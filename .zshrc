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
