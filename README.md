[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)   **But it is**  [![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)  



- [Configurations](#configurations)
	- [Iterm2/Terminal configurations](#iterm2terminal-configurations)
		- [Zsh plugins](#zsh-plugins)
		- [Install Fonts](#install-fonts)
		- [Get better version of man pages](#get-better-version-of-man-pages)
		- [Install Ruby](#install-ruby)
		- [Make terminal colorful](#make-terminal-colorful)
	- [Python setup](#python-setup)
		- [Virtual Environment for python](#virtual-environment-for-python)
	- [GO setup](#go-setup)
		- [Environment variables](#environment-variables)
	- [IntelliJ idea settings](#intellij-idea-settings)
	- [Multiple java versions in mac](#multiple-java-versions-in-mac)
	- [Multiple-SDK-for-Development-SDKMAN](#SDKMAN)
	- [video tutorials](#video-tutorials)


### Configurations

#### Iterm2/Terminal configurations

Note: Make sure you have *local admin rights* before you proceed with the following installations.

Following site will help you setup your mac.

1. Install iterm2 from https://www.iterm2.com/ and Install Homebrew from https://brew.sh/ 

2. Install software listed in file brew-leaves.txt `brew install $(< brew-leaves.txt)`

3. Add theme to iterm2: Oh-my-Z `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

4. Add additional plugins, themes and fonts to iterm2  

   ##### Zsh plugins

   You can add additional plugins in zsh at `.oh-my-zsh/custom/plugins` location

   ```shell
   cd $ZSH/custom/plugins;git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-completions
   ```

   ##### Install Fonts

   https://github.com/adobe-fonts/source-code-pro

   https://github.com/powerline/fonts

   https://github.com/gabrielelana/awesome-terminal-fonts

   https://github.com/ryanoasis/nerd-fonts

5. Install powerlevel9k theme(choose Option 2: Install for Oh-My-ZSH) https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k  
6. Update .zshrc file as show in [here](https://github.com/dineshbhagat/mac-configurations/blob/master/.zshrc)
7. change fonts for iterm2: iTerm2 -> Preferences -> Profiles -> Text -> Font -> Change Font to hack-nerd
8. Execute `compaudit | xargs chmod g-w,o-w /usr/local/share/zsh ;compaudit | xargs chmod g-w,o-w /usr/local/share/zsh/site-functions`
9. change font settings as shown in image  
   ![image](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202018-12-04%20at%205.47.48%20PM.png)
10. Vim Customization 

```shell
git clone https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
```

11. Customize iterm2 [shortcut](https://stackoverflow.com/a/10485061/2987755)
    ![image](https://github.com/dineshbhagat/mac-configurations/blob/master/images/iterm2-config.png)

⌘←  "SEND HEX CODE"      0x01  
⌘→  "SEND HEX CODE"      0x05  
⌥←  "SEND ESC SEQ"  b  
⌥→  "SEND ESC SEQ"  f  

12. Bonus: If you want terminal app to be similar to iterm2 do following settings
    - terminal -> preference -> Basic theme ->Background -> change color from white to black, 
    - Text -> change color from black to white
    - Font -> change for to Hack bold nerd font  

More info:

https://github.com/nicolashery/mac-dev-setup

https://github.com/donnemartin/dev-setup

https://sourabhbajaj.com/mac-setup/

https://github.com/andreafrancia/trash-cli

https://github.com/codetalkchannel/pimpyourterminal/blob/master/.zshrc

https://github.com/zsh-users

https://help.github.com/en

Following are other changes require to make iterm more customizable and solutions to some problem I have encountered so far.

##### Get better version of man pages

https://tldr.sh/

##### Install Ruby

```shell
brew install rbenv ruby-build

# Add rbenv to bash/zsh (.bash_profile/.zshrc) so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
source ~/.zshrc

# Install Ruby
rbenv install 2.6.1
rbenv global 2.6.1
ruby -v

rbenv rehash

# to check outdated gems
gem outdated

#update all outdated gems
sudo gem update

# delete older gems
gem cleanup

```

 The first thing you want to do after installing a new Ruby version is to [install Bundler](https://github.com/nicolashery/mac-dev-setup#ruby).   
 This tool will allow you to set up separate environments for your different Ruby projects, so their required gem versions won't conflict with each other.  
 Install Bundler with:  

`gem install bundler`

 In a new Ruby project directory, create a new Gemfile with: like venv of python environment  
`bundle init`




##### Make terminal colorful

```shell
$sudo gem install colorls
```

Snapshots of my configurations:

```shell
+ — uncommitted changes in the index;
! — unstaged changes;
? — untracked changes;
$ — stashed changes;
⇣ — unpulled commits;
⇡ — unpushed commits
```

![normal-prompt](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202018-10-08%20at%2011.50.18%20AM.png)

![auto-complete](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202018-10-08%20at%2011.59.12%20AM.png)

command-failure-status:

![terminate-command-on-failure-status](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202018-10-08%20at%2012.00.18%20PM.png)



![ll-and-ls-commands](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screen%20Shot%202016-11-08%20at%2012.18.00%20AM.png)

#### Python setup

`brew install python@3`  
`brew install python@2`

##### Virtual Environment for python

It offers flexibility in isolating multiple python environment and does not interfer with other virtual environment  
Package installed in one virtual environment will not be visible in other virtual environment  
Package installed in virtual environment will not be installed system wide hence it will not be available to all programs which uses system python setup.

System python installation path   
`/System/Library/Frameworks/Python.framework/`

Homebrew installed python path  
`/usr/local/Cellar/python/<version>/`

Let us us python3 for virtual environment  
`pip3 install virtualenv`

Setup virtual environment at any location, lets setup at home directory  
`virtualenv -p python3 ~/virtEnvPy3`

Activate virtual environment  

```shell
cd ~/virtEnvPy3
source bin/activate
```

Install any package for above virtual environment from terminal   
`pip install flask`

Deactivate environment
`deactivate`

on similar line we can create virtual environment for python2 as well  

#### GO setup
`brew install golang`  or `brew install go`
check version
`go version`

##### Environment variables
Your Go working directory (`GOPATH`) is where you store your Go code/additional libraries.
It is not mandatory to have your code at `go-workspace`.
It can be any path you choose but must be separate from your Go installation directory (`GOROOT`).

```shell
mkdir ${HOME}/go-workspace
# GO projects/program will be stored
mkdir ${HOME}/go-workspace/src
# packaged object will be stored  
mkdir ${HOME}/go-workspace/pkg
# compiled binary files will be stored  
mkdir ${HOME}/go-workspace/bin

export GOPATH="${HOME}/go-workspace"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
```
Import Go packages
`go get -u github.com/tednaleid/ganda` [Ref](https://github.com/tednaleid/ganda)


More Ref
1. https://golang.org/project/
2. [GO-info](go-info.md)
      



#### IntelliJ idea settings

For IntelliJ keymap, import [settings.jar](settings.jar)

#### Multiple java versions in mac

http://jdk.java.net/12/ unzip and use for latest features, this will not mess-up your mac java version and environment variables

#### SDKMAN

Install

```shell
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

```
Uninstall 

```shell
tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman
# remove following line from bashrc/zshrc
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/dudette/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dudette/.sdkman/bin/sdkman-init.sh"

```

Update
`sdk update`


Usage

```shell
# Docs: https://sdkman.io/usage
sdk install micronaut
sdk uninstall micronaut 1.0.4
```

#### video tutorials

If you still could not follow up the steps, follow steps mentioned in the video  
Part1: https://www.youtube.com/watch?v=iwH1XqVjZOE  
Part2: https://www.youtube.com/watch?v=UsKd9Y42Mo0  
