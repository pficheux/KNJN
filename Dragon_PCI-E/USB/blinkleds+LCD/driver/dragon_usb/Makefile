# Run this Makefile as follows:
# (MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
#

#KDIR= /lib/modules/$(shell uname -r)/build
KDIR= $(HOME)/form-letr-inter/exercices/linux-2a8d45ec0883e3cbdce920855b3461ac77308a5f
PWD= $(shell pwd)

obj-m := dragon_usb.o

all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
	depmod -a

clean:
	rm -f *~ Module.markers Modules.symvers
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

