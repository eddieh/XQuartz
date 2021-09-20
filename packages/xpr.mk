PKGNAME=	xpr
PKGROOT=	src/xorg/app/xpr
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xpr
INST_ARTIFACT=	$(REL_PREFIX)/bin/xpr
