KDIR= /lib/modules/$(shell uname -r)/build
#KDIR= $(HOME)/OpenWide/Stages/buildroot-ow/output/build/linux-2.6.34.5
#KDIR= $(HOME)/Enseignement/cours-epita-pf/2011/GISTR/LIRT/KNJN/buildroot-ow/output/build/linux-2.6.34.5

PWD= $(shell pwd)

obj-m := dragon_usbnet.o

all: sendRawEth recvRawEth
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install

clean:
	rm -f *~ Module.markers Modules.symvers sendRawEth recvRawEth
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

