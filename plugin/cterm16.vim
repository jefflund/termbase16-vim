if exists("g:loaded_cterm16")
    finish
endif
let g:loaded_cterm16 = 1

let g:ct16_0 = 0  " primary background
let g:ct16_1 = 8  " secondary background (status bars, line number, fold marks)
let g:ct16_2 = 7  " selection background
let g:ct16_3 = 10 " comments, invisibles, line highlights
let g:ct16_4 = 15 " secondary foreground (status bars)
let g:ct16_5 = 7  " primary foreground, caret, delimiters, operators
let g:ct16_6 = 11 " tertiary foreground (rarely used)
let g:ct16_7 = 4  " tertiary background (rarely used)
let g:ct16_8 = 9  " variables, markup lists, diff deleted
let g:ct16_9 = 14 " integers, booleans, constants
let g:ct16_A = 13 " classes, markup bold, search background
let g:ct16_B = 12 " strings, inherited class, diff inserted
let g:ct16_C = 6  " support, regex, escape characters, markup quotes
let g:ct16_D = 2  " functions, methods, headings
let g:ct16_E = 5  " keywords, selector, markup italic, diff changed
let g:ct16_F = 3  " deprecated, embedding language tags

function! s:CTerm16GetThemes(cterm_only)
    let l:all_colors = getcompletion('', 'color')
    if a:cterm_only == 0
        return l:all_colors
    endif
    let l:colors = []
    for l:color in l:all_colors
        if l:color =~ '^cterm16-'
            call add(l:colors, l:color)
        endif
    endfor
    return l:colors
endfunction

function! CTerm16CycleNext(cterm_only = 1)
    let l:colors = s:CTerm16GetThemes(a:cterm_only)
    if empty(l:colors)
        return
    endif
    let l:idx = index(l:colors, g:colors_name) + 1
    exe 'colorscheme ' .. l:colors[l:idx < len(l:colors) ? l:idx : 0]
endfunction

function! CTerm16CyclePrev(cterm_only = 1)
    let l:colors = s:CTerm16GetThemes(a:cterm_only)
    if empty(l:colors)
        return
    endif
    let l:idx = index(l:colors, g:colors_name) - 1
    exe 'colorscheme ' .. l:colors[l:idx < 0 ? len(l:colors) - 1 : l:idx]
endfunction

function! CTerm16Highlight(group, fg, bg, attr)
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

