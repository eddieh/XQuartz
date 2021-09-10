PKGNAME=	libxcb-wm
PKGROOT=	src/xorg/lib/libxcb-wm
SRCROOT=	$(PKGROOT)

DEPS=		libXau xcb-proto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	ewmh/libxcb-ewmh.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-ewmh.pc
