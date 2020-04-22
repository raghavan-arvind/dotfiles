" Standard Settings "
filetype plugin indent on
syntax on
inoremap jk <Esc>
set nocompatible
set encoding=utf-8
set ignorecase
set clipboard=unnamed
set splitright
set mouse=a
set formatoptions=crqlj

" Default Indent Settings "
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=65

" Filetype-specific Indent Settings "
autocmd Filetype markdown setlocal shiftwidth=2 tabstop=2
autocmd Filetype sh setlocal shiftwidth=4 tabstop=4 noexpandtab

" Mac Backspace Fix "
set backspace=indent,eol,start

" Explorer Settings
let g:netrw_banner = 0
let g:netrw_liststyle=3
nnoremap <Space>re :Rex<CR>

" VimWiki Settings "
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay
nmap <Space>l <Plug>VimwikiToggleListItem

" Splitting Windows
set hidden
nnoremap <Space>w <C-W>
nnoremap <Space>w/ :vsplit .<CR>

" Buffer Control
nnoremap <Space>bn :bnext<CR>
nnoremap <Space>bp :bprev<CR>
nnoremap <Space>bb :ls<CR>

" Leaving and Coming Back
nnoremap <Space>f <C-Z>
nnoremap <Space>m :wall<CR>:make<CR>

" Colors
set background=dark

" Fuzzy File Finding
set path+=**
set wildmenu

" For using :make
set errorformat^=%-Gmake:\ ***\ [Makefile:2:\ compile]\ Error\ 1
autocmd FileType python compiler pyunit

" Highlight whitespace damage
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
