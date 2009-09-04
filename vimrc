set nocompatible
set selectmode=mouse
set backupdir=/tmp
set directory=/tmp
set guioptions-=T
set wildmode=longest
set errorfile=/tmp/rutkowsk.errors.log
set ic
" Sets tab stops to 2 spaces and autoindents and expands the tab
set shiftwidth=2
set expandtab
set autoindent

set ruler
set sm
set fileformats=dos,unix,mac
" highlight StatusLineNC guifg=#ff0000 guibg=#000000
" highlight StatusLine guifg=#00ff00 guibg=#000000
" set hls
hi Normal guibg=black guifg=white
hi Search guibg=white guifg=black
hi IncSearch guibg=white guifg=black
set tags=./tags
set mousef
syntax on

set ls=2 " Always show status line
if has('statusline')
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif

" Map bol and eol to the same style as the shell
map <C-e> $
map <C-a> ^
" Insert text into the next line
map <C-i> A<Enter>
" Quit real quick without saving
map <C-x> :q!<Enter>
" Close buffer
" map <c-w> :bd<Enter>
" Open files
map <c-o> :ls<Enter>
" yank line - Copy line
map <c-c> Y
" Jump to symbol for Ruby
nmap <c-t> /^ *def 

" ABBREVIATIONS : Automatically Insert Braces, quotes and other stuff
" Automatically Close Brackets 
inoremap          (   ()<LEFT>
inoremap <silent> )   )<ESC>
                      \:let tmp0=&clipboard <BAR>
                      \let &clipboard=''<BAR>
                      \let tmp1=@"<BAR>
                      \let tmp2=@0<CR>
                      \y2l
                      \:if '))'=="<C-R>=escape(@0,'"\')<CR>"<BAR>
                      \  exec 'normal "_x'<BAR>
                      \endif<BAR>
                      \let @"=tmp1<BAR>
                      \let @0=tmp2<BAR>
                      \let &clipboard=tmp0<BAR>
                      \unlet tmp0<BAR>
                      \unlet tmp1<BAR>
                      \unlet tmp2<CR>
                      \a

" If the context in which you hit tab is one where one would regularly hit tab
" then tab will return a tab, otherwise it will tab-complete the word currently
" being typed
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Vim color file
" Maintainer:   Shirk <shirk@gmx.net>
" Last Change:  19 September 2005 - 0.2
" URL: trinity.gentoofreaks.org

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark "or light
hi clear
if exists("syntax_on")
  syntax reset
endif

" Color scheme
colorscheme vividchalk
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0