" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

filetype plugin on

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
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'JamshedVesuna/vim-markdown-preview'

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

" neoformat
let g:neoformat_try_formatprg = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" fzf / ripgrep
"  --column: Show column number
"  --line-number: Show line number
"  --no-heading: Do not show file headings in results
"  --fixed-strings: Search term as a literal string
"  --ignore-case: Case insensitive search
"  --no-ignore: Do not respect .gitignore, etc...
"  --hidden: Search hidden files and folders
"  --follow: Follow symlinks
"  --glob: Additional conditions for search (in this case ignore everything in
"  .git/ folder)
"  --color: Search colour options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!{.git,node_modules}/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'help', 'markdown', 'qf', 'taskdata', 'taskedit', 'unite']

" vim-markdown-preview with grip
let vim_markdown_preview_github = 1
let vim_markdown_preview_browser = 'Google Chrome'

