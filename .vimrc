".vimrc  Tips from: https://dougblack.io/words/a-good-vimrc.html

syntax enable       " enable syntax processing

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set showmatch       " highlight matching [{()}]

set incsearch       " search as characters are entered
set hlsearch        " highlight matches

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    let l:winview = winsaveview()
    %s/\s\+$//e
    %s/\t$/    /e
    call setpos('.', l:save_cursor)
    call winrestview(l:winview)
endfun

" Press F6 to trim whitespace
nmap <F6> :call TrimWhitespace()<CR>

" Auto trim when you save
autocmd BufWritePre,FileWritePre * :call TrimWhitespace()
