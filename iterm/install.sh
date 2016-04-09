# title: iTerm

if [ ! -d ~/.iterm/ ]; then
  mkdir -p ~/.iterm/
  ln -sfv $(pwd -P)/iterm/com.googlecode.iterm2.plist ~/.iterm/
fi
