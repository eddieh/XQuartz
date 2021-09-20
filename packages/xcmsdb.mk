PKGNAME=	xcmsdb
PKGROOT=	src/xorg/app/xcmsdb
SRCROOT=	$(PKGROOT)

DEPS=		libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xcmsdb
INST_ARTIFACT=	$(REL_PREFIX)/bin/xcmsdb
