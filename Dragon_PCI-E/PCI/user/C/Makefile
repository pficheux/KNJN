CC= gcc

PROGS= pci_time_test

all: $(PROGS)

clean:
	rm -f $(PROGS) *~

.c:
	$(CC) -Wall -o $@ $< -lrt