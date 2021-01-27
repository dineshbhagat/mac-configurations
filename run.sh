#!/usr/bin/env bash

bundle install

# To run inside container
# bundle exec jekyll serve -w --host 0.0.0.0

# To run in local
bundle exec jekyll serve -w --host 0.0.0.0
