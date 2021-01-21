[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)   **But it is**  [![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)  

### Configurations

***

- [Configurations](#configurations)
  - [Iterm2/Terminal configurations](#iterm2terminal-configurations)
    - [Zsh plugins](#zsh-plugins)
    - [Install Fonts](#install-fonts)
    - [Get better version of man pages](#get-better-version-of-man-pages)
    - [Install Ruby](#install-ruby)
    - [Make ls, ll commands colorful](#make-ls-ll-commands-colorful-and-much-more-using-colorls)
    - [Optional powerlevel10k on top of powerlevel9k](#powerlevel10k-on-top-of-powerlevel9k)
  - [Python setup](#python-setup)
    - [Virtual Environment for python](#virtual-environment-for-python)
  - [GO setup](#go-setup)
    - [Environment variables](#environment-variables)
  - [Groovy setup](#groovy-setup)
  - [IntelliJ idea settings](#intellij-idea-settings)
  - [Multiple java versions in mac](#multiple-java-versions-in-mac)
  - [SDKMAN](#sdkman)
  - [Keychain-password](#keychain-password)
  - [video tutorials](#video-tutorials)

***



<a href="#configurations">:arrow_up:</a> 
#### Iterm2/Terminal configurations

Note: Make sure you have *local admin rights* before you proceed with the following installations.

Following site will help you setup your mac.

1. Install iterm2 from https://www.iterm2.com/ and Install Homebrew from https://brew.sh/ 

2. Install software listed in file brew-leaves.txt   
`brew install $(< brew-leaves.txt)`

3. Add theme to iterm2: [Oh-my-Z](https://ohmyz.sh/)   
`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

4. Add additional plugins, themes and fonts to iterm2  

   ##### Zsh plugins

   You can add additional plugins in zsh at `.oh-my-zsh/custom/plugins` location

   ```shell
   cd $ZSH/custom/plugins;git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-completions
   ```

   ##### Install Fonts

   [source-code-pro](https://github.com/adobe-fonts/source-code-pro)

   [powerline fonts](https://github.com/powerline/fonts)

   [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts)

   [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
   
   [nerd-fonts](https://www.nerdfonts.com/)

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


[nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)

[donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)

[sourabhbajaj/mac-setup/](https://sourabhbajaj.com/mac-setup/)

[andreafrancia/trash-cli](https://github.com/andreafrancia/trash-cli)

[pimpyourterminal/blob/master/.zshrc](https://github.com/codetalkchannel/pimpyourterminal/blob/master/.zshrc)

[zsh-users](https://github.com/zsh-users)

[help.github](https://help.github.com/en)

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

# If you're using Zsh
echo 'export PATH="$HOME/.gem/ruby/2.7.2/bin:$PATH"' >> ~/.zshrc

# If you're using Bash
echo 'export PATH="$HOME/.gem/ruby/2.7.2/bin:$PATH"' >> ~/.bash_profile

# Install Ruby
rbenv install 2.7.2
rbenv global 2.7.2
ruby -v

rbenv rehash

# to check outdated gems
gem outdated

#update all outdated gems
sudo gem update

# delete older gems
sudo gem cleanup

```

 The first thing you want to do after installing a new Ruby version is to [install Bundler](https://github.com/nicolashery/mac-dev-setup#ruby).   
 This tool will allow you to set up separate environments for your different Ruby projects, so their required gem versions won't conflict with each other.  
 Install Bundler with:  

`gem install bundler`

 In a new Ruby project directory, create a new Gemfile with: like venv of python environment  
`bundle init`


##### Make ls, ll commands colorful and much more using [colorls](https://github.com/athityakumar/colorls)

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


Following are some alternatives to colorls

[ogham/exa](https://github.com/ogham/exa)

[Peltoche/lsd](https://github.com/Peltoche/lsd)





##### powerlevel10k on top of powerlevel9k

This is optional setup and can be easy to change to and fro from powerlevel9k to [powerlevel10k](https://github.com/romkatv/powerlevel10k)

Only change you need to do is
1. Clone powerlevel10k sourcecode
```bash
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
```

2. Add powerlevel10k theme to `.zshrc` file and comment powerlevel9k
```bash
#ZSH_THEME="powerlevel9k/powerlevel9k"
 ZSH_THEME="powerlevel10k/powerlevel10k"
 ```
3. source the zsh config file
```bash
source ~/.zshrc
```

4. If you still need to configure powerlevel10k, you can execute following command and choose suitable options for you

```bash
p10k configure
```

5. If you want to use older setup, just change the theme to powerlevel9k and 
```bash
mv ~/.p10k.zsh ~/.p10k.zsh.bak
```
Minor difference compare to previous setup
1. No longer print status bar on enter command   
2. git status difference, we get total number of unstaged, untracked files, here 5 unstaged files and 13 untracked files   
3. if previous command's return status was success/error then subsequent enter will be in green/red respectively as shown below   

![](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screenshot%202019-12-21%20at%204.59.39%20PM.png)
![](https://github.com/dineshbhagat/mac-configurations/blob/master/images/Screenshot%202019-12-21%20at%204.57.52%20PM.png)



Other customizations you can try:
1. https://denysdovhan.com/spaceship-prompt/


------
<a href="#configurations">:arrow_up:</a>  
#### Python setup

`brew install python@3`  

info:   
```bash
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.7/site-packages
```

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

Now, if you want to extract which all packages you installed   
```python
pip2 freeze > requirements-2.txt
# OR
pip3 freeze > requirements-3.txt
```

If you want to install all packages from `requirements.txt`   

```python
pip2 install -r requirements.txt
#OR
pip3 install -r requirements.txt
```
------
<a href="#configurations">:arrow_up:</a>  
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
      
------
<a href="#configurations">:arrow_up:</a>  
#### Groovy setup
If you have existing groovy version installed remove it first  
`brew remove groovy`  
Then install SDK by  
`brew install groovysdk`  
`export GROOVY_HOME=/usr/local/opt/groovy/libexec`  
Point intelliJ idea to following path  
`/usr/local/Cellar/groovysdk/<version>/libexec`  
check version  
`groovy --version`  

Ref:
[1](https://stackoverflow.com/a/42952785/2987755)

------
<a href="#configurations">:arrow_up:</a>  
#### IntelliJ idea settings

For IntelliJ keymap, import [settings.jar](settings.jar)

[Fonts](https://www.jetbrains.com/lp/mono/)

------

#### Multiple java versions in mac

http://jdk.java.net/12/ unzip and use for latest features, this will not mess-up your mac java version and environment variables

------ 
<a href="#configurations">:arrow_up:</a>  
#### SDKMAN

Install:

```shell
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

```
Uninstall: 

```shell
tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman
# remove following line from bashrc/zshrc
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/dudette/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dudette/.sdkman/bin/sdkman-init.sh"

```

Update:  
`sdk update`

Usage:

```shell
# Docs: https://sdkman.io/usage
sdk install micronaut
sdk list micronaut
sdk uninstall micronaut 1.0.4
```

Install Java (multi distribution)

```bash
sdk list java
```

Available Java Versions

`>>>` indicates current default version

| Vendor        | Use | Version      | Dist    | Status     | Identifier       |
|---------------|-----|--------------|---------|------------|------------------|
| AdoptOpenJDK  |     | 15.0.0.j9    | adpt    |            | 15.0.0.j9-adpt   |      
|               | >>> | 11.0.8.hs    | adpt    | installed  | 11.0.8.hs-adpt   |
|               |     | 8.0.265.j9   | adpt    |            | 8.0.265.j9-adpt  |
|               |     | 8.0.265.hs   | adpt    |            | 8.0.265.hs-adpt  |
| Amazon        |     | 15.0.0       | amzn    |            | 15.0.0-amzn      |
|               |     | 11.0.8       | amzn    |            | 11.0.8-amzn      |
|               |     | 8.0.265      | amzn    |            | 8.0.265-amzn     |
| Azul Zulu     |     | 15.0.0       | zulu    |            | 15.0.0-zulu      |     
| BellSoft      |     | 15.0.0.fx    | librca  |            | 15.0.0.fx-librca |    
| GraalVM       |     | 20.2.0.r11   | grl     |            | 20.2.0.r11-grl   |     
| Java.net      |     | 16.ea.19     | open    |            | 16.ea.19-open    |       
| SAP           |     | 15.0.0       | sapmchn |            | 15.0.0-sapmchn   |
     

Use the Identifier for installation:   

```bash
# syntax
sdk install java <version-dist>
# e.g.
sdk install java 11.0.8.hs-adpt

```

Ref: https://sdkman.io/

------
<a href="#configurations">:arrow_up:</a> 
#### Keychain Password

[add/update/delete](https://github.com/dineshbhagat/mac-configurations/blob/master/Keychain-password.md)

------

#### video tutorials

If you still could not follow up the steps, follow steps mentioned in the video  
Part1: https://www.youtube.com/watch?v=iwH1XqVjZOE  
Part2: https://www.youtube.com/watch?v=UsKd9Y42Mo0  


------
<a href="#configurations">:arrow_up:</a> 

[customize-iterm2.sh](https://gist.github.com/dineshbhagat/a4bdff5c011957f9950b9bebed7f5e30)

------
