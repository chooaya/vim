#!/usr/bin/python
# -*- coding: utf-8 -*-
# pythondebug.py
import os
import sys
sys.path.append(os.path.join(os.path.realpath( os.path.join(os.getcwd(), os.path.dirname(__file__))), 'pydbgp','bin'))
import pydbgp

param = sys.argv
if len(param) >= 3:
    virargv = ['', '-d',str(param[1]),param[2]]
    try:
        ret = pydbgp.mainc(virargv)
        if ret == 1:
            os.system("python "+param[2])
    except Exception as e:
        pass

