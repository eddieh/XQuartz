PKGNAME=	sessreg
PKGROOT=	src/xorg/app/sessreg
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	sessreg
INST_ARTIFACT=	$(REL_PREFIX)/bin/sessreg
