PKGNAME=	mkfontscale
PKGROOT=	src/xorg/app/mkfontscale
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libfontenc freetype2

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--with-bzip2

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	mkfontscale
INST_ARTIFACT=	$(REL_PREFIX)/bin/mkfontscale
