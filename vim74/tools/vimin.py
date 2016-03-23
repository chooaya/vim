import sys
import vim
s = vim.bindeval('s:')
l = vim.bindeval('l:')
a = vim.bindeval('a:')
pythontoolspath = l['pythontoolspath']
print a['prog']
