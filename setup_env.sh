#!/bin/bash

# Colours
C_RED='\x1B[01;91m'
C_GREEN='\x1B[01;92m'
C_DGREEN='\x1B[01;38;5;28m'
C_YELLOW='\x1B[01;93m'
C_BLUE='\x1B[01;94m'
C_ORANGE='\x1B[01;38;5;208m'
C_MAGENTA='\x1B[01;95m'
C_CYAN='\x1B[01;96m'
C_BOLD='\x1B[01;1m'
C_STOP='\x1B[0m'

S_INFO="${C_BLUE}INFO${C_STOP}"
S_CHECKING="${C_BLUE}CHECKING${C_STOP}"
S_SKIPPING="${C_BLUE}SKIPPING${C_STOP}"
S_COMPLETED="${C_GREEN}COMPLETED${C_STOP}"
S_SUCCESS="${C_GREEN}SUCCESS${C_STOP}"
S_WARNING="${C_YELLOW}${C_BOLD}WARNING${C_STOP}"
S_ERROR="${C_RED}${C_BOLD}ERROR${C_STOP}"
S_CRITICAL="${C_RED}${C_BOLD}CRITICAL${C_STOP}"

S_BREW="${C_ORANGE} ${C_MAGENTA}BREW  ${C_STOP}"
S_GIT="${C_GREEN} ${C_MAGENTA}GIT   ${C_STOP}"
S_APT="${C_YELLOW} ${C_MAGENTA}APT   ${C_STOP}"
S_RUBY="${C_RED} ${C_MAGENTA}RUBY  ${C_STOP}"
S_PYTHON="${C_GREEN} ${C_MAGENTA}PYTHON${C_STOP}"
S_NODE="${C_GREEN} ${C_MAGENTA}NODE  ${C_STOP}"
S_RUST="${C_ORANGE} ${C_MAGENTA}RUST  ${C_STOP}"


function execute() {
  SEDCMP="s/^/${C_DGREEN}${!1}${C_STOP}: /; s/[eE][rR][rR][oO][rR]/$S_ERROR/; s/[wW][aA][rR][nN][iI][nN][gG]/$S_WARNING/; s/[sS][uU][cC][cC][eE][sS][sS][ :]/$S_SUCCESS/; s/[cC][hH][eE][cC][kK][iI][nN][gG]/$S_CHECKING/;"
 
  stdbuf -o0 "${@:2}" 2>&1 \
    | sed "$SEDCMP"
}

function log() {
  if [[ -z $2 ]]; then
    echo -e "${C_BLUE} ${C_MAGENTA}SETUP ${C_STOP}: $1"
  else
    echo -e "${!2}: $1"
  fi
}


## Script Start
OLD=/tmp/OLD

if [ ! -d $OLD ]; then
  mkdir $OLD
fi

## Brew
if ! command -v brew &> /dev/null; then
  log "Install Brew" 'S_BREW'
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function brewstall(){
  for CMD in $@
  do
    if ! command -v $CMD &> /dev/null; then
      execute 'S_BREW' brew install -q $CMD
      log "$CMD Installed" 'S_BREW'
    else
      log "$CMD is already installed" 'S_SKIPPING'
    fi
  done
}

brewstall coreutils python3 pip3 node cmake gh lua lazygit llvm make go openjdk openssh wget thefuck jandedobbeleer/oh-my-posh/oh-my-posh 
execute 'S_BREW' brew upgrade

# Install nerd font
oh-my-posh font install Firacode

## Move app configs to .config
mkdir -p ~/.config
cp -r ./aerospace ./nvim ./oh-my-posh ~/.config

## Add aliases to zshrc
echo "alias python=python3" >> ~/.zshrc
echo "alias vim=nvim" >> ~/.zshrc
