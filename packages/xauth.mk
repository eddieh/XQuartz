PKGNAME=	xauth
PKGROOT=	src/xorg/app/xauth
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXau libXext libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xauth
INST_ARTIFACT=	$(REL_PREFIX)/bin/xauth
