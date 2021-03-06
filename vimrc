set nocompatible
let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

if isdirectory($HOME . '/.vim')
  let s:CFGHOME=$HOME.'/.vim'
elseif isdirectory($HOME . '/vimfiles')
  let s:CFGHOME=$HOME.'/vimfiles'
elseif isdirectory($VIM . '/vimfiles')
  let s:CFGHOME=$VIM.'/vimfiles'
endif
if !has('gui_running')
	  set t_Co=256
	  colorscheme wombat256mod
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
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
vnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
inoremap <Esc> <nop>
vnoremap <Esc> <nop>
set relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>


set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set list
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
set completeopt=menuone
set expandtab
set tabstop=4
set shiftwidth=4
map <silent> <C-@> <nop>
imap <silent> <C-@> <nop>
cmap <silent> <C-@> <nop>
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree','vim','vimfiler','taglist','unite','php','java','json','quickrun']
set imdisable
let g:eskk_dictionary = expand('$VIMRUNTIME/SKK_JISYO/')
let g:eskk#directory = expand('$VIMRUNTIME/SKK_JISYO/')
let g:eskk#log_cmdline_level = 4
let g:eskk#enable_completion = 1
let g:eskk_debug = 0
let g:eskk_egg_like_newline = 1
let g:eskk_revert_henkan_style = "okuri"
let g:eskk_enable_completion = 1
let g:eskk#initial_mode = "hira"
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
set cscopetag
set cscopequickfix=s0,g0,d0,c-,t0,e0,f0,i0
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Keep_Alive = 1
let GtagsCscope_Absolute_Path = 1
let g:php_refactor_command='php ' . expand('$VIMRUNTIME/tools/refactor.phar')
let g:php_cs_fixer_path= expand('$VIMRUNTIME/tools/php-cs-fixer.phar')
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0
let g:php_cs_fixer_use_flg = 1
let g:php_cs_standard = g:php_cs_fixer_level
let g:php_cs_use_flg = 0
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
let g:pyflakes_use_quickfix = 0
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['php', 'coffeescript', 'sh', 'vim'],
            \ 'passive_filetypes': ['html', 'haskell', 'python']
            \}
" rename用のマッピングを無効にしたため、代わりにコマンドを定義
command! -nargs=0 JediRename :call jedi#rename()

" pythonのrename用のマッピングがquickrunとかぶるため回避させる
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "<CR>"

"let g:php_cs_fixer_config_file = '.php_cs'
"
autocmd FileType php noremap <buffer> <space>r :call PhpRefactorShowMenu()<CR>
"autocmd BufEnter * if &filetype == "" | setlocal ft=php |call append(0,"<?php")|call append(1,"include_once(getenv('VIM').'/vim74/tools/test_cake.php');")|call append(2,"")|call append(3,"")|call append(4,"?>")|call cursor(4,0) | endif
autocmd BufEnter * if &filetype == "" | setlocal ft=php| endif
set clipboard=unnamed
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'filename': '%t',
"      \   'readonly': '%{&readonly?"x":""}',
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '|', 'right': '|' }
"      \ }
"autocmd FileType php set tags=$HOME/php.tags
"autocmd FileType int-phpsh set tags=$HOME/php.tags
set diffopt+=iwhite 
filetype on
"if has('vim_starting')
"  set rtp+=$VIMRUNTIME/bundle/neobundle.vim/
"  call neobundle#begin(expand("$VIMRUNTIME/bundle/"))
"  NeoBundleFetch 'Shougo/neobundle.vim'
"  NeoBundleFetch 'joonty/vdebug'
"  call neobundle#end()
"endif
"let g:dbgPavimBreakAtEntry = 0

