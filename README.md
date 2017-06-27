# dotfiles for mac

## Homebrew

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install peco
$ brew install fasd
```

## dotfiles

```
$ git clone git@github.com:tmf16/dotfiles.git
$ cd dotfiles
```

## setup(bash & vim)

```
$ curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
$ curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
```

```
$ ln -s .bash_profile ~/.bash_profile
$ ln -s .bashrc ~/.bashrc
$ ln -s .vim ~/.vim
$ ln -s .vimrc ~/.vimrc
```

```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh .vim/dein
$ vim ~/vimrc
```

```
:call dein#install()
```
