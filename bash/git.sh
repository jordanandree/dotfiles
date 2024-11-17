function wt_root() {
    git rev-parse --path-format=absolute --git-common-dir
}

function new-worktree() {
    local user=$(whoami)
    local name="$1"

    if [[ -z "$name" ]]; then
        name=read
    fi

    if [[ -z "$name" ]]; then
        echo "Name is required."
        return
    fi

    cd $(wt_root)
    git worktree add "$user/$1" -B "$user/$1" main
    cd "$user/$1"
}

function list-worktree() {
    git worktree list | fzf | awk '{print $1}'
}

function switch-worktree() {
    cd $(list-worktree)
}

function remove-worktree() {
    local tree=$(list-worktree)

    cd $(wt_root)
    git worktree remove "$tree"
}
