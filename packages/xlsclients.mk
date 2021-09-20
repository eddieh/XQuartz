PKGNAME=	xlsclients
PKGROOT=	src/xorg/app/xlsclients
SRCROOT=	$(PKGROOT)

DEPS=		libxcb

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xlsclients
INST_ARTIFACT=	$(REL_PREFIX)/bin/xlsclients
