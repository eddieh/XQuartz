PKGNAME=	xcb-proto
PKGROOT=	src/xorg/proto/xcbproto
SRCROOT=	$(PKGROOT)

BIN_DEPS=	python3
DEPS=

BUILD_FLAVOR=	autotools
BUILD_STYLE=	install-only

MAKE_ARTIFACT=
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xcb-proto.pc
