" vim:foldmethod=marker:fen:
scriptencoding utf-8
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}



function! s:run()
    call simpletap#is(eskk#util#mb_strlen('あいうえお'), 5)
    call simpletap#is(eskk#util#mb_strlen(''), 0)
    call simpletap#is(eskk#util#mb_strlen('あ'), 1)
    call simpletap#is(eskk#util#mb_strlen('あa'), 2)
    call simpletap#is(eskk#util#mb_strlen('aあ'), 2)
    call simpletap#is(eskk#util#mb_strlen('aあb'), 3)

    call simpletap#is(eskk#util#mb_chop('あいうえお'), 'あいうえ')
    call simpletap#is(eskk#util#mb_chop(''), '')
endfunction


call s:run()
Done


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
