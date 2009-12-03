" Font
set guifont=Monaco:h12.00

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" set window size
set lines=50 columns=80

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

