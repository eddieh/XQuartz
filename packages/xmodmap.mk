PKGNAME=	xmodmap
PKGROOT=	src/xorg/app/xmodmap
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xmodmap
INST_ARTIFACT=	$(REL_PREFIX)/bin/xmodmap