filetype plugin indent on     " required!
filetype indent on
filetype plugin on
runtime $VIMRUNTIME/macros/matchit.vim
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif
"let $LANG='ja_JP.UTF-8'
"language messages ja_jp.UTF-8
language mes en_US.utf8
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
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 0
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_mappings = {'jump_to_def': '<space><CR>'}
"autocmd FileType php set omnifunc=gtagsomnicomplete#Complete 
autocmd FileType int-phpsh set filetype=php
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
let g:ref_phpmanual_path = $VIMRUNTIME . '/dict/php-chunked-xhtml'
let g:neocomplete_php_locale = 'ja'
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 0
let g:syntastic_echo_current_error = 0
"let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 0
"" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
"let g:syntastic_php_php_args = '-l'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory=expand('$VIMRUNTIME/neosnippets/')
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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
nmap <Leader><LeftMouse> 	:<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
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
let g:ctrlp_map = '<space><space>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
if executable('global')
	let g:ctrlp_user_command = 'cd %s && global -aP'
	let g:ctrlp_use_caching = 0
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

function! s:Gitshowtofile(filename)
	if executable('git')
		if filereadable(".git/config")
			if a:filename == ''
				if expand("%") == ''
					execute "%delete" | execute "read !git show " . input("input the branch name:") . ":" . input("input the file path and name:") | execute "1delete" 
				else
					execute "%delete" | execute "read !git show " . input("input the branch name:") . ":" . expand("%") | execute "1delete" 
				endif
			else
				if filereadable(a:filename)
					execute "%delete" | execute "read !git show " . input("input the branch name:") . ":" . a:filename | execute "1delete" 
				else
					echo "file inputed is not readable!!"
				endif
			endif
		else
			echo "git config file is not readable!!"
		endif
	else
		echo "git command is not installed!!"
	endif
endfunction

command! -nargs=? Gitshowtofile  call s:Gitshowtofile('<args>')

let g:unite_source_find_command="find"
autocmd FileType vimfiler 
        \ nnoremap <buffer><silent>B 
        \ :<C-u>Unite bookmark -default-action=vimfiler<CR>

autocmd FileType vimfiler 
        \ nnoremap <buffer><silent>/ 
        \ :<C-u>Unite file_rec/async -default-action=vimfiler<CR>

autocmd FileType vimfiler nmap <buffer><silent><RightMouse> q
autocmd FileType vimfiler nmap <buffer><silent><2-LeftMouse> o

call unite#custom_default_action("source/find", "vimfiler")
nnoremap <silent> <Leader>f :<C-u>Unite find:.<CR> 
nnoremap <silent> <Leader>N :VimFilerBufferDir -winwidth=50 -simple -find -split -no-quit<CR>
nmap <silent> <RightMouse> 	:VimFilerBufferDir -winwidth=50 -simple -find -split -no-quit<CR>
autocmd VimEnter * VimFiler -split -simple -winwidth=50 -no-quit
nnoremap <silent> <Leader>n :VimFilerBufferDir -find -split -horizontal -no-quit<CR>
let g:vimfiler_as_default_explorer = 1
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
" gr -> grep  , gf -> find , <C-v> -> vim buffer mode , <ESC> -> vimfiler mode
function! s:vimfiler_width_expr()
	  let w = vimfiler#get_context().winwidth
	    return w == winwidth(0) ? w * 2 : w
    endfunction
    autocmd FileType vimfiler
      \ nmap <buffer> <SID>(vimfiler_redraw_screen) <Plug>(vimfiler_redraw_screen)|
      \ nnoremap <buffer><script><expr> <C-H>
      \   <SID>vimfiler_width_expr() . "\<C-W>\|\<SID>(vimfiler_redraw_screen)"

" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>

map <silent> <Leader><Leader>d :<C-u>:BreakpointRemove *<CR>

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
let g:unite_source_rec_async_command='global -aP'
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
autocmd BufRead *.txt\|*.TXT nnoremap <CR> <C-w>gF
"autocmd BufRead *.txt\|*.TXT nnoremap <C-w><CR> <C-w>gF
"nnoremap <CR> gF
"nnoremap <C-w><CR> <C-w>gF
" JSONの整形コマンドphp使用
function! UserIdFunc(range_given, line1, line2,prog)
    if a:range_given
        let tmp = @@
        silent normal gvy
        let selected = @@
        let @@ = tmp
        let usrcmd = 'php -q '.$VIMRUNTIME.'/tools/stdin.php ' . a:prog
        let stdin = selected. "\n"
        let r=system(usrcmd,stdin)
    else
        let tmp = @@
        silent normal ggyG
        let selected = @@
        let @@ = tmp
        let usrcmd = 'php -q '.$VIMRUNTIME.'/tools/stdin.php ' . a:prog
        let stdin = join(getline(1,'$'), "\n")
        let r=system(usrcmd,stdin)
    endif
    if !v:shell_error
        if a:range_given
            set paste
            exe "norm! gvc".r
            set nopaste
        else
            %d "
            let @z = @_
            let @z = r
            0put z
        endif
    else
        echo "PHP script interrupted by error!!"
    endif
