#!/bin/bash
set -eu

here=$(cd -- "$(dirname -- "$BASH_SOURCE")" && /bin/pwd)
build=$here/uvg
repo=$here/umm-v-generator/.git
branch=master
archive_fmt=tgz
env_path=config/environments/production.rb

archive_out=$build/uvg-$branch.$archive_fmt

archive_args=(
    --remote "$repo"
    # --prefix uvg
    --format "$archive_fmt"
    --output "$archive_out"
)
git archive "${archive_args[@]}" "$branch"
tar x -C "$build" -f "$archive_out" "$env_path"
sed -i.bak -e "s/\(config\.force_ssl = \)true/\1false/" "$build/$env_path"
