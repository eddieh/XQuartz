PKGNAME=	xrandr
PKGROOT=	src/xorg/app/xrandr
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXrender libXrandr

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xrandr
INST_ARTIFACT=	$(REL_PREFIX)/bin/xrandr
