PKGNAME=	xterm
PKGROOT=	src/xterm
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXt libXpm libXinerama libXext

BUILD_FLAVOR=	configure
BUILD_STYLE=	make

CONFIG_OPTS=	--mandir=${PREFIX}/share/man \
		--enable-wide-chars \
		--enable-luit \
		--enable-256-color \
		--enable-logging \
		--enable-load-vt-fonts \
		--x-include=${PREFIX}/include \
		--x-lib=${PREFIX}/lib \
		--with-app-defaults=${PREFIX}/share/X11/app-defaults

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xterm
INST_ARTIFACT=	$(REL_PREFIX)/bin/xterm
