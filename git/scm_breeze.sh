# title: SCM Breeze

if [ ! -d ~/.scm_breeze ]; then
  git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
  $HOME/.scm_breeze/install.sh
fi
