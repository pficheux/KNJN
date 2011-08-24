CC= gcc
CFLAGS= -g

PROG= dragon-ctrl

OBJS= dragon-ctrl.o bitfile.o

$(PROG): $(OBJS)
	$(CC) -o $@ $(OBJS) -lusb

clean:
	rm -f *~ $(PROG) $(OBJS)
