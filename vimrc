" .vimrc

" set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'wincent/Command-T'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'taketwo/vim-ros'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
" Plugin 'lervag/vim-latex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'kien/ctrlp.vim'
Plugin 'AndrewRadev/switch.vim'

" Plugin 'primitivorm/vim-predictive'
" Plugin 'sven-strothoff/vim-clang_doxygen'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/DoxyGen-Syntax'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set backspace=2                   " Make back work as other apps
runtime macros/matchit.vim        " use % to jump between start/end of methods

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]


" Tab line
let g:airline#extensions#tabline#enabled = 1
" set dark background and color scheme
let base16colorspace=256  " Access colors present in 256 colorspace"
let g:solarized_contrast="high"
let g:solarized_visilibity="low"
set background=dark
colorscheme solarized

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" set leader key to comma
let mapleader = ","

let g:airline_powerline_fonts = 1

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" map . in visual mode
vnoremap . :norm.<cr>

" die hash rockets, die!
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" map markdown preview
map <leader>m :!open -a Marked %<cr><cr>

" map git commands
" map <leader>b :Gblame<cr>
" map <leader>l :!clear && git log -p %<cr>
" map <leader>d :!clear && git diff %<cr>

" open gist after it's been created
let g:gist_open_browser_after_post = 1

" map Silver Searcher
map <leader>a :Ag!<space>

" search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" add :Plain command for converting text to plaintext
command! Plain execute "%s/’/'/ge | %s/[“”]/\"/ge | %s/—/-/ge"

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif


" configure tags - add additional tags here or comment out not-used ones
 set tags+=~/.vim/tags/tags
 set tags+=~/.vim/tags/tags.ros

 " automatically open and close the popup menu / preview window
 au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
 set completeopt=menuone,menu,preview ",longest 
 "END Omnicompletion


let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

set clipboard=unnamed
map <leader>a :AV<CR>







let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]



" Protodef

let g:protodefctagsexe = '/usr/local/bin/ctags'
let g:protodefprotogetter = '~/.vim/bundle/vim-protodef/pullproto.pl'


" YouCompleteMe
"

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'


let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^'],
\ }


" ROS
au BufRead,BufNewFile *.urdf              setfiletype xml
au BufRead,BufNewFile *.launch            setfiletype xml
au BufRead,BufNewFile *.world             setfiletype xml
au BufRead,BufNewFile *.launch            UltiSnipsAddFiletypes roslaunch.xml
au BufRead,BufNewFile cfg/*.cfg           UltiSnipsAddFiletypes roscfg.python
au BufRead,BufNewFile manifest.xml        UltiSnipsAddFiletypes rosmanifest.xml
au BufRead,BufNewFile */stacks/*.{cpp,h}  UltiSnipsAddFiletypes roscpp.cpp
au BufRead,BufNewFile */*_ws/*.{cpp,h}    UltiSnipsAddFiletypes roscpp.cpp
au BufRead,BufNewFile */stacks/*.py       UltiSnipsAddFiletypes rospy.python
au BufRead,BufNewFile */*_ws/*.py         UltiSnipsAddFiletypes rospy.python

" commentary
"
autocmd BufRead CMakeLists.txt set commentstring=#\ %s
au BufRead,BufNewFile *.pde,*.ino set filetype=cpp
" latex
"
let g:tex_flavor = "latex"


" make nerdtree open at startup
"
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeQuitOnOpen=1

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


" switch plugin

let g:switch_mapping = "-"

