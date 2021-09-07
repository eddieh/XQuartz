PKGNAME=	xorgproto
PKGROOT=	src/xorg/proto/xorgproto
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/share/pkgconfig/xproto.pc
