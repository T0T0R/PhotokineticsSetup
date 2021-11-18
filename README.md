# PhotokineticsSetup
A microcontroller (STM32F103C8) drives at the same time an Hamamatsu lamp through its RS232 interface, and two flip mounts MFF101 via TTL inputs.

## Installation
This script works with Python 3.9.
The pySerial library must be installed in order to achieve serial communication with the microcontroler:
```
python -m pip install pyserial
```
The Tkinter GUI is used in this program. There shouldn't be any need to install it since it is an integral part of most of Python installations.
