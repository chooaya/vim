set nocompatible
let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

if isdirectory($HOME . '/.vim')
  let s:CFGHOME=$HOME.'/.vim'
elseif isdirectory($HOME . '/vimfiles')
  let s:CFGHOME=$HOME.'/vimfiles'
elseif isdirectory($VIM . '/vimfiles')
  let s:CFGHOME=$VIM.'/vimfiles'
endif


if !has('gui_running') && s:MSWindows
  set termencoding=cp932
endif
if filereadable(s:CFGHOME . '/cp932')
  set encoding=cp932
else
  set encoding=utf-8
endif

if &encoding == 'utf-8'
  set fileencodings=ucs-bom,utf-8,default,latin1
else
  set fileencodings=ucs-bom
endif

if has('iconv')
  if &encoding == 'utf-8'
    set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
  else
    set fileencodings=ucs-bom,utf-8,ucs-2le,ucs-2,iso-2022-jp,euc-jp,cp932
  endif


  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let &fileencodings=substitute(&fileencodings, 'iso-2022-jp', 'iso-2022-jp-3', 'g')
    let &fileencodings=substitute(&fileencodings, 'euc-jp', 'euc-jp-ms', 'g')

  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let &fileencodings=substitute(&fileencodings, 'iso-2022-jp', 'iso-2022-jp-3', 'g')
    let &fileencodings=substitute(&fileencodings, 'euc-jp', 'euc-jisx0213', 'g')
  endif
endif

unlet s:CFGHOME
let vimrc_set_encoding = 1


" set fileformats=unix,dos,mac

if exists("loaded_ReCheckFENC")
  finish
endif
let loaded_ReCheckFENC = 1

if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fenc == 'utf-8' && search("[^\x01-\x7e]", 'n') == 0
      if s:MSWindows
        let &fileencoding='cp932'
      else
        let &fileencoding=&enc
      endif
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif


if has('unix') && has('gui_running')
  let $LANG='ja'
endif


set hidden
set number
set title
set laststatus=2
set showcmd
set ruler
set clipboard+=unnamed
set display=lastline
set ambiwidth=double
set shellslash
set ignorecase
set smartcase
set incsearch
set wildmenu
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"---------------------------------------------------------------------------以下は共通設定
filetype off
if has('vim_starting')
  set rtp+=$VIMRUNTIME/bundle/neobundle.vim/
  call neobundle#begin(expand("$VIMRUNTIME/bundle/"))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'joonty/vdebug'
  call neobundle#end()
endif

filetype plugin indent on     " required!
filetype indent on
filetype plugin on
runtime $VIMRUNTIME/macros/matchit.vim
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif
let $LANG='ja_JP.UTF-8'
"language messages ja_jp.UTF-8
set encoding=utf-8
set fileencodings=utf-8
syntax on
set number
set ignorecase
" ファイルを上書きする前にバックアップを作る。書き込みが成功してもバックアップはそのまま取っておく。（有効:backup/無効:nobackup）
set nobackup
" ファイルの上書きの前にバックアップを作る。オプション 'backup' がオンでない限り、バックアップは上書きに成功した後削除される。（有効:writebackup/無効:nowritebackup）
set nowritebackup
" set noswapfile
set swapfile
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=$VIMRUNTIME/dict/php.dict filetype=php
if has("lua")
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
else
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_ignore_case = 1
	let g:neocomplcache_enable_smart_case = 1
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:ref_phpmanual_path = $VIMRUNTIME . '/dict/php-chunked-xhtml'
let g:neocomplete_php_locale = 'ja'
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_enable_highlighting = 1
"" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
"let g:syntastic_php_php_args = '-l'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
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
let g:unite_source_grep_max_candidates = 10000
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
nnoremap <silent> ,R  :<C-u>UniteResume<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--ignore-case --nogroup --nocolor --line-numbers'
  let g:unite_source_grep_recursive_opt = ''
  set grepprg=ag\ --ignore-case\ --nogroup\ --nocolor\ --line-numbers\
  set grepformat=%f:%l:%m
