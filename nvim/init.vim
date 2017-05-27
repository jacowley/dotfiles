" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" vim-plug configuration
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" show line numbers
set number

" colors
set background=dark

" airline config
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1

" vim-jsx config (bundled with vim-polyglot)
let g:jsx_ext_required = 0

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" vim-flow
let g:flow#autoclose = 1

" neomake
"let g:neomake_logfile=$HOME.'/.config/nvim/log/neomake.log'
"let g:neomake_verbose = 3
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost *.js Neomake

" makes copy/paste work
set clipboard=unnamed

