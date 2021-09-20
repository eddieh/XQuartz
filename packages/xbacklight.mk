PKGNAME=	xbacklight
PKGROOT=	src/xorg/app/xbacklight
SRCROOT=	$(PKGROOT)

DEPS=		libxcb libXrandr

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xbacklight
INST_ARTIFACT=	$(REL_PREFIX)/bin/xbacklight
