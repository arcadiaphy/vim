" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'bling/vim-airline'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'SirVer/ultisnips'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-repeat'
call vundle#end()
filetype plugin indent on

" more convenient to reach leader key
let mapleader = ","

" colorscheme
colorscheme Tomorrow-Night-Eighties

" search highlight
set hlsearch
nnoremap <silent> <leader>i :nohl<CR>

" set ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-w>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <f12> :!ctags -R .<CR>

" reformat file
map <F7> mzgg=G`z<CR>

" move between windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" air line
let g:airline_theme = 'dark'
set laststatus=2
set t_Co=256

" ycm
let g:ycm_register_as_syntastic_checker = 0

" syntastics
" for python flake8 should be installed: pip install flake8
let g:syntastic_cpp_compiler              = "g++"
let g:syntastic_check_on_w                = 1
let g:syntastic_enable_signs              = 1
let g:syntastic_auto_loc_list             = 1
let g:syntastic_loc_list_height           = 4
let g:syntastic_cpp_remove_include_errors = 1

" doxygentoolkit
let g:DoxygenToolkit_fileTag      = "@file "
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag    = "@returns "
let g:DoxygenToolkit_versionTag   = "@version "
let g:DoxygenToolkit_authorTag    = "@author "
let g:DoxygenToolkit_dateTag      = "@date "
let g:DoxygenToolkit_authorName   = "Wang Jiajun <wangjiajun.phy@gmail.com>"
let g:doxygen_enhanced_color      = 1

" go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
let g:lasttab = 1
nmap <Leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" ultisnips
let g:UltiSnipsExpandTrigger       = "<c-l>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" paste without indentation
set pastetoggle=<C-y>

" git
let g:fugitive_gitlab_domains = ['https://git.xiaojukeji.com']

" easy align
" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nerdtree
map <F5> :NERDTreeToggle<CR>

" for hive script
filetype plugin on
autocmd BufNewFile,BufRead *.hive set filetype=hive

" ultisnippets
let g:UltiSnipsEditSplit   = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" delimitmate
let delimitMate_expand_space = 1
let delimitMate_expand_cr    = 1

" vimwiki
let wiki = {}
let wiki.path = '~/.vim/vimwiki/wiki'
let wiki.nested_syntaxes = {'python': 'python', 'cpp': 'cpp', 'plain': 'plain'}
let wiki.template_path = '~/.vim/vimwiki/template'
let wiki.template_default = 'default'
let wiki.css_name = 'github.css'
let g:vimwiki_list = [wiki]
nnoremap <leader>wc :VimwikiAll2HTML<CR>

" show invisible character
nnoremap <silent> <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" tab width
autocmd FileType cpp set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" preserve state function
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <leader>t :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <leader>= :call Preserve("normal gg=G")<CR>

" select all
nnoremap <leader>a ggVG

" quickly edit and apply vimrc
nnoremap <leader>ve :edit ~/.vim/vimrc<CR>
nnoremap <leader>va :let @/=""<CR>:w<CR>:source ~/.vimrc<CR>

" quickly install bundle plugin
nnoremap <leader>p :PluginInstall<CR>

" render markdown
" prerequisites: pandoc
"                npm install -g browser-sync
function! MdPath()
    return "~/.vim/vimwiki/wiki_html/".expand("%:t:r").".html"
endfunction
function! MdRender()
    execute "silent !pandoc -c github.css ".expand("%")." -o ".MdPath()
endfunction
function! MdSync()
    execute "silent !~/.vim/vimwiki/wiki_html/browser-sync.sh ".MdPath()
endfunction
function! MdEndSync()
    execute "silent !pkill -f browser-sync"
endfunction
function! MdRemove()
    execute "silent !rm ".MdPath()
endfunction
nnoremap <leader>r :redraw!<CR>
autocmd BufWinEnter,BufNewFile *.md execute ":w" | call MdRender() | call MdSync()
autocmd BufWritePost *.md call MdRender()
autocmd BufWinLeave *.md call MdEndSync() | call MdRemove()

" manage git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Git push --force<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nmap <leader>gb <leader>gs:Gbrowse<CR>ZZ

" show time when coding
nmap <silent> <leader>t :echo substitute(system('date +%T'),'\n','','')<CR>

syntax on
set backspace=2
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smartindent
set number
set clipboard=unnamed
set mouse=a
set textwidth=0
