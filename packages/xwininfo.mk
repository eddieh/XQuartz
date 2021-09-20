PKGNAME=	xwininfo
PKGROOT=	src/xorg/app/xwininfo
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libxcb libxcb-wm

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xwininfo
INST_ARTIFACT=	$(REL_PREFIX)/bin/xwininfo
