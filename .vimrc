" Copyright 2019-present an Individual Developer Woojoong Kim
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
" http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 
Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive' "required 
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'w0rp/ale'
Plugin 'shougo/neocomplete.vim'

call vundle#end()
filetype plugin indent on " Put your non-Plugin stuff after this line

syntax enable
set nu
set smartindent
set bs=2
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set laststatus=2
set noshowmode
set cursorline

set hlsearch
"set paste
set showmatch
set ruler

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
autocmd! bufreadpost * set noexpandtab | retab! 4
autocmd! bufwritepre * set expandtab | retab! 4
autocmd! bufwritepost * set noexpandtab | retab! 4


function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
                echo "ToggleMouse() -- Mouse off"
    else
        " enable mouse everywhere
        set mouse=a
                echo "ToggleMouse() -- Mouse on"
    endif
endfunc

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'name' ] ]
      \ },
      \ 'component': {
      \   'name': 'Woojoong@POSTECH'
      \ },
      \ }

if !has('gui_running')
  set t_Co=256
endif

nnoremap <Space> :call ToggleMouse()<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-d> :q!<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"****************** configure neocomplete **************************
"****************** end configure neocomplete **********************
