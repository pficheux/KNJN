Here is a Linux USB driver for KNJN Dragon-E. You can use the following design files :

- FX2_LEDs_Dragon-E.bit for leds
- FX2_TextLCD.bit for text LCD 

You can control V2 and V3 by sending hex value to Dragon-E through the driver. You can also control text LCD (HD44780) as described in http://www.knjn.com/FPGA-PCI-LCD.html.

You can compile the driver with :

$ make

You can load it with :

# insmod dragon_usb.ko

Once driver is loaded, you can access Dragon-E with both /sys entry or /dev/dragon_usb0. Don't forget to load  design file *before* loading Linux driver ! 

You control board by sending hex value (32 bits max) or ONE char, examples :

# echo -n 61 > /dev/dragon_usb0 -> will display 'a'
# echo -n \'a > /dev/dragon_usb0 -> will display 'a'

You should send the following values to set leds on:

    0x1 for V2
    0x2 for V3

examples:

# echo 3 > /sys/bus/usb/drivers/dragon_usb/3-2\:1.0/ledmask 
# cat /sys/bus/usb/drivers/dragon_usb/3-2\:1.0/ledmask 
0x3

# echo 3 > /dev/dragon_usb0

- LCD test (FX2_TextLCD.bit) :

Just try the lcd_test.sh script as follows :

# ./lcd_test.sh > /dev/dragon_usb0

It should display "Hello Linux!" on the LCD screen. You can also give a
string as parameter :

# ./lcd_test.sh "A sample string" > /dev/dragon_usb0


Enjoy.

PF
07/2014 
