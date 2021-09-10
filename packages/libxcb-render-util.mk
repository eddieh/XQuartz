PKGNAME=	libxcb-render-util
PKGROOT=	src/xorg/lib/libxcb-render-util
SRCROOT=	$(PKGROOT)

DEPS=		libxcb

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	renderutil/libxcb-render-util.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-renderutil.pc
