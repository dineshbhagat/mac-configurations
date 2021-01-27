#!/usr/bin/env bash

bundle install

# To run inside container
# bundle exec jekyll serve -w --host 0.0.0.0
# host: http://0.0.0.0:4000/

# To run in local
# host: localhost:4000
bundle exec jekyll serve
