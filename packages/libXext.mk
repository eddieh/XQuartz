PKGNAME=	libXext
PKGROOT=	src/xorg/lib/libXext
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans libxcb

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXext.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xext.pc
