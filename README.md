[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)   **But it is**  [![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)  

### Configurations

***

- [Configurations](#configurations)
  - [Iterm2/Terminal configurations](#iterm2terminal-configurations)
    - [Zsh plugins](#zsh-plugins)
    - [Install Fonts](#install-fonts)
    - [Get better version of man pages](#get-better-version-of-man-pages)
    - [Install Ruby](#install-ruby)
    - [Make ls, ll commands colorful](#make-ls-ll-commands-colorful)
    - [Smart cd command](#smart-cd-command)
    - [Optional powerlevel10k Configuration](#powerlevel10k-configuration)
    - [iterm2 color theme](#iterm2-color-theme)
    - [Terminal File Manager](#terminal-file-manager)
    - [Terminal Git Gui](#terminal-git-gui)
    - [Terminal Git Diff Tool](#terminal-git-diff-tool)
    - [Use Idea As Default Command Line Merge Tool](#use-idea-as-default-command-line-merge-tool)
    - [Uniform Commits for git projects](#uniform-commit-message-format)
    - [fig autocomplete](#fig-autocomplete)
  - [nushell](#nushell)
  - [Python setup](#python-setup)
    - [Multiple python versions on local machine](#multiple-python-versions-on-local-machine)
    - [Virtual Environment for python](#virtual-environment-for-python)
  - [GO setup](#go-setup)
    - [Environment variables](#environment-variables)
  - [Groovy setup](#groovy-setup)
  - [IntelliJ idea settings](#intellij-idea-settings)
  - [Multiple java versions in mac](#multiple-java-versions-in-mac)
  - [SDKMAN](#sdkman)
  - [Postman Configs](#postman-configs)
  - [Keychain-password](#keychain-password)
  - [video tutorials](#video-tutorials)
  - [Basic Mac setup](#basic-mac-setup)
  - [Softwares](#softwares)
  - [Application Initializers](#application-initializers)

***



<a href="#configurations">:arrow_up:</a> 
#### Iterm2/Terminal configurations

Note: Make sure you have *local admin rights* before you proceed with the following installations.

Following site will help you setup your mac.

1. Install iterm2 from https://www.iterm2.com/ and Install Homebrew from https://brew.sh/ 

2. Install software listed in file brew-leaves.txt(export `brew leaves | xargs brew desc --eval-all`, `brew ls --casks | xargs brew desc --eval-all`)    
   `brew install $(< brew-leaves.txt)`

3. Add theme to iterm2: [Oh-my-Z](https://ohmyz.sh/)   
   ```shell
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

4. Add additional plugins, themes and fonts to iterm2  

   ##### Zsh plugins

   You can add additional plugins in zsh at `.oh-my-zsh/custom/plugins` location

   ```shell
   cd $ZSH/custom/plugins;git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-completions
   ```

   ##### Install Fonts
   
   ```bash
   brew tap homebrew/cask-fonts
   brew install --cask font-hack-nerd-font

   # powerline clone
   git clone https://github.com/powerline/fonts.git --depth=1
   # install
   cd fonts
   ./install.sh
   # clean-up a bit
   cd ..
   rm -rf fonts
   ```

   [source-code-pro](https://github.com/adobe-fonts/source-code-pro)

   [powerline fonts](https://github.com/powerline/fonts)

   [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts)
   
   [nerd-fonts](https://www.nerdfonts.com/)

5. Install powerlevel10k theme(`brew install powerlevel10k`)
6. Update [.zshrc](https://github.com/dineshbhagat/mac-configurations/blob/d220ae87fa8351adf7ba63db73f6a91b2fb866cb/.zshrc) file
7. change fonts for iterm2: iTerm2 -> Preferences -> Profiles -> Text -> Font -> Change Font to hack-nerd
8. Execute `compaudit | xargs chmod g-w,o-w /usr/local/share/zsh ;compaudit | xargs chmod g-w,o-w /usr/local/share/zsh/site-functions`
9. change font settings as shown in image  
   ![image](images/Screen%20Shot%202018-12-04%20at%205.47.48%20PM.png)
10. Vim Customization 

    ```shell
      git clone https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
    ```

11. Customize iterm2 [shortcut](https://stackoverflow.com/a/10485061/2987755)  
    ![image](images/iterm2-config.png)

    ⌘←  "SEND HEX CODE"      0x01  
    ⌘→  "SEND HEX CODE"      0x05  
    ⌥←  "SEND ESC SEQ"  b  
    ⌥→  "SEND ESC SEQ"  f  

12. Bonus: If you want terminal app to be similar to iterm2 do following settings
    - terminal -> preference -> Basic theme ->Background -> change color from white to black, 
    - Text -> change color from black to white
    - Font -> change for to Hack bold nerd font  

More info:

- [nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)

- [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)

- [sourabhbajaj/mac-setup/](https://sourabhbajaj.com/mac-setup/)

- [andreafrancia/trash-cli](https://github.com/andreafrancia/trash-cli)

- [pimpyourterminal/blob/master/.zshrc](https://github.com/codetalkchannel/pimpyourterminal/blob/master/.zshrc)

- [zsh-users](https://github.com/zsh-users)

- [help.github](https://help.github.com/en)

Following are other changes require to make iterm more customizable and solutions to some problem I have encountered so far.

##### Get better version of man pages

https://tldr.sh/

##### Install Ruby

[Ruby Version Manager](https://github.com/rbenv/rbenv)

```shell
brew install rbenv ruby-build

# Add rbenv to bash/zsh (.bash_profile/.zshrc) so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

echo 'if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi' >> ~/.zshrc
source ~/.zshrc

# If you're using Zsh
echo 'export PATH="$HOME/.gem/ruby/2.7.2/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc

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


##### Make ls, ll commands colorful

1. [exa](https://the.exa.website/)

   ```shell
   brew install exa
   ```

2. [LSD](https://github.com/Peltoche/lsd) --> **I liked this one** 

   ```shell
   brew install lsd
   alias ll='lsd -la'
   alias ls='lsd'
   ```
3. [colorls](https://github.com/athityakumar/colorls) --> slower compared to other plugins

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

![normal-prompt](images/Screen%20Shot%202018-10-08%20at%2011.50.18%20AM.png)

![auto-complete](images/Screen%20Shot%202018-10-08%20at%2011.59.12%20AM.png)

command-failure-status:

![terminate-command-on-failure-status](images/Screen%20Shot%202018-10-08%20at%2012.00.18%20PM.png)

![ll-and-ls-commands](images/Screen%20Shot%202016-11-08%20at%2012.18.00%20AM.png)

##### Smart cd command

[zoxide](https://github.com/ajeetdsouza/zoxide)

[fzf](https://github.com/junegunn/fzf)

```bash
brew install zoxide
brew install fzf
# add following at the end of zshrc file
eval "$(zoxide init --cmd cd zsh)"
```


##### powerlevel10k configuration

1. To configure powerlevel10k, execute following command and choose suitable options for you

```bash
p10k configure
```

2. This will generate following files and you can have multiple files for each of the config 
```bash
mv ~/.p10k.zsh ~/.p10k.zsh.config1
```
To use desired config
```bash
cp ~/.p10k.zsh.config1 ~/.p10k.zsh
```
Restart the terminal.   

![](images/Screenshot%202019-12-21%20at%204.59.39%20PM.png)
![](images/Screenshot%202019-12-21%20at%204.57.52%20PM.png)

Other customizations you can try:
1. [🚀](https://spaceship-prompt.sh/)
2. [⭐🚢 == 🚀](https://starship.rs/)
3. [🐟🐚](https://fishshell.com/)
4. [List Of Shell Customization frameworks](https://github.com/alebcay/awesome-shell)

**Sadly, this project is no longer maintained 😞**

------

<a href="#configurations">:arrow_up:</a>
#### iterm2 color theme

The color scheme I have used in above iterm2 snapshots is [here](mac-configuration.itermcolors)

If you need different color schemes then you can [ref](https://github.com/sindresorhus/iterm2-snazzy)

- Download the colorscheme file
- double click on it, iterm2 will import it.

------

<a href="#configurations">:arrow_up:</a>  
#### Terminal File Manager

Installation:   
```bash
brew install nnn
```
OR     
Refer installation instructions from [here](https://github.com/jarun/nnn/wiki)   
OR   
This will add icons to directories and files   
Note: Nerd fonts should be installed and configured.

```bash
wget https://github.com/jarun/nnn/archive/refs/heads/master.zip
tar -zxvf master.zip
cd nnn-master/
# Not Zero, but Alphabet O, you will get binary nnn in same folder and you can move this bonary to the place you want and use it.
sudo make O_NERD=1

# Since I have install nnn with homebrew and it does not give any colors and icons, so  compiled it manually and replaced nnn binary file
sudo cp nnn /usr/local/Cellar/nnn/4.0/bin/
alias nnn='nnn -de'
```

![image](images/Screenshot%202021-04-23%20at%2012.21.01%20PM.png)


Plugins   
```bash
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
```
Plugins are installed to `${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins`.

Add active plugin list to .zshrc/.bashrc file
```
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
```

Ref: 
- [nnn-github](https://github.com/jarun/nnn)

------

<a href="#configurations">:arrow_up:</a> 

#### Terminal Git Gui

```bash
brew install jesseduffield/lazygit/lazygit
```

Ref:
- [lazygit-github](https://github.com/jesseduffield/lazygit)

------

<a href="#configurations">:arrow_up:</a> 

#### Terminal Git Diff Tool

```bash
brew install difftastic
```

Ref:
- [Difftastic is Fantastic](https://github.com/wilfred/difftastic)
- [installation with git](https://difftastic.wilfred.me.uk/git.html)

------

#### Use Idea As Default Command Line Merge Tool

Note: 
1. `/Applications/IntelliJ IDEA.app/Contents/macOS/idea` is installation path of idea IDE(or if you are using Toolbox to install IDE `~/Applications/IntelliJ\ IDEA\ Community\ Edition.app/Contents/MacOS/idea`).    
2. By default, Git keeps a copy of the file's contents before resolving conflicts.  
   After a merge, Git saves the original file with the conflict tags with a .orig extension.  
   This file will not be preserved if you set the variable `keepBackup` to `false`.
    
```bash
# Find .gitconfig file and add following config

[merge]
tool = intellij
[mergetool "intellij"]
cmd = '~/Applications/IntelliJ\ IDEA\ Community\ Edition.app/Contents/MacOS/idea' merge "$LOCAL" "$REMOTE" "$BASE"
“$MERGED”
trustExitCode = true
[mergetool]
keepBackup = false 
```

3. Whenever in merge conflict situation, execute `git mergetool` (this mergetool string is defined in config)
4. Once conflict is resolved in idea, click on apply button to conclude the merge.

[Ref](https://www.jetbrains.com/help/idea/tutorial-use-idea-as-default-command-line-merge-tool.html)

------

<a href="#configurations">:arrow_up:</a> 

#### Uniform commit message format

[commitizen](https://commitizen-tools.github.io/commitizen/)

![](https://github.com/dineshbhagat/mac-configurations/blob/59b2e6be92ab5878201b365333c48f1692fcc7b6/images/cz1.png)
![](https://github.com/dineshbhagat/mac-configurations/blob/59b2e6be92ab5878201b365333c48f1692fcc7b6/images/cz2.png)

**In case if you want to change message prompt and add additional types then edit following file**  

Add following code at the end of files `/usr/local/lib/python3.11/site-packages/commitizen/defaults.py` and `/usr/local/Cellar/commitizen/3.5.4/libexec/lib/python3.11/site-packages/commitizen/defaults.py`.   
```
version_parser = r"(?P<version>([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?(\w+)?)"
```
For "conventional_commits" type template    
`commitizen-version` --> replace version number   
File: [/usr/local/lib/python3.11/site-packages/commitizen/cz/conventional_commits/conventional_commits.py, /usr/local/Cellar/commitizen/<commitizen-version>/libexec/lib/python3.11/site-packages/commitizen/cz/conventional_commits/conventional_commits.py](https://github.com/dineshbhagat/mac-configurations/blob/7710d09503d9b8a08a6493db97fb262d579865b1/conventional_commits.py)

This has one downside that, for every commitizen upgrade, need to change ^^ files manually   
```bash
cp /usr/local/lib/python3.11/site-packages/commitizen/cz/conventional_commits/conventional_commits.py /usr/local/Cellar/commitizen/$(cz version)/libexec/lib/python3.11/site-packages/commitizen/cz/conventional_commits/conventional_commits.py

cat <<"EOT" >> /usr/local/Cellar/commitizen/$(cz version)libexec/lib/python3.11/site-packages/commitizen/defaults.py

version_parser = r"(?P<version>([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?(\w+)?)"
EOT
```

```python
class: class ConventionalCommitsCz(BaseCommitizen)
method: def questions(self)
 "choices": [
 // other existing choices, NOTE: key should be of single character and should not be used by existing choices
 {
    "value": "chore",
    "name": (
        "chor: changes that do not relate to a fix or feature and "
        "don't modify src or test files (for example updating dependencies)"
    ),
    "key": "h",
},
{
    "value": "revert",
    "name": (
        "revert: reverts a previous commit"
    ),
    "key": "z",
},
``` 
Similarly scope and subject can be modified.

Add `revert` and `chore` in schema patters as well

```python
    def schema_pattern(self) -> str:
        PATTERN = (
            r"(?s)"  # To explictly make . match new line
            r"(build|ci|chore|docs|feat|fix|perf|refactor|style|test|chore|revert|bump)"  # type
            r"(\(\S+\))?!?:"  # scope
            r"( [^\n\r]+)"  # subject
            r"((\n\n.*)|(\s*))?$"
        )
        return PATTERN
```

------

<a href="#configurations">:arrow_up:</a> 

#### [Fig Autocomplete](https://fig.io/)

```bash
brew install --cask fig
```

You can opt-out of all telemetry and crash reporting by running:   
```
fig settings telemetry.disabled true
```

Requires an emailId for the setup. :unamused:

------

<a href="#configurations">:arrow_up:</a> 
#### nushell
- if you work with lots of json, yaml, toml, xml, csv, ini, data files, then I would suggest this shell than any other shell, it gives you so many options to make your life easy. 
- It is a structured shell like PowerShell.
- Nu views data functionally.
- Rather than using mutation, pipelines act as a means to load, change, and save data without mutable state.
- If you are used to any previous shell then this would help you get started: https://www.nushell.sh/book/nushell_map.html, https://www.nushell.sh/book/nushell_operator_map.html
- Some of the programming language option on shell prompt: https://www.nushell.sh/book/nushell_map_imperative.html 
```bash
# Linux and macOS
brew install nushell
# Windows
winget install nushell
```
After installing, launch Nu by typing `nu`

[website](https://www.nushell.sh/)   
[github](https://github.com/nushell/nushell)  
[book](https://www.nushell.sh/book/)  

------

<a href="#configurations">:arrow_up:</a>  
#### Python setup

1. **pyenv** manages multiple versions of Python itself.
2. **virtualenv/venv** manages virtual environments for a specific Python version.
3. **pyenv-virtualenv** manages virtual environments for across varying versions of Python.

![](https://imgs.xkcd.com/comics/python_environment.png)

```
brew install python@3
pip install --upgrade setuptools
python -m ensurepip --upgrade
pip install --upgrade pip
```

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

##### Multiple python versions on local machine

```bash
# install py environment manager
brew install pyenv
# identify versions available
pyenv install --list
# Install python
pyenv install <python-version>
# verify installed version
pyenv versions
# To set global python version
pyenv global <python-version>
# To set local version, this is helpful when you have multiple projects depends on different python versions but at the same time, you do not want to change your global python version
pyenv local <python-version>
# check python version
python -version
# Once you close the terminal or open new terminal tab, this may not work, we need to initialize everytime we start a bash/zsh sessions
# add following in .zshrc or .bashrc file, similar to rbenv(ruby environment)
eval "$(pyenv init -)"
# installation location
ls ~/.pyenv/versions/
# To remove any python version
pyenv uninstall <python-version>
# To check installed python versions
pyenv versions
```

##### Virtual Environment for python

It offers flexibility in isolating multiple python environment and does not interfer with other virtual environment  
Package installed in one virtual environment will not be visible in other virtual environment  
Package installed in virtual environment will not be installed system wide hence it will not be available to all programs which uses system python setup.

System python installation path   
`/System/Library/Frameworks/Python.framework/`

Homebrew installed python path  
`/usr/local/Cellar/python/<version>/`


Let us use python3 for virtual environment  
`pip3 install virtualenv`   
OR upgrade    
`pip install --upgrade virtualenv`   

Setup virtual environment at any location, lets setup at home directory  
```bash
virtualenv -p python3 ~/virtEnvPy3
python3 -m pip install --upgrade setuptools
virtualenv --upgrade-embed-wheels
```  


Activate virtual environment  

```bash
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
pip3 install --user -r requirements.txt
# pip3 install help
# --user --> Install to the Python user install directory for your platform.  
# Typically ~/.local/, or %APPDATA%\Python on Windows.  
# (See the Python documentation for site.USER_BASE for full details.
```

##### Use pyenv along with venv [preferred if you have multiple projects with different python versions]   
This is possible with [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) plugin.   
Installation of pyenv-virtualenv plugin, for more refer respective github page:     
```bash
brew install pyenv-virtualenv
# Add following to .zshrc/,bashrc file
eval "$(pyenv virtualenv-init -)" 
```

Create a virtual environment, make sure you have installed `python-version` from pyenv. This creates `.python-version` file to project folder.  
`pyenv virtualenv <python-version> <environment/project_name>` e.g. `pyenv virtualenv 3.11.9 LLM-demo`

If you need all site-packages from parent python version to be available in virtual env then   
```bash
pyenv virtualenv --system-site-packages <python-version> <environment/project_name>
```


Activate Virtual env
`pyenv local <environment_name>LLM-demo` e.g. `pyenv local LLM-demo`

Verify
```bash
pyenv which python
pyenv which pip
```


Ref:   
 - [intro-to-pyenv](https://realpython.com/intro-to-pyenv/)
 - [python 3.12 breaking changes](https://stackoverflow.com/a/77364602/2987755)

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
`go get -u github.com/tednaleid/ganda`


More Ref
1. [Ganda](https://github.com/tednaleid/ganda)
2. [Golang-Homepage](https://golang.org/project/)
3. [GO-info](go-info.md)
      
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

[To Launch from terminal](https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#toolbox)   
1. Go to respective app's settings and give shell scripts name. Let say `ideac` for community version of intellij idea.  
2. Execute `ideac .` from terminal to launch it.  

[Fonts](https://www.jetbrains.com/lp/mono/)

------

#### Multiple java versions in mac

http://jdk.java.net/12/ unzip and use for latest features, this will not mess-up your mac java version and environment variables

------ 
<a href="#configurations">:arrow_up:</a>  
#### SDKMAN

Why:
- When you have multiple project which depends on different java versions
- It is difficult to remember which java version is required for project

Helps:  
- Setup once for all the project,
- Free from cognitive load and changing java version for the project unless supported java version changed ☕
- Global and local java versions can co-exists.
- IDE support for sdkman downloaded java

Install:

```shell
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```
THIS MUST BE AT THE END OF THE .zshrc/.bashrc FILE FOR SDKMAN TO WORK!!!
```bash
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

OR using [homebrew-deprecated](https://github.com/sdkman/homebrew-tap)
```shell
brew tap sdkman/tap
brew install sdkman-cli
# then add following lines to the end of your .bash_profile or .zshrc file
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
```

Verify installation:   
`sdk version`

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
| Amazon        |     | 15.0.0       | amzn    |            | 15.0.0-amzn      |
|               |     | 11.0.8       | amzn    |            | 11.0.8-amzn      |
| Azul Zulu     |     | 15.0.0       | zulu    |            | 15.0.0-zulu      |      
| GraalVM       |     | 20.2.0.r11   | grl     |            | 20.2.0.r11-grl   |     
| Java.net      |     | 16.ea.19     | open    |            | 16.ea.19-open    |       
| SAP           |     | 15.0.0       | sapmchn |            | 15.0.0-sapmchn   |

Use the Identifier for installation:   
```bash
# syntax
sdk install java <Identifier>
# e.g.
sdk install java 11.0.23-tem
```
Note: Install Global JDK with `Y` prompt and rest of the JDK as `n`   
Do you want java <identifier> to be set as default? (Y/n): Y   
Or 
you can set any version as default   
```bash
sdk default java 11.0.23-tem
```

To check java version at any path `sdk current java`  

To setup java for any project, go to project root folder and execute  
`sdk env init` -> This will create .sdkmanrc file.   
It adds global java version in file as
```
java=11.0.23-tem
```
If you need different version, edit file and update required java version with its identifier. 
Verify change by `sdk env`.  

Now if you want to setup project specific jdk version and do not want to switch everytime
add/enable `sdkman_auto_env=true` in `$SDKMAN_DIR/etc/config` file by executing `sdk config`   

Update specific libs or all the libs `sdk upgrade java` or `sdk upgrade` 

Temporary file cleanup `sdk flush`

Script : When we want to use java_home in script, get jdk home as `sdk home java <identifier>`


Ref:
- [sdkman homepage](https://sdkman.io/)

------ 
<a href="#configurations">:arrow_up:</a>  
#### Postman Configs

[bearer token in pre-script and dynamic variables](postman.md)

------
<a href="#configurations">:arrow_up:</a> 
#### Keychain Password

[add/update/delete](Keychain-password.md)

[Ref for github pages](https://github.com/benbalter/jekyll-relative-links/)

------

#### video tutorials

If you still could not follow up the steps, follow steps mentioned in the video  
[Part1:https://www.youtube.com/watch?v=iwH1XqVjZOE](https://www.youtube.com/watch?v=iwH1XqVjZOE)  
[Part2:https://www.youtube.com/watch?v=UsKd9Y42Mo0](https://www.youtube.com/watch?v=UsKd9Y42Mo0).   

------

If your zsh is slower: 

- check shell loading time
  ```
  timezsh() {
     shell=${1-$SHELL}
     for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
   }
  timezsh 
  ```
- check its plugin loading time
  ```
   # Load all of the plugins that were defined in ~/.zshrc
   for plugin ($plugins); do
     timer=$(($(gdate +%s%N)/1000000))
     if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
       source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
     elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
       source $ZSH/plugins/$plugin/$plugin.plugin.zsh
     fi
     now=$(($(gdate +%s%N)/1000000))
     elapsed=$(($now-$timer))
     echo $elapsed":" $plugin
   done
  ```
- zsh profiler module
  ```
  zmodload zsh/zprof
  zprof
  ```

[Ref](https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html#:~:text=We%20did%20it%20by%3A,environments%20using%20the%20evalcache%20plugin)

------
<a href="#configurations">:arrow_up:</a> 
### Basic Mac Setup

[These](basic-mac-configuration.md) are common solutions to problems faced while using mac.

------
<a href="#configurations">:arrow_up:</a> 
### Softwares

[These](softwarelist.md) softwares I find it useful and grateful to the people who take care of it.

------
<a href="#configurations">:arrow_up:</a> 
### Application Initializers

[Some of the useful application generators](application-initializers.md).

------

<a href="#configurations">:arrow_up:</a> 

[customize-iterm2.sh](https://gist.github.com/dineshbhagat/a4bdff5c011957f9950b9bebed7f5e30)

{% gist a4bdff5c011957f9950b9bebed7f5e30 customize-iterm2.sh %}

[jekyll-gist](https://github.com/jekyll/jekyll-gist)


------

Other Awesome resources 😎 📚 🗒️:

- https://github.com/sindresorhus/awesome
- https://github.com/jlevy/the-art-of-command-line
- https://github.com/rothgar/awesome-tuis
- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/cirosantilli/linux-kernel-module-cheat
- https://github.com/rothgar/mastering-zsh
- https://github.com/forthebadge/for-the-badge
- https://github.com/serhii-londar/open-source-mac-os-apps

------
