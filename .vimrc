source ~/.vim/options.vim
packadd termdebug

let g:termdebug_config = {'wide': 1}

let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ }

let mapleader = " "

let g:fern#renderer = "nerdfont"

source ~/.vim/keybinds.vim

autocmd FileType s,S,asm setlocal tabstop=12 shiftwidth=12 softtabstop=12
autocmd fileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

runtime! ftplugin/man.vim

let g:ale_cpp_clangd_options = '--compile-commands-dir=build'
let g:ale_completion_enabled = 1




