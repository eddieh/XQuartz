PKGNAME=	xinit
PKGROOT=	src/xorg/app/xinit
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libX11

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--without-launchd \
		--with-bundle-id-prefix=$(IDENTIFIER_PREFIX)

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xinit
INST_ARTIFACT=	$(REL_PREFIX)/bin/xinit
