PKGNAME=	libxcb
PKGROOT=	src/xorg/lib/libxcb
SRCROOT=	$(PKGROOT)

DEPS=		libXau xcb-proto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libxcb.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb.pc
