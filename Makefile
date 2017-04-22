KVER ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KVER)/build

TVER ?= $(shell echo $(KVER) | sed -E 's/([^.]+\.[^.]+).*/\1/')
TDIR ?= /usr/src/linux-source-$(TVER)

INSTALL_MOD_DIR := kernel/driver/leds

ccflags-y := -I$(TDIR)/drivers/leds

obj-m := ledtrig-morse.o

.PHONY: default install clean

default:
	$(MAKE) -C $(KDIR) M=$$PWD modules

install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install \
INSTALL_MOD_DIR=$(INSTALL_MOD_DIR)

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

Makefile:;
