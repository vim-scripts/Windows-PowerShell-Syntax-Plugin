" Vim syntax file
" Version: 2.1
" Language:	Windows PowerShell
" Maintainer:	
"   Peter Provost <peter@provost.org>
" Last Change:	2006-07-31
" Remark: Updated to support Windows PowerShell (ps1)
" Contributions by:
" 	Jared Parsons <jaredp@beanseed.org>

" Compatible VIM syntax file start
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" PowerShell doesn't care about case
syn case ignore

" List of actual keywords and core language components
syn keyword ps1Conditional if else switch
syn keyword ps1Repeat while foreach default for do until break continue
syn keyword ps1Keyword return where filter in trap throw
syn keyword ps1Keyword function nextgroup=ps1Function skipwhite
syn match ps1Function /\w\+/ contained
syn match ps1Comment /#.*/
syn match ps1Cmdlet /\w\+-\w\+/
syn match ps1Cmdlet /new-object/ nextgroup=ps1StandaloneType skipwhite
syn match ps1Cmdlet /remove-variable/ nextgroup=ps1VariableName skipwhite

" Type declarations
syn match ps1Type /\[[a-z0-9_:.]\+\]/
syn match ps1StandaloneType /[a-z0-9_.]\+/ contained
syn keyword ps1Scope global local private script contained

" Variables and other user defined items
syn match ps1Variable /\$\w\+/	
syn match ps1Variable /\${\w\+:\\\w\+}/ 
syn match ps1ScopedVariable /\$\w\+:\w\+/ contains=ps1Scope
syn match ps1VariableName /\w\+/ contained

" Operators
syn match ps1OperatorStart /-c\?/ nextgroup=ps1Operator
syn keyword ps1Operator and not or as band bor is isnot lt le gt ge contained
syn keyword ps1Operator eq ne match notmatch contained
syn keyword ps1Operator like notlike replace ireplace f contained
syn match ps1Operator /(not)\?contains/ contained

" Strings
syn region ps1String start=/"/ skip=/`"/ end=/"/ 
syn region ps1String start=/'/ end=/'/  

" Numbers
syn match ps1Number /\<[0-9]\+/

if version >= 508 || !exists("did_ps1_syn_inits")
  if version < 508
    let did_ps1_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ps1String 						String
	HiLink ps1Conditional 			Conditional
	HiLink ps1Function					Function
	HiLink ps1Variable					Identifier
	HiLink ps1ScopedVariable		Identifier
	HiLink ps1VariableName			Identifier
	HiLink ps1Type							Type
	HiLink ps1Scope							Type
	HiLink ps1StandaloneType		Type
	HiLink ps1Number 						Number
	HiLink ps1Comment						Comment
	HiLink ps1Operator 					Operator
	HiLink ps1Repeat						Repeat
	HiLink ps1Keyword						Keyword
	HiLink ps1Cmdlet						Statement
  delcommand HiLink
endif

