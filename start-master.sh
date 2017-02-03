#!/bin/bash

# add Ruby gem path to PATH
GEM_PATHS=`gem environment GEM_PATHS | cut -d: -f1`
export PATH=${GEM_PATHS}/bin:$PATH

# install Kontena client
which kontena &>/dev/null || {
  echo "### Installing Kontena..."
  gem install kontena-cli
}

# startup Kontena master
docker-compose -f docker-compose-master.yml up -d
