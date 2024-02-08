if exists('b:current_syntax')
finish
endif

syn match uiuaidents "\<[a-zA-Z]\+\>"
syn match uiuacomments "#.*$"
syn match uiuacharacters "@\%(\\\%(x[0-9A-Fa-f]{2}\|u[0-9A-Fa-f]{4}\|.\)\|.\)"
syn match uiuanumbers "[`¯]\?[0-9]\+\%([./][0-9]\+\%(e[+-]\?[0-9]\+\)\?\)\?"
syn match uiuastrand "_"
syn match uiuastack "[.,:◌;?⸮∘]\|\([a-zA-Z]\)\@<!\(\%(duplicate\|over\|flip\|pop\|stack\|trac\%(e\)\?\|id\%(e\%(n\%(t\%(i\%(t\%(y\)\?\)\?\)\?\)\?\)\?\)\?\)\)\([a-zA-Z]\)\@!"
syn match uiuanoadic "[↫⚂ηπτ∞]\|\([a-zA-Z]\)\@<!\(\%(rec\%(u\%(r\)\?\)\?\|rand\%(o\%(m\)\?\)\?\|tag\|now\|eta\|pi\|tau\|inf\%(i\%(n\%(i\%(t\%(y\)\?\)\?\)\?\)\?\)\?\)\|&\%(sc\|ts\|args\|asr\)\)\([a-zA-Z]\)\@!"
syn match uiuamonadic "[¬±¯`⌵√○⌊⌈⁅⧻△⇡⊢⇌♭¤⋯⍉⍏⍖⊚⊛◴◰□⋕]\|\([a-zA-Z]\)\@<!\(\%(not\|sig\%(n\)\?\|neg\%(a\%(t\%(e\)\?\)\?\)\?\|abs\%(o\%(l\%(u\%(t\%(e\%( \%(v\%(a\%(l\%(u\%(e\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\|sqr\%(t\)\?\|sin\%(e\)\?\|flo\%(o\%(r\)\?\)\?\|cei\%(l\%(i\%(n\%(g\)\?\)\?\)\?\)\?\|rou\%(n\%(d\)\?\)\?\|len\%(g\%(t\%(h\)\?\)\?\)\?\|sha\%(p\%(e\)\?\)\?\|ran\%(g\%(e\)\?\)\?\|fir\%(s\%(t\)\?\)\?\|rev\%(e\%(r\%(s\%(e\)\?\)\?\)\?\)\?\|des\%(h\%(a\%(p\%(e\)\?\)\?\)\?\)\?\|fix\|bit\%(s\)\?\|tra\%(n\%(s\%(p\%(o\%(s\%(e\)\?\)\?\)\?\)\?\)\?\)\?\|ris\%(e\)\?\|fal\%(l\)\?\|whe\%(r\%(e\)\?\)\?\|cla\%(s\%(s\%(i\%(f\%(y\)\?\)\?\)\?\)\?\)\?\|ded\%(u\%(p\%(l\%(i\%(c\%(a\%(t\%(e\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\|uni\%(q\%(u\%(e\)\?\)\?\)\?\|box\|pars\%(e\)\?\|wait\|recv\|tryrecv\|gen\|utf\|type\)\|&\%(s\|pf\|p\|raw\|var\|runi\|runc\|cd\|sl\|invk\|cl\|fo\|fc\|fde\|ftr\|fe\|fld\|fif\|fras\|frab\|imd\|ims\|gifd\|ad\|ap\|tcpl\|tcpa\|tcpc\|tcpsnb\|tcpaddr\)\)\([a-zA-Z]\)\@!"
syn match uiuadyadic "[==≠<≤>≥+\-×*÷%◿ⁿₙ↧↥∠ℂ≍⊟⊂⊏⊡↯☇↙↘↻◫▽⌕∊⊗⍤]\|\([a-zA-Z]\)\@<!\(\%(equals\|not \%(e\%(q\%(u\%(a\%(l\%(s\)\?\)\?\)\?\)\?\)\?\)\?\|less than\|les\%(s\%( \%(o\%(r\%( \%(e\%(q\%(u\%(a\%(l\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\|greater than\|gre\%(a\%(t\%(e\%(r\%( \%(o\%(r\%( \%(e\%(q\%(u\%(a\%(l\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\)\?\|add\|subtract\|mul\%(t\%(i\%(p\%(l\%(y\)\?\)\?\)\?\)\?\)\?\|div\%(i\%(d\%(e\)\?\)\?\)\?\|mod\%(u\%(l\%(u\%(s\)\?\)\?\)\?\)\?\|pow\%(e\%(r\)\?\)\?\|log\%(a\%(r\%(i\%(t\%(h\%(m\)\?\)\?\)\?\)\?\)\?\)\?\|min\%(i\%(m\%(u\%(m\)\?\)\?\)\?\)\?\|max\%(i\%(m\%(u\%(m\)\?\)\?\)\?\)\?\|ata\%(n\%(g\%(e\%(n\%(t\)\?\)\?\)\?\)\?\)\?\|com\%(p\%(l\%(e\%(x\)\?\)\?\)\?\)\?\|mat\%(c\%(h\)\?\)\?\|cou\%(p\%(l\%(e\)\?\)\?\)\?\|joi\%(n\)\?\|sel\%(e\%(c\%(t\)\?\)\?\)\?\|pic\%(k\)\?\|res\%(h\%(a\%(p\%(e\)\?\)\?\)\?\)\?\|rer\%(a\%(n\%(k\)\?\)\?\)\?\|tak\%(e\)\?\|dro\%(p\)\?\|rot\%(a\%(t\%(e\)\?\)\?\)\?\|win\%(d\%(o\%(w\%(s\)\?\)\?\)\?\)\?\|kee\%(p\)\?\|fin\%(d\)\?\|mem\%(b\%(e\%(r\)\?\)\?\)\?\|ind\%(e\%(x\%(o\%(f\)\?\)\?\)\?\)\?\|ass\%(e\%(r\%(t\)\?\)\?\)\?\|send\|deal\|regex\|map\|has\|get\|remove\)\|&\%(rs\|rb\|ru\|w\|i\|fwa\|ime\|gife\|gifs\|ae\|tcpsrt\|tcpswt\|httpsw\)\)\([a-zA-Z]\)\@!"
syn match uiuamod1 "[/∧\∵≡⊞⍥⊕⊜⊔⋅⊙∩°↬]\|\([a-zA-Z]\)\@<!\(\%(reduce\|fol\%(d\)\?\|scan\|eac\%(h\)\?\|row\%(s\)\?\|tab\%(l\%(e\)\?\)\?\|rep\%(e\%(a\%(t\)\?\)\?\)\?\|gro\%(u\%(p\)\?\)\?\|par\%(t\%(i\%(t\%(i\%(o\%(n\)\?\)\?\)\?\)\?\)\?\)\?\|con\%(t\%(e\%(n\%(t\)\?\)\?\)\?\)\?\|ga\%(p\)\?\|dip\|bot\%(h\)\?\|un\|thi\%(s\)\?\|bind\|memo\|comptime\|spawn\|dump\)\|&\%(ast\)\)\([a-zA-Z]\)\@!"
syn match uiuamod2 "[⍜⊃⊓⋔⍢⬚⍣]\|\([a-zA-Z]\)\@<!\(\%(setinv\|setund\|und\%(e\%(r\)\?\)\?\|for\%(k\)\?\|bra\%(c\%(k\%(e\%(t\)\?\)\?\)\?\)\?\|all\|do\|fil\%(l\)\?\|try\)\)\([a-zA-Z]\)\@!"

