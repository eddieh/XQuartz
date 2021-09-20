PKGNAME=	smproxy
PKGROOT=	src/xorg/app/smproxy
SRCROOT=	$(PKGROOT)

DEPS=		libSM libICE libXt libXmu

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	smproxy
INST_ARTIFACT=	$(REL_PREFIX)/bin/smproxy
