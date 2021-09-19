PKGNAME=	iceauth
PKGROOT=	src/xorg/app/iceauth
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	iceauth
INST_ARTIFACT=	$(REL_PREFIX)/bin/iceauth
