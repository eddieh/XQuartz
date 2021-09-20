PKGNAME=	xwd
PKGROOT=	src/xorg/app/xwd
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xwd
INST_ARTIFACT=	$(REL_PREFIX)/bin/xwd
