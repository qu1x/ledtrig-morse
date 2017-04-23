ifndef KVER
KVER := $(shell uname -r)
endif
ifndef KDIR
KDIR := /lib/modules/$(KVER)/build
endif

ifndef TVER
TVER := $(shell echo $(KVER) | sed -E 's/([^.]+\.[^.]+).*/\1/')
endif
ifndef TDIR
TDIR := /usr/src/linux-source-$(TVER)
endif

ifndef MDIR
MDIR := kernel/drivers/leds/trigger
endif

obj-m := ledtrig-morse.o

ccflags-y := -I$(TDIR)/drivers/leds

default:
	$(MAKE) -C $(KDIR) M=$$PWD modules

install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install INSTALL_MOD_DIR=$(MDIR)
	depmod

uninstall:
	rm -f $(dir $(KDIR))$(MDIR)/$(obj-m:.o=.ko)
	depmod

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

.PHONY: default install uninstall clean

Makefile:;
