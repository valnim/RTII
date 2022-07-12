# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

from scipy import signal
import matplotlib.pyplot as plt

a = 10
sys = signal.TransferFunction([1], [1, 2 * a, a*a, 0])

w, mag, phase = signal.bode(sys)
w2, H = signal.freqresp(sys)


plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.grid("on")
plt.title("Bode Magnitude Plot")
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
plt.grid("on")
plt.title("Phase")
plt.figure()
plt.plot(H.real, H.imag, "b")
plt.plot(H.real, -H.imag, "r")
plt.grid("on")

plt.title("Ortskurve")
plt.show()