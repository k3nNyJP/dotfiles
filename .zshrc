##### setup ssh-agent
ssh-add -q --apple-use-keychain ~/.ssh/id_rsa

##### setup completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

##### setup powerline-go
function powerline_precmd() {
    PS1="$($(brew --prefix powerline-go)/bin/powerline-go -error $? -shell zsh)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


##### ghq & fzf
export GHQ_ROOT="~/Projects"

function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf


function gadd() {
    local selected
    selected=$(unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        selected=$(tr '\n' ' ' <<< "$selected")
        git add $selected
        echo "Completed: git add $selected"
    fi
}

##### aliases
alias ls="eza"
alias la="ls -a"
alias ll="ls -l"
alias l="ls -al"
alias lt="ls -alT"

alias cat="bat"

alias sdev="ssh dev"
alias sstg="ssh staging"
alias sprod="ssh prod"
alias ssdev="sshuttle -vr dev 172.16.0.0/16"
alias ssstg="sshuttle -vr staging 10.0.0.0/8"
alias ssprod="sshuttle -vr prod 10.0.0.0/8"
alias ssqa='sshuttle -vr ec2-user@18.178.152.139 0/0 --ssh-cmd "ssh -i ~/.ssh/qa1-vacan.pem"'

alias ncu="npx npm-check-updates"

##### docker buildkit
export DOCKER_BUILDKIT=1

##### podenv
PATH=/usr/local/Cellar/podenv/1.0.0/bin:$PATH

##### setup anyenv
eval "$(anyenv init -)"

##### volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
