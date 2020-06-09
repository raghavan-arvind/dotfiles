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
set textwidth=70

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
nmap <Space>l <Plug>VimwikiToggleListItem
let g:vimwiki_list = [{
\    'path': '~/Dropbox/vimwiki/',
\    'syntax': 'markdown',
\    'ext': '.md'
\}]

" Splitting Windows
set hidden
nnoremap <Space>w <C-W>
nnoremap <Space>w/ :vsplit .<CR>

" Leaving and Coming Back
nnoremap <Space>s :wall<CR>
nnoremap <Space>m :wall<CR>:make<CR>

" Move reminder list to Finished
nnoremap <Space>td O<CR><Esc>k:read !date +"\%a \%b \%d"<CR>kJI#<Space><Esc>p

" Colors
set background=dark

" fzf
set rtp+=~/.fzf
nnoremap <Space>fe :Files<CR>
nnoremap <Space>fa :Files<Space>~<CR>
nnoremap <Space>fb :Buffers<CR>
nnoremap <Space>fg :GFiles?<CR>
nnoremap <Space>fl :Lines<CR>

" For using :make
set errorformat^=%-Gmake:\ ***\ [Makefile:2:\ compile]\ Error\ 1
autocmd FileType python compiler pyunit

" Highlight whitespace damage
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <Space>tr :call TrimWhitespace()<CR>

let g:cargo_makeprg_params = '--color always'
