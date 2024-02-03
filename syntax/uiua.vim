if exists('b:current_syntax')
    finish
endif

" adds to statusline
" set laststatus=2
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}
" " a little more informative version of the above
" nmap <Leader>sI :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"     if !exists("*synstack")
"         return
"     endif
"     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

syn match uiuaids "\<[a-zA-Z]\+\>"
syn match uiuacmt "#.*$"
syn match uiuachr "@\%(\\\%(x[0-9A-Fa-f]{2}\|u[0-9A-Fa-f]{4}\|.\)\|.\)"
syn match uiuanum "[`¯]\?[0-9]\+\%([./][0-9]\+\%(e[+-]\?[0-9]\+\)\?\)\?"
syn match uiuastnd "_"
syn match uiuasymbstack "[.,:◌;∘]"
syn match uiuawordstack "\%(duplicate\|over\|flip\|pop\|id\%(e\%(n\%(t\%(i\%(t\%(y\)\?\)\?\)\?\)\?\)\?\)\?\)"
syn match uiuashortstack "[dgi]{2,}"
syn match uiuasymbdbgstack "[?⸮]"
syn match uiuaworddbgstack "stack\|trac\%(e\)\?"
syn match uiuasymbnoad "[↫⚂ηπτ∞]"
syn match uiuawordnoad "rec\%(u\%(r\)\?\)\?\|rand\%(o\%(m\)\?\)\?\|eta\|pi\|tau\|inf\%(i\%(n\%(i\%(t\%(y\)\?\)\?\)\?\)\?\)\?"
syn match uiuakwdnoad "tag\|now"
syn match uiuasysnoad "&\%(sc\|ts\|args\|asr\)"
syn match uiuasymbmnad "[¬±¯`⌵√○⌊⌈⁅⧻△⇡⊢⇌♭¤⋯⍉⍏⍖⊚⊛◴◰□⋕]"
syn match uiuawordmnad "not\|sig\%(n\)\?\|neg\%(a\%(t\%(e\)\?\)\?\)\?\|abs\%(o\%(l\%(u\%(t\%(e\)\?\)\?\)\?\)\?\)\?\|sqr\%(t\)\?\|sin\%(e\)\?\|flo\%(o\%(r\)\?\)\?\|cei\%(l\%(i\%(n\%(g\)\?\)\?\)\?\)\?\|rou\%(n\%(d\)\?\)\?\|len\%(g\%(t\%(h\)\?\)\?\)\?\|sha\%(p\%(e\)\?\)\?\|ran\%(g\%(e\)\?\)\?\|fir\%(s\%(t\)\?\)\?\|rev\%(e\%(r\%(s\%(e\)\?\)\?\)\?\)\?\|des\%(h\%(a\%(p\%(e\)\?\)\?\)\?\)\?\|fix\|bit\%(s\)\?\|tra\%(n\%(s\%(p\%(o\%(s\%(e\)\?\)\?\)\?\)\?\)\?\)\?\|ris\%(e\)\?\|fal\%(l\)\?\|whe\%(r\%(e\)\?\)\?\|cla\%(s\%(s\%(i\%(f\%(y\)\?\)\?\)\?\)\?\)\?\|ded\%(u\%(p\%(l\%(i\%(c\%(a\%(t\%(e\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\|uni\%(q\%(u\%(e\)\?\)\?\)\?\|box\|pars\%(e\)\?"
syn match uiuakwdmnad "wait\|recv\|tryrecv\|gen\|utf\|type"
syn match uiuasysmnad "&\%(cd\|fo\|fc\|fde\|ftr\|fe\|fld\|fif\|fras\|frab\|s\|pf\|p\|raw\|var\|cl\|runi\|runc\|invk\|ad\|ap\|imd\|ims\|gifd\|tcpl\|tcpa\|tcpc\|tcpsnb\|tcpaddr\|sl\)"
syn match uiuasymbdyad "[-=≠<≤>≥+×*÷%◿ⁿₙ↧↥∠ℂ≍⊟⊂⊏⊡↯☇↙↘↻◫▽⌕∊⊗⍤]"
syn match uiuacmpworddyad "equ\%(a\%(l\%(s\)\?\)\?\)\?\|\%(\%(les\%(s\)\?\|gre\%(a\%(t\%(e\%(r\)\?\)\?\)\?\)\?\)\%( \%(or\|than\)\)\? \?\)\%(equ\%(a\%(l\%(s\)\?\)\?\)\?\)\?"
syn match uiuaworddyad "add\|subtract\|mul\%(t\%(i\%(p\%(l\%(y\)\?\)\?\)\?\)\?\)\?\|div\%(i\%(d\%(e\)\?\)\?\)\?\|mod\%(u\%(l\%(u\%(s\)\?\)\?\)\?\)\?\|pow\%(e\%(r\)\?\)\?\|log\%(a\%(r\%(i\%(t\%(h\%(m\)\?\)\?\)\?\)\?\)\?\)\?\|min\%(i\%(m\%(u\%(m\)\?\)\?\)\?\)\?\|max\%(i\%(m\%(u\%(m\)\?\)\?\)\?\)\?\|ata\%(n\%(g\%(e\%(n\%(t\)\?\)\?\)\?\)\?\)\?\|com\%(p\%(l\%(e\%(x\)\?\)\?\)\?\)\?\|mat\%(c\%(h\)\?\)\?\|cou\%(p\%(l\%(e\)\?\)\?\)\?\|joi\%(n\)\?\|sel\%(e\%(c\%(t\)\?\)\?\)\?\|pic\%(k\)\?\|res\%(h\%(a\%(p\%(e\)\?\)\?\)\?\)\?\|rer\%(a\%(n\%(k\)\?\)\?\)\?\|tak\%(e\)\?\|dro\%(p\)\?\|rot\%(a\%(t\%(e\)\?\)\?\)\?\|win\%(d\%(o\%(w\%(s\)\?\)\?\)\?\)\?\|kee\%(p\)\?\|fin\%(d\)\?\|mem\%(b\%(e\%(r\)\?\)\?\)\?\|ind\%(e\%(x\%(o\%(f\)\?\)\?\)\?\)\?\|ass\%(e\%(r\%(t\)\?\)\?\)\?"
syn match uiuakwddyad "send\|deal\|regex\|map\|has\|get\|remove"
syn match uiuasysdyad "&\%(rs\|rb\|ru\|w\|i\|fwa\|ime\|gife\|gifs\|ae\|tcpsrt\|tcpswt\|httpsw\|httpsw\|tcpswt\|tcpsrt\)"
syn match uiuasymbmod1 "[/∧\∵≡⊞⍥⊕⊜⊔⋅⊙∩°↬]"
syn match uiuawordmod1 "reduce\|fol\%(d\)\?\|scan\|eac\%(h\)\?\|row\%(s\)\?\|tab\%(l\%(e\)\?\)\?\|rep\%(e\%(a\%(t\)\?\)\?\)\?\|gro\%(u\%(p\)\?\)\?\|par\%(t\%(i\%(t\%(i\%(o\%(n\)\?\)\?\)\?\)\?\)\?\)\?\|con\%(t\%(e\%(n\%(t\)\?\)\?\)\?\)\?\|ga\%(p\)\?\|dip\|bot\%(h\)\?\|un"
syn match uiuakwdmod1 "thi\%(s\)\?\|bind\|memo\|comptime\|spawn\|dump\|&ast"
syn match uiuasymbmod2 "[⍜⊃⊓⋔⍢⬚⍣]"
syn match uiuawordmod2 "und\%(e\%(r\)\?\)\?\|for\%(k\)\?\|bra\%(c\%(k\%(e\%(t\)\?\)\?\)\?\)\?\|all\|do\|fil\%(l\)\?\|try"
syn match uiuakwdmod2 "set\%(inv\|und\)"

