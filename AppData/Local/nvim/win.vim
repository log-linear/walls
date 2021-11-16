" Windows-specific configuration ==============================================

let user = substitute(substitute(system('whoami'), '\n\+$', '', ''), '^.\+\\', '', '')

" Setting clipboard to unnamedplus is super slow on windows
set clipboard=""
set mouse=a
if has("clipboard")
    nnoremap y  "+y
    vnoremap y  "+y
    nnoremap yy "+yy
    nnoremap Y  "+Y
    vnoremap Y  "+Y

    nnoremap d  "+d
    vnoremap d  "+d
    nnoremap dd "+dd
    nnoremap D  "+D
    vnoremap D  "+D

    nnoremap p  "+p
    vnoremap p  "+p
    nnoremap P  "+P
    vnoremap P  "+P
endif

" Open markdown html previews - workaround for non-functioning mlp
autocmd FileType markdown nmap <leader>mh :w! \| !pandoc "%" -o "%:r.html" && start firefox "%:p:r.html"<CR>

