PKGNAME=	libSM
PKGROOT=	src/xorg/lib/libSM
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans libICE

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libSM.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/sm.pc
