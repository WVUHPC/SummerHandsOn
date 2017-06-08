#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt

fig,ax=plt.subplots(2,1, figsize=(11.69, 8.27), dpi=100)

plt.subplots_adjust(left=0.05, bottom=0.1, right=0.98, top=0.98, 
                    wspace=None, hspace=None)

idata=np.loadtxt('Input_FFT.dat')
ax[0].plot(idata[:,0])
ax[0].plot(idata[:,1])
ax[0].plot(idata[:,2])
ax[0].set_xlim(0,10000)

odata=np.loadtxt('Output_FFT.dat')
ax[1].plot(odata[:,0])
ax[1].plot(odata[:,1])
ax[1].plot(odata[:,2])
ax[1].set_xlim(0,60)

fig.savefig('example_fft.pdf')
