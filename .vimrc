" .vimrc

"-- defaults --
"set clipboard=unnamed
set autoread
set backspace=eol,start,indent
set colorcolumn=80
set cursorline
set expandtab
set exrc " local .vimrc
set foldcolumn=1
set hidden
set laststatus=2
set lazyredraw
set modeline
set modelines=5
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set secure
set shiftwidth=2
set showmatch
set smarttab
set switchbuf=usetab
set tabstop=2
set ttyfast
set wildmenu
set wildmode=list:longest,full

"-- filtetype --
filetype plugin on
filetype indent on

"-- encoding --
scriptencoding utf8
set encoding=utf8

"-- pathogen --
"execute pathogen#infect()
execute pathogen#infect('bundle/{}', '~/local/src/vim/bundle/{}')

"-- netrw --
"let g:netrw_liststyle=3
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_winsize=15
"let g:netrw_altv=1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

"-- NERDTree --
let NERDTreeShowHidden=1
let g:NERDTreeWinPos='right'

"-- airline --
let g:airline#extensions#tabline#enabled=1

"-- ALE --
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1

"-- ansible --
"let g:ansible_unindent_after_newline=1

"-- terraform --
let g:terraform_fmt_on_save=1

"-- theme/syntax --
set background=dark
set t_Co=256
set t_ut=
set termguicolors
syntax on

let g:airline_theme='codedark'
colorscheme codedark

"-- markdown --
let g:vim_markdown_folding_level=6
let g:vim_markdown_folding_style_pythonic=1
let g:vim_markdown_override_foldtext=0

"-- markdown preview --
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_toggle=1

"-- mapping --
" buffer prev/next
nnoremap <silent><s-left>   :bprev<cr>
inoremap <silent><s-left>   <esc>:bprev<cr>i
nnoremap <silent><s-right>  :bnext<cr>
inoremap <silent><s-right>  <esc>:bnext<cr>i

nnoremap <F1> <nop>
inoremap <F1> <nop>

nnoremap <silent><f2>   :NERDTreeToggle<cr>
inoremap <silent><f2>   <esc>:NERDTreeToggle<cr>

nnoremap <silent><f10>  :call ToggleFoldSignColumn()<cr>
inoremap <silent><f10>  <esc>:call ToggleFoldSignColumn()<cr>i
nnoremap <silent><f11>  :set invlist<cr>
inoremap <silent><f11>  <esc>:set invlist<cr>i
nnoremap <silent><f12>  :set invnumber<cr>
inoremap <silent><f12>  <esc>:set invnumber<cr>i

set pastetoggle=<F8>

nnoremap <silent><leader>n :NERDTreeFocus<cr>

"-- list --
"set list
set listchars=tab:»·,trail:×,extends:»,precedes:«,eol:↲

"-- search --
set hlsearch
set incsearch

"-- autocmd --
if has('autocmd')
  autocmd FileType tagbar,nerdtree set signcolumn=no
  autocmd BufRead,BufNewFile * set signcolumn=yes
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

  augroup templates
    autocmd BufNewFile *.md 0r ~/.vim/templates/skeletor.md
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeletor.py
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeletor.bash
    autocmd BufNewFile *.tf 0r ~/.vim/templates/skeletor.tf
    autocmd BufNewFile *.yml 0r ~/.vim/templates/skeletor-ansible.yml
  augroup END

endif

"-- folding --
set foldmethod=syntax
set foldlevelstart=99
let g:sh_fold_enabled=1

"-- term/tmux --
if &term =~ '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"-- functions --
function! ToggleFoldSignColumn()
  if &foldcolumn > 0
    set foldcolumn=0
  else
    set foldcolumn=1
  endif

  if &signcolumn == "yes"
    set signcolumn=no
  else
    set signcolumn=yes
  endif
endfunction
