PKGNAME=	xrdb
PKGROOT=	src/xorg/app/xrdb
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xrdb
INST_ARTIFACT=	$(REL_PREFIX)/bin/xrdb
