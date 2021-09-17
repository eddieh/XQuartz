PKGNAME=	libAppleWM
PKGROOT=	src/xorg/lib/libAppleWM
SRCROOT=	$(PKGROOT)

DEPS=		libX11 libXext

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT=	src/libAppleWM.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/applewm.pc