function! CTerm16Apply(name = "")
    " Setup theme
    set background=dark
    highlight clear
    syntax reset
    if a:name != ""
        let g:colors_name="cterm16-" . a:name
    endif
    " Vim editor colors
    call CTerm16Highlight("Normal",       g:ct16_5, g:ct16_0, "")
    call CTerm16Highlight("Bold",         "",       "",       "bold")
    call CTerm16Highlight("Debug",        g:ct16_8, "",       "")
    call CTerm16Highlight("Directory",    g:ct16_D, "",       "")
    call CTerm16Highlight("Error",        g:ct16_0, g:ct16_8, "")
    call CTerm16Highlight("ErrorMsg",     g:ct16_8, g:ct16_0, "")
    call CTerm16Highlight("Exception",    g:ct16_8, "",       "")
    call CTerm16Highlight("FoldColumn",   g:ct16_C, g:ct16_1, "")
    call CTerm16Highlight("Folded",       g:ct16_3, g:ct16_1, "")
    call CTerm16Highlight("IncSearch",    g:ct16_1, g:ct16_9, "none")
    call CTerm16Highlight("Italic",       "",       "",       "none")
    call CTerm16Highlight("Macro",        g:ct16_8, "",       "")
    call CTerm16Highlight("MatchParen",   "",       g:ct16_3, "")
    call CTerm16Highlight("ModeMsg",      g:ct16_B, "",       "")
    call CTerm16Highlight("MoreMsg",      g:ct16_B, "",       "")
    call CTerm16Highlight("Question",     g:ct16_D, "",       "")
    call CTerm16Highlight("Search",       g:ct16_1, g:ct16_A, "")
    call CTerm16Highlight("Substitute",   g:ct16_1, g:ct16_A, "none")
    call CTerm16Highlight("SpecialKey",   g:ct16_3, "",       "")
    call CTerm16Highlight("TooLong",      g:ct16_8, "",       "")
    call CTerm16Highlight("Underlined",   g:ct16_8, "",       "")
    call CTerm16Highlight("Visual",       "",       g:ct16_2, "")
    call CTerm16Highlight("VisualNOS",    g:ct16_8, "",       "")
    call CTerm16Highlight("WarningMsg",   g:ct16_8, "",       "")
    call CTerm16Highlight("WildMenu",     g:ct16_8, "",       "")
    call CTerm16Highlight("Title",        g:ct16_D, "",       "none")
    call CTerm16Highlight("Conceal",      g:ct16_D, g:ct16_0, "")
    call CTerm16Highlight("Cursor",       g:ct16_0, g:ct16_5, "")
    call CTerm16Highlight("NonText",      g:ct16_3, "",       "")
    call CTerm16Highlight("LineNr",       g:ct16_3, g:ct16_1, "")
    call CTerm16Highlight("SignColumn",   g:ct16_3, g:ct16_1, "")
    call CTerm16Highlight("StatusLine",   g:ct16_4, g:ct16_2, "none")
    call CTerm16Highlight("StatusLineNC", g:ct16_3, g:ct16_1, "none")
    call CTerm16Highlight("VertSplit",    g:ct16_2, g:ct16_2, "none")
    call CTerm16Highlight("ColorColumn",  "",       g:ct16_1, "none")
    call CTerm16Highlight("CursorColumn", "",       g:ct16_1, "none")
    call CTerm16Highlight("CursorLine",   "",       g:ct16_1, "none")
    call CTerm16Highlight("CursorLineNr", g:ct16_4, g:ct16_1, "")
    call CTerm16Highlight("QuickFixLine", "",       g:ct16_1, "none")
    call CTerm16Highlight("PMenu",        g:ct16_5, g:ct16_1, "none")
    call CTerm16Highlight("PMenuSel",     g:ct16_1, g:ct16_5, "")
    call CTerm16Highlight("TabLine",      g:ct16_3, g:ct16_1, "none")
    call CTerm16Highlight("TabLineFill",  g:ct16_3, g:ct16_1, "none")
    call CTerm16Highlight("TabLineSel",   g:ct16_B, g:ct16_1, "none")
    " Standard syntax highlighting
    call CTerm16Highlight("Boolean",      g:ct16_9, "",       "")
    call CTerm16Highlight("Character",    g:ct16_8, "",       "")
    call CTerm16Highlight("Comment",      g:ct16_3, "",       "")
    call CTerm16Highlight("Conditional",  g:ct16_E, "",       "")
    call CTerm16Highlight("Constant",     g:ct16_9, "",       "")
    call CTerm16Highlight("Define",       g:ct16_E, "",       "none")
    call CTerm16Highlight("Delimiter",    g:ct16_F, "",       "")
    call CTerm16Highlight("Float",        g:ct16_9, "",       "")
    call CTerm16Highlight("Function",     g:ct16_D, "",       "")
    call CTerm16Highlight("Identifier",   g:ct16_8, "",       "none")
    call CTerm16Highlight("Include",      g:ct16_D, "",       "")
    call CTerm16Highlight("Keyword",      g:ct16_E, "",       "")
    call CTerm16Highlight("Label",        g:ct16_A, "",       "")
    call CTerm16Highlight("Number",       g:ct16_9, "",       "")
    call CTerm16Highlight("Operator",     g:ct16_5, "",       "none")
    call CTerm16Highlight("PreProc",      g:ct16_A, "",       "")
    call CTerm16Highlight("Repeat",       g:ct16_A, "",       "")
    call CTerm16Highlight("Special",      g:ct16_C, "",       "")
    call CTerm16Highlight("SpecialChar",  g:ct16_F, "",       "")
    call CTerm16Highlight("Statement",    g:ct16_8, "",       "")
    call CTerm16Highlight("StorageClass", g:ct16_A, "",       "")
    call CTerm16Highlight("String",       g:ct16_B, "",       "")
    call CTerm16Highlight("Structure",    g:ct16_E, "",       "")
    call CTerm16Highlight("Tag",          g:ct16_A, "",       "")
    call CTerm16Highlight("Todo",         g:ct16_A, g:ct16_1, "")
    call CTerm16Highlight("Type",         g:ct16_A, "",       "none")
    call CTerm16Highlight("Typedef",      g:ct16_A, "",       "")
    " C highlighting
    call CTerm16Highlight("cOperator",  g:ct16_C, "", "")
    call CTerm16Highlight("cPreCondit", g:ct16_E, "", "")
    " C# highlighting
    call CTerm16Highlight("csClass",                g:ct16_A, "", "")
    call CTerm16Highlight("csAttribute",            g:ct16_A, "", "")
    call CTerm16Highlight("csModifier",             g:ct16_E, "", "")
    call CTerm16Highlight("csType",                 g:ct16_8, "", "")
    call CTerm16Highlight("csUnspecifiedStatement", g:ct16_D, "", "")
    call CTerm16Highlight("csContextualStatement",  g:ct16_E, "", "")
    call CTerm16Highlight("csNewDecleration",       g:ct16_8, "", "")
    " CSS highlighting
    call CTerm16Highlight("cssBraces",    g:ct16_5, "", "")
    call CTerm16Highlight("cssClassName", g:ct16_E, "", "")
    call CTerm16Highlight("cssColor",     g:ct16_C, "", "")
    " Diff highlighting
    call CTerm16Highlight("DiffAdd",     g:ct16_B, g:ct16_1, "")
    call CTerm16Highlight("DiffChange",  g:ct16_3, g:ct16_1, "")
    call CTerm16Highlight("DiffDelete",  g:ct16_8, g:ct16_1, "")
    call CTerm16Highlight("DiffText",    g:ct16_D, g:ct16_1, "")
    call CTerm16Highlight("DiffAdded",   g:ct16_B, g:ct16_0, "")
    call CTerm16Highlight("DiffFile",    g:ct16_8, g:ct16_0, "")
    call CTerm16Highlight("DiffNewFile", g:ct16_B, g:ct16_0, "")
    call CTerm16Highlight("DiffLine",    g:ct16_D, g:ct16_0, "")
    call CTerm16Highlight("DiffRemoved", g:ct16_8, g:ct16_0, "")
    " Git highlighting
    call CTerm16Highlight("gitcommitOverflow",      g:ct16_8, "", "")
    call CTerm16Highlight("gitcommitSummary",       g:ct16_B, "", "")
    call CTerm16Highlight("gitcommitComment",       g:ct16_3, "", "")
    call CTerm16Highlight("gitcommitUntracked",     g:ct16_3, "", "")
    call CTerm16Highlight("gitcommitDiscarded",     g:ct16_3, "", "")
    call CTerm16Highlight("gitcommitSelected",      g:ct16_3, "", "")
    call CTerm16Highlight("gitcommitHeader",        g:ct16_E, "", "")
    call CTerm16Highlight("gitcommitSelectedType",  g:ct16_D, "", "")
    call CTerm16Highlight("gitcommitUnmergedType",  g:ct16_D, "", "")
    call CTerm16Highlight("gitcommitDiscardedType", g:ct16_D, "", "")
    call CTerm16Highlight("gitcommitBranch",        g:ct16_9, "", "bold")
    call CTerm16Highlight("gitcommitUntrackedFile", g:ct16_A, "", "")
    call CTerm16Highlight("gitcommitUnmergedFile",  g:ct16_8, "", "bold")
    call CTerm16Highlight("gitcommitDiscardedFile", g:ct16_8, "", "bold")
    call CTerm16Highlight("gitcommitSelectedFile",  g:ct16_B, "", "bold")
    " GitGutter highlighting
    call CTerm16Highlight("GitGutterAdd",          g:ct16_B, g:ct16_1, "")
    call CTerm16Highlight("GitGutterChange",       g:ct16_D, g:ct16_1, "")
    call CTerm16Highlight("GitGutterDelete",       g:ct16_8, g:ct16_1, "")
    call CTerm16Highlight("GitGutterChangeDelete", g:ct16_E, g:ct16_1, "")
    " HTML highlighting
    call CTerm16Highlight("htmlBold",   g:ct16_A, "", "")
    call CTerm16Highlight("htmlItalic", g:ct16_E, "", "")
    call CTerm16Highlight("htmlEndTag", g:ct16_5, "", "")
    call CTerm16Highlight("htmlTag",    g:ct16_5, "", "")
    call CTerm16Highlight("htmlStrike", g:ct16_8, "", "")
    " JavaScript highlighting
    call CTerm16Highlight("javaScript",          g:ct16_5, "", "")
    call CTerm16Highlight("javaScriptBraces",    g:ct16_5, "", "")
    call CTerm16Highlight("javaScriptNumber",    g:ct16_9, "", "")
    call CTerm16Highlight("jsOperator",          g:ct16_D, "", "")
    call CTerm16Highlight("jsStatement",         g:ct16_E, "", "")
    call CTerm16Highlight("jsReturn",            g:ct16_E, "", "")
    call CTerm16Highlight("jsThis",              g:ct16_8, "", "")
    call CTerm16Highlight("jsClassDefinition",   g:ct16_A, "", "")
    call CTerm16Highlight("jsFunction",          g:ct16_E, "", "")
    call CTerm16Highlight("jsFuncName",          g:ct16_D, "", "")
    call CTerm16Highlight("jsFuncCall",          g:ct16_D, "", "")
    call CTerm16Highlight("jsClassFuncName",     g:ct16_D, "", "")
    call CTerm16Highlight("jsClassMethodType",   g:ct16_E, "", "")
    call CTerm16Highlight("jsRegexpString",      g:ct16_C, "", "")
    call CTerm16Highlight("jsGlobalObjects",     g:ct16_A, "", "")
    call CTerm16Highlight("jsGlobalNodeObjects", g:ct16_A, "", "")
    call CTerm16Highlight("jsExceptions",        g:ct16_A, "", "")
    call CTerm16Highlight("jsBuiltins",          g:ct16_A, "", "")
    " LSP highlighting
    call CTerm16Highlight("LspDiagnosticsDefaultError",       g:ct16_8, "", "")
    call CTerm16Highlight("LspDiagnosticsDefaultWarning",     g:ct16_9, "", "")
    call CTerm16Highlight("LspDiagnosticsDefaultInformation", g:ct16_5, "", "")
    call CTerm16Highlight("LspDiagnosticsDefaultHint",        g:ct16_3, "", "")
    " Mail highlighting
    call CTerm16Highlight("mailQuoted1", g:ct16_A, "", "")
    call CTerm16Highlight("mailQuoted2", g:ct16_B, "", "")
    call CTerm16Highlight("mailQuoted3", g:ct16_E, "", "")
    call CTerm16Highlight("mailQuoted4", g:ct16_C, "", "")
    call CTerm16Highlight("mailQuoted5", g:ct16_D, "", "")
    call CTerm16Highlight("mailQuoted6", g:ct16_A, "", "")
    call CTerm16Highlight("mailURL",     g:ct16_D, "", "")
    call CTerm16Highlight("mailEmail",   g:ct16_D, "", "")
    " Markdown highlighting
    call CTerm16Highlight("markdownCode",             g:ct16_B, "",       "")
    call CTerm16Highlight("markdownError",            g:ct16_5, g:ct16_0, "")
    call CTerm16Highlight("markdownCodeBlock",        g:ct16_B, "",       "")
    call CTerm16Highlight("markdownHeadingDelimiter", g:ct16_D, "",       "")
    " NERDTree highlighting
    call CTerm16Highlight("NERDTreeDirSlash", g:ct16_D, "", "")
    call CTerm16Highlight("NERDTreeExecFile", g:ct16_5, "", "")
    " PHP highlighting
    call CTerm16Highlight("phpMemberSelector", g:ct16_5, "", "")
    call CTerm16Highlight("phpComparison",     g:ct16_5, "", "")
    call CTerm16Highlight("phpParent",         g:ct16_5, "", "")
    call CTerm16Highlight("phpMethodsVar",     g:ct16_C, "", "")
    " Python highlighting
    call CTerm16Highlight("pythonOperator",  g:ct16_E, "", "")
    call CTerm16Highlight("pythonRepeat",    g:ct16_E, "", "")
    call CTerm16Highlight("pythonInclude",   g:ct16_E, "", "")
    call CTerm16Highlight("pythonStatement", g:ct16_E, "", "")
    " Ruby highlighting
    call CTerm16Highlight("rubyAttribute",              g:ct16_D, "", "")
    call CTerm16Highlight("rubyConstant",               g:ct16_A, "", "")
    call CTerm16Highlight("rubyInterpolationDelimiter", g:ct16_F, "", "")
    call CTerm16Highlight("rubyRegexp",                 g:ct16_C, "", "")
    call CTerm16Highlight("rubySymbol",                 g:ct16_B, "", "")
    call CTerm16Highlight("rubyStringDelimiter",        g:ct16_B, "", "")
    " SASS highlighting
    call CTerm16Highlight("sassidChar",    g:ct16_8, "", "")
    call CTerm16Highlight("sassClassChar", g:ct16_9, "", "")
    call CTerm16Highlight("sassInclude",   g:ct16_E, "", "")
    call CTerm16Highlight("sassMixing",    g:ct16_E, "", "")
    call CTerm16Highlight("sassMixinName", g:ct16_D, "", "")
    " Signify highlighting
    call CTerm16Highlight("SignifySignAdd",    g:ct16_B, g:ct16_1, "")
    call CTerm16Highlight("SignifySignChange", g:ct16_D, g:ct16_1, "")
    call CTerm16Highlight("SignifySignDelete", g:ct16_8, g:ct16_1, "")
    " Spelling highlighting
    call CTerm16Highlight("SpellBad",   "", "", "undercurl")
    call CTerm16Highlight("SpellLocal", "", "", "undercurl")
    call CTerm16Highlight("SpellCap",   "", "", "undercurl")
    call CTerm16Highlight("SpellRare",  "", "", "undercurl")
    " Startify highlighting
    call CTerm16Highlight("StartifyBracket", g:ct16_3, "", "")
    call CTerm16Highlight("StartifyFile",    g:ct16_7, "", "")
    call CTerm16Highlight("StartifyFooter",  g:ct16_3, "", "")
    call CTerm16Highlight("StartifyHeader",  g:ct16_B, "", "")
    call CTerm16Highlight("StartifyNumber",  g:ct16_9, "", "")
    call CTerm16Highlight("StartifyPath",    g:ct16_3, "", "")
    call CTerm16Highlight("StartifySection", g:ct16_E, "", "")
    call CTerm16Highlight("StartifySelect",  g:ct16_C, "", "")
    call CTerm16Highlight("StartifySlash",   g:ct16_3, "", "")
    call CTerm16Highlight("StartifySpecial", g:ct16_3, "", "")
    " Java highlighting
    call CTerm16Highlight("javaOperator", g:ct16_D, "", "")
