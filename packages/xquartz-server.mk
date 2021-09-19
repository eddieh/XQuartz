PKGNAME=	xorg-server
PKGROOT=	src/xquartz/xserver
SRCROOT=	$(PKGROOT)

DEPS=		xorg-macros libxcb-keysyms libxcb-image \
		libxcb-render-util libxcb-wm libxtrans \
		libxkbfile libXfont2 pixman font-util \
		xkeyboard-config mesa libAppleWM

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS=	--disable-shave --disable-nls \
		--enable-xcsecurity --enable-record \
		--with-fontdir=${PREFIX}/share/fonts \
		--with-default-font-path=${FONTPATH} \
		--with-bundle-id-prefix=${IDENTIFIER_PREFIX} \
		--with-apple-application-name=XQuartz \
		--with-apple-applications-dir=${APPLICATION_PATH} \
		--with-bundle-version=${APPLICATION_VERSION} \
		--with-bundle-version-string=${APPLICATION_VERSION_STRING}

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	hw/xquartz/libXquartz.la
INST_ARTIFACT=	$(REL_PREFIX)/Applications/Utilities/XQuartz.app/Contents/MacOS/X11
