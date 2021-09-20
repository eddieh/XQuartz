PKGNAME=	xdpyinfo
PKGROOT=	src/xorg/app/xdpyinfo
SRCROOT=	$(PKGROOT)

DEPS=		xorgproto libXext libX11 libXtst libxcb libXxf86vm \
		libXxf86dga libXi libXrender libXcomposite \
		libXinerama libdmx

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--without-xf86misc

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	xdpyinfo
INST_ARTIFACT=	$(REL_PREFIX)/bin/xdpyinfo
