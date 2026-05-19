nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

nnoremap <leader>n :noh<CR>

nnoremap <leader>rn :set rnu!<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

nnoremap <leader>x :close<CR>

nnoremap <leader>e :Fern . -reveal=%<CR>

nnoremap <leader>f :Files<CR>

nnoremap <leader>g :Termdebug<CR><C-W>l<C-W>H

nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>

nnoremap <leader>ss :mksession! Session.vim<CR>
nnoremap <leader>ls :source Session.vim<CR>

nnoremap <leader>qs :mksession! Session.vim \| wqa<CR>
nnoremap <leader>qq :wqa<CR>

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

tnoremap <Esc> <C-\><C-n>
inoremap ;; <Esc>A;<CR>

nnoremap <leader>d :Fern . -drawer -reveal=%<CR>

nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap K :ALEHover<CR>
