PKGNAME=	xgamma
PKGROOT=	src/xorg/app/xgamma
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXxf86vm

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xgamma
INST_ARTIFACT=	$(REL_PREFIX)/bin/xgamma
