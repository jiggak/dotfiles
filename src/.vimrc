helptags ~/.vim/doc

set autoindent
set shiftwidth=3

set expandtab
set tabstop=8

set number
set nowrap
set nohlsearch

set guifont=Consolas\ 12

syntax on
filetype on

autocmd FileType c,cpp compiler gcc
autocmd FileType java compiler ant

let treeExplVertical=1 " use vertical split for tree explorer
let treeExplWinSize=40 " set width of tree explorer

let Tlist_WinWidth=40  " set width of tag list

nmap <F12> :call VtreeToggle()<CR>
nmap <F11> :TlistToggle<CR>

function VtreeToggle()
   if bufwinnr("TreeExplorer") != -1
      execute "bd " . bufnr("TreeExplorer")
      return
   endif

   execute "VSTreeExplore"
   set nonumber
endfunction
