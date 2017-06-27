HISTSIZE=10000
HISTFILESIZE=10000

alias ll='ls -la'

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

# history

peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi  

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi  
    else
        history -d $((HISTCMD-1))
    fi  
}
bind -x '"\C-r":peco-history'
alias ph=peco-history

# cd

peco-find-cd() {
  local DIR=$(fasd -ld | peco | head -n 1)

  if [ -n "$DIR" ] ; then
    #DIR=${DIR%/*}
    pushd "$DIR"
  fi
}
alias pd=peco-find-cd

# fasd
eval "$(fasd --init auto)"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

