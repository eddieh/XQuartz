PKGNAME=	xcursor-themes
PKGROOT=	src/xorg/data/cursors
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros libXcursor

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

MAKE_ARTIFACT=	whiteglass/X_cursor
INST_ARTIFACT=	$(REL_PREFIX)/share/icons/whiteglass/cursors/X_cursor
