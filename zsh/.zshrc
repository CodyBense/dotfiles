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
alias vi="nvim"
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

#flatpak aliases
alias yazi="flatpak run io.github.sxyazi.yazi"

# randomPokemon="$HOME/.config/.scripts/randomPokemon.sh"
# [[ -s $randomPokemon ]] && source $randomPokemon

function y() {
    local tmp="$(mktemp -t "yazi-ced.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# scripts
export PATH=$PATH:$HOME/bin

# bun completions
[ -s "/home/codybense/.bun/_bun" ] && source "/home/codybense/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-09-21 14:15:16
export PATH="$PATH:/home/codybense/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
