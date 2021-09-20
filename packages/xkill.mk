PKGNAME=	xkill
PKGROOT=	src/xorg/app/xkill
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xkill
INST_ARTIFACT=	$(REL_PREFIX)/bin/xkill
