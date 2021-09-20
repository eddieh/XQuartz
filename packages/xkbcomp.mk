PKGNAME=	xkbcomp
PKGROOT=	src/xorg/app/xkbcomp
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libxkbfile

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xkbcomp
INST_ARTIFACT=	$(REL_PREFIX)/bin/xkbcomp
