call plug#begin('~/.vim/plugged')

Plug 'pulkomandy/c.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'

call plug#end()

nnoremap <Tab><Up> :resize +2<CR>
nnoremap <Tab><Down> :resize -2<CR>
nnoremap <Tab><Left> :vertical resize -2<CR>
nnoremap <Tab><Right> :vertical resize +2<CR>

nnoremap <Tab>n :NERDTreeToggle<CR>
nnoremap <C-n> :vsp<CR>
nnoremap <C-s> :sp<CR>
nnoremap <C-q> :q<CR>
nnoremap <Tab>v <C-v>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme onedark
syntax on
set relativenumber

augroup CustomFileSyntax
	autocmd!
	autocmd FileType c source ~/.vim/plugged/c.vim/c.vim
augroup END

filetype plugin on

let g:gutentags_enbaled = 1
let g:gutentags_ctags_extra_args = ['--fileds=+l']
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.root']

