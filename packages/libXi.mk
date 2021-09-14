PKGNAME=	libXi
PKGROOT=	src/xorg/lib/libXi
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXfixes

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXi.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xi.pc
