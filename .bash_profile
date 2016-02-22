# Set title to current directory
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# bundler aliases
alias b="bundle"
alias bu="bundle update"
alias bi="bundle install"
alias be="bundle exec"
alias bs="bundle show"
alias vm="vagrant"
alias h="heroku"
alias sourcetree='open -a SourceTree'
alias st='sourcetree'
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# VPN Aliases
source ~/.openconnect/aliases

# Set editor to Sublime Text 2
export EDITOR='subl'

# green path with git branch in bash prompt
export PS1="\[\033[01;32m\] \w \[\033[0;32m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(/\n/).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]→\[\033[00m\] "

# SCM Breeze
if [ -s "$HOME/.scm_breeze/scm_breeze.sh" ]; then
  . "$HOME/.scm_breeze/scm_breeze.sh"
fi

# Bash Completion 1
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/hg-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/hg-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/brew_bash_completion.sh ]; then
. `brew --prefix`/etc/bash_completion.d/brew_bash_completion.sh
fi

if [ -f `brew --prefix`/etc/bash_completion.d/rake ]; then
. `brew --prefix`/etc/bash_completion.d/rake
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# NPM modules
export PATH="/usr/local/share/npm/bin:$PATH"

# Android SDK
export PATH="$PATH:~/bin/sdk/platform-tools"

# Composer global packages
export PATH="$PATH:~/.composer/vendor/bin"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

# Digital Ocean Vagrant Cert
export SSL_CERT_FILE="/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"

# Erlang
export PATH="$PATH:/path/to/elixir/bin"

# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE="$HOME/Virtualenvs"
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# Maven
export PATH=$PATH:/usr/local/apache-maven-3.2.3/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME
export MAVEN_OPTS=-Xmx2048m
export JVM_ARGS="-d64 -Xms2048m -Xmx15360m -server"

# added by Anaconda2 2.4.0 installer
export PATH="/Users/jordanandree/anaconda/bin:$PATH"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export rvmsudo_secure_path=1
export PATH="$PATH:$HOME/.rvm/bin"