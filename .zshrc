 # Path to your oh-my-zsh installation.
 export ZSH="/Users/<username>/.oh-my-zsh"
# ZSH_THEME="robbyrussell"


#POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='nerdfont-complete'
source ~/.oh-my-zsh/custom/themes/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"

######## parameter customization for powerlevel theme, get it from https://github.com/bhilburn/powerlevel9k ###############################
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv background_jobs ssh dir vcs status root_indicator dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"

#POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"

POWERLEVEL9K_VCS_HIDE_TAGS='false'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

#POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_STATUS_OK=false

#######################################################################################


 HIST_STAMPS="mm/dd/yyyy"
 plugins=(
   git zsh-syntax-highlighting zsh-autosuggestions osx jsontools mvn
 )

 source $ZSH/oh-my-zsh.sh
 fpath=(/usr/local/share/zsh-completions $fpath)
 alias starymysql="mysql.server start"
 alias brewski="brew outdated && brew update && brew upgrade && brew cleanup; brew doctor"
 export JAVA_HOME=$(/usr/libexec/java_home)
 export PATH=$PATH:/usr/local/Cellar/gradle/4.9/bin
 test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
 
 #git shorcuts
 alias gitlog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"

# commented following line since its disabling $ls color output
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#usage box 10.1.1.1
function box() {
    ssh <ssh-username>@$1
 }

alias stopnginx="nginx -s stop"

alias urld='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urle='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias jshell="~/standalone/jdk-12.jdk/Contents/Home/bin/jshell"
export kafka="~/standalone/kafka_2.11-2.0.0"
alias startkafka="$kafka/bin/kafka-server-start.sh $kafka/config/server.properties"
alias startzoo="$kafka/bin/zookeeper-server-start.sh $kafka/config/zookeeper.properties"
alias stopkafka="$kafka/bin/kafka-server-stop.sh"
alias stopzoo="$kafka/bin/zookeeper-server-stop.sh"
alias startmongo="mongod --config /usr/local/etc/mongod.conf"

######################### This line should be last in file else ll command is giving trouble ########################################

source $(dirname $(gem which colorls))/tab_complete.sh

# customize your ls output using online tool: https://geoff.greer.fm/lscolors/
export CLICOLOR=1;
export LSCOLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=36:*.rpm=90"

alias ll='colorls -lA --sd'
alias ls='colorls --group-directories-first'

bindkey '^`' autosuggest-clear
#################################################################
