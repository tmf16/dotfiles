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
```

## setup(bash & vim)

```
$ cd dotfiles
$ ./setup.sh
```

```
$ vim ~/.vimrc
```

```
:call dein#install()
```
