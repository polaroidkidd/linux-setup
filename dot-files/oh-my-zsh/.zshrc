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

DISABLE_MAGIC_FUNCTIONS=true 

# Add wisely, as too many plugins slow down shell startup.
plugins=(
 git
 ssh-agent
 zsh-syntax-highlighting
 zsh-autosuggestions
)


zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities dle@ebikon dle@github.com dle@bitbucket.org dae@ti8m.ch pi@ebikon dae@ti8m.laptop
zstyle :omz:plugins:ssh-agent lifetime

source $ZSH/oh-my-zsh.sh


fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

source ~/.envs/.all.sh

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
function __begone {
	sudo apt-get purge "$1"
}


# Docker & Docker-Compose alias
alias dc="docker-compose"
function __dcrm {
  dc stop ${1} && echo "y" | dc rm ${1}
}
alias dcrm="__drm"
alias dwipe='echo "y" | docker system prune -a'
alias dwipev='echo "y" | docker volume prune'

# NVM
export NVM_DIR="/home/dle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Yarn
alias node=nodejs


# MPV Alias to watch a video with mpv but detatch the process
function __mpvq {
	mpv --really-quiet "$1" & disown
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
source ~/.aliases/ti8m

# local path
export PATH="$PATH:/home/dle/.local/bin"

#####################################################
################ BEGIN  ENVS  #######################
#####################################################
source ~/.envs/.all.sh


#####################################################
################ BEGIN  PROGS #######################
#####################################################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/dle/.sdkman"
[[ -s "/home/dle/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dle/.sdkman/bin/sdkman-init.sh"
