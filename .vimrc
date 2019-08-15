" Standard Settings "
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

set hidden
set formatoptions+=r
set splitright
set mouse=a

" Remove File Explorer Banner "
let g:netrw_banner = 0

" VimWiki Settings "
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay

" Splitting Windows
nnoremap <Space>w <C-W>
nnoremap <Space>w/ :vsplit .<CR>
nnoremap <Space>wd :q <CR>

" Buffer Control
nnoremap <Space>bn :bnext<CR>
nnoremap <Space>bb :ls<CR>

" Send to background
nnoremap <Space><Space> :w<CR><C-z>

