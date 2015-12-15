#Docker Registry 2.0

##Build the Dockerfile

    docker build --no-cache=true -t hyper.cd/core/registry-insecure:2.2.0 .

##Run the Registry

    mkdir ~/.registry
    docker run -d --name registry \
     -p 5000:5000 \
     -v ~/.registry:/var/lib/registry \
     hyper.cd/core/registry-insecure:2.2.0


##References
- https://github.com/docker/distribution/blob/master/docs/deploying.md#get-a-certificate
- https://hub.docker.com/_/registry/
- https://sapcerts.wdf.global.corp.sap
- https://serverpilot.io/community/articles/how-to-fix-an-encrypted-ssl-private-key.html
- http://www.akadia.com/services/ssh_test_certificate.html