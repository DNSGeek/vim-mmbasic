" Vim filetype plugin
" Language: MMBasic
" Maintainer: MMBasic Community

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Comment string for MMBasic
setlocal commentstring='\ %s

" Enable folding
setlocal foldmethod=syntax
setlocal foldlevel=99

" Format options
setlocal formatoptions-=t
setlocal formatoptions+=croql

" MMBasic is case-insensitive
setlocal ignorecase

" Keywords for word completion
setlocal iskeyword=@,48-57,_,$

" Undo ftplugin settings
let b:undo_ftplugin = "setlocal fo< com< cms< isk< ic< fdm< fdl<"

" Optional: Add some useful mappings
" Uncomment if you want these shortcuts

" Toggle comment on current line
" nnoremap <buffer> <leader>c :s/^/'\|s/^''//g<CR>:noh<CR>

" Run program (requires serial connection setup)
" nnoremap <buffer> <F5> :!mmbasic %<CR>
