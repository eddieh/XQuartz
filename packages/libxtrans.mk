PKGNAME=	libxtrans
PKGROOT=	src/xorg/lib/libxtrans
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/pkgconfig/xtrans.pc
