PKGNAME=	libXcomposite
PKGROOT=	src/xorg/lib/libXcomposite
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXfixes

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXcomposite.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcomposite.pc
