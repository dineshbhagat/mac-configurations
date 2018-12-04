# configurations

Note: Make sure you have local admin rights before you proceed with the following installations.

Following site will help you setup your mac.

1. Homebrew
2. Install software listed in file brew-leaves.txt `brew install $(< brew-leaves.txt)`
3. Add theme to iterm2: Oh-my-Z `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
4. Add additional themes and fonts to iterm2
5. Install powerlevel9k theme(choose Option 2: Install for Oh-My-ZSH) https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k



https://github.com/nicolashery/mac-dev-setup

https://github.com/donnemartin/dev-setup

https://sourabhbajaj.com/mac-setup/

https://github.com/andreafrancia/trash-cli



https://github.com/codetalkchannel/pimpyourterminal/blob/master/.zshrc

https://github.com/zsh-users

Following are other changes require to make iterm more customizable and solutions to some problem I have encountered so far.

#### Zsh plugins

You can add additional plugins in zsh at `.oh-my-zsh/custom/plugins` location

```shell
cd $ZSH;git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-completions
```


#### Get better version of man pages

https://tldr.sh/


#### Install Fonts

https://github.com/adobe-fonts/source-code-pro

https://github.com/powerline/fonts

https://github.com/gabrielelana/awesome-terminal-fonts

https://github.com/ryanoasis/nerd-fonts

```shell
$gem install colorls
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

#### intelliJ idea settings

For IntelliJ keymap, import settings.jar

#### multiple java versions in mac

http://jdk.java.net/12/ unzip and use for latest features, this will not mess-up your mac java version and environment variables

#### video tutorials

If you still could not follow up the steps, follow steps mentioned in the video  
Part1: https://www.youtube.com/watch?v=iwH1XqVjZOE  
Part2: https://www.youtube.com/watch?v=UsKd9Y42Mo0  

