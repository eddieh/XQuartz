PKGNAME=	xmessage
PKGROOT=	src/xorg/app/xmessage
SRCROOT=	$(PKGROOT)

DEPS=		libXaw libXt

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xmessage
INST_ARTIFACT=	$(REL_PREFIX)/bin/xmessage
