PKGNAME=	libXres
PKGROOT=	src/xorg/lib/libXres
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXRes.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xres.pc
