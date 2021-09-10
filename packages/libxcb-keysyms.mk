PKGNAME=	libxcb-keysyms
PKGROOT=	src/xorg/lib/libxcb-keysyms
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	keysyms/libxcb-keysyms.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-keysyms.pc
