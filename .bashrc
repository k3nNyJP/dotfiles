# prompt
if [ $UID -eq 0 ]; then
  PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
  PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

# bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# minikube completion
if type minikube >/dev/null 2>&1; then
  [ -f ~/.minikube-completion ] && . ~/.minikube-completion
fi

# alias
if type exa >/dev/null 2>&1; then
  alias ls="exa"
  alias la="exa -a"
  alias ll="exa -l"
  alias l="exa -al"
else
  alias ls="ls -FG"
  alias ll="ls -l"
  alias la="ls -A"
  alias l="ls -Al"
fi

# sudo completion
complete -cf sudo
