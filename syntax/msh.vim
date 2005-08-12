" Vim syntax file
" Language:	MSH/Monad (Microsoft Command Shell)
" Maintainer:	Peter Provost <peter@provost.org>
" Last Change:	2005-08-10 10:54:32
" Version: 1.1
" Filenames:	*.msh

if exists("b:current_syntax")
	finish
endif

syn case ignore

syn match mshComment "#.*$"
syn keyword mshFunctionDef						function nextgroup=mshFunction skipwhite
syn match		mshFunction								"[a-zA-Z_][a-zA-Z0-9_-]*" contained
syn keyword mshRepeat									do until for foreachwhile break continue 
syn keyword mshConditional						if else elseif switch 
syn keyword mshKeyword								where filter in return
syn region	mshString									start=+"+ end=+"+
syn match		mshNumber									"\<\d\+\>"
syn match   mshOperator   						"-\|=\|[:<>+\*^/\\]\|AND\|OR"
syn match   mshVariable								"\$\w\+"
syn match		mshCmdlet									"\w\+-\w\+"
syn match		mshType										"\[[^\]0-9]\+\]"

hi def link mshComment                          Comment
hi def link mshFunctionDef						Keyword
hi def link mshFunction								Function
hi def link mshRepeat									Repeat
hi def link mshConditional						Conditional
hi def link mshKeyword								Keyword
hi def link mshString									String
hi def link mshNumber									Number
hi def link mshOperator								Operator
hi def link mshVariable								Identifier
hi def link mshCmdlet									Special
hi def link mshType										Special
