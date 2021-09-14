PKGNAME=	libXv
PKGROOT=	src/xorg/lib/libXv
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXv.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xv.pc
