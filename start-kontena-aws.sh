#!/bin/zsh

# add Ruby gem path to PATH
GEM_PATHS=`gem environment GEM_PATHS | cut -d: -f1`
export PATH=${GEM_PATHS}/bin:$PATH

bold=$(tput bold)
normal=$(tput sgr0)

run_command() {
  DESCR="$1"
  COMMAND="$2"

  echo "${bold}###${normal} ${DESCR}"
  echo ""
  echo "${bold}${COMMAND}${normal}"
  read
  eval ${COMMAND}
  echo "..."
  read 
}

run_command "Install Kontena" "gem install kontena-cli"
run_command "Check for Kontena" "kontena"
run_command "List Kontena plugins" "kontena plugin search"
run_command "Install Kontena AWS plugin" "kontena plugin install aws"
run_command "Install Kontena AWS plugin" "kontena plugin install aws"
