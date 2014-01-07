# vim:ts=4:sw=4:isfname-==

TARGET=finddup.pl
DESTDIR=/usr/local/bin

all:
	@echo use 'make install' to install $(TARGET) to $(DESTDIR)

install:
	cp $(TARGET) $(DESTDIR)
	chmod 755 $(DESTDIR)

