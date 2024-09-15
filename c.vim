" We define our own handling for if, while and for, so remove them from
" the simple keyword matching used by default
syn clear cConditional
syn clear cRepeat
syn clear cStorageClass

syn keyword cConditional switch else
syn keyword cRepeat do

syn match cJCFuncCall "\<\I\i*\s*("
" Matches for types in function parameters
syn match cJCParamVoid "\<void\>" contained
syn match cJCParamType "\<\(\(const\|restrict\|volatile\|signed\|unsigned\|struct\|enum\)[ \t*]\+\)*\I\i*[ \t*]\+\I"he=e-1 contained containedin=cJCFor

" Matchs for types in variables and function declarations
syn match cJCTypeInDecl "^\s*\(\(inline\|const\|restrict\|extern\|GLOBAL\|static\|register\|auto\|volatile\|virtual\|signed\|unsigned\|struct\)[ \t*]\+\)*\I\i*\([ \t*]\+\(const\|restrict\|volatile\)\)*[ \t*]*" contained
syn match cJCDecl "^\s*\(inline\s\+\)\=\(\I\i*[ \t*]\+\)\+\s*\I" contains=cJCTypeInDecl

" Matches function declarations and definitions
syn region cJCFunc start="^\(\(inline\|const\|extern\|GLOBAL\|static\|register\|auto\|volatile\|virtual\|signed\|unsigned\|struct\)[ \t*]\+\)*\I\i*\s\+\**\s*\I[[:ident:]:]*\s*(" end=")" contains=CJCParamVoid,cJCParamType,cJCTypeInDecl,cComment
syn region cJCFunc start="^\I\i*\s*(" end=")" contains=CJCParamVoid,cJCParamType

" Matches type casts
syn match cJCTypeCast "(\@<=\s*\(\(const\|restrict\|volatile\|signed\|unsigned\|struct\|enum\)[ \t*]\+\)*\I\i*\s*\**\s*\(restrict\)\?\s*)\s*[^) \t;,{]"me=e-2

" Matchs function calls and if/else/while, so they are not
" accidentally matched by things above.
syn match cJCFctCall "\i\s*(\s*\(\(const\|restrict\|volatile\|signed\|unsigned\|struct\|enum\)[ \t*]\+\)*\I\i*\s*\**\s*)"

syn region cJCIfParent matchgroup=cConditional start="(" end=")" contained contains=ALLBUT,@cParenGroup,cJCTypeInDecl
syn region cJCIf matchgroup=cConditional start="\(\s*\(\<else\s\+\)\=\<if\|\s*\<while\)\s*("rs=e-1 matchgroup=NONE end="$"me=e-1 contains=cJCIfParent
syn region cJCFor matchgroup=cConditional start="\<for\s*(" end=")" contains=ALLBUT,@cParenGroup,cJCTypeInDecl,cErrInBracket

" Put our custom matching things in clusters that are used in ALLBUT places
" in vim standard C highlighting, because we don t want them to match there.
syn cluster cParenGroup add=cJCTypeInDecl,cJCParamType,cJCIfParent
syn cluster cPreProcGroup add=cJCParamType,cJCTypeCast

" Override some standard C things because cJCDecl matches a bit too easily
syn match cStatement "^\s*return\>."me=e-1
syn match cStatement "^\s*goto\s\+\I"me=e-1
syn match cConditional "^\s*case\>."me=e-1
syn match cConditional ":\s*$"

highlight clear NonText
" Delete the keyword-based cType matching, it just gets in the way
syn clear cType

" Highlight all the types using cType
hi link cJCType cType
hi link cJCParamType cType
hi link cJCParamVoid cType
hi link cJCTypeInDecl cType
hi link cJCTypeCast cType

" Flesh-and-Blood Colorscheme Adaptations
hi cJCType guifg=#D8DEE9 ctermfg=Grey  " Adapt type highlighting to match the theme
hi cJCParamType guifg=#FF4060 ctermfg=Grey
hi cJCTypeInDecl guifg=#FF4060 ctermfg=Grey
hi cJCTypeCast guifg=#A3BE8C ctermfg=LightGreen

" NEW: Match structure member access (struct->member or struct.member, including nested accesses)
syn match cJCStructCall "\<\I\i*\(\.\|->\)\I\i*"
highlight cJCStructCall guifg=#FF6F61 ctermfg=204  " Struct member access in a light red

" NEW: Highlight malloc function calls in a deeper BrightRed
syn keyword cBrightRedFuncs malloc
hi cBrightRedFuncs guifg=#FF4060 ctermfg=LightRed

" Macro definitions
syn match cMacro /\<[A-Z0-9_]\+\>/
hi cMacro guifg=#EBCB8B ctermfg=Yellow  " BrightRed for general macros

hi cJCFuncCall guifg=#933D52 ctermfg=132  "Light function calls color
"hi cJCFunc guifg=#933D52 ctermfg=130

highlight cConditional guifg=#BF616A ctermfg=Red  " Conditional statements
highlight cRepeat guifg=#BF616A ctermfg=Red       " Repeat statements
highlight cStatement guifg=#BF616A ctermfg=Red

" Uncomment these for debug mode: very visible highlight of what we match
"hi cJCTypeCast guibg=#ff0000
"hi cJCDecl guibg=#d08080
"hi cJCType guibg=#FFFF00
"hi cJCTypeInDecl guibg=#FF00FF
"hi cJCFunc guibg=#00FF00
"hi cJCParamType guibg=#0000FF
"hi cJCIf guibg=#00FFFF
"hi cJCFor guibg=#00FF80

