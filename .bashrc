HISTSIZE=10000
HISTFILESIZE=10000

alias ls='ls -FG'
alias ll='ls -alFG'

# Git

## Source git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

## Source git prompt
if [ -f ~/.git-prompt.sh ]; then
    # リポジトリの状態によって表示が変わる設定を有効にする
    GIT_PS1_SHOWDIRTYSTATE=1
    . ~/.git-prompt.sh
    PS1='[\W$(__git_ps1 " (%s)")]\$ '
fi

