PKGNAME=	fontconfig
PKGROOT=	src/fontconfig
SRCROOT=	$(PKGROOT)

DEPS=		freetype2

BUILD_FLAVOR=	autotools
BUILD_STYLE=	make

CONFIG_OPTS= --with-expat=/usr \
	--with-templatedir=${PREFIX}/etc/X11/fontconfig/conf.avail \
	--with-baseconfigdir=${PREFIX}/etc/X11/fontconfig \
	--with-default-fonts=${PREFIX}/share/fonts \
	--with-cache-dir=${PREFIX}/var/cache/fontconfig \
	--disable-docs

INSTALL_TARGET=	install-strip

MAKE_ARTIFACT= 	src/libfontconfig.la
INST_ARTIFACT=	$(REL_PREFIX)/lib/pkgconfig/fontconfig.pc
