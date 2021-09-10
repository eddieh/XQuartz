PKGNAME=	libxcb-cursor
PKGROOT=	src/xorg/lib/libxcb-cursor
SRCROOT=	$(PKGROOT)

DEPS=		libxcb libxcb-util libxcb-render-util libxcb-image

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	image/libxcb-cursor.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-cursor.pc
