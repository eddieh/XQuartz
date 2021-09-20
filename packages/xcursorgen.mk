PKGNAME=	xcursorgen
PKGROOT=	src/xorg/app/xcursorgen
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXcursor libpng16

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xcursorgen
INST_ARTIFACT=	$(REL_PREFIX)/bin/xcursorgen
