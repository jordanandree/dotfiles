# title: tmux

if [ ! -d ~/src/powerline-fonts ]; then
  mkdir -p ~/src/
  git clone https://github.com/powerline/fonts.git  ~/src/powerline-fonts
  (cd ~/src/powerline-fonts && ./install.sh)

  curl -o ~/Library/Fonts/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
fi;
