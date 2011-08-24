CC=  i686-pc-mingw32-gcc

PROGS= USB_IO8.exe USB_regs.exe LCD_Text.exe

all: $(PROGS)

clean:
	rm -rf *~ $(PROGS)

%.exe : %.c
	$(CC) -o $@ $<


