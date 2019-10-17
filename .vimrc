"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')

  call dein#add('tomasr/molokai')

  " file
  call dein#add('mechatroner/rainbow_csv')

  " php
  call dein#add('flyinshadow/php_localvarcheck.vim')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"-----------------------------------------
" colorscheme & view

set t_Co=256
syntax on
colorscheme molokai


" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  " PODバグ対策
  syn sync fromstart

  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
  endfunction

  augroup invisible
  autocmd! invisible
  autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

set display=lastline
set pumheight=10

set showmatch
set matchtime=1

set number

"-----------------------------------------
" file

" complete
augroup vimrc
  autocmd!
  autocmd FileType javascript setl omnifunc=jscomplete#CompleteJS
  autocmd FileType coffee setl omnifunc=jscomplete#CompleteJS
  autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
augroup END

" encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" backup
set backup
set backupdir=~/.vim/backup

" undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" buffer
set hidden

" php
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:sql_type_default  = 'pgsql'

"-----------------------------------------
" motion

" tab & indent
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set expandtab
set autoindent

" cmd
set showcmd

" BS
set backspace=indent,eol,start

" search highlight
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" repeated indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" vimgrep
autocmd QuickfixCmdPost vimgrep cw

" cursor
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE


"-----------------------------------------
" plugin

" neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

" unite
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>

" php_localvarcheck
let g:php_localvarcheck_enable = 1
let g:php_localvarcheck_global = 0
