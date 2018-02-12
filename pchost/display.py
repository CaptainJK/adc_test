import serial
import numpy as np
import struct
import matplotlib.pyplot as plt

plt.ion()
dev = '/dev/ttyACM0'

def bldc_plot(dev):
    m, a, b, c = bldc_log(dev)
    plt.plot(a)
    plt.plot(b)
    plt.plot(c)
    plt.plot(m)
    return m, a, b, c


def bldc_preset(dev, pwm=3000, t_spinup=[10, 5, 3, 1]):
    s = serial.Serial(dev)
    msg = struct.pack('<BBBB{}B'.format(len(t_spinup)), 0xAA, 0xAA, len(t_spinup) + 1, len(t_spinup), *t_spinup)
    s.write(msg)
    s.close()

def bldc_log(dev):
    s = serial.Serial(dev)
    s.flush()
    d = []
    try:
        while True:
            d.extend(s.read(2 * 64 * 4))
    except KeyboardInterrupt:
        s.close()
        ret = np.fromstring(''.join(d), dtype='int16')
        a = ret[0::4]
        b = ret[1::4]
        c = ret[2::4]
        mdl = ret[3::4]
        return (a.astype('float'), b.astype('float'), c.astype('float'), mdl.astype('float'))
