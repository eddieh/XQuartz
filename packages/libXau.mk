PKGNAME=	libXau
PKGROOT=	src/xorg/lib/libXau
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	libXau.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xau.pc
