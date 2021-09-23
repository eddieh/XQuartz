PKGNAME=	xinput
PKGROOT=	src/xorg/app/xinput
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext libXi libXrandr libXinerama

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/xinput
INST_ARTIFACT=	$(REL_PREFIX)/bin/xinput
