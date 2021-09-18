PKGNAME=	xf86-video-nested
PKGROOT=	src/xorg/driver/xf86-video-nested
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto xorg-server libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/nested_drv.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/xorg/modules/drivers/nested_drv.la
