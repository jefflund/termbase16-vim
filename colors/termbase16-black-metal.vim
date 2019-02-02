" Setup theme
set background=dark
highlight clear
syntax reset
let g:colors_name="termbase16-black-metal"

" Color definitions
let s:t0="000" " Default Background
let s:t1="233" " Lighter Background (Status bars)
let s:t2="235" " Selection Background
let s:t3="236" " Comments, Invisibles
let s:t4="246" " Dark Foreground (Status bars)
let s:t5="250" " Default Foreground
let s:t6="246" " Light Foreground (Rarely used)
let s:t7="250" " Light Background (Rarely used)
let s:t8="066" " Debug, Identifiers, Diff Delete
let s:t9="007" " Numbers, Booleans, Constants
let s:tA="131" " Classes, Labels
let s:tB="174" " Strings, Diff Add
let s:tC="007" " Escapes, RegExp
let s:tD="102" " Function, Include, Directory
let s:tE="246" " Keywords, Storage, Diff Change
let s:tF="238" " Delimiters, SpecialChar

" Highlight function
function s:hi(group, fg, bg, attr)
    if a:fg != ""
        exec "highlight " . a:group . " ctermfg=" . a:fg
    endif
    if a:bg != ""
        exec "highlight " . a:group . " ctermbg=" . a:bg
    endif
    if a:attr != ""
        exec "highlight " . a:group . " cterm=" . a:attr
    endif
endfunction

" Vim editor colors
call s:hi("Normal",       s:t5, s:t0, "")
call s:hi("Bold",         "",   "",   "bold")
call s:hi("Debug",        s:t8, "",   "")
call s:hi("Directory",    s:tD, "",   "")
call s:hi("Error",        s:t0, s:t8, "")
call s:hi("ErrorMsg",     s:t8, s:t0, "")
call s:hi("Exception",    s:t8, "",   "")
call s:hi("FoldColumn",   s:tC, s:t1, "")
call s:hi("Folded",       s:t3, s:t1, "")
call s:hi("IncSearch",    s:t1, s:t9, "none")
call s:hi("Italic",       "",   "",   "none")
call s:hi("Macro",        s:t8, "",   "")
call s:hi("MatchParen",   "",   s:t3, "")
call s:hi("ModeMsg",      s:tB, "",   "")
call s:hi("MoreMsg",      s:tB, "",   "")
call s:hi("Question",     s:tD, "",   "")
call s:hi("Search",       s:t1, s:tA, "")
call s:hi("Substitute",   s:t1, s:tA, "none")
call s:hi("SpecialKey",   s:t3, "",   "")
call s:hi("TooLong",      s:t8, "",   "")
call s:hi("Underlined",   s:t8, "",   "")
call s:hi("Visual",       "",   s:t2, "")
call s:hi("VisualNOS",    s:t8, "",   "")
call s:hi("WarningMsg",   s:t8, "",   "")
call s:hi("WildMenu",     s:t8, "",   "")
call s:hi("Title",        s:tD, "",   "none")
call s:hi("Conceal",      s:tD, s:t0, "")
call s:hi("Cursor",       s:t0, s:t5, "")
call s:hi("NonText",      s:t3, "",   "")
call s:hi("LineNr",       s:t3, s:t1, "")
call s:hi("SignColumn",   s:t3, s:t1, "")
call s:hi("StatusLine",   s:t4, s:t2, "none")
call s:hi("StatusLineNC", s:t3, s:t1, "none")
call s:hi("VertSplit",    s:t2, s:t2, "none")
call s:hi("ColorColumn",  "",   s:t1, "none")
call s:hi("CursorColumn", "",   s:t1, "none")
call s:hi("CursorLine",   "",   s:t1, "none")
call s:hi("CursorLineNr", s:t4, s:t1, "")
call s:hi("QuickFixLine", "",   s:t1, "none")
call s:hi("PMenu",        s:t5, s:t1, "none")
call s:hi("PMenuSel",     s:t1, s:t5, "")
call s:hi("TabLine",      s:t3, s:t1, "none")
call s:hi("TabLineFill",  s:t3, s:t1, "none")
call s:hi("TabLineSel",   s:tB, s:t1, "none")

