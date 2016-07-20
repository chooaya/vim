"===================================================================
" 一度だけ実行する
"===================================================================
if exists("b:did_ftplugin_python")
  finish
endif
let b:did_ftplugin_python = 1

"===================================================================
" タブをスペース4つ分に展開
"===================================================================
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

"===================================================================
" vim-indent-guides
"===================================================================
" indent-guides を有効にする
IndentGuidesEnable

" 1インデント目からガイドする
let g:indent_guides_start_level = 1
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" 奇数インデントのガイドカラー
hi IndentGuidesOdd  ctermbg=green
" 偶数インデントのガイドカラー
hi IndentGuidesEven ctermbg=black

" ハイライト色の変化の幅 (Terminal では未サポート)
"let g:indent_guides_color_change_percent = 20
" ガイドの幅
let g:indent_guides_guide_size = 1
" ガイド幅をインデント幅に合わせる
"let g:indent_guides_guide_size = &tabstop
