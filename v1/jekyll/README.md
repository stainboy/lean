# Run jekyll:pages

    docker run -d --name jekyll --label jekyll \
     -v /path/to/your/website:/srv/jekyll \
     -p 4000:4000 jekyll:pages jekyll s

