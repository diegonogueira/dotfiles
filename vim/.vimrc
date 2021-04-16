" ======================================
" ============= basic ==================
" ======================================

" set runtimepath+=~/.vim.d/vim/ " load snippets
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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'liuchengxu/vim-better-default'
  Plug 'bkad/CamelCaseMotion'
  Plug 'tpope/vim-commentary'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'sheerun/vim-polyglot'
  Plug 'janko-m/vim-test'
  Plug 'benmills/vimux'
  Plug 'tpope/vim-surround'
  Plug 'thinca/vim-visualstar'
  Plug 'tpope/vim-repeat'
  Plug 'svermeulen/vim-cutlass'
  Plug 'svermeulen/vim-subversive'
  Plug 'svermeulen/vim-yoink'
  Plug 'kana/vim-altr'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'beloglazov/vim-textobj-quotes'
  Plug 'Julian/vim-textobj-brace'
  Plug 'terryma/vim-expand-region'
  Plug 'junegunn/goyo.vim'
  " Plug 'brooth/far.vim'
  " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' # https://github.com/neoclide/coc-snippets
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " " Plug 'slashmili/alchemist.vim'
  Plug 'joshdick/onedark.vim'
call plug#end()

" ======================================
" =========== better default ===========
" ======================================

runtime! plugin/default.vim
nunmap <Leader>sc

" ======================================
" ================ coc =================
" ======================================

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-elixir',
  \ 'coc-explorer',
  \ 'coc-json',
  \ 'coc-xml',
  \ 'coc-markdownlint',
  \ 'coc-graphql',
  \ 'coc-just-complete',
  \ 'coc-sh',
  \ 'coc-sql',
  \ 'coc-tailwindcss',
  \ 'coc-vetur',
  \ 'coc-yaml'
  \ ]

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" " Formatting selected code.
xmap <leader>ff <Plug>(coc-format-selected)
nmap <leader>ff <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <space>e :CocCommand explorer<CR>

nmap <Leader>p [fzf-p]
xmap <Leader>p [fzf-p]

nnoremap <silent> [fzf-p]f     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>

" ======================================
" ======= CamelCaseMotion ==============
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

" " ======================================
" " ============== Emmet =================
" " ======================================

let g:user_emmet_leader_key='<C-t>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eelixir EmmetInstall

" ======================================
" ============ Easymotion ==============
" ======================================

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap <leader>s <Plug>(easymotion-s)
map <leader>S <Plug>(easymotion-bd-w)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)

" ======================================
" ========== visual multi ==============
" ======================================

" let g:VM_maps["Select All"] = '<leader>8'

" ======================================
" ======== Vim subversive ==============
" ======================================

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" ======================================
" ======== Vim yoink ==============
" ======================================

let g:yoinkIncludeDeleteOperations=1

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" ======================================
" ============ Vim test ================
" ======================================

let test#filename_modifier = ":~"
let test#strategy = "vimux"

nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tb :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tr :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

" ======================================
" ============== Vim altr ==============
" ======================================

call altr#remove_all()
call altr#define('web/%/%.ex', 'lib/%/%.ex', 'test/%/%_test.exs')
call altr#define('app/%/%.rb', 'test/%/%_test.rb')

nmap <leader>gt <Plug>(altr-forward)

" ======================================
" ============ Vimux ================
" ======================================

function! TmuxToggleZoom()
  return system("tmux resize-pane -t 0 -Z")
endfunction

function! TmuxSetSize(size)
  return system("tmux resize-pane -t 1 -y " . a:size)
endfunction

map <Leader>vf :VimuxZoomRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vi :VimuxInspectRunner<CR>

noremap <silent> <leader>vt :call TmuxToggleZoom()<CR>
noremap <silent> <leader>vj :call TmuxSetSize(7)<CR>
noremap <silent> <leader>vk :call TmuxSetSize(30)<CR>

" ======================================
" ========== vim-textobj-quotes ==========
" ======================================

