#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if uwsm check may-start && uwsm select; then
    exec uwsm start default
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/codybense/.config/.dart-cli-completion/bash-config.bash ] && . /home/codybense/.config/.dart-cli-completion/bash-config.bash || true
## [/Completion]

. "$HOME/.cargo/env"
