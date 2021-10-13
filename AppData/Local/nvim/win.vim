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

" Powershell terminals
map <Leader>tt :split term://powershell.exe<CR><C-\><C-n><C-w>k
map <Leader>tp :split term://powershell.exe<CR>ipython<CR><C-\><C-n><C-w>k
map <Leader>tr :split term://powershell.exe<CR>iradian --no-history<CR><C-\><C-n><C-w>k

""" R
" Path to R exe
let R_path = 'C:\\Users\\' . user . '\\scoop\\apps\\r\\current\\bin\\x64'
let R_auto_start = 0  " Don't auto start on all .R/.Rmd files

" radian
let R_app = 'C:\\Users\\' . user . '\\Anaconda3\\Scripts\\radian.exe'
let R_editing_mode = "vi"
let R_pdfviewer = 'sumatrapdf'
let R_openpdf = 1
let R_openhtml = 1

" Path to Rtools binaries
let $PATH = "C:\\Users\\" . user . "\\scoop\\apps\\rtools\\current\\mingw64\\bin;C:\\Users\\" . user . "\\scoop\\apps\\rtools\\current\\usr\\bin;" . $PATH

" Open markdown html previews - workaround for non-functioning mlp
autocmd FileType markdown nmap <leader>mh :w! \| !pandoc "%" -o "%:r.html" && start firefox %:p:r.html<CR>

