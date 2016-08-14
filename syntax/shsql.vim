if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/sh.vim
unlet b:current_syntax

runtime! syntax/sql.vim
unlet b:current_syntax

let b:current_syntax = 'shsql'