syn match uiuaquote /""/ contained
syn region uiuastringsnormal matchgroup=uiuastringsnormal start=/"/ end=/"/ contains=uiuaquote
syn region uiuastringsformat matchgroup=uiuastringsformat start=/\$"/ end=/"/ contains=uiuaquote
syn region uiuastringsmultil matchgroup=uiuastringsmultil start=/\$ / end=/$/ contains=uiuaquote
syn sync fromstart

hi link uiuaidents Identifier
hi link uiuacomments Comment
hi link uiuacharacters Character
hi link uiuanumbers Number
hi link uiuastringsnormal String
hi link uiuastringsformat String
hi link uiuastringsmultil String
hi link uiuastrand Comment
hi link uiuastack Normal
hi link uiuanoadic Special
hi link uiuamonadic Macro
hi link uiuadyadic Function
hi link uiuamod1 Type
hi link uiuamod2 Keyword

if has ('nvim')
    hi link @lsp.type.string String
    hi link @lsp.type.number Number
    hi link @lsp.type.comment Comment
    hi link @lsp.type.stack_function Normal
    hi link @lsp.type.noadic_function Special
    hi link @lsp.type.monadic_function Macro
    hi link @lsp.type.dyadic_function Function
    hi link @lsp.type.monadic_modifier Type
    hi link @lsp.type.dyadic_modifier Keyword
endif

let b:current_syntax='uiua'
