#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Updating repo with local changes..."

cp -v "$HOME/.vimrc" "$SCRIPT_DIR/.vimrc"

rsync -av --delete --exclude="pack/" "$HOME/.vim/" "$SCRIPT_DIR/.vim/"

if [[ -n $(git status -s) ]]; then
    echo "Changes detected. Pushing to GitHub..."
    git add .
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    echo "Push successful!"
else
    echo "No changes detected. Nothing to push."
fi
