import sys
import vim
import importlib
s = vim.bindeval('s:')
l = vim.bindeval('l:')
a = vim.bindeval('a:')
g = vim.bindeval('g:')
sys.path.append(l['pythontoolspath'])
i = importlib.import_module(a['prog'])
ret = i.main(l['stdin'])
l['stdin'] = ret
