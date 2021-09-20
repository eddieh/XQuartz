PKGNAME=	xhost
PKGROOT=	src/xorg/app/xhost
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libXau libxtrans

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xhost
INST_ARTIFACT=	$(REL_PREFIX)/bin/xhost
