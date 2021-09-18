PKGNAME=	xf86-input-void
PKGROOT=	src/xorg/driver/xf86-input-void
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto xorg-server

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/void_drv.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/xorg/modules/input/void_drv.la
