" syntax/fuzzil.vim
" Language: fuzzIL
" =======================================================
if exists("b:current_syntax")
  finish
endif

" =======================================================
syntax keyword fuzzilOperation Await 
syntax keyword fuzzilOperation BeginAnyFunctionDefinition BeginBlockStatement BeginClassDefinition BeginCodeString BeginMethodDefinition BeginWith BinaryOperation Break
syntax keyword fuzzilOperation CallFunction CallFunctionWithSpread CallMethod CallSuperConstructor CallSuperMethod Compare Construct Continue ControlFlowOperation CreateArray CreateArrayWithSpread CreateObject CreateObjectWithSpread
syntax keyword fuzzilOperation DeleteComputedProperty DeleteElement DeleteProperty Dup
syntax keyword fuzzilOperation EndAnyFunctionDefinition EndBlockStatement EndClassDefinition EndCodeString EndWith Eval
syntax keyword fuzzilOperation In InstanceOf InternalOperation
syntax keyword fuzzilOperation LoadBigInt LoadBoolean LoadBuiltin LoadComputedProperty LoadElement LoadFloat LoadFromScope LoadInteger LoadNull LoadProperty LoadRegExp LoadString LoadSuperProperty LoadUndefined
syntax keyword fuzzilOperation Nop
syntax keyword fuzzilOperation Reassign Return
syntax keyword fuzzilOperation StoreComputedProperty StoreElement StoreProperty StoreSuperProperty StoreToScope
syntax keyword fuzzilOperation ThrowException TypeOf
syntax keyword fuzzilOperation UnaryOperation
syntax keyword fuzzilOperation Yield
syntax keyword fuzzilOperation YieldEach
" =======================================================
syntax keyword fuzzilBlocks BeginAnyFunctionDefinition BeginBlockStatement BeginCatch BeginClassDefinition BeginCodeString BeginElse BeginFor BeginForIn BeginForOf BeginIf BeginMethodDefinition BeginTry BeginWhile BeginWith EndAnyFunctionDefinition EndClassDefinition EndIf EndWhile

" =======================================================
" String literals
syntax region fuzzilStringLiteral start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link fuzzilStringLiteral String

" Array used for propertyNames in Operations
syntax region fuzzilArray start=/\v\[/ skip=/\v\\./ end=/\v\]/
highlight link fuzzilArray Special

" Value assignment (i.e, variable binding)
syntax match fuzzilAssignment /\v\-\>/
syntax match fuzzilAssignment /\v\<\-/
highlight link fuzzilAssignment Special

" FuzzIL variables
syntax match fuzzilVariable /\('\)\@<![a-z][0-9]\+\('\)\@!/
highlight link fuzzilVariable Identifier

" Operators [ : ]
syntax match fuzzilOperator /\v:/
highlight link fuzzilOperator Operator
" =======================================================

let b:current_syntax = "fuzzil"
