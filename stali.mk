ROOT=..

include $(ROOT)/config.mk

all:
	@$(MAKE) || exit
	@echo done

install:
	@mkdir -p $(DESTDIR)/boot
	@cp arch/x86_64/boot/bzImage $(DESTDIR)/boot/vmlinuz
	@cp System.map $(DESTDIR)/boot/
	@cp .config $(DESTDIR)/boot/config
	@echo installed

uninstall:
	@rm -f $(DESTDIR)/boot/vmlinuz
	@rm -f $(DESTDIR)/boot/System.map
	@rm -f $(DESTDIR)/boot/config
	@echo uninstalled

clean:
	@$(MAKE) clean
	echo cleaned

.PHONY: all install clean
