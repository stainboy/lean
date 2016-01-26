#!/usr/bin/env bash
set -e


# check cluster settings
if [ -z "$MYSQL_CLUSTER" ]; then
	echo >&2 'error: unknown galera cluster method'
	echo >&2 '  Did you forget to add -e MYSQL_CLUSTER=new|join ?'	
	exit 1
fi
if [ -z "$MYSQL_CLUSTER_PEER" -o -z "$MYSQL_CLUSTER_IP" -o -z "$MYSQL_CLUSTER_NAME" ]; then
	echo >&2 'error: unknown galera cluster data'
	echo >&2 '  Did you forget to add -e MYSQL_CLUSTER_PEER=... -e MYSQL_CLUSTER_IP=... -e MYSQL_CLUSTER_NAME=... ?'
	exit 1
fi


# get data dir
DATADIR="$(mysqld --verbose --help 2>/dev/null | awk '$1 == "datadir" { print $2; exit }')"

# init data dir
if [ ! -d "$DATADIR/mysql" ]; then
	if [ -z "$MYSQL_ROOT_PASSWORD" -a -z "$MYSQL_ALLOW_EMPTY_PASSWORD" ]; then
		echo >&2 'error: database is uninitialized and MYSQL_ROOT_PASSWORD not set'
		echo >&2 '  Did you forget to add -e MYSQL_ROOT_PASSWORD=... ?'
		exit 1
	fi

	mkdir -p "$DATADIR"
	chown -R mysql:mysql "$DATADIR"

	echo 'Running mysql_install_db'
	mysql_install_db --user=mysql --datadir="$DATADIR" --rpm
	echo 'Finished mysql_install_db'



	# start mysql safely which allows login without password
	mysqld --user=mysql --datadir="$DATADIR" --skip-networking &
	pid="$!"


	# connect to mysql server
	mysql=( mysql --protocol=socket -uroot )
	for i in {30..0}; do
		if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
			break
		fi
		echo 'MySQL init process in progress...'
		sleep 1
	done
	if [ "$i" = 0 ]; then
		echo >&2 'MySQL init process failed.'
		exit 1
	fi


	# forcibly update galera cluster info
	"${mysql[@]}" <<-EOSQL
		DELETE FROM mysql.user;
		GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
		GRANT ALL PRIVILEGES ON *.* TO 'sst_user'@'%' IDENTIFIED BY '54321' WITH GRANT OPTION;
		CREATE USER 'haproxy'@'%';
		DROP DATABASE IF EXISTS test ;
		FLUSH PRIVILEGES;
	EOSQL


	# shutdown mysqld
	if ! kill -s TERM "$pid" || ! wait "$pid"; then
		echo >&2 'MySQL init process failed.'
		exit 1
	fi

	echo
	echo 'MySQL init process done. Ready for start up.'
	echo

else
	chown -R mysql:mysql "$DATADIR"
fi



# replace cluster variables
if [ -f /etc/mysql/conf.d/galera.cnf.tpl ]; then
	sed -i 's/${MYSQL_CLUSTER_PEER}/'"${MYSQL_CLUSTER_PEER}"'/' /etc/mysql/conf.d/galera.cnf.tpl
	sed -i 's/${MYSQL_CLUSTER_IP}/'"${MYSQL_CLUSTER_IP}"'/' /etc/mysql/conf.d/galera.cnf.tpl
	sed -i 's/${MYSQL_CLUSTER_NAME}/'"${MYSQL_CLUSTER_NAME}"'/g' /etc/mysql/conf.d/galera.cnf.tpl
	mv /etc/mysql/conf.d/galera.cnf.tpl /etc/mysql/conf.d/galera.cnf
fi

if [ "$MYSQL_CLUSTER" = 'new' ]; then
	mysqld --wsrep-new-cluster
elif [ "$MYSQL_CLUSTER" = 'join' ]; then
	mysqld
fi