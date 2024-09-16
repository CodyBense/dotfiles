HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

source <(fzf --zsh)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

export PATH=$PATH:$HOME/go/bin

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
alias cat="bat"
alias ".."="cd .."
alias "2."="cd ../.."
alias "3."="cd ../../.."
alias "4."="cd ../../../.."
alias py="python3"

randomPokemon="$HOME/.config/.scripts/randomPokemon.sh"
[[ -s $randomPokemon ]] && source $randomPokemon

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/codybense/.bun/_bun" ] && source "/home/codybense/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
