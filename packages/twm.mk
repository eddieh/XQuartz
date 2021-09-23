PKGNAME=	twm
PKGROOT=	src/xorg/app/twm
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXext libXt libXmu libICE \
		libSM libXrandr

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/twm
INST_ARTIFACT=	$(REL_PREFIX)/bin/twm
