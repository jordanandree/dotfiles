# title: vim

mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/w0ng/vim-hybrid.git ~/.vim/

vim +PluginInstall +q
nvim +PluginInstall +q
