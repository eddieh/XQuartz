PKGNAME=	libXmu
PKGROOT=	src/xorg/lib/libXmu
SRCROOT=	$(PKGROOT)

DEPS=		libXt libXext libX11 xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXmu.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xmu.pc
