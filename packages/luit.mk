PKGNAME=	luit
PKGROOT=	src/xorg/app/luit
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	luit
INST_ARTIFACT=	$(REL_PREFIX)/bin/luit
