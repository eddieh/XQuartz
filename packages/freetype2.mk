PKGNAME=	freetype2
PKGROOT=	src/freetype2
SRCROOT=	$(PKGROOT)

DEPS=		libpng16

BUILD_FLAVOR=	freetype2-autogen
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	objs/libfreetype.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/freetype2.pc
