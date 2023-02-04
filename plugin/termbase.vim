if exists("g:loaded_termbase")
    finish
endif
let g:loaded_termbase = 1

function! TermbaseNextColor()
    let colors = getcompletion('', 'color')
    let idx = index(colors, g:colors_name) + 1
    exe 'colorscheme ' .. colors[idx <= len(colors) ? idx :0]
endfunction

function! TermbasePrevColor()
    let colors = getcompletion('', 'color')
    let idx = index(colors, g:colors_name) - 1
    exe 'coloscheme ' .. colors[idx < 0 ? -1 : idx]
endfunction
