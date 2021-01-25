" ftplugin/fuzzil/folding.vim
setlocal ai si sw=4 ts=4
setlocal foldmethod=expr
setlocal foldexpr=GetUngramFold(v:lnum)

function! GetUngramFold(lnum)
  " Defaults current line number to
  " fold level 0 (i.e., ignore line) 
  let b:flevel = '0'

  " Default empty line to foldlevel either line above
  " or below, dependent upon lower value
  if getline(a:lnum) =~? '\v^\s*$'
    let b:flevel = '-1'
  endif

  let b:lnum_indent = IndentLevel(a:lnum)
  let b:lnextnb_indent = IndentLevel(NextNonBlankLine(a:lnum))

  if b:lnextnb_indent == b:lnum_indent
    let b:flevel = b:lnum_indent
  elseif b:lnextnb_indent < b:lnum_indent
    let b:flevel = b:lnum_indent
  elseif b:lnextnb_indent > b:lnum_indent
    let b:flevel = '>' . b:lnextnb_indent
  endif

  return b:flevel
endfunction


function! IndentLevel(lnum)
  let b:level = indent(a:lnum) / &shiftwidth
  return b:level
endfunction


function! NextNonBlankLine(lnum)
  " Default to not found (i.e., no nonblank lines below lnum)
  let b:lnextnb = -2

  " Get total line count and next (relative) lnum
  let b:numlines = line('$')
  let b:lnext = a:lnum + 1

  while b:lnext <= b:numlines
    " Break if next line contains a non-whitespace char
    if getline(b:lnext) =~? '\v\S'
      let b:lnextnb = b:lnext
      break
    endif
    let b:lnext += 1
  endwhile

  return b:lnextnb
endfunction
