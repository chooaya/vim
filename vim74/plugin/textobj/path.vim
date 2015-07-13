" textobj-path - Text objects for file paths
" Version: 0.0.1
" Copyright (C) 2014 Yu Huang
" License: So-called MIT/X license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_textobj_path')
  finish
endif

call textobj#user#plugin('path', {
\      'next_path': {
\        'select-a': 'ap', '*select-a-function*': 'textobj#path#select_ap',
\        'select-i': 'ip', '*select-i-function*': 'textobj#path#select_ip',
\      },
\      'prev_path': {
\        'select-a': 'aP', '*select-a-function*': 'textobj#path#select_aP',
\        'select-i': 'iP', '*select-i-function*': 'textobj#path#select_iP',
\      },
\    })

let g:loaded_textobj_path = 1

" __END__
" vim: foldmethod=marker