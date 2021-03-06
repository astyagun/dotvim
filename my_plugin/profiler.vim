function! ProfileStart() abort
  profile start ~/Desktop/vim-profile.log
  profile func *
  profile file *
endfunction

function! ProfileEnd() abort
  profile pause
  qall!
endfunction

command! ProfileStart call ProfileStart()
command! ProfileEnd call ProfileEnd()
