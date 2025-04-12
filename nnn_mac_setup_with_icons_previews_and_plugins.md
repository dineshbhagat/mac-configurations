Ref: 

- https://github.com/jarun/nnn/wiki/Live-previews
- https://github.com/jarun/nnn/wiki/Advanced-use-cases
- https://github.com/jarun/nnn/wiki/Advanced-use-cases#file-icons

Do not remove following package post nnn is build, since   
ncurses is a library that provides text-based user interfaces (TUI).   
It's essential for nnn because it allows the application to display a dynamic,   
interactive user interface within the terminal.  
Without ncurses, nnn wouldn’t be able to handle terminal manipulation like scrolling, selecting files, etc  

pkg-config is a utility that helps in managing compilation flags and library dependencies.   
It helps the make process find ncurses and other libraries to ensure they are linked properly during the build.  
Removing pkg-config might prevent the build system from detecting the required libraries, leading to failed builds.  

```bash
brew install git make ncurses
brew install pkg-config
git clone https://github.com/jarun/nnn.git
cd nnn
make O_NERD=1
cd plugins
```

We may get following error if we try to use preview plugin   
```bash
syntax error near +(g'
/Users/$USER/.config/nnn/plugins/preview-tui: line 395:  
 elif [ -n "$NNN_PREVIEWVIDEO" ] && [[ "$4" == +(gif|video) ]]; then'
```

This was not posix compatible,   
we may need to replace it with   
```bash
elif [ -n "$NNN_PREVIEWVIDEO" ] && ([[ "$4" == "gif" ]] || [[ "$4" == "video" ]]); then
```
Also another error   
```bash
line 454:     
if [ "$NNN_TERMINAL" = "kitty" ] && [[ "$NNN_PREVIEWIMGPROG" == +(|icat) ]]; then'
replace it with 
if [ "$NNN_TERMINAL" = "kitty" ] && [ "$NNN_PREVIEWIMGPROG" = "icat" ]; then
```
Reason is bash-specific globbing syntax `(+())`, which doesn't work in POSIX shell.
[preview-tuiFile ref](Ref: https://github.com/jarun/nnn/blob/master/plugins/preview-tui)  

We use different app for different file types   
e.g.  
`bat` for image. 
If we have `iterm2` installed already, then we can use `imgcat` which is available with iterm2.   
Assuming iterm2 shell integration is already active (Path is added in .zshrc file)  

Essential plugins:
- preview-tui.sh — for text and image previews
- fzopen.sh — for fuzzy file opening with fzf
- nuke.sh — for opening files or directories in Finder or editor
- dragdrop.sh — for macOS drag-and-drop functionality, to drag files directly from nnn to Finder or another application.
- clipboard-mac.sh — to copy to clipboard (macOS), to copy file contents or paths to the clipboard

#### NNN config to be added in .zshrc file

```bash
# Enable NNN icons with Nerd Fonts
export NNN_PLUG='p:preview-tui;f:fzopen;o:nuke'

# Image preview program (iTerm2's imgcat)
export NNN_PREVIEWIMGPROG=imgcat

# FIFO for communication between NNN and preview
export NNN_FIFO=/tmp/nnn.fifo

# Path to your custom plugins
export NNN_OPENER=~/.config/nnn/plugins/nuke

# Enable preview and plugins for fuzzy search, preview, etc.
export NNN_USE_EDITOR=1

# Optional: Adjust the NNN window size in iTerm2 (customization)
export NNN_TERM_SIZE=20

# Optional: set default editor for NNN (e.g., vim or nano)
export NNN_USE_EDITOR=vim
```
