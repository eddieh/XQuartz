PKGNAME=	libXaw
PKGROOT=	src/xorg/lib/libXaw
SRCROOT=	$(PKGROOT)

DEPS=		libXpm libXmu libXt libXext libX11 xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXaw6.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xaw6.pc
