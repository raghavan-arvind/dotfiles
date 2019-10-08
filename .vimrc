" Standard Settings "
filetype plugin indent on
syntax on
inoremap jk <Esc>
set nocompatible
set encoding=utf-8
set ignorecase

" Default Indent Settings "
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Filetype-specific Indent Settings"
autocmd Filetype markdown setlocal shiftwidth=2 tabstop=2

" Mac Backspace Fix "
set backspace=indent,eol,start

set hidden
set formatoptions+=r
set splitright
set mouse=a

" Explorer Settings
let g:netrw_banner = 0
nnoremap <Space>re :Rex<CR>

" VimWiki Settings "
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay

" Splitting Windows
nnoremap <Space>w <C-W>
nnoremap <Space>w/ :vsplit .<CR>

" Buffer Control
nnoremap <Space>bn :bnext<CR>
nnoremap <Space>bp :bprev<CR>
nnoremap <Space>bb :ls<CR>

" Colors
set background=dark
