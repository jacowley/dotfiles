" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" vim-plug configuration
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'sbdchd/neoformat'
Plug 'chrisbra/NrrwRgn'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" show line numbers
set relativenumber
set number

" colors
set background=dark
colorscheme muon

" airline config
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" vim-jsx config (bundled with vim-polyglot)
let g:jsx_ext_required = 0

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" makes copy/paste work
set clipboard=unnamed

" mouse
set mouse=a

" reload files when they change on disk
set autoread

" prettier JavaScript formatter
autocmd FileType javascript set formatprg=prettier\ --stdin

" deoplete
let g:deoplete#enable_at_startup = 1

