#!/usr/bin/python
#--*-- encoding: utf-8 --*--

import sys
from dbfpy import dbf
from types import *

db = dbf.Dbf(sys.argv[1])
newDB=dbf.Dbf(sys.argv[2], new=True)

for f in db.header.fields:
   newDB.addField(f)

for rec in db:
   r=newDB.newRecord()
   newData=[]
   for f in rec.fieldData:
      if type(f)==StringType:
         f=unicode(f,'utf-8')
         f=f.encode('windows-1251')
      newData.append(f)
   r.fieldData=newData
   r.store()

db.close()
newDB.close()