set guifont=Monaco:h11
set guioptions-=r " hide scrollbar
set guioptions-=T " hide toolbar

NoMatchParen

if has("gui_macvim")
  nnoremap <D-CR> :b#<CR>
endif
