PKGNAME=	xset
PKGROOT=	src/xorg/app/xset
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXext libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--without-xf86misc --without-fontcache

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xset
INST_ARTIFACT=	$(REL_PREFIX)/bin/xset
