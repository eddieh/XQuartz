PKGNAME=	libXrender
PKGROOT=	src/xorg/lib/libXrender
SRCROOT=	$(PKGROOT)

DEPS=		libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXrender.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xrender.pc
