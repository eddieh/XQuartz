PKGNAME=	libxshmfence
PKGROOT=	src/xorg/lib/libxshmfence
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libxshmfence.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xshmfence.pc
