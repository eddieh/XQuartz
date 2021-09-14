PKGNAME=	libdmx
PKGROOT=	src/xorg/lib/libdmx
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libdmx.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/dmx.pc