" Standard syntax highlighting
call s:hi("Boolean",      s:t9, "",   "")
call s:hi("Character",    s:t8, "",   "")
call s:hi("Comment",      s:t3, "",   "")
call s:hi("Conditional",  s:tE, "",   "")
call s:hi("Constant",     s:t9, "",   "")
call s:hi("Define",       s:tE, "",   "none")
call s:hi("Delimiter",    s:tF, "",   "")
call s:hi("Float",        s:t9, "",   "")
call s:hi("Function",     s:tD, "",   "")
call s:hi("Identifier",   s:t8, "",   "none")
call s:hi("Include",      s:tD, "",   "")
call s:hi("Keyword",      s:tE, "",   "")
call s:hi("Label",        s:tA, "",   "")
call s:hi("Number",       s:t9, "",   "")
call s:hi("Operator",     s:t5, "",   "none")
call s:hi("PreProc",      s:tA, "",   "")
call s:hi("Repeat",       s:tA, "",   "")
call s:hi("Special",      s:tC, "",   "")
call s:hi("SpecialChar",  s:tF, "",   "")
call s:hi("Statement",    s:t8, "",   "")
call s:hi("StorageClass", s:tA, "",   "")
call s:hi("String",       s:tB, "",   "")
call s:hi("Structure",    s:tE, "",   "")
call s:hi("Tag",          s:tA, "",   "")
call s:hi("Todo",         s:tA, s:t1, "")
call s:hi("Type",         s:tA, "",   "none")
call s:hi("Typedef",      s:tA, "",   "")

" C highlighting
call s:hi("cOperator",  s:tC, "", "")
call s:hi("cPreCondit", s:tE, "", "")

" C# highlighting
call s:hi("csClass",                s:tA, "", "")
call s:hi("csAttribute",            s:tA, "", "")
call s:hi("csModifier",             s:tE, "", "")
call s:hi("csType",                 s:t8, "", "")
call s:hi("csUnspecifiedStatement", s:tD, "", "")
call s:hi("csContextualStatement",  s:tE, "", "")
call s:hi("csNewDecleration",       s:t8, "", "")

" CSS highlighting
call s:hi("cssBraces",    s:t5, "", "")
call s:hi("cssClassName", s:tE, "", "")
call s:hi("cssColor",     s:tC, "", "")

" Diff highlighting
call s:hi("DiffAdd",     s:tB, s:t1, "")
call s:hi("DiffChange",  s:t3, s:t1, "")
call s:hi("DiffDelete",  s:t8, s:t1, "")
call s:hi("DiffText",    s:tD, s:t1, "")
call s:hi("DiffAdded",   s:tB, s:t0, "")
call s:hi("DiffFile",    s:t8, s:t0, "")
call s:hi("DiffNewFile", s:tB, s:t0, "")
call s:hi("DiffLine",    s:tD, s:t0, "")
call s:hi("DiffRemoved", s:t8, s:t0, "")

" Git highlighting
call s:hi("gitcommitOverflow",      s:t8, "", "")
call s:hi("gitcommitSummary",       s:tB, "", "")
call s:hi("gitcommitComment",       s:t3, "", "")
call s:hi("gitcommitUntracked",     s:t3, "", "")
call s:hi("gitcommitDiscarded",     s:t3, "", "")
call s:hi("gitcommitSelected",      s:t3, "", "")
call s:hi("gitcommitHeader",        s:tE, "", "")
call s:hi("gitcommitSelectedType",  s:tD, "", "")
call s:hi("gitcommitUnmergedType",  s:tD, "", "")
call s:hi("gitcommitDiscardedType", s:tD, "", "")
call s:hi("gitcommitBranch",        s:t9, "", "bold")
call s:hi("gitcommitUntrackedFile", s:tA, "", "")
call s:hi("gitcommitUnmergedFile",  s:t8, "", "bold")
call s:hi("gitcommitDiscardedFile", s:t8, "", "bold")
call s:hi("gitcommitSelectedFile",  s:tB, "", "bold")

" GitGutter highlighting
call s:hi("GitGutterAdd",          s:tB, s:t1, "")
call s:hi("GitGutterChange",       s:tD, s:t1, "")
call s:hi("GitGutterDelete",       s:t8, s:t1, "")
call s:hi("GitGutterChangeDelete", s:tE, s:t1, "")

" HTML highlighting
call s:hi("htmlBold",   s:tA, "", "")
call s:hi("htmlItalic", s:tE, "", "")
call s:hi("htmlEndTag", s:t5, "", "")
call s:hi("htmlTag",    s:t5, "", "")

