PKGNAME=	libXfixes
PKGROOT=	src/xorg/lib/libXfixes
SRCROOT=	$(PKGROOT)

DEPS=		libX11 xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXfixes.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xfixes.pc
