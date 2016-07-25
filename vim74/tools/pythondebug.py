#!/usr/bin/python
# -*- coding: utf-8 -*-
# pythondebug.py
import os
import StringIO
import sys
sys.path.append(os.path.join(os.path.realpath( os.path.join(os.getcwd(), os.path.dirname(__file__))), 'pydbgp','bin'))
import pydbgp


#output = StringIO.StringIO()
#sys.stdout = output
print('Loading function')
param = sys.argv
if len(param) >= 3:
    virargv = ['', '-d',str(param[1]),param[2]]
    try:
        ret = pydbgp.mainc(virargv)
        #sys.stdout = sys.__stdout__
        if ret == 1:
            print(ret)
    except Exception as e:
        pass