endfunction

command! -range=0 PostFormFormat :call UserIdFunc(<count>, <line1>, <line2>,'PostFormFormat')
command! -range=0 PostToJson :call UserIdFunc(<count>, <line1>, <line2>,'PostToJson')
command! -range=0 JsonFormat :call UserIdFunc(<count>, <line1>, <line2>,'JsonFormat')

if !exists('g:neocomplcache_force_omni_patterns')
	  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\|\h\w*::'
if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\|\h\w*::'

"タグ補完の呼び出しパターン
if !exists('g:neocomplcache_member_prefix_patterns')
	let g:neocomplcache_member_prefix_patterns = {}
endif
"let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'

if !exists('g:neocomplete#sources#member#prefix_patterns')
	let g:neocomplete#sources#member#prefix_patterns = {}
endif
"let g:neocomplete#sources#member#prefix_patterns.php = '->\|::'


let g:EclimCompletionMethod = 'omnifunc'

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'


map <Leader>c <Plug>(operator-camelize)
map <Leader>C <Plug>(operator-decamelize)

autocmd FileType java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
autocmd FileType php nnoremap <silent> <buffer> <cr> g<C-]>
autocmd FileType php nnoremap <silent> <buffer> <c-\><cr> :<C-U>Unite -default-action=split -no-start-insert ref/phpmanual -immediately -input=<C-R><C-W><CR>
"nnoremap <silent> <C-\><C-\> :<C-u>Unite output:map<cr>

" vim-tags
"let g:vim_tags_project_tags_command = "ctags -R --fields=+aimS --languages=PHP --langmap=PHP:.php.inc -f ~/php.tags `echo $DEVPATH` 2>/dev/null "

let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let g:tlist_php_settings = 'php;c:class;f:function;d:constant'
nnoremap <Leader>t :Tlist<CR>
let g:Tlist_Auto_Open = 1

" gtags
let Gtags_Auto_Update = 1
"let Gtags_No_Auto_Jump = 1
function! s:gtags_jump_ex()
	execute 'Gtags '.expand('<cword>')
endfunction
if executable('ctags')
	autocmd FileType php nmap <silent> <MiddleMouse> 	:<C-u>TlistToggle<CR>
else
	autocmd FileType php nmap <silent> <MiddleMouse> 	:<C-u>Unite -vertical -winwidth=30 outline -direction=botright -no-quit -toggle -buffer-name=outline -silent -wrap -no-start-insert<CR>
endif
map g<LeftMouse> 	:<C-u>execute 'Gtags -r '.expand('<cword>')<CR>
"map <C-LeftMouse>  :call <SID>gtags_jump_ex()<CR>
map g<RightMouse> 	:<C-u>execute 'Unite gtags/context:'.expand('<cword>')<CR>
"autocmd FileType php nmap g<RightMouse> 	:<C-u>execute 'Gtags '.expand('<cword>')<CR>
"autocmd FileType php map <C-RightMouse> 	:<C-u>execute 'Gtags '.expand('<cword>')<CR>

"let $GTAGSROOT = '/srv/'
"
let g:unite_source_gtags_project_config = {
  \ '_':                   { 'treelize': 0,'absolute_path': 1 }
  \ }



function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction
function! s:Toggle_mouse_ctrl()
	if &mouse == 'a'
		set mouse=
		set nonumber
		set paste
        set nolist
		exe 'IndentGuidesEnable'
	else
		set mouse=a
		set number
		set nopaste
        set list
        if &filetype != 'python'
            exe 'IndentGuidesDisable'
        endif
	endif
endfunction
map <silent> <C-\><C-\> :call <SID>Toggle_mouse_ctrl()<CR>

let g:vdebug_options = {
\    "port" : 9002,
\    "timeout" : 20,
\    "server" : '',
\    "on_close" : 'stop',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "path_maps" : {},
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾',
\    "continuous_mode"  : 0
\}
let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F4>",
\    "step_out" : "<F8>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e"
\}

"python -S ./pydbgp.py  -d localhost:9002 ~/test.py
"http://www.raditha.com/blog/archives/vim-and-python-debug/

function! UserPythonFunc(range_given, line1, line2,prog,debug_mode)
    let l:pydbgppath = $VIMRUNTIME.'/tools/pydbgp/bin'
    let l:pythontoolspath = $VIMRUNTIME.'/tools/pythontools'
    let l:viminfile = $VIMRUNTIME.'/tools/vimin.py'
    let l:stdin = ''
    if a:range_given
        let tmp = @@
        silent normal gvy
        let selected = @@
        let @@ = tmp
        let l:stdin = selected
    else
        let tmp = @@
        silent normal ggyG
        let selected = @@
        let @@ = tmp
        let stdin = selected
    endif
    if a:debug_mode == ''
        execute 'pyfile' l:viminfile
    else
        python <<EOF
import vim
l = vim.bindeval('l:')
g = vim.bindeval('g:')
import sys
sys.path.append(l['pydbgppath'])
import pydbgp
virargv = ['', '-d',str(g['vdebug_options']['port']),l['viminfile']]
try:
    ret = pydbgp.main(virargv)
except:
    pass

EOF
    endif

    if a:range_given
        set paste
        exe "norm! gvc".l:stdin
        set nopaste
    else
        %d "
        let @z = @_
        let @z = l:stdin
        0put z
    endif

endfunction


"command! -range=0 -bang JsonFormatP :call UserPythonFunc(<count>, <line1>, <line2>,'JsonFormat','<bang>')
command! -range=0 -bang PostFormFormatP :call UserPythonFunc(<count>, <line1>, <line2>,'PostFormFormat','<bang>')
command! -range=0 -bang PostToJsonP :call UserPythonFunc(<count>, <line1>, <line2>,'PostToJson','<bang>')



function! Func() range
	let tmp = @@
	silent normal gvy
	let selected = @@
	let @@ = tmp
	echo selected
endfunction

command! -range Func :call Func()

let g:vim_json_syntax_conceal = 0



let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 10}
let g:quickrun_config.python = {'command' : expand('$VIMRUNTIME/tools/pythondebug.py'), "cmdopt" : g:vdebug_options["port"]}



nmap Q :cgetb\|Qfreplace<CR> 
vnoremap q :cgetb\|Qfreplace<CR> 
"Vim: quickfix用key mappings   nnoremap q :Qfreplace<CR>
"
nnoremap <silent> ,D  :<C-u>g//d<CR>
nnoremap <silent> ,d  :<C-u>g!//d<CR>
nnoremap <silent> ,y  :<C-u>let @y = ''\|g//yank Y<CR>
let g:ctrlp_max_height = &lines
"http://phpy.readthedocs.org/en/latest/introduction.html
"ps aux|awk -v ORS=" " 'NR>1{print $2}'

" please install ConqueShell (https://github.com/lrvick/Conque-Shell)
function! DebugJs()
  let cmd="node --debug-brk "
  if( expand('%:e') == "coffee")
    let cmd="coffee --nodejs --debug-brk "
  endif
  exec "silent ConqueTermVSplit bash -ic \"(" . cmd . @% . " &) ; sleep 1s && node-vim-inspector\""
endfunction

" launch debug on ctrl-d


