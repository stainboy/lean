#Groovy#

Open http://www.groovy-lang.org/download.html in your browser and download the *apache-groovy-binary-2.4.4.zip* manually.

Then build the Dockerfile

    # convert zip archive to tar
    unzip apache-groovy-binary-2.4.4.zip
    tar -cjf groovy-2.4.4.tar.xz groovy-2.4.4/
    rm apache-groovy-binary-2.4.4.zip
    rm -r groovy-2.4.4
    
    # build the docker image
    docker build --no-cache=true -t groovy:2.4.4 .