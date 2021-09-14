PKGNAME=	libxkbfile
PKGROOT=	src/xorg/lib/libxkbfile
SRCROOT=	$(PKGROOT)

DEPS=		libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libxkbfile.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xkbfile.pc
