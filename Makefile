# -*- mode: Makefile;-*-

# TODO: check for things like gmake and autotools

include Makefile.modules

#PREFIX =
#BTOOLS =
SRCROOT = $(shell cd . && pwd)

# one of: debug alpha beta rc release
BSTYLE = debug

MJOBS := $(shell sysctl -n hw.activecpu)

# ENABLE_XQUARTZ_SPARKLE
# XQUARTZ_SPARKLE
# XQUARTZ_SPARKLE_FEED_URL

# FOP_

# ENABLE_DOCS
# ENBABLE_TESTS

# ENABLE_PRIVILEGED_STARTX
# ENABLE_LAUNCHD

# src/xquartz/xserver/hw/xquartz
# src/xorg/xserver/hw/xquartz

DESTDIR = ${SRCROOT}/build
PREFIX = ${DESTDIR}/${BSTYLE}

APP_PATH = ${PREFIX}/Application/Utilities

APP_FRAMEWORKS =
ifdef ENABLE_SPARKLE
APP_FRAMEWORKS = -F${APP_PATH}/XQuartz.app/Contents/Frameworks
endif

export CPPFLAGS = -I${PREFIX}/include ${APP_FRAMEWORKS} -DFAIL_HARD
export LDFLAGS = -L${PREFIX}/lib ${APP_FRAMEWORKS}
export ACLOCAL = aclocal -I ${PREFIX}/share/aclocal
export PKG_CONFIG_PATH = \
	${PREFIX}/share/pkgconfig:${PREFIX}/lib/pkgconfig

PHONY := __all
__all: debug

PHONY += report_config
report_config:
	@echo >&2 '***'
	@echo >&2 "*** Prefix: ${PREFIX}"
	@echo >&2 "*** Build tools: ${BTOOLS}"
	@echo >&2 "*** Source root: ${SRCROOT}"
	@echo >&2 "*** Max jobs: ${MJOBS}"
	@echo >&2 '***'
	@echo >&2 "*** Modules: ${MODULES}"
	@echo >&2 '***'
#	@/usr/bin/false

PHONY += submodules_check
submodules_check:
	@for dir in $(SUBMODULES); do [ -f "$${dir}/.git" ]; exit_status=$$?; \
	  if [ $$exit_status -ne 0 ]; then \
	    echo "submodule $${dir} not initialized"; \
	    echo >&2 '***'; \
	    echo >&2 '*** use'; \
	    echo >&2 '***'; \
	    echo >&2 '***	  git submodule update --init --recursive'; \
	    echo >&2 '***'; \
	    echo >&2 '*** to initialize all submodules'; \
	    echo >&2 '***'; \
	    exit $$exit_status; \
	  fi; \
	done;

$(PREFIX):
	mkdir -p ${PREFIX}

### Patches
### -------

include Makefile.patches

PATCHFILES = $(addprefix $(SRCROOT)/, $(PATCHES))
PATCHES_TO_APPLY = $(addsuffix .applied, $(PATCHFILES))
$(PATCHES_TO_APPLY): %.patch.applied: %.patch
	cd $(@D:.patches=) && patch -p1 < $< && date > $@
$(PATCHFILES):

PHONY += patch
patch: $(PATCHES_TO_APPLY)

### Prereqs
### -------

# NOTE: We need the latest gmake (gnumake) for this to work
define install_macro_prereq =
	pushd $(firstword $|) ; \
	autoreconf -fvi ; \
	./configure --prefix=${PREFIX} ; \
	popd
	${MAKE} -C $(firstword $|)
	${MAKE} install -C $(firstword $|)
endef

# xorg* modules depend on these macros being in
# ${PREFIX}/share/aclocal
${PREFIX}/share/aclocal/xorg-macros.m4: | $(XORG_MACROS)
	$(install_macro_prereq)
PREREQS += ${PREFIX}/share/aclocal/xorg-macros.m4

${PREFIX}/share/aclocal/fontutil.m4: | $(XORG_FONT_UTIL)
	$(install_macro_prereq)
PREREQS += ${PREFIX}/share/aclocal/fontutil.m4

${PREFIX}/share/aclocal/xtrans.m4: | $(XORG_XTRANS)
	$(install_macro_prereq)
PREREQS += ${PREFIX}/share/aclocal/xtrans.m4

# PHONY += prereqs
# prereqs: $(PREREQS)

