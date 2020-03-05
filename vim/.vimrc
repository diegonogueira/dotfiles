" ======================================
" ============= basic ==================
" ======================================

set runtimepath+=~/.vim.d/vim/ " load snippets
nnoremap <space> <Nop>
map <space> <leader>

" ======================================
" ============ plugin manager ==========
" ======================================

if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
  autocmd VimEnter * silent! UpdateRemotePlugins
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'chrisbra/Colorizer'
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vim-better-default'
  Plug 'mileszs/ack.vim'
  Plug 'bkad/CamelCaseMotion'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/vim-easy-align'
  Plug 'easymotion/vim-easymotion'
  Plug 'sheerun/vim-polyglot'
  Plug 'janko-m/vim-test'
  Plug 'benmills/vimux'
  Plug 'tpope/vim-surround'
  Plug 'mg979/vim-visual-multi', { 'branch': 'test' }
  Plug 'thinca/vim-visualstar'
  Plug 'tpope/vim-repeat'
  Plug 'svermeulen/vim-easyclip'
  Plug 'brooth/far.vim'
  Plug 'vim-scripts/CmdlineComplete'
  Plug 'kana/vim-altr'
  Plug 'tomtom/tlib_vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'itchyny/lightline.vim'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'slashmili/alchemist.vim'
  Plug 'vim-ruby/vim-ruby'
  " Plug 'natebosch/vim-lsc'
  " Plug 'natebosch/vim-lsc-dart'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'vim-scripts/matchit.zip'
  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'beloglazov/vim-textobj-quotes'
  Plug 'Julian/vim-textobj-brace'
  Plug 'terryma/vim-expand-region'
  Plug 'diegonogueira/nova-vim'
  Plug 'jnurmine/Zenburn'
call plug#end()

" ======================================
" =========== better default ===========
" ======================================

let g:vim_better_default_fold_key_mapping = 0

runtime! plugin/default.vim
nunmap <Leader>sc
nunmap <Leader>tp

" ======================================
" ============= Ultilsnips =============
" ======================================

let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" ======================================
" ================ Fzf =================
" ======================================

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_action = {
      \ 'ctrl-q': 'wall | bdelete',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* GGrep
      \ call fzf#vim#grep('git grep --color=always --line-number '.shellescape(<q-args>), 0, <bang>0)

nnoremap <silent> <leader>pf :call FZFOpen(':Files')<CR>
nnoremap <silent> <leader>pb :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <leader>pr :call FZFOpen(':History')<CR>
nnoremap <silent> <leader>pg :call FZFOpen(':Ag')<CR>

" ======================================
" =========== Camelcase ================
" ======================================

map <silent> w <Plug>CamelCaseMotion_e
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_w
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_ie
xmap <silent> iw <Plug>CamelCaseMotion_ie
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_iw
xmap <silent> ie <Plug>CamelCaseMotion_iw

onoremap <silent> io iw
xnoremap <silent> io iw

" ======================================
" =========== Commentary ===============
" ======================================

xmap <leader>; <Plug>Commentary
nmap <leader>; <Plug>Commentary
nmap <leader>; <Plug>CommentaryLine

" ======================================
" ============= NERDTree ===============
" ======================================

let NERDTreeShowHidden=1

noremap <leader>pt :NERDTreeToggle<CR>
noremap <leader>pN :NERDTreeFind<CR>

" ======================================
" ============ Easymotion ==============
" ======================================

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

nmap <leader>es <Plug>(easymotion-s)
map <Leader>ew <Plug>(easymotion-bd-w)
map <Leader>ej <Plug>(easymotion-j)
map <Leader>ek <Plug>(easymotion-k)
map  <leader>e/ <Plug>(easymotion-sn)
omap <leader>e/ <Plug>(easymotion-tn)

" ======================================
" ========== Visual multi ==============
" ======================================

let g:VM_no_meta_mappings=1
let g:VM_sublime_mappings=1

function! Multiple_cursors_before()
  if exists('g:deoplete#disable_auto_complete')
    let g:deoplete#disable_auto_complete = 1
  endif
endfunction

function! Multiple_cursors_after()
  if exists('g:deoplete#disable_auto_complete')
    let g:deoplete#disable_auto_complete = 0
  endif
endfunction

" ======================================
" ============ Vim test ================
" ======================================

let test#filename_modifier = ":~"
let test#strategy = "vimux"

nnoremap <silent> ,tt :TestNearest<CR>
nnoremap <silent> ,tb :TestFile<CR>
nnoremap <silent> ,ta :TestSuite<CR>
nnoremap <silent> ,tr :TestLast<CR>
nnoremap <silent> ,tv :TestVisit<CR>

" ======================================
" ============ Easyclip ================
" ======================================

let g:EasyClipAutoFormat=1
let g:EasyClipPreserveCursorPositionAfterYank=1

" ======================================
" ============ Git gutter ==============
" ======================================

set signcolumn=yes

" ======================================
" ============ Easy align ==============
" ======================================

xmap <leader>= <Plug>(EasyAlign)
nmap <leader>= <Plug>(EasyAlign)

" ======================================
" ============== Vim altr ==============
" ======================================

call altr#remove_all()
call altr#define('web/%/%.ex', 'lib/%/%.ex', 'test/%/%_test.exs')
call altr#define('app/%/%.rb', 'test/%/%_test.rb')

nmap ,gt <Plug>(altr-forward)

" ======================================
" ============= Lightline ==============
" ======================================

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'nova',
      \ }

" ======================================
" ============== Deoplete ==============
" ======================================

set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1

" ======================================
" ========== Vim textobj user ==========
" ======================================

xmap q iq
omap q iq

" ======================================
" ============ Alchemist ===============
" ======================================

let g:alchemist_tag_map = '<leader>gd'

" ======================================
" ============== Emmet =================
" ======================================

let g:user_emmet_leader_key='<C-t>'

" ======================================
" ================ Lsc =================
" ======================================

" let g:lsc_auto_map = v:true

" ======================================
" ================ Coc =================
" ======================================

" set hidden
" set nobackup
" set nowritebackup
" set cmdheight=2
" set updatetime=300
" set shortmess+=c
" set signcolumn=yes

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <silent><expr> <c-space> coc#refresh()

" if has('patch8.1.1068')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" autocmd CursorHold * silent call CocActionAsync('highlight')

" nmap <leader>crn <Plug>(coc-rename)

" xmap <leader>cf  <Plug>(coc-format-selected)
" nmap <leader>cf  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>cq  <Plug>(coc-fix-current)

" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>

" ======================================
" ============== Editor ================
" ======================================

set list listchars=tab:\ \ ,trail:·
set gcr=a:blinkon0
autocmd BufWritePre * :%s/\s\+$//e
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nostartofline
set nocursorline
set noshowcmd
set linespace=3
set nofixendofline

au FileType * set fo-=c fo-=r fo-=o

set background=dark
colorscheme nova

if has('gui_running')
  set macligatures
  set guifont=Monaco:h17
endif

if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

nnoremap <leader>fa :saveas <C-R>=expand("%")<CR>
nnoremap <leader>fr :edit!<CR>
nnoremap <leader><Tab> :b#<CR>

nnoremap <silent> <Esc><Esc> :let @/=""<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

nnoremap <leader>o o<cr>
nnoremap <leader>O O<esc>O
nnoremap <leader>p o<esc>p
nnoremap <leader>P O<esc>P
