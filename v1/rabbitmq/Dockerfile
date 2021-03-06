FROM debian:jessie
# docker build --no-cache=true -t rabbitmq:3.5.4 .
#

ADD src/start-mq.sh /usr/bin/
ADD src/plugins/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.4/plugins/

ENV PATH=/usr/lib/rabbitmq/bin:$PATH

RUN \
    # rabbitmq user and group
    groupadd -r rabbitmq && useradd -r -d /var/lib/rabbitmq -m -g rabbitmq rabbitmq &&\
    # http proxy
    export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # erlang-key
    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 434975BD900CCBE4F7EE1B1ED208507CA14F4FCA &&\
    # rabbitmq-key
    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys F78372A06FF50C80464FC1B4F7B8CEA6056E8E56 &&\
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
    # enable plugins
    # rabbitmq-plugins enable rabbitmq_management &&\
    # rabbitmq-plugins enable rabbitmq_delayed_message_exchange &&\
    echo '[rabbitmq_delayed_message_exchange,rabbitmq_management].' > /etc/rabbitmq/enabled_plugins &&\
    # clean
    rm -rf /var/lib/rabbitmq/* &&\
    # executable
    chmod +x /usr/bin/start-mq.sh  &&\
    # done
    echo 'done'

# VOLUME /var/lib/rabbitmq

# EXPOSE 5672 4369 15672 25672

ENTRYPOINT ["/usr/bin/start-mq.sh"]