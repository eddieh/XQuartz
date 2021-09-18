PKGNAME=	xf86-video-dummy
PKGROOT=	src/xorg/driver/xf86-video-dummy
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto xorg-server

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/dummy_drv.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/xorg/modules/drivers/dummy_drv.la
