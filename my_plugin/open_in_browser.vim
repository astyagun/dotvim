function! OpenInBrowser(name) abort
  call netrw#BrowseX(expand((exists('g:netrw_gx') ? g:netrw_gx : a:name)), netrw#CheckIfRemote())
endfunction
