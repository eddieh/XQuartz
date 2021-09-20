PKGNAME=	xsetroot
PKGROOT=	src/xorg/app/xsetroot
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXmu libXcursor xbitmaps

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xsetroot
INST_ARTIFACT=	$(REL_PREFIX)/bin/xsetroot
