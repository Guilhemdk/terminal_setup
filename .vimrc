let mapleader= " "

call plug#begin('~/.vim/plugged')

Plug 'ludovicchabant/vim-gutentags'
Plug 'pulkomandy/c.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'sainttttt/flesh-and-blood'

call plug#end()

nnoremap <Tab>j :resize +2<CR>
nnoremap <Tab>k :resize -2<CR>
nnoremap <Tab>h :vertical resize -2<CR>
nnoremap <Tab>l :vertical resize +2<CR>

nnoremap <Tab>n :NERDTreeToggle<CR>
nnoremap <C-n> :vsp<CR>
nnoremap <C-s> :sp<CR>
nnoremap <C-q> :q<CR>
nnoremap <Tab>v <C-v>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>d <C-]>
nnoremap <leader>b <C-t>

syntax on
set relativenumber
colorscheme flesh-and-blood
let g:airline_theme ='jet'

augroup CustomFileSyntax
	autocmd!
	autocmd FileType c source ~/.vim/plugged/c.vim/c.vim
augroup END

" Autosave when switching between buffers or losing focus
augroup autosave
	autocmd!
	autocmd BufLeave,FocusLost * silent! wa
augroup END

autocmd BufWritePre * :%s/\s\+$//e

filetype plugin on

nnoremap <leader>r yiw:! git grep -lz <C-r>" -- ':/' \| xargs -0 -r sed -i -e 's/<C-r>"/<C-r>"/g'
nnoremap gp :<C-r>"

" Set tab width to 4 spaces (using a tab character, not spaces)
set tabstop=4        " Number of spaces a tab character represents
set shiftwidth=4     " Number of spaces to use for auto-indentation
set softtabstop=4    " Controls how many spaces a tab counts for in insert mode

let g:gutentags_project_root = ['.git', '.hg', '.svn', 'Makefile']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_enabled = 1
