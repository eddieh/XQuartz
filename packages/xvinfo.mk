PKGNAME=	xvinfo
PKGROOT=	src/xorg/app/xvinfo
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXv

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xvinfo
INST_ARTIFACT=	$(REL_PREFIX)/bin/xvinfo
