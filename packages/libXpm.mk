PKGNAME=	libXpm
PKGROOT=	src/xorg/lib/libXpm
SRCROOT=	$(PKGROOT)

DEPS=		libXt libXext libX11 xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXpm.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xpm.pc
