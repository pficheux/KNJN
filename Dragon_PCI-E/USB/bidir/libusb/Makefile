CC=gcc
CFLAGS= -Wall

PROG=  libusbbidir

OBJS= libusbbidir.o


all: $(PROG)

clean: 
	rm -f *~ $(OBJS) $(PROG)

$(PROG) : $(OBJS)
	$(CC) -o $@ $(OBJS) -lusb-1.0
