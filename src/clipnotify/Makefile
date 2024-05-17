PREFIX ?= ${HOME}/.local

x11_bsd_flags = -I/usr/X11R6/include -L/usr/X11R6/lib

all:
	${CC} ${CFLAGS} ${LDFLAGS} clipnotify.c -o clipnotify2 $(x11_bsd_flags) -lX11 -lXfixes

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f clipnotify2 ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/clipnotify2

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/clipnotify2

clean:
	rm -f *.o *~ clipnotify2
