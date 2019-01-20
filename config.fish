set -U FZF_LEGACY_KEYBINDINGS 0

if type exa >/dev/null 2>&1
    alias ls 'exa'
    alias l 'exa -al'
end

if type ccat >/dev/null 2>&1
    alias cat 'ccat --bg=dark'
end

# Load anyenv automatically by adding
# the following to ~/.config/fish/config.fish:

set -x PATH $PATH $HOME/.anyenv/bin

status --is-interactive
and source (anyenv init -|psub)
