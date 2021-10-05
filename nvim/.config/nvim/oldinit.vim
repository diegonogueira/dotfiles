" ======================
" Vim Plug
" ======================

" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
" endif

" if !1 | finish | endif
" if has('vim_starting')
"   set nocompatible
"   call plug#begin()
" endif

" source ~/.vimrc

" call plug#begin('~/.vim/plugged2')
"   Plug 'liuchengxu/vim-better-default'
"   Plug 'sheerun/vim-polyglot'
"   Plug 'asvetliakov/vim-easymotion'
"   Plug 'bkad/CamelCaseMotion'
"   Plug 'tpope/vim-surround'
"   Plug 'tpope/vim-repeat'
"   Plug 'thinca/vim-visualstar'
"   Plug 'svermeulen/vim-cutlass'
"   Plug 'svermeulen/vim-subversive'
"   Plug 'svermeulen/vim-yoink'
"   Plug 'kana/vim-textobj-user'
"   Plug 'kana/vim-textobj-indent'
"   Plug 'sgur/vim-textobj-parameter'
"   Plug 'adriaanzon/vim-textobj-matchit'
"   Plug 'beloglazov/vim-textobj-quotes'
"   Plug 'Julian/vim-textobj-brace'
"   Plug 'terryma/vim-expand-region'
" call plug#end()

" " ======================================
" " ======= CamelCaseMotion ==============
" " ======================================

" map <silent> w <Plug>CamelCaseMotion_e
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_w
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" omap <silent> iw <Plug>CamelCaseMotion_ie
" xmap <silent> iw <Plug>CamelCaseMotion_ie
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_iw
" xmap <silent> ie <Plug>CamelCaseMotion_iw

" onoremap <silent> io iw
" xnoremap <silent> io iw

" " ======================================
" " ============ Vim cutlass ================
" " ======================================

" nnoremap x d
" xnoremap x d

" nnoremap xx dd
" nnoremap X D

" " ======================================
" " ======== Vim subversive ==============
" " ======================================

" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)

" " ======================================
" " ======== Vim yoink ==============
" " ======================================

" let g:yoinkIncludeDeleteOperations=1

" nmap <c-n> <plug>(YoinkPostPasteSwapBack)
" nmap <c-p> <plug>(YoinkPostPasteSwapForward)

" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

" nmap y <plug>(YoinkYankPreserveCursorPosition)
" xmap y <plug>(YoinkYankPreserveCursorPosition)

" " ======================================
" " ========== vim-textobj-quotes ==========
" " ======================================

" xmap q iq
" omap q iq