$(PREREQS): $(PREFIX)

### generate configure scripts
### --------------------------

ODDBALL_MODULES_AUTOGEN = $(addsuffix /configure, $(ODDBALL_MODULES))
$(ODDBALL_MODULES_AUTOGEN):
	cd $(@D) && ./autogen.sh

MODULES_AUTORECONF = $(addsuffix /configure, $(MODULES))
MODULES_AUTORECONF += src/mesa/glu/configure
MODULES_AUTORECONF += src/freeglut/freeglut/configure

$(MODULES_AUTORECONF): $(PREREQS)

# runs autoreconf if 'configure' doesn't exist or 'configure.ac'
# changes
$(MODULES_AUTORECONF): %/configure: %/configure.ac
	cd $(@D) && autoreconf -fvi

# PHONY += autoreconf
# autoreconf: $(MODULES_AUTORECONF)

### generate Makefile(s)
### --------------------

# runs configure if Makefile doesn't exist or configure changes
MODULES_MAKEFILE = $(addsuffix /Makefile, $(MODULES))

src/xorg/app/xinit/Makefile: USER_CONF = -user
src/xorg/xserver/Makefile: USER_CONF = -user
src/xquartz/xserver/Makefile: USER_CONF = -user

# xserver -> glu & glut > mesa
$(MESON_MODULES)/build: %/build: %/meson.build
	cd $(@D) && meson build -Dprefix=$(PREFIX) \
		$(subst $${PREFIX},${PREFIX}, \
		$(file < $(@D)${USER_CONF}.confopt))
	ninja -C $(@D)/build
	ninja -C $(@D)/build install

GL_MODULES_MAKEFILE = $(addsuffix /Makefile, $(GL_MODULES))

$(GL_MODULES_MAKEFILE): %/Makefile: %/configure $(MESON_MODULES)/build
	cd $(@D) && ./configure --prefix=${PREFIX} \
		$(subst $${PREFIX},${PREFIX}, \
		$(file < $(@D)${USER_CONF}.confopt))
	${MAKE} -C $(@D)
	${MAKE} install -C $(@D)

src/xorg/xserver/Makefile: $(GL_MODULES)/Makefile

$(MODULES_MAKEFILE): %/Makefile: %/configure $(MODULES_AUTORECONF) $(ODDBALL_MODULES_AUTOGEN)
	cd $(@D) && ./configure --prefix=${PREFIX} \
		$(subst $${PREFIX},${PREFIX}, \
		$(file < $(@D)${USER_CONF}.confopt))
	${MAKE} -C $(@D)
	${MAKE} install -C $(@D)

XORG_DRIVERS_MAKEFILE = $(addsuffix /Makefile, $(XORG_DRIVERS))
$(XORG_DRIVERS_MAKEFILE): src/xorg/xserver/Makefile

$(XORG_DRIVERS_MAKEFILE): %/Makefile: %/configure.ac
	pushd $(@D) ; \
	autoreconf -fvi ; \
	./configure --prefix=${PREFIX} \
		$(subst $${PREFIX},${PREFIX}, \
		$(file < $(@D)${USER_CONF}.confopt)) ; \
	popd
	${MAKE} -C $(@D)
	${MAKE} install -C $(@D)

# PHONY += configure
# configure: $(MODULES_MAKEFILE)

### run make
### --------

PHONY += modules_build
modules_build: $(MODULES_MAKEFILE)
	@for dir in $(MODULES); do \
		${MAKE} -C $$dir; \
		exit_status=$$?; \
		[ $$exit_status -ne 0 ] && exit $$exit_status; \
	done; true

### run make install
### ----------------

PHONY += modules_install
modules_install: modules_build

debug d: $(MODULES_MAKEFILE) $(XORG_DRIVERS_MAKEFILE)

alpha a:

beta b:

rc:

release r:

dist:

testing t:

analyze:

PHONY += clean
clean:
	-rm -rf build
	@for dir in $(SUBMODULES); do \
		${MAKE} -C $$dir clean; \
	done; true

PHONY += cleanx
cleanx:
	-rm -rf build src/mesa/mesa/build
	git submodule foreach 'git clean -Xf'

# Declare the contents of the PHONY variable as phony. We keep that
# information in a variable so we can use it in if_changed and
# friends.
.PHONY: $(PHONY)
