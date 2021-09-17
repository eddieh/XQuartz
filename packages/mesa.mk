PKGNAME=	mesa
PKGROOT=	src/mesa/mesa
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext libXfixes libxcb

BUILD_FLAVOR=	meson
BUILD_STYLE=	build

CONFIG_OPTS=	-Dc_std=c11 -Dosmesa=true

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	build/src/glx/libGL.dylib
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/gl.pc

AUTO_PATCHES=
CONFIG_PATCHES=
BUILD_PATCHES=	mesa-timespec.patch
