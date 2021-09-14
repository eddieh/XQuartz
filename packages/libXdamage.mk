PKGNAME=	libXdamage
PKGROOT=	src/xorg/lib/libXdamage
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXfixes

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXdamage.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xdamage.pc
