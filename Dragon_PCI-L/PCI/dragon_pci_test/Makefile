CC= gcc

PROGS= dragon_pci_test

all: $(PROGS)

install:
	cp $(PROGS) /usr/local/bin

clean:
	rm -f $(PROGS) *~

.c:
	$(CC) -Wall -o $@ $<
