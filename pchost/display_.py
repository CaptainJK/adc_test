import serial
import numpy as np
import wx
from pchostgui import PCHostGUI
import matplotlib
matplotlib.use('wxagg')
from matplotlib.backends.backend_wxagg import FigureCanvasWxAgg
from matplotlib.backends.backend_wxagg import NavigationToolbar2WxAgg
from matplotlib.figure import Figure

class GUI(PCHostGUI):
    def __init__(self, *args, **kwargs):
        super(GUI, self).__init__(*args, **kwargs)

        # self.figure = Figure()
        # self.axes = self.figure.add_subplot(111)
        # self.plot_canvas = FigureCanvasWxAgg(self.m_panel1, -1, self.figure)
        # self.plot_toolbar = NavigationToolbar2WxAgg(self.plot_canvas)
        # self.bSizer1.Add( self.plot_toolbar, 0, wx.ALL|wx.EXPAND, 5 )
        # self.bSizer1.Add( self.plot_canvas, 10, wx.ALL|wx.EXPAND, 5 )

        # self.sliders = []
        # self.plot_line, = self.axes.plot([], [])

    def StartCapture(self, event):
        t = np.linspace(0, 6 * np.pi, 256)
        f = np.sin(t + np.random.rand(1)[0])
        self.plot_line.set_data(t, f)
        self.axes.relim()
        self.axes.autoscale_view(True, True, True)
        self.figure.canvas.draw()

if __name__ == '__main__':
    app = wx.App()
    frame = GUI(None)
    frame.Show()
    app.MainLoop()