endfunction

function! CTerm16AirlineTheme()
    " Section A/Z: mode indicator (bold accent on secondary bg)
    " Section B/Y: secondary info (secondary fg on selection bg)
    " Section C/X: filename/main area (primary fg on secondary bg)
    let s:N1 = ['', '', g:ct16_1, g:ct16_B, '']
    let s:N2 = ['', '', g:ct16_4, g:ct16_2, '']
    let s:N3 = ['', '', g:ct16_5, g:ct16_1, '']

    let s:I1 = ['', '', g:ct16_1, g:ct16_D, '']
    let s:I2 = ['', '', g:ct16_4, g:ct16_2, '']
    let s:I3 = ['', '', g:ct16_5, g:ct16_1, '']

    let s:R1 = ['', '', g:ct16_1, g:ct16_8, '']
    let s:R2 = ['', '', g:ct16_4, g:ct16_2, '']
    let s:R3 = ['', '', g:ct16_5, g:ct16_1, '']

    let s:V1 = ['', '', g:ct16_1, g:ct16_E, '']
    let s:V2 = ['', '', g:ct16_4, g:ct16_2, '']
    let s:V3 = ['', '', g:ct16_5, g:ct16_1, '']

    let s:IA = ['', '', g:ct16_3, g:ct16_1, '']

    let g:airline#themes#cterm16#palette = {}
    let g:airline#themes#cterm16#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
    let g:airline#themes#cterm16#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
    let g:airline#themes#cterm16#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
    let g:airline#themes#cterm16#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
    let g:airline#themes#cterm16#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

    let g:airline#themes#cterm16#palette.normal_modified = {
          \ 'airline_c': ['', '', g:ct16_9, g:ct16_1, ''],
          \ }
    let g:airline#themes#cterm16#palette.insert_modified = {
          \ 'airline_c': ['', '', g:ct16_9, g:ct16_1, ''],
          \ }
    let g:airline#themes#cterm16#palette.replace_modified = {
          \ 'airline_c': ['', '', g:ct16_9, g:ct16_1, ''],
          \ }
    let g:airline#themes#cterm16#palette.visual_modified = {
          \ 'airline_c': ['', '', g:ct16_9, g:ct16_1, ''],
          \ }

    let s:WI = ['', '', g:ct16_0, g:ct16_A, '']
    let g:airline#themes#cterm16#palette.normal.airline_warning = s:WI
    let g:airline#themes#cterm16#palette.insert.airline_warning = s:WI
    let g:airline#themes#cterm16#palette.replace.airline_warning = s:WI
    let g:airline#themes#cterm16#palette.visual.airline_warning = s:WI

    let s:ER = ['', '', g:ct16_0, g:ct16_8, '']
    let g:airline#themes#cterm16#palette.normal.airline_error = s:ER
    let g:airline#themes#cterm16#palette.insert.airline_error = s:ER
    let g:airline#themes#cterm16#palette.replace.airline_error = s:ER
    let g:airline#themes#cterm16#palette.visual.airline_error = s:ER
endfunction

function! CTerm16ClearANSIColors()
    if exists('w:cterm16_matches')
        for l:id in w:cterm16_matches
            call matchdelete(l:id)
        endfor
        unlet w:cterm16_matches
    endif
endfunction

function! CTerm16HighlightANSIColors()
    call CTerm16ClearANSIColors()
    let w:cterm16_matches = []
    for l:code in range(256)
        let l:group = 'CTerm16Color' . l:code
        execute 'highlight ' . l:group . ' ctermfg=' . l:code . ' ctermbg=none'
        let l:pattern = '\<'.l:code.'\>'
        call add(w:cterm16_matches, matchadd(l:group, l:pattern, 100))
    endfor
endfunction

augroup cterm16_highlight_ansi_colors
    autocmd!
    autocmd BufWinEnter */colors/cterm16-*.vim call CTerm16HighlightANSIColors()
    autocmd BufWinLeave */colors/cterm16-*.vim call CTerm16ClearANSIColors()
augroup END
