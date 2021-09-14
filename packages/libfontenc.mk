PKGNAME=	libfontenc
PKGROOT=	src/xorg/lib/libfontenc
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto font-util

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libfontenc.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/fontenc.pc
