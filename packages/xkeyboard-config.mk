PKGNAME=	xkeyboard-config
PKGROOT=	src/xkeyboard-config
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/pkgconfig/xkeyboard-config.pc
