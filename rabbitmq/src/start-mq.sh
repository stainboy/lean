#!/usr/bin/env bash
set -e
set -m

if [ "$RABBITMQ_ERLANG_COOKIE" ]; then
    cookieFile='/var/lib/rabbitmq/.erlang.cookie'
    if [ -e "$cookieFile" ]; then
        if [ "$(cat "$cookieFile" 2>/dev/null)" != "$RABBITMQ_ERLANG_COOKIE" ]; then
            echo >&2
            echo >&2 "warning: $cookieFile contents do not match RABBITMQ_ERLANG_COOKIE"
            echo >&2
        fi
    else
        echo "$RABBITMQ_ERLANG_COOKIE" > "$cookieFile"
        chmod 600 "$cookieFile"
        chown rabbitmq "$cookieFile"
    fi
fi


# make sure MQ has the right permission
chown -R rabbitmq /var/lib/rabbitmq

# start MQ server
rabbitmq-server &
pid="$!"


# wait for server up
rabbitmqctl status
for i in {20..0}; do
    if [ $(rabbitmqctl status | grep listeners | grep 5672 | wc -l) -eq 1 ]; then
        break
    fi
    echo 'RabbitMQ init process in progress...'
    sleep 1
done
if [ "$i" = 0 ]; then
    echo >&2 'MySQL init process failed.'
    exit 1
fi


if [ "$RABBITMQ_ADMIN" ]; then
    # create admin user
    mqAdmin=$(echo $RABBITMQ_ADMIN | cut -f1 -d:)
    mqPasswd=$(echo $RABBITMQ_ADMIN | cut -f2 -d:)
    rabbitmqctl add_user $mqAdmin $mqPasswd
    rabbitmqctl set_user_tags $mqAdmin administrator
    rabbitmqctl set_permissions -p / $mqAdmin ".*" ".*" ".*" 
fi


if [ "$RABBITMQ_CLUSTER_PEER" ]; then
    # join the cluster
    rabbitmqctl stop_app
    rabbitmqctl reset
    rabbitmqctl join_cluster rabbit@$RABBITMQ_CLUSTER_PEER
    rabbitmqctl start_app
else
    rabbitmqctl set_policy ha-all "^" '{"ha-mode":"exactly","ha-params":2,"ha-sync-mode":"automatic"}'
fi


# switch to foreground process
fg