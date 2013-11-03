CC=gcc

all: dragon_usb dragon_usb_bidir

dragon_usb: dragon_usb.c
	$(CC) -g -o $@ $< -lusb-1.0

dragon_usb_bidir: dragon_usb_bidir.c
	$(CC) -g -o $@ $< -lusb-1.0

clean: 
	rm -f *~ *.o dragon_usb dragon_usb_bidir

