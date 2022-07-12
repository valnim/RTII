# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

from scipy import signal
import matplotlib.pyplot as plt
import control as cr
import numpy as np

#g = signal.TransferFunction([1], [1, 1, 0, 0]) #G(s) = 1/s^2/(s+1)

g = cr.tf(np.array([1]), np.array([1, 1, 0, 0]))
r = cr.tf(np.array([2]), np.array([1]))

sys = cr.series(g, r)

w, mag, phase = signal.bode(sys)
w2, H = signal.freqresp(sys)


plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.grid("on")
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
plt.grid("on")
plt.figure()
plt.plot(H.real, H.imag, "b")
plt.plot(H.real, -H.imag, "r")
plt.grid("on")
plt.show()