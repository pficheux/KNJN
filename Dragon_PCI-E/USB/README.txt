USB test for DragonPCI-E
========================

Here are some Linux examples for DragonPCI-E USB interface

bidir	      	    bidirectionnal example
blinkleds+LCD	    Leds + text LCD example
utils		    The 'cycfx2prog' utility

Most of examples are provided as kernel driver and libusb (1.x) program.

DragonPCI-E needs a firmware to load in FX2 USB interface. That firmware is
copyrighted by KNJN and *not* available with the Linux examples.

If you get firmware (FX2_init.hex) from KNJN, you can load it with the 
"cycfx2prog" available from http://www.triplespark.net/elec/periph/USB-FX2/software or in the 'utils' directory.
 
# cycfx2prog --list
# cycfx2prog -d=003.002 prg:FX2_init.hex run

Enjoy

PF
07/2014


