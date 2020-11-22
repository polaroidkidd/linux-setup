NVM_AUTOLOAD=1
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dle/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# DISABLE_MAGIC_FUNCTIONS=true

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
  sudo
  safe-paste
  nvm
)
  autoload -U compinit && compinit

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities dae.bn.aws@ti8m.ch dae@gitlab.ti8m.ch dle@github.com dle.xps@aero dle.xps@bitbucket.org dle.xps@cassandra dle.xps@pi dle.xps@vps.faber.dev pi@ebikon 
zstyle :omz:plugins:ssh-agent lifetime


source $ZSH/oh-my-zsh.sh

fpath=(~/.zsh/completion $fpath)
fpath=(~/.linuxbrew/share/zsh/site-functions/ $fpath)
autoload -Uz compinit && compinit -i

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

#####################################################
################ BEGIN  ALIAS #######################
#####################################################

# Useful Git Commands
alias gl="git log --pretty=format:'%Cred%h %Cgreen%ad %Cblue%aN %Creset%s' --date=iso --graph --branches"
alias gall="git add --all"
alias ga="git add"
alias gs="git status"
alias gb="git branch -a"
alias gco="git checkout"
alias gcm="git commit -m"
alias gp="git push"
alias gpa="git push --all"
alias gpt="git push --follow-tags"
alias gip="git pull --verbose"
alias gbdo="git push --delete origin"

# core git editor
export GIT_EDITOR=vim

# function to commit and push all with a message in format of: gcp example text [ENTER TO SEND]
function __gcp() {
  gall
  gcm "$*"
  gp
}
alias gcp='__gcp'

# Aliases for shutting down
alias sdn="sudo shutdown -P now"
alias rbn="sudo shutdown -r now"

# Alias for installing and removing
alias gimme="sudo apt-get install"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias uu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias rem="sudo apt autoremove -y"
alias usdn="uu -y && sdn"

alias begone="__begone && rem"
function __begone() {
  sudo apt-get purge "$1"
}

# Docker & Docker-Compose alias
alias dc="docker-compose"
function __drm() {
  docker-compose stop ${1}
  wait
  echo "y" | dc rm ${1}
}

function __dcwipe(){
  if ! [[ -z `docker-compose stop | grep 'ERRPR'` ]] ; then
    echo "y" | docker-compose rm
    wait
    echo "y" | docker system prune -a
  fi
}

function __dwipe() {
  docker stop `docker ps -aq`
  wait
  echo "y" | docker system prune -a
}


function __dprune() {
  echo "y" | docker system prune -a
  wait
  echo "y" | docker volume prune
  wait
  echo "y" | docker network prune -a

}


alias dcwipe='__dcwipe'
alias dwipe='__dwipe'
alias dprune='__dprune'


# ranger exit in directory
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'


function __tns(){
  tmux new-session -s ${1}
}

function __tks(){
  tmux kill-session -t ${1}
}

function __tas(){
  tmux attach-session -t ${1}
}

function __tkill(){
  tmux kill-server
}


# tmux aliases
alias tns="__tns"
alias tks="__tks"
alias tas="__tas"
alias tkill="__tkill"


# Yarn
# alias node=nodejs

# MPV Alias to watch a video with mpv but detatch the process
function __mpvq() {
  mpv --really-quiet "$1" &
  disown
}
alias mpvq='__mpvq'

# Gradle Wrapper
alias gw='./gradlew'

# copy pwd to clip board
alias cpwd='pwd | xclip -sel clip'

# ranger exit in directory
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

#####################################################
################ BEGIN  PATHS #######################
#####################################################

# SNAP
export PATH="$PATH:/snap/bin"

# work aliases
# source ~/.aliases/.ti8m.sh

# local path
export PATH="$PATH:/home/dle/.local/bin"

#####################################################
################ BEGIN  ENVS  #######################
#####################################################
source ~/.envs/.all.sh
#  export GTK_IM_MODULE="xim"

#####################################################
################ BEGIN  PROGS #######################
#####################################################

# Use global yarn packages from cli
export PATH="$PATH:`yarn global bin`"

# Use Android cli
export PATH="/home/dle/Android/Sdk/cmdline-tools/latest/bin:$PATH"

source <(doctl completion zsh)
eval $(~/.linuxbrew/bin/brew shellenv)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/dle/.sdkman"
[[ -s "/home/dle/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dle/.sdkman/bin/sdkman-init.sh"

