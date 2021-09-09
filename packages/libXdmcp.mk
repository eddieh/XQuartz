PKGNAME=	libXdmcp
PKGROOT=	src/xorg/lib/libXdmcp
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	libXdmcp.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xdmcp.pc
