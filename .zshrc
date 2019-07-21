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
   git zsh-syntax-highlighting zsh-autosuggestions zsh-completions osx jsontools mvn
 )

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)

 ### Fix slowness of pastes with zsh-syntax-highlighting.zsh
 pasteinit() {
   OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
   zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
 }

 pastefinish() {
   zle -N self-insert $OLD_SELF_INSERT
 }
 zstyle :bracketed-paste-magic paste-init pasteinit
 zstyle :bracketed-paste-magic paste-finish pastefinish

 source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 ### Fix slowness of pastes
 
 
alias starymysql="mysql.server start"
alias brewski="brew outdated && brew update && brew upgrade && brew cleanup; brew doctor"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH

export GOPATH="${HOME}/go-workspace"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

#export GRADLE_HOME=$(brew --prefix gradle)/libexec
#export PATH=$PATH:${GRADLE_HOME}/bin
#export M2_HOME=$(brew --prefix maven)/libexec
#export PATH=$PATH:${M2_HOME}/bin

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

alias jshell="~/standalone/jdk-12.jdk/Contents/Home/bin/jshell --enable-preview"
alias ojava="~/standalone/jdk-12.jdk/Contents/Home/bin/java"

# This will enable java for only in terminal where this function is executed
java11()
 {
	   export JAVA_HOME=~/standalone/jdk-11.jdk/Contents/Home
	   export PATH=${JAVA_HOME}/bin:$PATH
	   java -version
 }
java12()
 {
	   export JAVA_HOME=~/standalone/jdk-12.jdk/Contents/Home
	   export PATH=${JAVA_HOME}/bin:$PATH
	   java -version
 }

export kafka="~/standalone/kafka_2.11-2.0.0"
alias startkafka="$kafka/bin/kafka-server-start.sh $kafka/config/server.properties"
alias startzoo="$kafka/bin/zookeeper-server-start.sh $kafka/config/zookeeper.properties"
alias stopkafka="$kafka/bin/kafka-server-stop.sh"
alias stopzoo="$kafka/bin/zookeeper-server-stop.sh"
alias startmongo="mongod --config /usr/local/etc/mongod.conf"
alias redis="redis-server /usr/local/etc/redis.conf"
alias haproxy="haproxy -f /usr/local/etc/haproxy.cfg"
alias neo4jst="neo4j start"
alias neo4jsp="neo4j stop"
alias elastic="elasticsearch"
alias kibana="kibana"

export gradleArtifactPath="~/.gradle/caches/modules-2/files-2.1"

export graalHome=~/standalone/graalvm-ce-1.0.0-rc11/Contents/Home/bin
alias gjavac="$graalHome/javac"
alias gjava="$graalHome/java"

export LC_ALL=en_US.UTF-8

######################### This line should be last in file else ll command is giving trouble ########################################

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $(dirname $(gem which colorls))/tab_complete.sh

# customize your ls output using online tool: https://geoff.greer.fm/lscolors/
export CLICOLOR=1;
export LSCOLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=36:*.rpm=90"

alias ll='colorls -lA --sd'
alias ls='colorls --group-directories-first'

bindkey '^`' autosuggest-clear

# embedded-terminal intelliJ idea
bindkey "\e\eOD" backward-word
bindkey "\e\eOC" forward-word
#################################################################
