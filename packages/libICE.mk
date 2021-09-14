PKGNAME=	libICE
PKGROOT=	src/xorg/lib/libICE
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libICE.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/ice.pc
