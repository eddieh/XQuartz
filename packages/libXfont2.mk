PKGNAME=	libXfont2
PKGROOT=	src/xorg/lib/libXfont2
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libxtrans libfontenc

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	libXfont2.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xfont2.pc
