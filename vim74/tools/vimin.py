import sys
import vim
s = vim.bindeval('s:')
a = vim.bindeval('a:')
print a['prog']
