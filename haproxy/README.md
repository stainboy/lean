# HAProxy Setup and Test #

## 1. Prerequisites ##
4 ubuntu 14.04 nodes with docker installed.

- node1 (e.g. 10.58.9.243) for db1, mq1
- node2 (e.g. 10.58.9.244) for db2, mq2
- node3 (e.g. 10.58.9.245) for db3, mq3
- node4 (e.g. 10.58.9.246) for haproxy

Refer ../mariadb-galera and ../rabbitmq to setup cluster.

## 2. Build the solution ##
    docker build --no-cache=true -t haproxy:1.5.14

## 3. Prepare haproxy.cfg ##
Go to node4, prepare haproxy.cfg manually. You can edit the file based on src/_haproxy.cfg (Replace the IP address with your own)

    cat > ~/.haproxy.cfg << EOF
    global
        log         127.0.0.1   local0
        log         127.0.0.1   local1 notice
        maxconn     4096
        user        haproxy
        group       haproxy
        nbproc      1
        pidfile     /var/run/haproxy.pid

    defaults
        log         global
        option      tcplog
        option      dontlognull
        retries     3
        maxconn     4096
        option      redispatch
        timeout     connect 50000ms
        timeout     client  50000ms
        timeout     server  50000ms

    listen mariadb-galera-writes
        bind 0.0.0.0:3307
        mode tcp
        option mysql-check user haproxy
        server db1 10.58.9.243:3306 check
        server db2 10.58.9.244:3306 check backup
        server db3 10.58.9.245:3306 check backup

    listen mariadb-galera-reads
        bind 0.0.0.0:3306
        mode tcp
        balance leastconn
        option mysql-check user haproxy
        server db1 10.58.9.243:3306 check
        server db2 10.58.9.244:3306 check
        server db3 10.58.9.245:3306 check

    listen rabbitmq
        bind 0.0.0.0:5672
        mode tcp
        balance roundrobin
        server mq1 10.58.9.243:5672 check inter 2000 rise 2 fall 3
        server mq2 10.58.9.244:5672 check inter 2000 rise 2 fall 3
        server mq3 10.58.9.245:5672 check inter 2000 rise 2 fall 3

    listen rabbitmq-management
        bind 0.0.0.0:15672
        mode http
        server mq1 10.58.9.243:15672 check
        server mq2 10.58.9.244:15672 check backup
        server mq3 10.58.9.245:15672 check backup

    # HAProxy web ui
    listen stats 0.0.0.0:9000
        mode http
        stats enable
        stats uri /
        stats realm HAProxy\ Statistics
        stats auth haproxy:12345
        stats admin if TRUE
    EOF

## 3. Start haproxy ##
Type the command to start haproxy.

    docker run -d --name haproxy \
     -p 3306:3306 -p 3307:3307 -p 5672:5672 -p 15672:15672 -p 9000:9000 \
     -v ~/.haproxy.cfg:/etc/haproxy/haproxy.cfg:ro \
     haproxy:1.5.14

## 4. Test cluster ##
Open browser and goto http://10.58.9.246:9000, login as haproxy/12345. Check the haproxy status.

Open browser and goto http://10.58.9.246:15672, login as admin/admin. Check the MQ status.

Start mysql client, input password 12345

    docker run -it --rm --name mariadb-client \
     --entrypoint /bin/bash
     mariadb-galera:10.0.21

    mysql -h 10.58.9.246 --protocol=TCP -u root -P 3306 -p

Show cluster status

    mysql> show status like 'wsrep%';

Show schemas

    mysql> show databases;

Show users

    mysql> select user from mysql.user;

## 5. When cluster nodes changed ##
Edit ~/.haproxy.cfg and type command

    docker restart -t 0 haproxy

## 6. When haproxy is dead ##
Make sure ~/.haproxy.cfg is correct and redo step #3.