xmap q iq
omap q iq

" ======================================
" ============= editor ==================
" ======================================

set signcolumn=yes
set list listchars=tab:\ \ ,trail:·
set tabstop=2
set softtabstop=2
set nostartofline
set nocursorline
set noshowcmd
set linespace=3
set nofixendofline
set cmdheight=2
set updatetime=300
set shortmess+=c
autocmd BufWritePre * :%s/\s\+$//e

set background=dark
colorscheme onedark

nnoremap <leader>fS :saveas <C-R>=expand("%")<CR>
nnoremap <leader>R :edit!<CR>
nnoremap <leader><Tab> :b#<CR>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" ======================================
" ============= basic ==================
" ======================================

" set runtimepath+=~/.vim.d/vim/ " load snippets
" nnoremap <space> <Nop>
" map <space> <leader>

" " ======================================
" " =========== better default ===========
" " ======================================

" let g:vim_better_default_fold_key_mapping = 0
" let g:vim_better_default_file_key_mapping = 0
" let g:vim_better_default_buffer_key_mapping = 0

" runtime! plugin/default.vim
" nunmap <Leader>sc
" nunmap <Leader>tp
" nnoremap <Leader>D :bd<CR>

" " ======================================
" " ============= Ultilsnips =============
" " ======================================

" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" " ======================================
" " ================ Fzf =================
" " ======================================

" function! FZFOpen(command_str)
"   if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
"     exe "normal! \<c-w>\<c-w>"
"   endif
"   exe 'normal! ' . a:command_str . "\<cr>"
" endfunction

" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" let g:fzf_buffers_jump = 1
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" let g:fzf_tags_command = 'ctags -R'
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" let g:fzf_action = {
"       \ 'ctrl-q': 'wall | bdelete',
"       \ 'ctrl-t': 'tab split',
"       \ 'ctrl-s': 'split',
"       \ 'ctrl-v': 'vsplit' }

" command! -bang -nargs=* GGrep
"       \ call fzf#vim#grep('git grep --color=always --line-number '.shellescape(<q-args>), 0, <bang>0)

" nnoremap <silent> <leader>f :call FZFOpen(':Files')<CR>
" nnoremap <silent> <leader>b :call FZFOpen(':Buffers')<CR>
" nnoremap <silent> <leader>r :call FZFOpen(':History')<CR>
" nnoremap <silent> <leader>F :call FZFOpen(':Ag')<CR>

" " ======================================
" " =========== Camelcase ================
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
" " =========== Commentary ===============
" " ======================================

" xmap <leader>; <Plug>Commentary
" nmap <leader>; <Plug>Commentary
" nmap <leader>; <Plug>CommentaryLine

" " ======================================
" " ============= NERDTree ===============
" " ======================================

" let NERDTreeShowHidden=1

" noremap <leader>n :NERDTreeToggle<CR>
" noremap <leader>N :NERDTreeFind<CR>

" " ======================================
" " ============ Easymotion ==============
" " ======================================

" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:EasyMotion_smartcase = 1

" nmap <leader>s <Plug>(easymotion-s)
" map <Leader>e <Plug>(easymotion-bd-w)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map  <leader>/ <Plug>(easymotion-sn)
" omap <leader>/ <Plug>(easymotion-tn)

" " ======================================
" " ========== Visual multi ==============
" " ======================================

" let g:VM_no_meta_mappings=1
" let g:VM_sublime_mappings=1

" " function! Multiple_cursors_before()
" "   if exists('g:deoplete#disable_auto_complete')
" "     let g:deoplete#disable_auto_complete = 1
" "   endif
" " endfunction

" " function! Multiple_cursors_after()
" "   if exists('g:deoplete#disable_auto_complete')
" "     let g:deoplete#disable_auto_complete = 0
" "   endif
" " endfunction

" " ======================================
" " ============ Vim test ================
" " ======================================

