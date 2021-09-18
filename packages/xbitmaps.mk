PKGNAME=	xbitmaps
PKGROOT=	src/xorg/data/bitmaps
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/pkgconfig/xbitmaps.pc
