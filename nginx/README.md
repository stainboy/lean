# nginx

    docker build --no-cache=true -t hyper.cd/core/nginx:1.9.7 .


# how to use

    docker run -d \
     --name nginx \
     --net host \
     -v ~/.nginx/nginx.conf:/etc/nginx/nginx.conf \
     -v ~/.nginx/certs:/etc/nginx/certs \
     -v ~/.nginx/sites:/etc/nginx/sites \
     hyper.cd/core/nginx:1.9.7
