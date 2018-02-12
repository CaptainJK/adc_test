#!/usr/bin/env python

import numpy as np
import serial.tools.list_ports as lp
import struct
import argparse
import numpy as np
from tqdm import tqdm
from serial import Serial
from collections import Counter

CAP_VALS = 1024

def get_dev(pid):
    for i in lp.comports():
        if i.pid == pid:
            return i.device
    return None

def get_chunk(s, sz, chn):
    s.flush()
    s.write(struct.pack('<2BHB', 0xAA, 0xAA, sz, chn))
    data = s.read(sz * 2)
    return struct.unpack('<{}H'.format(sz), data)

def process(dev_pid, itr, chn):
    dev = get_dev(dev_pid)

    if dev:
        d = []
        for i in tqdm(range(itr)):
            s = Serial(dev)
            s.timeout = 1
            ret = get_chunk(s, CAP_VALS, chn)
            s.close()

            if len(ret) == CAP_VALS:
                d.append(ret)
        
        return d

    else:
        return None

def calc_rmse(d_flat):
    a = np.array(d_flat)
    mean = np.argmax(np.bincount(a))
    ret = np.sqrt(np.sum((a - mean) ** 2.) / len(a))
    return ret

if __name__ == '__main__':
    p = argparse.ArgumentParser(description='Process some integers.')
    p.add_argument('n', type=int, help='The number of acquisition iterations')
    p.add_argument('--pid', type=lambda x: int(x, 0), default=0x5740, help='USB PID')
    p.add_argument('--ch', type=int, default=0, choices=[0, 1, 2, 3, 4], help='ADC channel (0..4)')
    args = p.parse_args()

    d = process(args.pid, args.n, args.ch)

    if d:
        d_flat = [item for sublist in d for item in sublist]
        print(Counter(d_flat))
        print('Mean value: {}'.format(np.argmax(np.bincount(d_flat))))
        print('Swing: {}'.format(np.max(d_flat) - np.min(d_flat)))
        print('RMSE: {}'.format(calc_rmse(d_flat)))
    else:
        print('Device not found!')
