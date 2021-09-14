PKGNAME=	libXrandr
PKGROOT=	src/xorg/lib/libXrandr
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext libXrender

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXrandr.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xrandr.pc
