PKGNAME=	font-util
PKGROOT=	src/xorg/font/util
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/fontutil.pc
