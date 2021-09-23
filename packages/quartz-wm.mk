PKGNAME=	quartz-wm
PKGROOT=	src/xorg/app/quartz-wm
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11 libXext libXinerama libXrandr \
		pixman libAppleWM

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--with-bundle-id-prefix=${IDENTIFIER_PREFIX}

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/quartz-wm
INST_ARTIFACT=	$(REL_PREFIX)/bin/quartz-wm
