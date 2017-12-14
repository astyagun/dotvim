colorscheme mac_classic

highlight LineNr guibg=white
highlight CursorLineNR guibg=#F0F6FF
highlight VertSplit guibg=white guifg=#808080

" Fix Error visibility when in cursor line
highlight Error guibg=#FFDDDD guifg=red gui=bold

" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Diff
highlight DiffAdd guibg=#DDFFDD
highlight DiffDelete guibg=#FFDDDD
highlight DiffChange guibg=#FFFFDD
highlight DiffText guibg=#FFFFAA

" Hide tilde from empty lines after file contents
highlight EndOfBuffer guifg=bg

" ColorColumn
highlight ColorColumn guibg=#F5F5F5

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
