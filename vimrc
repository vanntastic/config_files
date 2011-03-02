" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Speed optimizations
set lz
set ttyfast

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" if has("folding")
  " set foldenable
  " set foldmethod=syntax
  " set foldlevel=1
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" endif

" Softtabs, 2 spaces, autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cinkeys=0{,0},:,0#,!,!^F

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = "\\"

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel<CR> 
map <Leader>c :Rcontroller<CR>
map <Leader>v :Rview<CR>
map <Leader>u :Runittest<CR>
map <Leader>f :Rfunctionaltest<CR> 
map <Leader>tm :RTmodel<CR> 
map <Leader>tc :RTcontroller<CR> 
map <Leader>tv :RTview<CR>
map <Leader>tu :RTunittest<CR> 
map <Leader>tf :RTfunctionaltest<CR> 
map <Leader>sm :RSmodel<CR>
map <Leader>sc :RScontroller<CR>
map <Leader>sv :RSview<CR>
map <Leader>su :RSunittest<CR> 
map <Leader>sf :RSfunctionaltest<CR> 
map <Leader><Leader> :w<CR>
" Split window
map <Leader><space> :sp<CR>
" Close the buffer
map <Leader>q :bd<CR>
" Close vim and save
map <Leader>wq :wq!
" access to commands
map <Leader>[ :!
" Git diff on the current file
map <Leader>d :!git diff % <CR>
" Hide search highlighting
map <Leader>h :set invhls <CR>
" After selecting a visual block, use the following to comment multlines
map <Leader>3 :s/^/# /<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Map the surround word plugin
map <Leader>] ysiw
" Map the surround word - tag plugin
map <Leader>]t ysiwt
" Map the source word - tag - line
map <Leader>]tl ysst

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Maps autocomplete to tab
" imap <Tab> <C-N> 

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>
" Shortcut for hash arrow
imap <C-m> =>
" Beginning and end of line in insert mode
imap <C-a> <C-c><C-a>i
imap <C-e> <C-c><C-e>a
" Undo
imap <C-z> <C-c>ui

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme vividchalk
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Map bol and eol to the same style as the shell
map <C-e> $
map <C-a> ^
" Insert text into the next line
map <C-i> A<Enter>
" Quit real quick without saving
map <C-x> :q<Enter>
" Close the buffer
map <C-d> :bd<Enter>
" Close buffer
" map <c-w> :bd<Enter>
" Fuzzyfinder mappings
map <Leader>o :FufBuffer<Enter>
map <Leader>t :FufJumpList<Enter>
map <Leader>f :FufFile<Enter>
map <c-o> :FufBuffer<Enter> 
map <c-t> :FufJumpList<Enter>
map <c-f> :FufFile<Enter>
" yank line - Copy line
map <c-c> Y

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
