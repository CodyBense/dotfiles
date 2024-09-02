HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source <(fzf --zsh)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

#aliases
alias pacman="sudo pacman"
alias c="clear"
alias v="nvim"
alias iv='nvim $(fzf --preview="bat --color=always {}")'
alias sv="sudo nvim"
alias ll="ls -l"
alias la="ls -a"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias ".."="cd .."
alias "2."="cd ../.."
alias "3."="cd ../../.."
alias "4."="cd ../../../.."
alias py="python3"
