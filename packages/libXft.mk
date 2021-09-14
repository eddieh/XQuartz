PKGNAME=	libXft
PKGROOT=	src/xorg/lib/libXft
SRCROOT=	$(PKGROOT)

DEPS=		libXrender freetype2 fontconfig

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXft.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xft.pc
