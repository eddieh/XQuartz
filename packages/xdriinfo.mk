PKGNAME=	xdriinfo
PKGROOT=	src/xorg/app/xdriinfo
SRCROOT=	$(PKGROOT)

DEPS=

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=

INSTALL_TARGET=	install-strip

MAKE_ARTIFAC	xdriinfoT=
INST_ARTIFACT=	$(REL_PREFIX)/bin/xdriinfo
