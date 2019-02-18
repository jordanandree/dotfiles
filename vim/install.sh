# title: vim

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  mkdir -p ~/.vim/autoload
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
