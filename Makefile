# vim:ts=4:sw=4:isfname-==

SOURCE=dupious
DESTDIR=/usr/local/bin

all:
	@echo use 'make install' to install $(SOURCE) to $(DESTDIR)

install:
	install $(SOURCE) $(DESTDIR)

