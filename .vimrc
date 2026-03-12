source ~/.vim/options.vim
packadd termdebug

let g:termdebug_config = {'wide': 1}

let g:lightline = {
	\ 'colorscheme': 'catppuccin_mocha',
	\ }

let mapleader = " "

let g:fern#renderer = "nerdfont"

source ~/.vim/keybinds.vim

autocmd FileType s,S,asm setlocal tabstop=12 shiftwidth=12 softtabstop=12
autocmd fileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

runtime! ftplugin/man.vim

nnoremap <Leader>fn :call CreateArm64Function()<CR>

function! CreateArm64Function()
    let l:func_name = input('Function Name: ')
    if l:func_name == ''
        return
    endif
    
    let l:indent = repeat( ( &expandtab ? ' ' : "\t" ), &shiftwidth )

    " Define the template with stack setup
    let l:template = [
                \ l:indent . '.section .text',
                \ l:indent . '.global ' . l:func_name,
                \ l:indent . '.type ' . l:func_name . ', %function',
                \ l:func_name . ':',
                \ l:indent . 'stp x29, x30, [sp, -16]!',
                \ l:indent . 'mov x29, sp',
                \ l:indent,
                \ l:indent . 'ldp x29, x30, [sp], 16',
                \ l:indent . 'ret',
                \ l:indent . '.size ' . l:func_name . ', . - ' . l:func_name
                \ ]

    " Get current line and append the template
    let l:start_line = line('.')
    call append(l:start_line, l:template)

    " Move cursor to the empty line (6th line of the template)
    " We use l:start_line + 6 to land right in the 'body' area
    call cursor(l:start_line + 6, len(l:indent) + 1)
    startinsert!
endfunction

let g:ale_cpp_clangd_options = '--compile-commands-dir=build'
