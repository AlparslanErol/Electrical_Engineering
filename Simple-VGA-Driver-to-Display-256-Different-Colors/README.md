# Simple-VGA-Driver-to-Display-256-Different-Colors
Design a VGA driver to display 256 different colors on a monitor. Two timing signals are generated in this system, vsync and hsync to synchronize the plotting of vertical and horizontal pixels, respectively. The color data of each pixel is generated using an 8 bit counter whose first 3-bits are for red, next 3-bits are for green and last 2-bits are for blue color data while the synchronization signals are generated. This way, as the counter counts, 256 different color combinations are displayed on the screen one after another. This counter is implemented on the FPGA board.

### Built With
- [VHDL](https://en.wikipedia.org/wiki/VHDL)
