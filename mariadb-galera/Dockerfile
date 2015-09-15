FROM debian:jessie
# docker build --no-cache=true -t mariadb-galera:10.0.21 .
#
# docker run --rm -it --name mariadb-galera-test \
#  -p 3306:3306 -p 4567:4567 -p 4568:4568 -p 4444:4444 \
#  mariadb-galera:10.0.21

ADD src/start-mariadb.sh /usr/bin/
ADD src/bin/wsrep_sst_rsync /usr/bin/
ADD src/conf/galera.cnf.tpl /etc/mysql/conf.d/

RUN \
    # mysql user and group
    groupadd -r mysql && useradd -r -g mysql mysql &&\
    # http proxy
    export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # install mariadb and galera
    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 199369E5404BD5FC7D2FE43BCBCB082A1BB943DB &&\
    { \
        echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
        echo 'deb http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.0/debian jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    # test purpose, remove it later
    # apt-get install -y --force-yes --no-install-recommends net-tools vim curl wget file &&\
    apt-get install -y --force-yes --no-install-recommends mariadb-galera-server socat rsync galera net-tools &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    # stop mysql
    # ps aux|grep mysqld|awk '{print $2}'|xargs kill -9 &&\
    rm -rf /var/log/* &&\
    # configure mariadb and galera
    rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql &&\
    sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf &&\
    echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf &&\
    mv /tmp/my.cnf /etc/mysql/my.cnf &&\
    # executable
    chmod +x /usr/bin/start-mariadb.sh /usr/bin/wsrep_sst_rsync  &&\
    # done
    echo 'done'


# VOLUME /var/lib/mysql

# EXPOSE 3306 4567 4568 4444

ENTRYPOINT ["/usr/bin/start-mariadb.sh"]