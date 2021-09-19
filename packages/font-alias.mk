PKGNAME=	font-alias
PKGROOT=	src/xorg/font/alias
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros font-util

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	100dpi/fonts.alias
INST_ARTIFACT=	$(REL_PREFIX)/share/fonts/X11/100dpi/fonts.alias