" let test#filename_modifier = ":~"
" let test#strategy = "vimux"

" nnoremap <silent> <leader>tt :TestNearest<CR>
" nnoremap <silent> <leader>tb :TestFile<CR>
" nnoremap <silent> <leader>ta :TestSuite<CR>
" nnoremap <silent> <leader>tr :TestLast<CR>
" nnoremap <silent> <leader>tv :TestVisit<CR>

" " ======================================
" " ============ Vimux ================
" " ======================================

" function! TmuxToggleZoom()
"   return system("tmux resize-pane -t 0 -Z")
" endfunction

" function! TmuxSetSize(size)
"   return system("tmux resize-pane -t 1 -y " . a:size)
" endfunction

" map <Leader>vf :VimuxZoomRunner<CR>
" map <Leader>vq :VimuxCloseRunner<CR>
" map <Leader>vi :VimuxInspectRunner<CR>
" noremap <silent> <leader>vt :call TmuxToggleZoom()<CR>
" noremap <silent> <leader>vj :call TmuxSetSize(7)<CR>
" noremap <silent> <leader>vk :call TmuxSetSize(30)<CR>

" " ======================================
" " ============ Easyclip ================
" " ======================================

" " let g:EasyClipAutoFormat=1
" " let g:EasyClipPreserveCursorPositionAfterYank=1
" " let g:EasyClipUseCutDefaults = 0

" " ======================================
" " ============ Git gutter ==============
" " ======================================

" set signcolumn=yes

" " ======================================
" " ============ Easy align ==============
" " ======================================

" xmap <leader>= <Plug>(EasyAlign)
" nmap <leader>= <Plug>(EasyAlign)

" " ======================================
" " ============== Vim altr ==============
" " ======================================

" call altr#remove_all()
" call altr#define('web/%/%.ex', 'lib/%/%.ex', 'test/%/%_test.exs')
" call altr#define('app/%/%.rb', 'test/%/%_test.rb')

" nmap <leader>gt <Plug>(altr-forward)

" " ======================================
" " ============= Lightline ==============
" " ======================================

" set noshowmode

" let g:lightline = {
"       \ 'colorscheme': 'onedark',
"       \ }

" " ======================================
" " ============== Deoplete ==============
" " ======================================

" " set completeopt+=noinsert
" " let g:deoplete#enable_at_startup = 1

" " ======================================
" " ========== Vim textobj user ==========
" " ======================================

" xmap q iq
" omap q iq

" " ======================================
" " ============ Alchemist ===============
" " ======================================

" " let g:alchemist_tag_map = '<leader>gd'

" " ======================================
" " ============== Emmet =================
" " ======================================

" let g:user_emmet_leader_key='<C-t>'

" " ======================================
" " ============== Coc =================
" " ======================================

" let g:coc_global_extensions = ['coc-elixir']

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Formatting selected code.
" xmap <leader><leader>f  <Plug>(coc-format-selected)
" nmap <leader><leader>f  <Plug>(coc-format-selected)

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" " ======================================
" " ============== Editor ================
" " ======================================

" set list listchars=tab:\ \ ,trail:·
" set gcr=a:blinkon0
" autocmd BufWritePre * :%s/\s\+$//e
" set shiftwidth=2
" set tabstop=2
" set softtabstop=2
" set nostartofline
" set nocursorline
" set noshowcmd
" set linespace=3
" set nofixendofline
" set cmdheight=2
" set shortmess+=c

" au FileType * set fo-=c fo-=r fo-=o

" set background=dark
" colorscheme onedark

" nnoremap <Leader>s :update<CR>
" nnoremap <leader>S :saveas <C-R>=expand("%")<CR>
" nnoremap <leader>E :edit!<CR>
" nnoremap <leader><Tab> :b#<CR>

" nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz

" nnoremap <leader>o o<cr>
" nnoremap <leader>O O<esc>O
" nnoremap <leader>p o<esc>p
" nnoremap <leader>P O<esc>P
