export HISTSIZE=10000
export HISTFILESIZE=10000

PROMPT_COMMAND='history -a; history -c; history -r'
export -n PROMPT_COMMAND

export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export NODE_OPTIONS="--max-old-space-size=8192" 
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
export EDITOR='nvim'

[ -s "/Users/jandree/.scm_breeze/scm_breeze.sh" ] && source "/Users/jandree/.scm_breeze/scm_breeze.sh"
[ -s "$(brew --prefix)/etc/autojump.sh" ] && source "$(brew --prefix)/etc/autojump.sh"

# Git status in prompt
function parse_git_dirty {
  [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

# Init fzf
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,.DS_Store
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

if [ "$PS1" ] ; then
    eval "$(fzf --bash)"
    bind -x '"\C-p": vim $(fzf);'
    bind -x '"\C-f": tmux-sessionizer;'
    export PS1="\n \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
fi

[ -s "$HOME/.config/bash/git" ] && source "$HOME/.config/bash/git"
[ -s "$HOME/.config/bash/aliases" ] && source "$HOME/.config/bash/aliases"
