KDIR= /lib/modules/$(shell uname -r)/build

PWD= $(shell pwd)

obj-m := dragon_pci_mem.o

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

clean:
	rm -f *~ Module.markers Modules.symvers
	$(MAKE) -C $(KDIR) M=$(PWD) clean

