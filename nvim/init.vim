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
Plug 'leshill/vim-json'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'steelsojka/deoplete-flow'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wokalski/autocomplete-flow'
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
Plug 'zoubin/vim-gotofile'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'
Plug 'elmcast/elm-vim'
Plug 'rust-lang/rust.vim'
Plug 'craigemery/vim-autotag'

" Required for completion in autocomplete-flow
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

" rust
let g:rustfmt_autosave = 1

" haskell-vim
syntax on
filetype plugin indent on

" show line numbers
set relativenumber
set number

" colors
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark
" colorscheme OceanicNext
colorscheme muon

" airline config
" always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'oceanicnext'
let g:airline#extensions#tabline#enabled = 1

" vim-polyglot
let g:polyglot_disabled = ['elm', 'haskell']

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
autocmd BufWritePre *.js Neoformat

" neoformat
let g:neoformat_try_formatprg = 1

" deoplete
let g:deoplete#enable_at_startup = 1
" autocmd CompleteDone * silent! pclose!

" neosnippet
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" deoplete-flow
function! StrTrim(txt)
    return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
    let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

" Ale linters
let g:ale_echo_msg_format = '[%linter%] %s'
" let g:ale_linters = {
            " \ 'haskell': [],
            " \ 'rust': ['cargo']
            " \}

set diffopt+=vertical

" neco ghc
let g:necoghc_enable_detailed_browse = 1

" elm-vim
let g:elm_format_autosave = 1

" Set display characters for tab and trailing
set list listchars=trail:·,tab:▸\
hi NonText ctermfg=7 guifg=white

" Tagbar
nmap <F8> :TagbarToggle<CR>
