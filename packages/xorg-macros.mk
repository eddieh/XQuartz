PKGNAME=	xorg-macros
PKGROOT=	src/xorg/util/macros
SRCROOT=	$(PKGROOT)

BIN_DEPS=	autoreconf gmake pkg-config

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/aclocal/xorg-macros.m4
