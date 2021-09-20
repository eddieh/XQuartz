PKGNAME=	xprop
PKGROOT=	src/xorg/app/xprop
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xprop
INST_ARTIFACT=	$(REL_PREFIX)/bin/xprop
