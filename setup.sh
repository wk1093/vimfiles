#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git -C "$SCRIPT_DIR" fetch

LOCAL=$(git -C "$SCRIPT_DIR" rev-parse HEAD)
REMOTE=$(git -C "$SCRIPT_DIR" rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Update found!"
    git pull --quiet
    exec "$BASH_SOURCE" "$@"
    exit 0
fi

echo "Syncing Vim configuration..."

mkdir -p ~/.vim/pack/plugins/start

cp -rv "$SCRIPT_DIR"/.vim/* ~/.vim/
cp -v "$SCRIPT_DIR"/.vimrc ~/.vimrc

sync_plugin() {
    local repo=$1
    local dest=$2

    if [ -d "$dest/.git" ]; then
        echo "Updating $(basename "$dest")..."
        git -C "$dest" pull
    else
        echo "Installing $(basename "$dest")..."
        mkdir -p "$(dirname "$dest")"
        git clone --depth 1 "$repo" "$dest"
    fi
}

PACK_DIR="$HOME/.vim/pack/plugins/start"
VENDOR_DIR="$HOME/.vim/pack/vendor/start"

sync_plugin "https://github.com/lambdalisue/vim-fern" "$PACK_DIR/fern"
sync_plugin "https://github.com/junegunn/fzf.git" "$PACK_DIR/fzf"
sync_plugin "https://github.com/junegunn/fzf.vim.git" "$PACK_DIR/fzf.vim"
sync_plugin "https://github.com/dense-analysis/ale.git" "$PACK_DIR/ale"
sync_plugin "https://github.com/catppuccin/vim.git" "$VENDOR_DIR/catppuccin"
sync_plugin "https://github.com/lambdalisue/vim-nerdfont" "$PACK_DIR/nerdfont.vim"
sync_plugin "https://github.com/lambdalisue/vim-fern-renderer-nerdfont" "$PACK_DIR/fern-renderer-nerdfont.vim"
sync_plugin "https://github.com/preservim/nerdcommenter.git" "$VENDOR_DIR/nerdcommenter"
sync_plugin "https://github.com/ap/vim-buftabline.git" "$PACK_DIR/vim-buftabline"
