#Groovy#

Open http://www.groovy-lang.org/download.html in your browser and download the *apache-groovy-binary-2.4.5.zip* manually.

Then build the Dockerfile

    # convert zip archive to tar
    unzip apache-groovy-binary-2.4.5.zip
    tar -cjf groovy-2.4.5.tar.xz groovy-2.4.5/
    rm apache-groovy-binary-2.4.5.zip
    rm -r groovy-2.4.5

    # download jsoup
    wget http://jsoup.org/packages/jsoup-1.8.3.jar
    
    # build the docker image
    docker build --no-cache=true -t hyper.cd/core/groovy:2.4.5 .
