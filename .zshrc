 # Path to your oh-my-zsh installation.
 export ZSH="/Users/<username>/.oh-my-zsh"
 ZSH_THEME="robbyrussell"
 HIST_STAMPS="mm/dd/yyyy"
 plugins=(
   git zsh-syntax-highlighting
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

# customize your ls output using online tool: https://geoff.greer.fm/lscolors/

export CLICOLOR=1;
export LSCOLORS="GxcxcxdxBxfxfxabagacad"

#usage box 10.1.1.1
function box() {
    ssh <ssh-username>@$1
 }

alias stopnginx="nginx -s stop"

alias urld='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urle='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
