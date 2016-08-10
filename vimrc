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
Plugin 'honza/vim-snippets'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on

" colorscheme
colorscheme Tomorrow-Night-Eighties

" search highlight
set hlsearch
nnoremap <silent> <C-i> :nohl<CR><C-i>

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
set pastetoggle=<F10>

" git
let g:fugitive_gitlab_domains = ['https://git.xiaojukeji.com']

" easy align
" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nerdtree
map <F5> :NERDTreeToggle<CR>

syntax on
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cindent
set nu
set clipboard=unnamed
