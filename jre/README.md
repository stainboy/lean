#Oracle JRE8#

Open http://www.oracle.com/technetwork/java/javase/downloads/index.html in your browser and download the *jre-8u60-linux-x64.gz* manually.

Then build the Dockerfile

    docker build --no-cache=true -t jre:8u60 .