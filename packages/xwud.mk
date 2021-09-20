PKGNAME=	xwud
PKGROOT=	src/xorg/app/xwud
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xwud
INST_ARTIFACT=	$(REL_PREFIX)/bin/xwud
