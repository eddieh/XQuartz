PKGNAME=	libXcursor
PKGROOT=	src/xorg/lib/libXcursor
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXrender libXfixes

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXcursor.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcursor.pc
