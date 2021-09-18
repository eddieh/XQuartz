PKGNAME=	xorg-server
PKGROOT=	src/xorg/xserver
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros libxcb-keysyms libxcb-image \
		libxcb-render-util libxcb-wm libxtrans \
		libxkbfile libXfont2 pixman font-util \
		xkeyboard-config

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--disable-dri --disable-glx --disable-shave --disable-nls \
		--with-fontdir=${PREFIX}/share/fonts \
		--with-default-font-path=${FONTPATH} \
		--disable-glamor \
		--disable-xquartz \
		--enable-xorg \
		--enable-kdrive \
		--enable-xephyr \
		--disable-sdl \
		--enable-xnest \
		--enable-xvfb \
		--disable-specs \
		--disable-devel-docs \
		--disable-docs \
		--disable-unit-tests

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	hw/xfree86/fbdevhw/libfbdevhw.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/xorg-server.pc
