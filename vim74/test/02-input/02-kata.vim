" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}



function! s:run()
    Is eskk#test#emulate_filter_keys(";q"), ""
    Is eskk#test#emulate_filter_keys("a"), "あ"
    Is eskk#test#emulate_filter_keys(";qa"), "あ"

    Is eskk#test#emulate_filter_keys('qaq'), 'ア'
    Is eskk#test#emulate_filter_keys('qsq'), ''
    Is eskk#test#emulate_filter_keys("qasq"), "ア"
    Is eskk#test#emulate_filter_keys("qasaq"), "アサ"

    Is eskk#test#emulate_filter_keys(';aq'), 'ア'
    Is eskk#test#emulate_filter_keys(';sq'), 's'
    Is eskk#test#emulate_filter_keys(";asq"), "アs"
    Is eskk#test#emulate_filter_keys(";asaq"), "アサ"

    Is eskk#test#emulate_filter_keys(";nq"), "ン"
    Is eskk#test#emulate_filter_keys(";nnq"), "ン"
endfunction

call s:run()
Done


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
