PKGNAME=	libXxf86vm
PKGROOT=	src/xorg/lib/libXxf86vm
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libXxf86vm.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xxf86vm.pc
