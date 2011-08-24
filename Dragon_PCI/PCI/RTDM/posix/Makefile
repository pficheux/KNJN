prefix := $(shell xeno-config --prefix)

ifeq ($(prefix),)
$(error Please add <xenomai-install-path>/bin to your PATH variable)
endif

CC := $(shell xeno-config --skin=posix --cc)
STD_CFLAGS  := $(shell xeno-config --skin=posix --cflags) -g
STD_LDFLAGS := $(shell xeno-config --skin=posix --ldflags) -g -lrtdm
STD_TARGETS := xenomai_pci

EXTRA_CFLAGS := -I../driver/

all: $(STD_TARGETS)

$(STD_TARGETS): $(STD_TARGETS:%=%.c)
	$(CC) -o $@ $< $(STD_CFLAGS) $(STD_LDFLAGS) $(EXTRA_CFLAGS)

clean:
	$(RM) -f *.o *~ $(STD_TARGETS)
