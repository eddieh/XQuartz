PKGNAME=	libxcb-util
PKGROOT=	src/xorg/lib/libxcb-util
SRCROOT=	$(PKGROOT)

DEPS=

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libxcb-util.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-util.pc
