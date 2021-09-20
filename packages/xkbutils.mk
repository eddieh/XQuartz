PKGNAME=	xkbutils
PKGROOT=	src/xorg/app/xkbutils
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libXaw libXt libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xkbwatch
INST_ARTIFACT=	$(REL_PREFIX)/bin/xkbwatch
