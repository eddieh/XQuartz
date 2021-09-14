PKGNAME=	libFS
PKGROOT=	src/xorg/lib/libFS
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libFS.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/libfs.pc
