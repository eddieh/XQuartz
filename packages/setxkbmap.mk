PKGNAME=	setxkbmap
PKGROOT=	src/xorg/app/setxkbmap
SRCROOT=	$(PKGROOT)

DEPS=		libkbfile libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	setxkbmap
INST_ARTIFACT=	$(REL_PREFIX)/bin/setxkbmap
