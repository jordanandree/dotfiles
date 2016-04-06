# title: vim

if [ ! -d ~/.vim/bundle/ ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d ~/.vim/colors/ ]; then
  mkdir -p ~/.vim/colors
  cp ./vim/colors/hybrid.vim ~/.vim/colors/
fi;

if [ ! -d ~/.config/nvim/ ]; then
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi

vim +PluginInstall +qall
nvim +PluginInstall +qall
