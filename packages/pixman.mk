PKGNAME=	pixman
PKGROOT=	src/pixman
SRCROOT=	$(PKGROOT)

DEPS=

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--disable-mmx

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	pixman/libpixman-1.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/pixman-1.pc
