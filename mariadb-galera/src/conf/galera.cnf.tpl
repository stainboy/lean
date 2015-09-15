[mysqld]
binlog_format=ROW
innodb_autoinc_lock_mode=2

wsrep_provider=/usr/lib/galera/libgalera_smm.so
wsrep_cluster_address="gcomm://${MYSQL_CLUSTER_PEER}"
wsrep_cluster_name='galera_cluster'
wsrep_node_address='${MYSQL_CLUSTER_IP}'
wsrep_node_name='${MYSQL_CLUSTER_NAME}'
wsrep_sst_method=rsync
wsrep_sst_auth=sst_user:54321