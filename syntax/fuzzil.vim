" syntax/fuzzil.vim
" Language: fuzzIL
" =======================================================
if exists("b:current_syntax")
  finish
endif

" FuzzIL Operations
syntax keyword fuzzilOperation Await 
syntax keyword fuzzilOperation BinaryOperation Break
syntax keyword fuzzilOperation CallFunction CallFunctionWithSpread CallMethod CallSuperConstructor CallSuperMethod
syntax keyword fuzzilOperation Compare Construct Continue ControlFlowOperation
syntax keyword fuzzilOperation CreateArray CreateArrayWithSpread CreateObject CreateObjectWithSpread
syntax keyword fuzzilOperation DeleteComputedProperty DeleteElement DeleteProperty Dup
syntax keyword fuzzilOperation Eval
syntax keyword fuzzilOperation In InstanceOf InternalOperation
syntax keyword fuzzilOperation LoadBigInt LoadBoolean LoadBuiltin LoadComputedProperty LoadElement LoadFloat LoadFromScope
syntax keyword fuzzilOperation LoadInteger LoadNull LoadProperty LoadRegExp LoadString LoadSuperProperty LoadUndefined
syntax keyword fuzzilOperation Nop
syntax keyword fuzzilOperation Reassign Return
syntax keyword fuzzilOperation StoreComputedProperty StoreElement StoreProperty StoreSuperProperty StoreToScope
syntax keyword fuzzilOperation ThrowException TypeOf
syntax keyword fuzzilOperation UnaryOperation
syntax keyword fuzzilOperation Yield
syntax keyword fuzzilOperation YieldEach

" FuzzIL Control Flow Operations
syntax keyword fuzzilBlock BeginAnyFunctionDefinition BeginBlockStatement BeginCatch BeginClassDefinition BeginCodeString
syntax keyword fuzzilBlock BeginElse BeginFor BeginForIn BeginForOf BeginIf BeginMethodDefinition BeginTry BeginWhile BeginWith
syntax keyword fuzzilBlock EndAnyFunctionDefinition EndBlockStatement EndCatch EndClassDefinition EndCodeString
syntax keyword fuzzilBlock EndElse EndFor EndForIn EndForOf EndIf EndMethodDefinition EndTry EndWhile EndWith

" String literals
syntax region fuzzilStringLiteral start=/\v'/ skip=/\v\\./ end=/\v'/

" Value assignment (i.e, variable binding)
syntax match fuzzilAssignment /\v\-\>/
syntax match fuzzilAssignment /\v\<\-/
syntax match fuzzilAssignment /\v\,/

" FuzzIL variable name
syntax match fuzzilVariable /\('\)\@<![a-z][0-9]\+\('\)\@!/

" Property types delimiters
syntax match fuzzilDelimiter /\v:/
syntax match fuzzilDelimiter /\v\[/
syntax match fuzzilDelimiter /\v\]/
" =======================================================

let b:current_syntax = "fuzzil"
highlight link fuzzilOperation     Type
highlight link fuzzilBlock         Conditional
highlight link fuzzilStringLiteral String
highlight link fuzzilAssignment    Special
highlight link fuzzilVariable      Identifier
highlight link fuzzilDelimiter     Delimiter
