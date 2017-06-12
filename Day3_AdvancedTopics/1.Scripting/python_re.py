#!/usr/bin/env python

import re
import numpy as np
import json

rf = open('OUTCAR')
data = rf.read()

# Parsing of the data
kp=re.findall('k-point([\d\s]*):([\d\s.]*)band[\s\w.]*occupation([\s\d:.\-]*)\n\n', data)

# Giving structure to the data
ret=[]
for ikp in kp:
    entry={}
    entry['number']= int(ikp[0])
    entry['position']= [float(x) for x in ikp[1].split()]
    entry['values']= np.array(ikp[2].split()[:48], dtype=float).reshape(-1,3).tolist()
    ret.append(entry)

# Storing the results into a JSON file
wf = open('k-points.json','w')
dp = json.dump(ret, wf, sort_keys=True, indent=4, separators=(',', ': '))
wf.close()
