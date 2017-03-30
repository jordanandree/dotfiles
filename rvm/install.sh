# title: RVM

if [ ! -d ~/.rvm ]; then
  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
  \curl -sSL https://get.rvm.io | bash -s stable --ruby

  ~/.rvm/bin/rvm install 2.4.0

  gem install --system
fi
