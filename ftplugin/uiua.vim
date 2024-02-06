setlocal commentstring=#%s
setlocal matchpairs=(:),{:},[:]
setlocal ignorecase

setlocal shiftwidth=2 tabstop=2 softtabstop=2

setlocal autoread

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
