PKGNAME=	font-bh-type1
PKGROOT=	src/xorg/font/bh-type1
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros font-util mkfontscale

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/fonts/X11/Type1/l047013t.afm
