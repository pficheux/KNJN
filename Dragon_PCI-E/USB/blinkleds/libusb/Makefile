CC=gcc
CFLAGS= -Wall

PROG=  libusbleds

OBJS= libusbleds.o


all: $(PROG)

clean: 
	rm -f *~ $(OBJS) $(PROG)

$(PROG) : $(OBJS)
	$(CC) -o $@ $(OBJS) -lusb-1.0
