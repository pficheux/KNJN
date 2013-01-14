prefix		:= $(shell xeno-config --prefix)

ifeq ($(prefix),)
$(error Please add <xenomai-install-path>/bin to your PATH variable)
endif

PWD		:= $(shell pwd)
# ADEOS/Xenomai compatible kernel sources path
KDIR=$(HOME)/Enseignement/cours-tr-pf/exercices/buildroot/buildroot-ow/output/build/linux-2.6.34.5
#KDIR= $(HOME)/developpement/Perso/github/KNJN/Dragon_PCI/PCI/RTDM/buildroot-ow/output/build/linux-2.6.34.5

EXTRA_CFLAGS 	+= $(shell xeno-config --skin=posix --cflags)

# on gcc 4.6 to avoid warnings.
#EXTRA_CFLAGS	+= -Wno-unused-but-set-variable

obj-m += pci_io_rtdm.o

all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
	depmod -a

clean:
	rm -f *~ Module.markers Module.symvers modules.order
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