" JavaScript highlighting
call s:hi("javaScript",          s:t5, "", "")
call s:hi("javaScriptBraces",    s:t5, "", "")
call s:hi("javaScriptNumber",    s:t9, "", "")
call s:hi("jsOperator",          s:tD, "", "")
call s:hi("jsStatement",         s:tE, "", "")
call s:hi("jsReturn",            s:tE, "", "")
call s:hi("jsThis",              s:t8, "", "")
call s:hi("jsClassDefinition",   s:tA, "", "")
call s:hi("jsFunction",          s:tE, "", "")
call s:hi("jsFuncName",          s:tD, "", "")
call s:hi("jsFuncCall",          s:tD, "", "")
call s:hi("jsClassFuncName",     s:tD, "", "")
call s:hi("jsClassMethodType",   s:tE, "", "")
call s:hi("jsRegexpString",      s:tC, "", "")
call s:hi("jsGlobalObjects",     s:tA, "", "")
call s:hi("jsGlobalNodeObjects", s:tA, "", "")
call s:hi("jsExceptions",        s:tA, "", "")
call s:hi("jsBuiltins",          s:tA, "", "")

" Mail highlighting
call s:hi("mailQuoted1", s:tA, "", "")
call s:hi("mailQuoted2", s:tB, "", "")
call s:hi("mailQuoted3", s:tE, "", "")
call s:hi("mailQuoted4", s:tC, "", "")
call s:hi("mailQuoted5", s:tD, "", "")
call s:hi("mailQuoted6", s:tA, "", "")
call s:hi("mailURL",     s:tD, "", "")
call s:hi("mailEmail",   s:tD, "", "")

" Markdown highlighting
call s:hi("markdownCode",             s:tB, "",   "")
call s:hi("markdownError",            s:t5, s:t0, "")
call s:hi("markdownCodeBlock",        s:tB, "",   "")
call s:hi("markdownHeadingDelimiter", s:tD, "",   "")

" NERDTree highlighting
call s:hi("NERDTreeDirSlash", s:tD, "", "")
call s:hi("NERDTreeExecFile", s:t5, "", "")

" PHP highlighting
call s:hi("phpMemberSelector", s:t5, "", "")
call s:hi("phpComparison",     s:t5, "", "")
call s:hi("phpParent",         s:t5, "", "")
call s:hi("phpMethodsVar",     s:tC, "", "")

" Python highlighting
call s:hi("pythonOperator",  s:tE, "", "")
call s:hi("pythonRepeat",    s:tE, "", "")
call s:hi("pythonInclude",   s:tE, "", "")
call s:hi("pythonStatement", s:tE, "", "")

" Ruby highlighting
call s:hi("rubyAttribute",              s:tD, "", "")
call s:hi("rubyConstant",               s:tA, "", "")
call s:hi("rubyInterpolationDelimiter", s:tF, "", "")
call s:hi("rubyRegexp",                 s:tC, "", "")
call s:hi("rubySymbol",                 s:tB, "", "")
call s:hi("rubyStringDelimiter",        s:tB, "", "")

" SASS highlighting
call s:hi("sassidChar",    s:t8, "", "")
call s:hi("sassClassChar", s:t9, "", "")
call s:hi("sassInclude",   s:tE, "", "")
call s:hi("sassMixing",    s:tE, "", "")
call s:hi("sassMixinName", s:tD, "", "")

" Signify highlighting
call s:hi("SignifySignAdd",    s:tB, s:t1, "")
call s:hi("SignifySignChange", s:tD, s:t1, "")
call s:hi("SignifySignDelete", s:t8, s:t1, "")

" Spelling highlighting
call s:hi("SpellBad",   "", "", "undercurl")
call s:hi("SpellLocal", "", "", "undercurl")
call s:hi("SpellCap",   "", "", "undercurl")
call s:hi("SpellRare",  "", "", "undercurl")

" Startify highlighting
call s:hi("StartifyBracket", s:t3, "", "")
call s:hi("StartifyFile",    s:t7, "", "")
call s:hi("StartifyFooter",  s:t3, "", "")
call s:hi("StartifyHeader",  s:tB, "", "")
call s:hi("StartifyNumber",  s:t9, "", "")
call s:hi("StartifyPath",    s:t3, "", "")
call s:hi("StartifySection", s:tE, "", "")
call s:hi("StartifySelect",  s:tC, "", "")
call s:hi("StartifySlash",   s:t3, "", "")
call s:hi("StartifySpecial", s:t3, "", "")

" Java highlighting
call s:hi("javaOperator", s:tD, "", "")

" Cleanup
delfunction s:hi
unlet s:t0 s:t1 s:t2 s:t3 s:t4 s:t5 s:t6 s:t7 s:t8 s:t9 s:tA s:tB s:tC s:tD s:tE s:tF
