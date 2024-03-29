" Parts of rust.vim by The Rust Foundation reused available
" under the MIT license, available at https://github.com/rust-lang/rust.vim
function uiua#Run(args)
    let args = s:ShellTokenize(a:args)
    let bufname = bufname('%')
    call s:Run('run', bufname, args)
endfunction

function uiua#Test()
    let bufname = bufname('%')
    call s:Run('test', bufname, [])
endfunction

function uiua#Fmt()
    let bufname = bufname('%')
    call s:Run('fmt', bufname, [])
endfunction

function! s:Run(uiua_arg, bufname, args)
    let uiua_exe = s:get_uiua_exe()

    exe '!'.shellescape(uiua_exe)." ".a:uiua_arg." ".a:bufname." ".join(map(a:args, 'shellescape(v:val)'))
endfunction

function! uiua#Pad(count, line1, line2, ...) abort
    redraw
    let l:uiua_pad_url = get(g:, 'uiua_pad_url', 'https://uiua.org/pad')
    let content = s:get_selection(a:count, a:line1, a:line2, 0)
    let uiua_exe = s:get_uiua_exe()
    let uiua_version = substitute(split(s:strip_output(system(uiua_exe . ' --version')), ' ')[1], '\.', '_', 'g')
	let encoded = s:b64encode(content)
	let url = l:uiua_pad_url."?src=".uiua_version.'__'.encoded
	let footer = ''
	if exists('g:uiua_clip_command')
            call system(g:uiua_clip_command, url)
            if !v:shell_error
                let footer = ' (copied to clipboard)'
            else
                echom "Error: ".v:shell_error
            endif
        endif
        redraw | echomsg 'Done: '.url.footer
    endfunction

function! uiua#Eval(count, line1, line2, ...) abort
    let content = s:get_selection(a:count, a:line1, a:line2, 1)
    call s:Eval(content)
endfunction

function s:Eval(content)
    let uiua_exe = s:get_uiua_exe()
    exe '!' . shellescape(uiua_exe) . " eval " . shellescape(a:content)
endfunction

function s:get_selection(count, line1, line2, for_eval)
    if a:count < 1
        let content = join(getline(a:line1, a:line2), "\n")
    else
        let save_regcont = @"
        let save_regtype = getregtype('"')
        silent! normal! gvy
        let yanked = @"
        let content = join(reverse(split(yanked, "\n")))
        call setreg('"', save_regcont, save_regtype)
    endif
    return content
endfunction

function s:get_uiua_exe()
    return exists("g:uiua_path") ? g:uiua_path : "uiua"
endfunction

function s:b64encode(input)
    let uiua_exe = s:get_uiua_exe()
    let prog = '&p⊏⍜⋯(⍜≡⇌(⬚0↯∞_6)↘1)⊂255↘1↘¯1&ru0 0⊂∩⊂∩+@A,@a⇡26+@0⇡10"-_"'
    " make sure there is a newline at the end
    let input = a:input
    let output = trim(system([uiua_exe, 'eval', prog], shellescape(input)))
    let padding = repeat('=', len(output) % 4)
    return output . padding
endfunction

function s:strip_output(text)
    return substitute(a:text, '\n$', '', 'g')
endfunction

" Tokenize the string according to sh parsing rules
function! s:ShellTokenize(text)
    " states:
    " 0: start of word
    " 1: unquoted
    " 2: unquoted backslash
    " 3: double-quote
    " 4: double-quoted backslash
    " 5: single-quote
    let l:state = 0
    let l:current = ''
    let l:args = []
    for c in split(a:text, '\zs')
        if l:state == 0 || l:state == 1 " unquoted
            if l:c ==# ' '
                if l:state == 0 | continue | endif
                call add(l:args, l:current)
                let l:current = ''
                let l:state = 0
            elseif l:c ==# '\'
                let l:state = 2
            elseif l:c ==# '"'
                let l:state = 3
            elseif l:c ==# "'"
                let l:state = 5
            else
                let l:current .= l:c
                let l:state = 1
            endif
        elseif l:state == 2 " unquoted backslash
            if l:c !=# "\n" " can it even be \n?
                let l:current .= l:c
            endif
            let l:state = 1
        elseif l:state == 3 " double-quote
            if l:c ==# '\'
                let l:state = 4
            elseif l:c ==# '"'
                let l:state = 1
            else
                let l:current .= l:c
            endif
        elseif l:state == 4 " double-quoted backslash
            if stridx('$`"\', l:c) >= 0
                let l:current .= l:c
            elseif l:c ==# "\n" " is this even possible?
                " skip it
            else
                let l:current .= '\'.l:c
            endif
            let l:state = 3
        elseif l:state == 5 " single-quoted
            if l:c ==# "'"
                let l:state = 1
            else
                let l:current .= l:c
            endif
        endif
    endfor
    if l:state != 0
        call add(l:args, l:current)
    endif
    return l:args
endfunction
