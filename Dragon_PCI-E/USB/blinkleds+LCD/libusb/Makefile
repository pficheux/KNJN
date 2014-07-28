CC=gcc
CFLAGS= -Wall

PROGS=  libusblcd libusbleds

all: $(PROGS)

clean: 
	rm -f *~ $(PROGS)

.c :
	$(CC) -o $@ $< -lusb-1.0
