PKGNAME=	libXtst
PKGROOT=	src/xorg/lib/libXtst
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext libXi

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXtst.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xtst.pc
