function wt_root() {
    git rev-parse --path-format=absolute --git-common-dir
}

function new-worktree() {
    local user=$(whoami)
    local name="$1"

    if [[ -z "$name" ]]; then
        read -p "Enter worktree name: " name
    fi

    if [[ -z "$name" ]]; then
        echo "Name is required."
        return
    fi

    cd $(wt_root)
    git fetch origin main
    git worktree add "$user/$name" -B "$user/$name" main
    cd "$user/$name"
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
