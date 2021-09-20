PKGNAME=	xrefresh
PKGROOT=	src/xorg/app/xrefresh
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xrefresh
INST_ARTIFACT=	$(REL_PREFIX)/bin/xrefresh
