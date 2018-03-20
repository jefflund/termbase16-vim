" Setup theme
set background=dark
highlight clear
syntax reset
let g:colors_name="termbase16-xcode-dusk"

" Color definitions
let s:t0="236" " Default Background
let s:t1="238" " Lighter Background (Status bars)
let s:t2="240" " Selection Background
let s:t3="242" " Comments, Invisibles
let s:t4="244" " Dark Foreground (Status bars)
let s:t5="246" " Default Foreground
let s:t6="007" " Light Foreground (Rarely used)
let s:t7="250" " Light Background (Rarely used)
let s:t8="126" " Debug, Identifiers, Diff Delete
let s:t9="098" " Numbers, Booleans, Constants
let s:tA="066" " Classes, Labels
let s:tB="160" " Strings, Diff Add
let s:tC="037" " Escapes, RegExp
let s:tD="091" " Function, Include, Directory
let s:tE="126" " Keywords, Storage, Diff Change
let s:tF="173" " Delimiters, SpecialChar

" Highlight function
function <sid>hi(group, fg, bg, attr)
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
call <sid>hi("Normal",       s:t5, s:t0, "")
call <sid>hi("Bold",         "",   "",   "bold")
call <sid>hi("Debug",        s:t8, "",   "")
call <sid>hi("Directory",    s:tD, "",   "")
call <sid>hi("Error",        s:t0, s:t8, "")
call <sid>hi("ErrorMsg",     s:t8, s:t0, "")
call <sid>hi("Exception",    s:t8, "",   "")
call <sid>hi("FoldColumn",   s:tC, s:t1, "")
call <sid>hi("Folded",       s:t3, s:t1, "")
call <sid>hi("IncSearch",    s:t1, s:t9, "none")
call <sid>hi("Italic",       "",   "",   "none")
call <sid>hi("Macro",        s:t8, "",   "")
call <sid>hi("MatchParen",   "",   s:t3, "")
call <sid>hi("ModeMsg",      s:tB, "",   "")
call <sid>hi("MoreMsg",      s:tB, "",   "")
call <sid>hi("Question",     s:tD, "",   "")
call <sid>hi("Search",       s:t3, s:tA, "")
call <sid>hi("Substitute",   s:t3, s:tA, "none")
call <sid>hi("SpecialKey",   s:t3, "",   "")
call <sid>hi("TooLong",      s:t8, "",   "")
call <sid>hi("Underlined",   s:t8, "",   "")
call <sid>hi("Visual",       "",   s:t2, "")
call <sid>hi("VisualNOS",    s:t8, "",   "")
call <sid>hi("WarningMsg",   s:t8, "",   "")
call <sid>hi("WildMenu",     s:t8, "",   "")
call <sid>hi("Title",        s:tD, "",   "none")
call <sid>hi("Conceal",      s:tD, s:t0, "")
call <sid>hi("Cursor",       s:t0, s:t5, "")
call <sid>hi("NonText",      s:t3, "",   "")
call <sid>hi("LineNr",       s:t3, s:t1, "")
call <sid>hi("SignColumn",   s:t3, s:t1, "")
call <sid>hi("StatusLine",   s:t4, s:t2, "none")
call <sid>hi("StatusLineNC", s:t3, s:t1, "none")
call <sid>hi("VertSplit",    s:t2, s:t2, "none")
call <sid>hi("ColorColumn",  "",   s:t1, "none")
call <sid>hi("CursorColumn", "",   s:t1, "none")
call <sid>hi("CursorLine",   "",   s:t1, "none")
call <sid>hi("CursorLineNr", s:t4, s:t1, "")
call <sid>hi("QuickFixLine", "",   s:t1, "none")
call <sid>hi("PMenu",        s:t5, s:t1, "none")
call <sid>hi("PMenuSel",     s:t1, s:t5, "")
call <sid>hi("TabLine",      s:t3, s:t1, "none")
call <sid>hi("TabLineFill",  s:t3, s:t1, "none")
call <sid>hi("TabLineSel",   s:tB, s:t1, "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:t9, "",   "")
call <sid>hi("Character",    s:t8, "",   "")
call <sid>hi("Comment",      s:t3, "",   "")
call <sid>hi("Conditional",  s:tE, "",   "")
call <sid>hi("Constant",     s:t9, "",   "")
call <sid>hi("Define",       s:tE, "",   "none")
call <sid>hi("Delimiter",    s:tF, "",   "")
call <sid>hi("Float",        s:t9, "",   "")
call <sid>hi("Function",     s:tD, "",   "")
call <sid>hi("Identifier",   s:t8, "",   "none")
call <sid>hi("Include",      s:tD, "",   "")
call <sid>hi("Keyword",      s:tE, "",   "")
call <sid>hi("Label",        s:tA, "",   "")
call <sid>hi("Number",       s:t9, "",   "")
call <sid>hi("Operator",     s:t5, "",   "none")
call <sid>hi("PreProc",      s:tA, "",   "")
call <sid>hi("Repeat",       s:tA, "",   "")
call <sid>hi("Special",      s:tC, "",   "")
call <sid>hi("SpecialChar",  s:tF, "",   "")
call <sid>hi("Statement",    s:t8, "",   "")
call <sid>hi("StorageClass", s:tA, "",   "")
call <sid>hi("String",       s:tB, "",   "")
call <sid>hi("Structure",    s:tE, "",   "")
call <sid>hi("Tag",          s:tA, "",   "")
call <sid>hi("Todo",         s:tA, s:t1, "")
call <sid>hi("Type",         s:tA, "",   "none")
call <sid>hi("Typedef",      s:tA, "",   "")

" C highlighting
call <sid>hi("cOperator",  s:tC, "", "")
call <sid>hi("cPreCondit", s:tE, "", "")

" C# highlighting
call <sid>hi("csClass",                s:tA, "", "")
call <sid>hi("csAttribute",            s:tA, "", "")
call <sid>hi("csModifier",             s:tE, "", "")
call <sid>hi("csType",                 s:t8, "", "")
call <sid>hi("csUnspecifiedStatement", s:tD, "", "")
call <sid>hi("csContextualStatement",  s:tE, "", "")
call <sid>hi("csNewDecleration",       s:t8, "", "")

" CSS highlighting
call <sid>hi("cssBraces",    s:t5, "", "")
call <sid>hi("cssClassName", s:tE, "", "")
call <sid>hi("cssColor",     s:tC, "", "")

" Diff highlighting
call <sid>hi("DiffAdd",     s:tB, s:t1, "")
call <sid>hi("DiffChange",  s:t3, s:t1, "")
call <sid>hi("DiffDelete",  s:t8, s:t1, "")
call <sid>hi("DiffText",    s:tD, s:t1, "")
call <sid>hi("DiffAdded",   s:tB, s:t0, "")
call <sid>hi("DiffFile",    s:t8, s:t0, "")
call <sid>hi("DiffNewFile", s:tB, s:t0, "")
call <sid>hi("DiffLine",    s:tD, s:t0, "")
call <sid>hi("DiffRemoved", s:t8, s:t0, "")

" Git highlighting
call <sid>hi("gitcommitOverflow",      s:t8, "", "")
call <sid>hi("gitcommitSummary",       s:tB, "", "")
call <sid>hi("gitcommitComment",       s:t3, "", "")
call <sid>hi("gitcommitUntracked",     s:t3, "", "")
call <sid>hi("gitcommitDiscarded",     s:t3, "", "")
call <sid>hi("gitcommitSelected",      s:t3, "", "")
call <sid>hi("gitcommitHeader",        s:tE, "", "")
call <sid>hi("gitcommitSelectedType",  s:tD, "", "")
call <sid>hi("gitcommitUnmergedType",  s:tD, "", "")
call <sid>hi("gitcommitDiscardedType", s:tD, "", "")
call <sid>hi("gitcommitBranch",        s:t9, "", "bold")
call <sid>hi("gitcommitUntrackedFile", s:tA, "", "")
call <sid>hi("gitcommitUnmergedFile",  s:t8, "", "bold")
call <sid>hi("gitcommitDiscardedFile", s:t8, "", "bold")
call <sid>hi("gitcommitSelectedFile",  s:tB, "", "bold")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",          s:tB, s:t1, "")
call <sid>hi("GitGutterChange",       s:tD, s:t1, "")
call <sid>hi("GitGutterDelete",       s:t8, s:t1, "")
call <sid>hi("GitGutterChangeDelete", s:tE, s:t1, "")

" HTML highlighting
call <sid>hi("htmlBold",   s:tA, "", "")
call <sid>hi("htmlItalic", s:tE, "", "")
call <sid>hi("htmlEndTag", s:t5, "", "")
call <sid>hi("htmlTag",    s:t5, "", "")

" JavaScript highlighting
call <sid>hi("javaScript",          s:t5, "", "")
call <sid>hi("javaScriptBraces",    s:t5, "", "")
call <sid>hi("javaScriptNumber",    s:t9, "", "")
call <sid>hi("jsOperator",          s:tD, "", "")
call <sid>hi("jsStatement",         s:tE, "", "")
call <sid>hi("jsReturn",            s:tE, "", "")
call <sid>hi("jsThis",              s:t8, "", "")
call <sid>hi("jsClassDefinition",   s:tA, "", "")
call <sid>hi("jsFunction",          s:tE, "", "")
call <sid>hi("jsFuncName",          s:tD, "", "")
call <sid>hi("jsFuncCall",          s:tD, "", "")
call <sid>hi("jsClassFuncName",     s:tD, "", "")
call <sid>hi("jsClassMethodType",   s:tE, "", "")
call <sid>hi("jsRegexpString",      s:tC, "", "")
call <sid>hi("jsGlobalObjects",     s:tA, "", "")
call <sid>hi("jsGlobalNodeObjects", s:tA, "", "")
call <sid>hi("jsExceptions",        s:tA, "", "")
call <sid>hi("jsBuiltins",          s:tA, "", "")

" Mail highlighting
call <sid>hi("mailQuoted1", s:tA, "", "")
call <sid>hi("mailQuoted2", s:tB, "", "")
call <sid>hi("mailQuoted3", s:tE, "", "")
call <sid>hi("mailQuoted4", s:tC, "", "")
call <sid>hi("mailQuoted5", s:tD, "", "")
call <sid>hi("mailQuoted6", s:tA, "", "")
call <sid>hi("mailURL",     s:tD, "", "")
call <sid>hi("mailEmail",   s:tD, "", "")

" Markdown highlighting
call <sid>hi("markdownCode",             s:tB, "",   "")
call <sid>hi("markdownError",            s:t5, s:t0, "")
call <sid>hi("markdownCodeBlock",        s:tB, "",   "")
call <sid>hi("markdownHeadingDelimiter", s:tD, "",   "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash", s:tD, "", "")
call <sid>hi("NERDTreeExecFile", s:t5, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector", s:t5, "", "")
call <sid>hi("phpComparison",     s:t5, "", "")
call <sid>hi("phpParent",         s:t5, "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:tE, "", "")
call <sid>hi("pythonRepeat",    s:tE, "", "")
call <sid>hi("pythonInclude",   s:tE, "", "")
call <sid>hi("pythonStatement", s:tE, "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",              s:tD, "", "")
call <sid>hi("rubyConstant",               s:tA, "", "")
call <sid>hi("rubyInterpolationDelimiter", s:tF, "", "")
call <sid>hi("rubyRegexp",                 s:tC, "", "")
call <sid>hi("rubySymbol",                 s:tB, "", "")
call <sid>hi("rubyStringDelimiter",        s:tB, "", "")

" SASS highlighting
call <sid>hi("sassidChar",    s:t8, "", "")
call <sid>hi("sassClassChar", s:t9, "", "")
call <sid>hi("sassInclude",   s:tE, "", "")
call <sid>hi("sassMixing",    s:tE, "", "")
call <sid>hi("sassMixinName", s:tD, "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",    s:tB, s:t1, "")
call <sid>hi("SignifySignChange", s:tD, s:t1, "")
call <sid>hi("SignifySignDelete", s:t8, s:t1, "")

" Spelling highlighting
call <sid>hi("SpellBad",   "", s:t0, "undercurl")
call <sid>hi("SpellLocal", "", s:t0, "undercurl")
call <sid>hi("SpellCap",   "", s:t0, "undercurl")
call <sid>hi("SpellRare",  "", s:t0, "undercurl")

" Startify highlighting
call <sid>hi("StartifyBracket", s:t3, "", "")
call <sid>hi("StartifyFile",    s:t7, "", "")
call <sid>hi("StartifyFooter",  s:t3, "", "")
call <sid>hi("StartifyHeader",  s:tB, "", "")
call <sid>hi("StartifyNumber",  s:t9, "", "")
call <sid>hi("StartifyPath",    s:t3, "", "")
call <sid>hi("StartifySection", s:tE, "", "")
call <sid>hi("StartifySelect",  s:tC, "", "")
call <sid>hi("StartifySlash",   s:t3, "", "")
call <sid>hi("StartifySpecial", s:t3, "", "")

" Cleanup
delfunction <sid>hi
unlet s:t0 s:t1 s:t2 s:t3 s:t4 s:t5 s:t6 s:t7 s:t8 s:t9 s:tA s:tB s:tC s:tD s:tE s:tF
