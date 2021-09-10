PKGNAME=	libxcb-errors
PKGROOT=	src/xorg/lib/libxcb-errors
SRCROOT=	$(PKGROOT)

DEPS=		libxcb xcb-proto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libxcb-errors.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-errors.pc
