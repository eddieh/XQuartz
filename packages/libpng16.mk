PKGNAME=	libpng16.mk
PKGROOT=	src/libpng/libpng16
SRCROOT=	$(PKGROOT)

DEPS=

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	libpng16.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/libpng.pc
