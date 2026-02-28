" Vim indent file
" Language: MMBasic
" Maintainer: MMBasic Community

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMMBasicIndent()
setlocal indentkeys=0=~end,0=~else,0=~elseif,0=~next,0=~loop,0=~wend,0=~case,!^F,o,O

" Only define the function once
if exists("*GetMMBasicIndent")
  finish
endif

function! GetMMBasicIndent()
  let lnum = prevnonblank(v:lnum - 1)
  
  " At the start of the file use zero indent
  if lnum == 0
    return 0
  endif
  
  let ind = indent(lnum)
  let line = getline(lnum)
  
  " Increase indent after IF, FOR, DO, WHILE, SUB, FUNCTION, SELECT CASE
  if line =~? '^\s*\(if\|for\|do\|while\|sub\|function\|select\s\+case\)\>'
    let ind = ind + shiftwidth()
  endif
  
  " Decrease indent for END IF, NEXT, LOOP, WEND, END SUB, END FUNCTION, END SELECT
  let thisline = getline(v:lnum)
  if thisline =~? '^\s*\(end\s\+if\|endif\|next\|loop\|wend\|end\s\+sub\|end\s\+function\|end\s\+select\)\>'
    let ind = ind - shiftwidth()
  endif
  
  " Decrease indent for ELSE, ELSEIF
  if thisline =~? '^\s*\(else\|elseif\)\>'
    let ind = ind - shiftwidth()
  endif
  
  " Increase indent after ELSE, ELSEIF
  if line =~? '^\s*\(else\|elseif\)\>'
    let ind = ind + shiftwidth()
  endif
  
  " Decrease indent for CASE
  if thisline =~? '^\s*case\>'
    let ind = ind - shiftwidth()
  endif
  
  return ind
endfunction
