" Hot keys {{{
" ==========

    " Insert mode {{{
    " ------------

        inoremap <c-f> <c-x><c-f>
        inoremap <c-]> <c-x><c-]>
        inoremap ii <esc>

    " }}}

    " Normal mode {{{
    " ------------

	" F1 to be a context sensitive keyword-under-cursor lookup
	nnoremap <F1> :help <C-R><C-W><CR>
	nnoremap <F7> :set number!<CR>
	nnoremap <F8> :set list!<CR>
	nnoremap <F9> :set noexpandtab<CR>
	nnoremap <F10> :set expandtab<CR>

	" Reformat current paragraph
	nnoremap Q gqap

	" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
	" which is the default
	nnoremap Y y$

        " Navigation
        nnoremap j gj
        nnoremap k gk
        nnoremap gj j
        nnoremap gk k
        nnoremap H ^
        nnoremap gI `.
        nnoremap <left>  :cprev<cr>zvzz
        nnoremap <right> :cnext<cr>zvzz
        nnoremap <up>    :lprev<cr>zvzz
        nnoremap <down>  :lnext<cr>zvzz

        " Automatically jump to end of text you pasted
        nnoremap <silent> p p`]

        " Not jump on star, only highlight
        nnoremap * *N

        " Drop hightlight search result
        noremap <leader><space> :set invhlsearch<CR>

        " Select entire buffer
        nnoremap vaa ggvGg_

        " QuickFix {{{
        "
            function! s:QuickfixToggle()
                for i in range(1, winnr('$'))
                    let bnum = winbufnr(i)
                    if getbufvar(bnum, '&buftype') == 'quickfix'
                        cclose
                        lclose
                        return
                    endif
                endfor
                copen
            endfunction

            command! ToggleQuickfix call <SID>QuickfixToggle()
            nnoremap <silent> <leader>ll :ToggleQuickfix <CR>
            nnoremap <silent> <leader>ln :cwindow<CR>:cn<CR>
            nnoremap <silent> <leader>lp :cwindow<CR>:cp<CR>

        " }}}

        " Window commands
        nnoremap <silent> <leader>h :wincmd h<CR>
        nnoremap <silent> <leader>j :wincmd j<CR>
        nnoremap <silent> <leader>k :wincmd k<CR>
        nnoremap <silent> <leader>l :wincmd l<CR>
        nnoremap <silent> <leader>+ :wincmd +<CR>
        nnoremap <silent> <leader>- :wincmd -<CR>
        nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
        nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
        nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
        nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>
        nnoremap <silent> <leader>cw :close<CR>

        " Buffer commands
        noremap <silent> <leader>ww :w<CR>
        noremap <silent> <leader>bd :bd<CR>
        noremap <silent> <leader>bn :bn<CR>
        noremap <silent> <leader>bp :bp<CR>

        " Delete all buffers
        nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>

        " Search the current file for the word under the cursor and display matches
        nnoremap <silent> <leader>gw :call rc#RGrep()<CR>

        " Open new tab
        nnoremap <silent> <C-W>t :tabnew<CR>

        " Keymap switch <C-F>
        " cnoremap <silent> <C-F> <C-^>
        inoremap <silent> <C-F> <C-^>
        nnoremap <silent> <C-F> a<C-^><Esc>
        vnoremap <silent> <C-F> <Esc>a<C-^><Esc>gv

        " Switch options
        nnoremap <silent> <leader>op :set paste! paste?<CR>
        nnoremap <silent> <leader>ol :set list! list?<CR>
        nnoremap <silent> <leader>ow :set wrap! wrap?<CR>
        nnoremap <silent> <leader>on :call ToggleRelativeAbsoluteNumber()<CR>
        function! ToggleRelativeAbsoluteNumber()
            if !&number && !&relativenumber
                set number
                set relativenumber
            elseif &relativenumber
                set norelativenumber
                set number
            elseif &number
                set nonumber
            endif
        endfunction

        " Close files
        nnoremap <silent> <leader>qq :q<CR>

        " Show syntax highlighting groups for word under cursor
        nmap <C-S-P> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
            if !exists("*synstack")
                return
            endif
            echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc


    " }}}

    " Command mode {{{
    " ------------

        cnoremap        <C-A> <Home>
        cnoremap        <C-B> <Left>
        cnoremap        <M-b> <S-Left>
        cnoremap        <M-f> <S-Right>
        silent! exe "set <S-Left>=\<Esc>b"
        silent! exe "set <S-Right>=\<Esc>f"

        " Write as sudo
        command! W %!sudo tee > /dev/null %

    " }}}

    " Visual mode {{{
    " ---------------

        " Copy selected to command line
        vnoremap ! y:<C-r>"<C-b>

        " Automatically jump to end of text you pasted
        vnoremap <silent> y y`]
        vnoremap <silent> p p`]

    " }}}
" }}}

