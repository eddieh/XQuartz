PKGNAME=	libxcb-image
PKGROOT=	src/xorg/lib/libxcb-image
SRCROOT=	$(PKGROOT)

DEPS=		xproto libxcb-util

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	image/libxcb-image.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-image.pc
