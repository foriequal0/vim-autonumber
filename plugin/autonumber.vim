
function! Autonum_Switch(mode)
    if a:mode == "n"     "none
        set nonumber
        set norelativenumber
    elseif a:mode == "a" "absolute
        set number
        set norelativenumber
    elseif a:mode == "r" "relative
        set number
        set relativenumber
    endif
endfunc

function! Autonum_SetMode(mode)
    let w:Autonum_mode = a:mode
    if a:mode == "n"
        let w:Autonum_alt = "n"
    elseif a:mode == "a"
        let w:Autonum_alt = "a"
    elseif a:mode == "r"
        let w:Autonum_alt = "a"
    endif
endfunc

" Relative Autonumber toggle.
function! Autonum_Toggle()
    if !exists('w:Autonum_mode') || w:Autonum_mode == "n"
        let Autonum_nextmode = "r"
    elseif w:Autonum_mode == "r"
        let Autonum_nextmode = "a"
    elseif w:Autonum_mode == "a"
        let Autonum_nextmode = "n"
    endif
    call Autonum_Switch(Autonum_nextmode)
    call Autonum_SetMode(Autonum_nextmode)
endfunc

function! Autonum_Auto(mode)
    if !exists('w:Autonum_mode')
        call Autonum_SetMode("r")
    endif

    if a:mode == "default"
        call Autonum_Switch(w:Autonum_mode)
    elseif a:mode == "alt"
        call Autonum_Switch(w:Autonum_alt)
    endif
endfunc

call Autonum_Auto("default")
" C-n to toggle number.
nnoremap <C-n> :call Autonum_Toggle()<cr>
" Number-RelativeNumber auto toggle with corresponding focus status.
autocmd FocusLost * :call Autonum_Auto("alt")
autocmd FocusGained * :call Autonum_Auto("default")
autocmd WinLeave * :call Autonum_Auto("alt")
autocmd WinEnter * :call Autonum_Auto("default")

" Relative number mode on Navigate mode, Numbermode on Insert mode
autocmd InsertEnter * :call Autonum_Auto("alt")
autocmd InsertLeave * :call Autonum_Auto("default")


