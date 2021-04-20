" Standard Settings "
filetype plugin indent on
syntax on
inoremap jk <Esc>
set nocompatible
set encoding=utf-8
set ignorecase
set smartcase
set clipboard^=unnamed,unnamedplus
set splitright
set mouse=a
set formatoptions=crqlj
let mapleader="\<Space>"

" Default Indent Settings "
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80

" Filetype-specific Indent Settings "
autocmd Filetype markdown setlocal shiftwidth=2 tabstop=2
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2

" Mac Backspace Fix "
set backspace=indent,eol,start

" Explorer Settings
let g:netrw_banner = 0
let g:netrw_liststyle=3
nnoremap <Leader>re :Rex<CR>

" VimWiki Settings "
nmap <Leader>l <Plug>VimwikiToggleListItem
let g:vimwiki_list = [{
\    'path': '~/Dropbox/vimwiki/',
\    'syntax': 'markdown',
\    'ext': '.md'
\}]

" Splitting Windows
set hidden
nnoremap <Leader>w <C-W>
nnoremap <Leader>w/ :vsplit<CR>:Files<CR>

" Leaving and Coming Back
nnoremap <Leader>s :wall<CR>
nnoremap <Leader>m :wall<CR>:make<CR>

" Move reminder list to Finished
nnoremap <Leader>td O<CR><Esc>k:read !gdate +"\%a \%b \%d, \%Y"<CR>kJI#<Space><Esc>p
nnoremap <Leader>yd O<CR><Esc>k:read !gdate<Space>-d<Space>"yesterday" +"\%a \%b \%d, \%Y"<CR>kJI#<Space><Esc>p

" Colors
set background=dark

" fzf
set rtp+=~/.fzf
nnoremap <Leader>fe :Files<CR>
nnoremap <Leader>fa :Files<Space>~<CR>
nnoremap <Leader>fg :GFiles?<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>b  :Buffers<CR>
nnoremap <Leader>r :Rg<SPACE>

" Search for word under cursor
nnoremap <Leader>fw :Rg<SPACE><C-R><C-W><CR>

" For using :make
set errorformat^=%-Gmake:\ ***\ [Makefile:2:\ compile]\ Error\ 1
autocmd FileType python compiler pyunit

" vim-go
nnoremap <Leader>gb :wall<CR>:GoBuild<CR>
nnoremap <Leader>gr :wall<CR>:GoRun<CR>

" Highlight whitespace damage
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <Leader>tr :call TrimWhitespace()<CR>

let g:cargo_makeprg_params = '--color always'
