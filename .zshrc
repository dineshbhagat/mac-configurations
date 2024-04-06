# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions zsh-completions osx jsontools mvn
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

###################################### User Customized ########################################


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

export TERM="xterm-256color"

alias startmysql="mysql.server start"
alias brewski="brew outdated && brew update && brew upgrade && brew cleanup; brew doctor"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH
alias sqldeveloper="/Applications/SQLDeveloper.app/Contents/MacOS/sqldeveloper.sh; exit"
alias jd="java -jar /Users/${USER}/standalone/Bytecode-Viewer-2.10.16.jar"

java8()
{
    export JAVA_HOME=~/standalone/temurin-8.jdk/Contents/Home
    export PATH=${JAVA_HOME}/bin:$PATH
    java -version
}

java17()
{
     export JAVA_HOME=~/standalone/temurin-17.jdk/Contents/Home
     export PATH=${JAVA_HOME}/bin:$PATH
     java -version
}


java19() {
	export JAVA_HOME=~/standalone/jdk-19.jdk/Contents/Home
	export PATH=${JAVA_HOME}/bin:$PATH
    java -version
}

export GOPATH="${HOME}/go-workspace"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GROOVY_HOME=/usr/local/opt/groovy/libexec


#export GRADLE_HOME=$(brew --prefix gradle)/libexec
#export PATH=$PATH:${GRADLE_HOME}/bin
#export GRADLE_JARS=~/.gradle/caches/modules-2/files-2.1
#export M2_HOME=$(brew --prefix maven)/libexec
#export PATH=$PATH:${M2_HOME}/bin
 
#git shorcuts
alias gitlog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"

# commented following line since its disabling $ls color output
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#usage box 10.1.1.1
function box() {
    ssh <ssh-username>@$1
}

alias stopnginx="nginx -s stop"

alias urld='python3 -c "import sys, urllib.parse as ul; print(ul.unquote(sys.argv[1]))"'
alias urle='python3 -c "import sys, urllib.parse as ul; print(ul.quote(sys.argv[1]))"'

alias jshell="~/standalone/temurin-17.jdk/Contents/Home/bin/jshell --enable-preview"
alias ojava="~/standalone/jdk-14.0.1+7/Contents/Home/bin/java"
export kafka=~/standalone/kafka_2.13-3.3.1
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
alias zipkin="java -jar ~/standalone/zipkin/zipkin.jar"

#alias kibana="kibana"
#alias logstash="logstash"
alias grafana="/usr/local/opt/grafana/bin/grafana-server --config /usr/local/etc/grafana/grafana.ini --homepath /usr/local/opt/grafana/share/grafana --packaging=brew cfg:default.paths.logs=/usr/local/var/log/grafana cfg:default.paths.data=/usr/local/var/lib/grafana cfg:default.paths.plugins=/usr/local/var/lib/grafana/plugins"

alias startc="~/standalone/apache-cassandra-4.0-beta1/bin/cassandra -f"
alias stconsul="consul agent -dev -bind 127.0.0.1"
export gradleArtifactPath="~/.gradle/caches/modules-2/files-2.1"

export INFLUXD_CONFIG_PATH="/usr/local/etc/influxdb2/config.yml"
alias influx="/usr/local/opt/influxdb/bin/influxd"
alias influxui="/usr/local/opt/chronograf/bin/chronograf"

export INFLUX_TOKEN="give-your-token"
#alias telegraf="telegraf --config http://localhost:8086/api/v2/telegrafs/08416057f57ab000"
alias telegraf="/usr/local/opt/telegraf/bin/telegraf -config ~/tick/telegraf.conf -config-directory /usr/local/etc/telegraf.d"
alias telegrafDefaultConfig="/usr/local/opt/telegraf/bin/telegraf -config /usr/local/etc/telegraf.conf -config-directory /usr/local/etc/telegraf.d"

alias trino="/usr/local/opt/trino/bin/trino-server run"

alias startpostgres='echo "To delete log files run: rm -rf /usr/local/var/postgres/log/*, restart postgres"; /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres'
alias postgresreport="pgbadger --prefix '%m [%p]: [%l-1] user=%u,db=%d,app=%a,client=%h ' /usr/local/var/postgres/log/* -o /usr/local/var/postgres/log/postgreslog.html"

export graalHome=~/standalone/graalvm-ce-1.0.0-rc11/Contents/Home/bin
alias gjavac="$graalHome/javac"
alias gjava="$graalHome/java"
export PATH=$graalHome/bin:$PATH

export LC_ALL=en_US.UTF-8

# https://github.com/dineshbhagat/mac-configurations/blob/main/README.md#make-ls-ll-commands-colorful
alias ll='lsd -la'
alias ls='lsd'

# file browser
alias nnn='nnn -de'
eval "$(zoxide init --cmd cd zsh)"

# embedded-terminal intelliJ idea
bindkey "\e\eOD" backward-word
bindkey "\e\eOC" forward-word
#################################################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit

#################################################################
