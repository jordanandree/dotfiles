# title: RVM

if [ ! -d ~/.rvm ]; then
  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi
