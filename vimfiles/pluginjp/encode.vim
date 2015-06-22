"=============================================================================
"    Description: UTF-8化と文字コード自動認識設定
"                 http://www.kawaz.jp/pukiwiki/?vimを改変
"         Author: fuenor <fuenor@gmail.com>
"                 http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-utf8
"  Last Modified: 2011-03-06 13:03
"        Version: 1.18
"=============================================================================

let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')
" 制御ファイルの読み出し先設定
if isdirectory($HOME . '/.vim')
  let s:CFGHOME=$HOME.'/.vim'
elseif isdirectory($HOME . '/vimfiles')
  let s:CFGHOME=$HOME.'/vimfiles'
elseif isdirectory($VIM . '/vimfiles')
  let s:CFGHOME=$VIM.'/vimfiles'
endif

" vimfiles (.vim) に特定のファイルが存在する場合は以下のように設定される。
" デフォルトはUTF-8
" --------------------------------------------------------------
" | ファイル名    |                                            |
" |---------------|---------------------------------------------
" | cp932         | 内部エンコーディングをcp932に設定。        |
" --------------------------------------------------------------
if !has('gui_running') && s:MSWindows
  set termencoding=cp932
endif
if filereadable(s:CFGHOME . '/cp932')
  set encoding=cp932
else
  " デフォルト
  set encoding=utf-8
endif

" fileencodingsのデフォルト設定
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

  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let &fileencodings=substitute(&fileencodings, 'iso-2022-jp', 'iso-2022-jp-3', 'g')
    let &fileencodings=substitute(&fileencodings, 'euc-jp', 'euc-jp-ms', 'g')
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let &fileencodings=substitute(&fileencodings, 'iso-2022-jp', 'iso-2022-jp-3', 'g')
    let &fileencodings=substitute(&fileencodings, 'euc-jp', 'euc-jisx0213', 'g')
  endif
endif

unlet s:CFGHOME
let vimrc_set_encoding = 1

" 改行コードの自動認識
" set fileformats=unix,dos,mac

if exists("loaded_ReCheckFENC")
  finish
endif
let loaded_ReCheckFENC = 1

" Windowsで日本語を含まない場合は cp932に設定
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

