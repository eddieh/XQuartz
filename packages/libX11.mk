PKGNAME=	libX11
PKGROOT=	src/xorg/lib/libX11
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans libxcb

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libX11.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/x11.pc
