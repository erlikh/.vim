let s:darwin = has('mac')

" Utils {{{
" =========

    NeoBundleFetch 'Shougo/neobundle.vim'

    " a Git wrapper so awesome, it should be illegal
    NeoBundle 'tpope/vim-fugitive'
    cabbrev git Git

    " Browse Git history
    NeoBundle 'gregsexton/gitv', {
        \ 'lazy': 1,
        \ 'depends': ['tpope/vim-fugitive'],
        \ 'autoload': {'commands': 'Gitv'}}

    nnoremap <leader>gL :Gitv --all<CR>
    nnoremap <leader>ga :Gadd<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gc :Gcommit %<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gl :Gitv! --all<CR>
    nnoremap <leader>go :Gread<CR>
    nnoremap <leader>gpl :Git pull origin master<CR>
    nnoremap <leader>gpm :Git push origin master<CR>
    nnoremap <leader>gpp :Git push<CR>
    nnoremap <leader>gr :Gremove<CR>
    nnoremap <leader>gs :Gstatus<CR>

    let g:Gitv_WipeAllOnClose = 1
    let g:Gitv_DoNotMapCtrlKey = 1

" }}}


" Configuration {{{
" =================

    " Disable plugins for LargeFile
    NeoBundle 'LargeFile'

    " Fetch clipboard
    NeoBundle "unphased/vim-fakeclip"

    " browse the vim undo tree
    NeoBundle 'mbbill/undotree', {
        \ 'lazy': 1,
        \ 'autoload' : {'commands': 'UndotreeToggle'}}
    let g:undotree_WindowLayout = 3
    nnoremap <leader>uu :UndotreeToggle<CR>

" }}}


" Browse {{{
" ==========

    " A tree explorer plugin for vim.
    NeoBundle 'scrooloose/nerdtree', {
        \ 'lazy': 1,
        \ 'autoload' : {'commands': ['NERDTreeToggle', 'NERDTreeFind']}}

    let NERDTreeWinSize = 30

    " files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
    let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$',
    \'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
    \'\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$',
    \'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
    \'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$' ]

    nnoremap <silent> <leader>t :NERDTreeToggle<CR>
    nnoremap <silent> <leader>f :NERDTreeFind<CR>

    " Find files
    NeoBundle 'kien/ctrlp.vim'

    let g:ctrlp_dont_split = 'NERD_tree_2'
    let g:ctrlp_map = '<leader>,'

    " Vim plugin that displays tags in a window, ordered by class etc.
    NeoBundle "majutsushi/tagbar", {
        \ 'lazy': 1,
        \ 'autoload' : {'commands': 'TagbarToggle'}}

    let g:tagbar_width = 30
    let g:tagbar_foldlevel = 1
    let g:tagbar_type_rst = {
        \ 'ctagstype': 'rst',
        \ 'kinds': [ 'r:references', 'h:headers' ],
        \ 'sort': 0,
        \ 'sro': '..',
        \ 'kind2scope': { 'h': 'header' },
        \ 'scope2kind': { 'header': 'h' }
    \ }

    " Toggle tagbar
    nnoremap <silent> <F3> :TagbarToggle<CR>

    if s:darwin
        NeoBundle "rizzatti/dash.vim", {
            \ 'lazy': 1,
            \ 'autoload' : {'commands': ['Dash', 'DashKeywords']}}
        nnoremap <silent> <leader>dd :Dash<CR>
    endif

" }}}


" Status line {{{
" ===============

    " lean & mean statusline for vim that's light as air
    NeoBundle 'bling/vim-airline'

    let g:airline_detect_iminsert = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_theme = 'wombat'

" }}}


" Motion and operators {{{
" ========================

    " Simple selection
    NeoBundle "gcmt/wildfire.vim"
    let g:wildfire_fuel_map = "="
    let g:wildfire_water_map = "-"

    " Quoting/parenthesizing made simple
    NeoBundle 'tpope/vim-repeat'
    NeoBundle 'tpope/vim-surround', {
        \ 'depends': ['tpope/vim-repeat']}

    " Exchange objects
    NeoBundle "tommcdo/vim-exchange"

" }}}


" Languages {{{
" =============

    NeoBundle 'othree/html5.vim', {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['html', 'xhtml', 'css']}}

    NeoBundle 'mattn/emmet-vim', {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}}

    autocmd BufNewFile,BufRead *.md setf markdown

    NeoBundle 'groenewege/vim-less', {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['less']}}
    autocmd BufNewFile,BufRead *.less setf less

    NeoBundle "kchmck/vim-coffee-script", {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['coffee']}}


    NeoBundle "pangloss/vim-javascript", {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['javascript']}}
    au BufNewFile,BufRead *.js setf javascript
    au BufNewFile,BufRead *.jsm setf javascript
    au BufNewFile,BufRead Jakefile setf javascript

    NeoBundle "digitaltoad/vim-jade", {
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': ['jade']}}
    au BufNewFile,BufRead *.jade setf jade
    au BufNewFile,BufRead *.jade set sw=2 ts=2 sts=2


" }}}


" =============



" }}}


" Syntax checkers {{{
" ===================

    NeoBundle 'scrooloose/syntastic'

    " Disable syntastic for python (managed by python-mode)
    let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['python'] }

" }}}


" NERDCommenter {{{
" =============

    " Vim plugin for intensely orgasmic commenting
    NeoBundle 'scrooloose/nerdcommenter'
    let NERDSpaceDelims = 1
    let g:NERDCustomDelimiters = { 'ansible': { 'left': '#'} }

" }}}


" Startify {{{
" ========

    " A fancy start screen for Vim.
    NeoBundle 'mhinz/vim-startify'

    let g:startify_session_dir = g:SESSION_DIR
    let g:startify_change_to_vcs_root = 1
    let g:startify_list_order = [
        \ ['   Last recently opened files:'],
        \ 'files',
        \ ['   My sessions:'],
        \ 'sessions',
    \ ]
    " let g:startify_change_to_dir = 0
    let g:startify_custom_header = [
        \ '           ______________________________________           ',
        \ '  ________|                                      |_______   ',
        \ '  \       |         VIM ' . v:version . ' - www.vim.org        |      /   ',
        \ '   \      |                                      |     /    ',
        \ '   /      |______________________________________|     \    ',
        \ '  /__________)                                (_________\   ',
        \ '']
" }}}

" WIKI {{{
" ====

    NeoBundle "vimwiki/vimwiki", 'dev'
    let g:vimwiki_folding = 1
    let g:vimwiki_fold_lists = 1
    let g:vimwiki_list = [{"path" : "~/Dropbox/wiki"}, {"path" : "~/Dropbox/wiki/english"}]
    nmap <Leader>wv <Plug>VimwikiIndex

" }}}


" Install bundles
" ================
NeoBundleCheck
