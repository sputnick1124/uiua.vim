setlocal commentstring=#%s
setlocal matchpairs=(:),{:},[:]
setlocal ignorecase

setlocal shiftwidth=2 tabstop=2 softtabstop=2

setlocal autoread

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

command! -nargs=* -complete=file -bang -buffer UiuaRun call uiua#Run(<bang>0, <q-args>)

command! -range=% UiuaPad :call uiua#Pad(<count>, <line1>, <line2>, <f-args>)

command! -range=% UiuaEval :call uiua#Eval(<count>, <line1>, <line2>, <f-args>)
