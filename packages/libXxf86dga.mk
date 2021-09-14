PKGNAME=	libXxf86dga
PKGROOT=	src/xorg/lib/libXxf86dga
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXxf86dga.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xxf86dga.pc
