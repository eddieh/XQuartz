PKGNAME=	xkbevd
PKGROOT=	src/xorg/app/xkbevd
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libxkbfile

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xkbevd
INST_ARTIFACT=	$(REL_PREFIX)/bin/xkbevd
