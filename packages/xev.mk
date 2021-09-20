PKGNAME=	xev
PKGROOT=	src/xorg/app/xev
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libXrandr

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xev
INST_ARTIFACT=	$(REL_PREFIX)/bin/xev
