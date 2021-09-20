PKGNAME=	xlsatoms
PKGROOT=	src/xorg/app/xlsatoms
SRCROOT=	$(PKGROOT)

DEPS=		libxcb

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xlsatoms
INST_ARTIFACT=	$(REL_PREFIX)/bin/xlsatoms
