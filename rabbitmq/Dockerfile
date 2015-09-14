FROM debian:jessie
# docker build --no-cache=true -t rabbitmq .
#

ENV PATH=/usr/lib/rabbitmq/bin:$PATH

RUN \
    # rabbitmq user and group
    groupadd -r rabbitmq && useradd -r -d /var/lib/rabbitmq -m -g rabbitmq rabbitmq &&\
    # http proxy
    export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # install rabbitmq
    { \
        echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
        echo 'deb http://packages.erlang-solutions.com/debian jessie contrib'; \
        echo 'deb http://www.rabbitmq.com/debian/ testing main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    # test purpose, remove it later
    # apt-get install -y --force-yes --no-install-recommends net-tools vim curl wget file &&\
    apt-get install -y --force-yes --no-install-recommends rabbitmq-server &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # configure rabbitmq
    ln -sf /var/lib/rabbitmq/.erlang.cookie /root/ &&\
    echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config &&\
    curl -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.4/plugins/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x.ez http://10.58.136.166/mc/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x.ez &&\
    curl -o /usr/bin/start-mq.sh http://10.58.136.166/mc/start-mq.sh &&\
    # enable plugins
    # rabbitmq-plugins enable rabbitmq_management &&\
    # rabbitmq-plugins enable rabbitmq_delayed_message_exchange &&\
    echo '[rabbitmq_delayed_message_exchange,rabbitmq_management].' > /etc/rabbitmq/enabled_plugins &&\
    # clean
    ps aux|grep rabbitmq-server|awk '{print $2}'|xargs kill -9 &&\
    rm -rf /var/lib/rabbitmq/* &&\
    # done
    echo 'done'

# VOLUME /var/lib/rabbitmq

# EXPOSE 5672 4369 15672 25672

ENTRYPOINT ["/usr/bin/start-mq.sh"]