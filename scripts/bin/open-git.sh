#!/usr/bin/env bash

cd $(tmux run "echo #{pane_start_path}")
url=$(git remote get-url origin)

zen-browser --new-window $url || echo "No remote found"
