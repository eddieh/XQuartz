PKGNAME=	libXt
PKGROOT=	src/xorg/lib/libXt
SRCROOT=	$(PKGROOT)

DEPS=		libSM libICE libX11 xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXt.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xt.pc
