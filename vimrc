set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
let g:loaded_matchparen=1
set background=dark
syntax on
syntax enable

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelUp> <C-U>
map <S-ScrollWheelDown> <C-D>

" highlight lines over 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

