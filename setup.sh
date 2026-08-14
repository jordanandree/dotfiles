#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

# Discover files dynamically. README and setup scripts are repository metadata,
# not user configuration, so they are excluded. Parent directories are created
# as needed.
while IFS= read -r -d '' source; do
  file=${source#"$repo_dir/"}
  destination="$HOME/$file"

  if [[ -e "$destination" || -L "$destination" ]]; then
    printf 'Already exists, skipping: %s\n' "$destination"
    continue
  fi

  mkdir -p -- "$(dirname -- "$destination")"
  ln -s -- "$source" "$destination"
  printf 'Symlinked %s -> %s\n' "$destination" "$source"
done < <(
  find "$repo_dir" \
    -path "$repo_dir/.git" -prune -o \
    -type f \
    ! -name 'README.md' \
    ! -name 'setup.sh' \
    ! -name '.DS_Store' \
    -print0
)
