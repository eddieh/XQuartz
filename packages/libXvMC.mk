PKGNAME=	libXvMC
PKGROOT=	src/xorg/lib/libXvMC
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext libXv

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXvMC.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xvmc.pc
