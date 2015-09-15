# RabbitMQ Cluster Setup and Test #

## 1. Prerequisites ##
3 ubuntu 14.04 nodes with docker installed.

- node1 (e.g. 10.58.9.243, cnvmtest1)
- node2 (e.g. 10.58.9.244, cnvmtest2)
- node3 (e.g. 10.58.9.245, cnvmtest3) 

## 2. Build the solution ##
    docker build --no-cache=true -t rabbitmq:3.5.14

## 3. Start node1 (aks master) ##
Logon node1, then type the command to start the first node. (Replace the IP address with your own)

     docker run -d --name rabbitmq \
      -h `hostname` \
      -e RABBITMQ_ERLANG_COOKIE='WWKXRWTRHFEWASAPGJCZ'\
      -e RABBITMQ_ADMIN='admin:12345'\
      -p 5672:5672 -p 4369:4369 -p 15672:15672 -p 25672:25672 \
      rabbitmq:3.5.14
Where *RABBITMQ\_ERLANG\_COOKIE* could be anything, just make sure all the nodes use the same value.
Where *RABBITMQ\_ADMIN* represents the admin user and password that you want to create.

## 4. Start node2 ##
Logon node2, then type the command to start the second node. (Again, replace the IP address with your own)

     docker run -d --name rabbitmq \
      -h `hostname` \
      -e RABBITMQ_ERLANG_COOKIE='WWKXRWTRHFEWASAPGJCZ'\
      -e RABBITMQ_CLUSTER_PEER=cnvmtest1 \
      -p 5672:5672 -p 4369:4369 -p 15672:15672 -p 25672:25672 \
      rabbitmq:3.5.14
Where *RABBITMQ\_CLUSTER\_PEER* equals to master node hostname, which is *cnvmtest1* in this case.

## 5. Start node3 ##
Logon node3, then type the command to start the third node

     docker run -d --name rabbitmq \
      -h `hostname` \
      -e RABBITMQ_ERLANG_COOKIE='WWKXRWTRHFEWASAPGJCZ'\
      -e RABBITMQ_CLUSTER_PEER=cnvmtest1 \
      -p 5672:5672 -p 4369:4369 -p 15672:15672 -p 25672:25672 \
      rabbitmq:3.5.14
Where *RABBITMQ\_CLUSTER\_PEER* equals to master node hostname, which is *cnvmtest1* in this case.

## 6. Test cluster ##
Open browser, input http://10.58.9.243:15672, login as the admin user and check the status.
http://10.58.9.244:15672 and http://10.58.9.245:15672 should also work fine.

## 7. When a node dead ##
Assume **e.g. node1 - 10.58.9.243, cnvmtest1** is dead, then go to any live node (e.g. node2), type the command to remove **node1** first.

     docker exec rabbitmq rabbitmqctl forget_cluster_node rabbit@cnvmtest1

Then go to the dead node, type the command to restart MQ and rejoin the cluster.

     docker run -d --name rabbitmq \
      -h `hostname` \
      -e RABBITMQ_ERLANG_COOKIE='WWKXRWTRHFEWASAPGJCZ'\
      -e RABBITMQ_CLUSTER_PEER=cnvmtest2 \
      -p 5672:5672 -p 4369:4369 -p 15672:15672 -p 25672:25672 \
      rabbitmq:3.5.14
Where *RABBITMQ\_CLUSTER\_PEER* equals to any of the live node hostname, which is *cnvmtest2* in this case. (Because cnvmtest1 is dead)

## 8. When the entire cluster dead ##
We don't persist MQ data, so start the entire cluster as the new one by redo the step #3,4,5.