CC=gcc

all: dragon_usb

dragon_usb: dragon_usb.c
	$(CC) -g -o $@ $< -lusb-1.0

clean: 
	rm -f *~ *.o dragon_usb

