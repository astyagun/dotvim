" Vim command to calculate the sum of time durations written in format like '1h 30m'
" The sum is inserted into a new line after the selected region

command! -nargs=0 -range SumDurations <line1>,<line2>call s:SumDurations()

function! s:SumDurations() range
  let hits     = s:GatherTime(a:firstline, a:lastline)
  let minutes  = s:Hits2Minutes(hits)
  let duration = s:Minutes2Duration(minutes)

  execute 'normal ' . a:lastline . 'Go'
  call setline(line('.'), duration)
  normal 
endfunction

function! s:GatherTime(line1, line2)
  let duration_pattern = '\v(\d+[hm])'
  let hits = []

  execute a:line1 . ',' . a:line2 . 's/' . duration_pattern . '/' .
        \ "\\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge"

  return hits
endfunction

function! s:Hits2Minutes(hits)
  let minutes = 0

  for hit in a:hits
    if hit =~ 'h$'
      let minutes = minutes + str2nr(substitute(hit, 'm$', '', '')) * 60
    endif
    if hit =~ 'm$'
      let minutes = minutes + str2nr(substitute(hit, 'm$', '', ''))
    endif
  endfor

  return minutes
endfunction

function! s:Minutes2Duration(minutes)
  let hours   = a:minutes / 60
  let minutes = a:minutes % 60

  return hours . 'h ' . minutes . 'm'
endfunction
