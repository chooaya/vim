"----------------------------------------
" IME
"----------------------------------------
if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " set imactivatekey=C-Space
  endif
endif

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

"----------------------------------------
" Font
"----------------------------------------
if has('xfontset')
  " set guifontset=a14,r14,k14
elseif has('mac')
  " set guifont=Osaka-mono:h14
elseif has('win32') || has('win64')
  " set guifont=MS_Gothic:h11:cSHIFTJIS
endif

if has('printer')
  if has('win32') || has('win64')
    " set printfont=MS_Mincho:h12:cSHIFTJIS
    " set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif
colorscheme evening " (GUI使用時)
"---------------------------------------------------------------------------以下は共通設定
filetype plugin on
runtime $VIMRUNTIME/macros/matchit.vim
let $LANG='ja_JP.UTF-8'
language messages ja_jp.UTF-8
set encoding=utf-8
set fileencodings=utf-8
syntax on
set number
set ignorecase
" ファイルを上書きする前にバックアップを作る。書き込みが成功してもバックアップはそのまま取っておく。（有効:backup/無効:nobackup）
set nobackup
" ファイルの上書きの前にバックアップを作る。オプション 'backup' がオンでない限り、バックアップは上書きに成功した後削除される。（有効:writebackup/無効:nowritebackup）
set nowritebackup
set noswapfile
"set swapfile
".vimrcの再適用  :bufdo source $MYVIMRC
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

map <F4> <Esc> :WriteBackup
vnoremap * "zy:let @/ = @z<CR>n

"Diff表示の際にウィンドウをリサイズしない
let versdiff_no_resize = 1
"<F5>でひとつ前のバックアップと比較
nmap <silent> <F5> :VersDiff -<CR>
"<F6>でひとつ後のバックアップと比較
nmap <silent> <F6> :VersDiff +<CR>
"<Leader>vqでVersDiffから抜ける
nmap <silent> <Leader>vq :VersDiff -c<CR>
let file_name = expand("%")

"------------------------------------
" Unit.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,t  :let g:unite_source_grep_default_opts = '--nogroup --nocolor  --line-numbers -G \.tpl$'<CR>
nnoremap <silent> ,p  :let g:unite_source_grep_default_opts = '--nogroup --nocolor  --line-numbers -G \.php$'<CR>
nnoremap <silent> ,a  :let g:unite_source_grep_default_opts = "--nogroup --nocolor  --line-numbers -G '\.php$\|\.tpl$'"<CR>
nnoremap <silent> ,u  :let g:unite_source_grep_default_opts = '--nogroup --nocolor  --line-numbers'<CR>

" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --line-numbers'
  let g:unite_source_grep_recursive_opt = ''
"  set grepprg=ag\ --nogroup\ --nocolor\ --line-numbers\
  set grepformat=%f:%l:%m
else
  let g:unite_source_grep_command = 'ack'
  set grepformat=%f:%l:%m
endif

nnoremap <silent> <Leader>N :CD<CR>:NERDTree<CR>
let NERDTreeShowHidden=1

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

nnoremap <F10> :VimFiler
nnoremap <F11> :UniteBookmarkAdd
nnoremap <F12> :Unite bookmark

function! UniteFileCurrentDir()
  let s  = ':Unite file -start-insert -path='
  let s .= vimfiler#get_current_vimfiler().current_dir

  execute s
endfunction

autocmd FileType vimfiler
      \ nnoremap <buffer><silent>/
      \ :call UniteFileCurrentDir() <CR>

" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>

" ,ih: bashを非同期で起動
nnoremap <silent> ,ih :VimShellInteractive  --split='split \| resize 55' bash<CR>

" ,s: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,s :VimShellSendString<CR>
" 選択中に,s: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,s <S-v>:VimShellSendString<CR>
set isfname=\ ,@,48-57,\\,/,.,-,_,+,,,#,$,%,{,},[,],@-@,!,~,=
nmap <C-n> <Plug>(operator-jump-tail-out)if
nmap <C-p> <Plug>(operator-jump-head-out)if
