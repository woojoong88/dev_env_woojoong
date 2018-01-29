set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#rc()

 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
Plugin 'dracula/vim'
Plugin 'The-NERD-Tree'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

set nu
set bs=2
set ts=4
set shiftwidth=4
set expandtab
syntax on

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set hlsearch
set paste
set showmatch
set ruler

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

nnoremap <Space> :call ToggleMouse()<CR>
nnoremap <C-n> :tabnew<CR>


function! StartUp()
  NERDTree
  wincmd p
endfunction

autocmd VimEnter * call StartUp()

let NERDTreeShowHidden=1