else
  let g:unite_source_grep_command = 'ack'
  set grepformat=%f:%l:%m
endif

let @a='find ./  -print | xargs egrep -i  -l "SEARCHTERM1"|xargs egrep -n -i  "SEARCHTERM2"'
let @b=' | xargs egrep -i  -l "SEARCHTERM1"|xargs egrep -n -i  "SEARCHTERM2"'
let @c=' | xargs egrep -i  -l "SEARCHTERM1"|xargs egrep -n -i -l "SEARCHTERM2"'
let @d="ag --ignore-case --nogroup --nocolor --line-numbers  --files-with-matches 'SEARCHTERM1'|xargs ag --ignore-case --nogroup --nocolor --line-numbers --vimgrep 'SEARCHTERM2'"
let @e=':Qfdo execute "normal i\<ESC>"'

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

let g:unite_source_find_command="find"
autocmd FileType vimfiler 
        \ nnoremap <buffer><silent>B 
        \ :<C-u>Unite bookmark -default-action=vimfiler<CR>

autocmd FileType vimfiler 
        \ nnoremap <buffer><silent>/ 
        \ :<C-u>Unite file -default-action=vimfiler<CR>

call unite#custom_default_action("source/find", "vimfiler")
nnoremap <silent> <Leader>f :<C-u>Unite find:.<CR> 
nnoremap <silent> <Leader>N :VimFilerBufferDir -winwidth=30 -simple -find -split -no-quit<CR>
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
nnoremap <silent> <Leader>n :VimFilerBufferDir -find -split -horizontal -auto-cd -no-quit<CR>
let g:vimfiler_as_default_explorer = 1
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
" gr -> grep  , gf -> find , <C-v> -> vim buffer mode , <ESC> -> vimfiler mode

" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>


" ,s: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,s :VimShellSendString<CR>
" 選択中に,s: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,s <S-v>:VimShellSendString<CR>
set isfname=\ ,@,48-57,\\,/,.,-,_,+,,,#,$,%,{,},[,],@-@,!,~,=
nmap <C-n> <Plug>(operator-jump-tail-out)if
nmap <C-p> <Plug>(operator-jump-head-out)if
augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END

nnoremap <Leader><Leader><Leader> :<C-u>Unite source<CR> 
nnoremap <Leader><Leader>l :<C-u>Unite line<CR> 
nnoremap <Leader><Leader>o :<C-u>Unite outline<CR> 
nnoremap <Leader><Leader>f :<C-u>Unite file_rec/async<CR> 
nnoremap <Leader><Leader>b :<C-u>Unite buffer_tab<CR> 
nnoremap <Leader><Leader>B :<C-u>Unite bookmark<CR> 
nnoremap <Leader><Leader>m :<C-u>Unite file_mru<CR> 
nnoremap <Leader><Leader>c :execute ":CD ".$DEVPATH<CR>:execute ":VimShellInteractive  --split='split \| resize 55' phpsh ".$MYTESTFILE<CR> 
nnoremap <Leader><Leader>M :execute ":VimShellInteractive  --split='split \| resize 55' ".$MYSQL<CR> 
" ,ih: bashを非同期で起動
nnoremap <silent> ,ih :VimShellInteractive  --split='split \| resize 55' bash<CR>
nnoremap <Leader><Leader>h :VimShellInteractive  --split='split \| resize 55' bash<CR> 
nnoremap <Leader><Leader>s :VimShellInteractive  --split='split \| resize 55' ssh default<CR> 
nnoremap <Leader><Leader>S :VimShellInteractive  --split='split \| resize 55' ssh  
nnoremap <CR> gF
nnoremap <C-w><CR> <C-w>gF
" JSONの整形コマンドPYTHON2.6使用
command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
  \ | :set ft=javascript
  \ | :1

let g:EclimCompletionMethod = 'omnifunc'

if !exists('g:neocomplcache_force_omni_patterns')
	  let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'
