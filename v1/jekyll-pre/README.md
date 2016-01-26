#Jekyll v3.0.9 Pre-release

##Docker Build##
    curl -sLO https://github.com/stainboy/lean/releases/download/v3.0.9-pre/ruby-jekyll-bundle.tar.xz
    docker build --no-cache=true -t jekyll:3.0.9 .

##Test Image##
    docker run --rm --name jekyll jekyll:3.0.9 jekyll --help

##Jekyll Official Image##
Alternatively, check https://hub.docker.com/r/jekyll/jekyll/ for jekyll official docker image