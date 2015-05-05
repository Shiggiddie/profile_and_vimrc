"Open NERDtree on vim launch
"autocmd vimenter * NERDTree
"Automatically start with cursor in file window (NOT NERDtree window)
"autocmd VimEnter * wincmd p
"Use F5 key to toggle NERDTree on/off
nmap <silent> <F5> :NERDTreeToggle<CR>
set nocompatible                      " vi is a butt.

" initiate a search and replace for the word under the cursor
map <Leader>s :%s/\<<C-r><C-w>\>/

set rtp+=$GOROOT/misc/vim
syntax on                             " syntax highlighting
filetype on                           " detect filetypes
filetype plugin on                    " per-filetype plugins
"filetype indent on                    " per-filetype indent
colorscheme railscasts                " looks like total ass in non-256 color, but whatevs

autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab
set autoindent                        " be smart
set smarttab                          " also smart
set shiftround
set softtabstop=4                     " 4 space tabs (soft)
set expandtab                         " use soft tabs
set enc=utf-8                         " still don't know, really
set fenc=utf-8                        " same
set fencs=utf-8,shift-jis,iso-8859-1  " I guess these are the ones that I ever actually see
set mouse=nv                          " let the mouse do stuff
set bs=2                              " make backspace work like it should
set autoread                          " automatically check for changes to the file
set incsearch                         " turn on incremental searching
set scrolloff=10                      " rows on either side of the cursor when scrolling
set splitright                        " open new vertical splits on the right side
set splitbelow                        " open new horizontal splits on the bottom
set smartcase                         " case-insensitive searching
set winwidth=50                       " dumb setting
set winminwidth=50                    " minimum window width.  makes ^W| useful
set winheight=16                      " also dumb
"set winminheight=10                   " minimum window height.  (^W_)
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildmenu                          " might do nothing because of wildmode
set wildmode=longest,list             " show menu for tab-completion
set wildignore+=*.pyc                 " don't need dem pyc files
set foldmethod=syntax                 " I dunno, maybe this will set up more folds automatically?
set foldlevelstart=99                 " forces folds open by default
set nojoinspaces                      " don't use two spaces after a . when joining lines
set foldenable                        " enable fold
set grepprg=ack                       " better than grep
set showcmd                           " show the cmdline.  not sure what it does other than show num of lines in visual mode
set t_Co=256                          " use 256 colors
set background=dark                   " dark terminals 4 lyfe
set ttyfast                           " optimize for fast terminals
set lazyredraw                        " don't redraw while executing macros or that sort of thing
set ruler                             " use the ruler.
set laststatus=2                      " always show the status line
set title                             " set window title
set noerrorbells                      " DESTROY ALL BELLS
set vb t_vb=                          " HATE BELLS
set showmatch                         " highlight matching brackets
set hlsearch                          " highlight search term
set showtabline=1                     " only show file tabs when more than one file open
set backupdir=/tmp,/var/tmp,~/tmp     " keep backup files in one place instead of next to the file
set directory=/tmp,/var/tmp,~/tmp     " directory to keep swap files in
set number                            " show line numbers
set listchars=tab:»·,trail:·          " when 'list' option set, show hard tabs and trailing spaces
set statusline=%f%m\ %y\ [%{&fenc}]\ (%04l/%04L,\ %02v)\ %p%%
set clipboard+=unnamed            " use osx clipboard
set omnifunc=syntaxcomplete#Complete

let g:CommandTMatchWindowAtTop = 1         " show command-t window at the top of the screen

let g:netrw_list_hide = '.*\.pyc$'

let g:pylint_onwrite = 0

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1               " lol

let g:NERDSpaceDelims = 1                  " put space after comment delimiter

let g:rails_statusline = 1
let g:rails_modelines = 1

let g:dont_map_cec_commands = 1


" let g:ctrlp_match_window_bottom = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': 'eggs$\|\.git$\|env/lib$\|node_modules$',
    \}
" map <leader>e :call ctrlpclearcache<cr>\|:call ctrlp<cr>
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>t'
let g:ctrlp_switch_buffer = 0

let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 0

map <leader>gg :ToggleGitGutter<cr>

" F6 toggles search highlighting
"map <F6> :set hls!<bar>set hls?<CR>
let g:pep8_map='<F6>'

" ^P toggles paste mode (from insert mode)
map <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
map <C-h> gT
" ctrl-L for next tab
map <C-l> gt

map <Leader>r :redraw!<CR>

" I hit these by mistake a lot
:command! W w
:command! Wq wq
:command! Q q

" display the number of occurences of the word under the cursor
map <Leader>wc :%s///gn<CR>

" make the numpad work right in xterm-256color term
map <C-[>Op 0
map <C-[>Oq 1
map <C-[>Or 2
map <C-[>Os 3
map <C-[>Ot 4
map <C-[>Ou 5
map <C-[>Ov 6
map <C-[>Ow 7
map <C-[>Ox 8
map <C-[>Oy 9
map <C-[>OX =

" open files with path relative to current buffer
map <Leader>re :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rt :tabnew <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rv :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rs :sp <C-R>=expand("%:p:h") . "/" <CR>

" de-uglify json files
map <Leader>jl :%!json_xs -f json -t json-pretty<cr>

" adds python path to vim path, so putting the cursor over an import and
" hitting 'gf' should jump to that module
if has("python")
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif
" Highlight character 80 in insert mode
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END
