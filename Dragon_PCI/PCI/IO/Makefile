KDIR= /lib/modules/$(shell uname -r)/build
#KDIR= $(HOME)/OpenWide/Stages/buildroot-ow/output/build/linux-2.6.34.5
#KDIR=$(HOME)/Enseignement/cours-epita-pf/2011/GISTR/LIRT/KNJN/buildroot-ow/output/build/linux-2.6.34.5

PWD= $(shell pwd)

obj-m := dragon_pci_io.o

all: $(USER_PROG)
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install

clean:
	rm -f *~ Module.markers Modules.symvers
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

