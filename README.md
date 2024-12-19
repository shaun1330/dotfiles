# dotfiles

### Stow
Dotfiles are set up to be installed using gnu-stow. (https://www.gnu.org/software/stow/)

Homebrew - `brew install stow`


### Sketchbar-app-font
Sketchybar needs the sketchybar-app-font to be installed. Change the version number to desired. 

`curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf`

The icon_map_fn.sh file should be part of the dotfiles but you can get it using the following. 

`curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/icon_map.sh -o ~/.config/sketchybar/plugins/icon_map_fn.sh`

