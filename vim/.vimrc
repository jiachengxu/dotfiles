""""""""""""""""""""
"     Settings     "
""""""""""""""""""""
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent 
set smartindent
set nocompatible
set ruler
set wrap
set incsearch
set hlsearch
set showmatch
set autowrite
set number
syntax enable
syntax on

"vim plug
call plug#begin('~/.vim/plugged')
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree' 
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go',{ 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark
"auto-pair
let g:AutoPairsShortcutFastWrap = '<C-e>'

"nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeWinPos='left'

"airline
let g:airline_theme='onedark'

"Tagbar
"let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <C-y> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/local/bin/python3'

"vim-go
let mapleader = ","
map <C-j> :lnext<CR>
map <C-k> :lprev<CR>
nnoremap <leader>l :lclose<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>co <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>do <Plug>(go-doc)
autocmd FileType go nmap <leader>al <Plug>(go-alternate-vertical)
autocmd FileType go nmap <leader>ca <Plug>(go-callers)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_list_type = "locationlist"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_test_timeout = '30s'

"Dash
nmap <leader>da <Plug>DashSearch

"Pymode
let g:pymode_options_colorcolumn = 0
let g:pymode_python = 'python3'
let g:pymode_doc_bind = '<leader>d'
let g:pymode_folding = 0
autocmd BufWritePost *.py PymodeLintAuto
