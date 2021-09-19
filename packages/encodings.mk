PKGNAME=	encodings
PKGROOT=	src/xorg/font/encodings
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros font-util mkfontscale

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	encodings.dir
INST_ARTIFACT=	$(REL_PREFIX)/share/fonts/X11/encodings/encodings.dir