"augroup PHP
"    autocmd!
"    " 書き込みのプレ処理
"    autocmd! BufWritePre *.php call PHPPre()
"    " 書き込みのポスト処理
"    autocmd! BufWritePost *.php call PHPPost()
"
"    " 書き込みのプレ処理
"    function! PHPPre()
"    endfunction
"
"    " 書き込みのポスト処理
"    " PHPLint
"    " コードの整形
"    function! PHPPost()
"        " php -lの実行結果を変数に代入
"        let l:php_lint_result = system('php -l '.bufname('%'))
"        " No syntax errorsの文字列がmatchするかチェック
"        let l:php_lint_err_check = matchstr(l:php_lint_result, 'No syntax errors')
"
"        " エラーがあるときだけLintの結果を出力する
"        if len(l:php_lint_err_check) == 0
"            " 半角スペースごとに配列を分割
"            let l:error_message_list = split(l:php_lint_result, ' ')
"            let l:line_flg = 0
"            let l:line_number = 0
"
"            " エラーメッセージからエラーの行数を拾う
"            " エラーメッセージのlineの後がエラーの行数みたい
"            for word in l:error_message_list
"                if l:line_flg == 1
"                    let l:line_number = word
"                    :break
"                else
"                    if word == 'line'
"                        let l:line_flg = 1
"                    endif
"                endif
"            endfor
"
"            " QuickFixのリストの末尾にエラーの内容を追加する
"            let l:qflist = []
"            call add(l:qflist, {'filename': bufname('%'), 'type': 'i', 'lnum': l:line_number, 'col': 1, 'text': l:php_lint_result})
"            call setqflist(l:qflist)
"            " QuickFixを表示
"            :copen
"        else
"            " QuickFixを閉じる
"            :cclose
"            " php_cs_fixerを利用してコードを整形
"            if g:php_cs_fixer_use_flg == 1
"                call PhpCsFixer()
"            endif
"            " phpcsでコードチェック
"            if g:php_cs_use_flg == 1
"                call PhpCs()
"            endif
"        endif
"    endfunction
"
"    " php_cs_fixerの設定
"    function! PhpCsFixer()
"        " @see https://github.com/FriendsOfPHP/PHP-CS-Fixer
"        :call PhpCsFixerFixFile()
"        syntax on
"    endfunction
"
"    " php_csの設定
"    function! PhpCs()
"        " パスが通っているか確認のため確認用のphpcsコマンドをたたく
"        let l:check_phpcs = system(g:php_cs_path.' -i 1>/dev/null 2> /dev/null && echo $?')
"
"        " phpcsのパスが通っている場合はphpcsでチェック
"        if l:check_phpcs == 0
"            set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"\\,%*[a-zA-Z0-9_.-\\,]
"
"            " phpcsコマンドをたたく
"            let l:phpcs_result = system(g:php_cs_path.' --standard='.g:php_cs_standard.' '.bufname('%'))
"
"            " phpcsチェックerrorの場合
"            if l:phpcs_result != ''
"                let l:i = 0
"                let l:qflist = []
"                " phpcsのエラーメッセージを改行ごとにsplit
"                let l:error_message_list = split(l:phpcs_result, "\n")
"
"                for message in l:error_message_list
"                    " エラー内容を表すメッセージは | 行番号 | ERROR or Warning | 内容
"                    " のフォーマットなので、|のある行を探す
"                    let l:match_result = matchstr(message, '|')
"                    if len(l:match_result) > 0
"                        " split_message[0] 行番号
"                        " split_message[1] ERROR or Warning
"                        " split_message[2] 内容
"                        let l:split_message = split(message, '|')
"
"                        " split_message[0]には半角スペースが含まれるのでtrim
"                        if len(substitute(l:split_message[0], " ","","g")) > 0
"                            call add(l:qflist, {'filename': bufname('%'), 'text': l:split_message[1].l:split_message[2], 'lnum':substitute(l:split_message[0], " ","","g"), 'col': 1})
"                        else
"                            call add(l:qflist, {'filename': "", 'text': l:split_message[2], 'lnum':'', 'col': 1})
"                        endif
"                    endif
"                endfor
"
"                " QuickFixのリストの末尾にエラーの内容を追加する
"                call setqflist(l:qflist)
"                " QuickFix open
"                copen
"            else
"                " QuickFix close
"                cclose
"            endif
"
"        " phpcsのパスが通っていない場合はerror表示
"        else
"            echo 'Error! phpcs not found.'
"        endif
"
"    endfunction
"augroup END