syn match uiuaquo /""/ contained
syn region uiuastn matchgroup=uiuastn start=/"/ end=/"/ contains=uiuaquo
syn region uiuastf matchgroup=uiuastf start=/\$"/ end=/"/ contains=uiuaquo
syn region uiuastm matchgroup=uiuastm start=/\$ / end=/$/ contains=uiuaquo
syn sync fromstart

hi link uiuaids Identifier
hi link uiuacmt Comment
hi link uiuachr Character
hi link uiuanum Number
hi link uiuastnd PreProc
hi link uiuasymbstack Normal
hi link uiuawordstack Normal
hi link uiuashortstack Normal
hi link uiuasymbdbgstack Normal
hi link uiuaworddbgstack Normal
hi link uiuasymbnoad Keyword
hi link uiuawordnoad Keyword
hi link uiuakwdnoad Keyword
hi link uiuasysnoad Keyword
hi link uiuasymbmnad Operator
hi link uiuawordmnad Operator
hi link uiuakwdmnad Operator
hi link uiuasysmnad Operator
hi link uiuasymbdyad Function
hi link uiuacmpworddyad Function
hi link uiuaworddyad Function
hi link uiuasysdyad Function
hi link uiuakwddyad Function
hi link uiuasymbmod1 Tag
hi link uiuawordmod1 Tag
hi link uiuakwdmod1 Tag
hi link uiuasymbmod2 Structure
hi link uiuawordmod2 Structure
hi link uiuakwdmod2 Structure
hi link uiuastn String
hi link uiuastf String
hi link uiuastm String

let b:current_syntax='uiua'
