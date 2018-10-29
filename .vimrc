execute pathogen#infect()

filetype plugin indent on
syntax on
inoremap jk <Esc>
set nocompatible
set encoding=utf-8
set ignorecase

" Indent/Tab Settings "
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Mac Backspace Fix "
set backspace=indent,eol,start

set formatoptions+=r
set splitright
set mouse=a

" VimWiki Settings "
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay

" Some brace keybindings "
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" For updating vimrc "
autocmd BufWritePost /Users/raghavan/.vimrc !updateVimrc
