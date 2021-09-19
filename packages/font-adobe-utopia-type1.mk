PKGNAME=	font-adobe-utopia-type1
PKGROOT=	src/xorg/font/adobe-utopia-type1
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros font-util mkfontscale

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/fonts/X11/Type1/UTB_____.afm
