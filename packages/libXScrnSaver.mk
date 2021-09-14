PKGNAME=	libXScrnSaver
PKGROOT=	src/xorg/lib/libXScrnSaver
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXss.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xscrnsaver.pc
