## Config
SRCROOT = .
ABS_SRCROOT := $(shell cd $(SRCROOT) && pwd)

STYLE = debug
REL_PREFIX := build/$(STYLE)
ABS_PREFIX := $(ABS_SRCROOT)/$(REL_PREFIX)
PREFIX := $(ABS_PREFIX)

ACLDIR = $(REL_PREFIX)/share/aclocal
PKGDIR = $(REL_PREFIX)/share/pkgconfig
LIBDIR = $(REL_PREFIX)/lib
LIBPKGDIR = $(REL_PREFIX)/lib/pkgconfig

APP_PATH = $(PREFIX)/Applications/Utilities

APP_FRAMEWORKS =
ifdef ENABLE_SPARKLE
APP_FRAMEWORKS = -F$(APP_PATH)/XQuartz.app/Contents/Frameworks
endif

EXCLUDE_MODULES =

# the X Display Manager Control Protocol is probably optional for
# XQuartz
WITHOUT_XDMCP = 1
ifdef WITHOUT_XDMCP
EXCLUDE_MODULES += libXdmcp
endif

export CPPFLAGS = -I$(PREFIX)/include $(APP_FRAMEWORKS)
export LDFLAGS = -L$(PREFIX)/lib $(APP_FRAMEWORKS)
export ACLOCAL = aclocal -I $(PREFIX)/share/aclocal
export PKG_CONFIG_PATH = \
	$(PREFIX)/share/pkgconfig:$(PREFIX)/lib/pkgconfig

export FONTPATH = "${PREFIX}/share/fonts/misc/,${PREFIX}/share/fonts/TTF/,${PREFIX}/share/fonts/OTF,${PREFIX}/share/fonts/Type1/,${PREFIX}/share/fonts/75dpi/:unscaled,${PREFIX}/share/fonts/100dpi/:unscaled,${PREFIX}/share/fonts/75dpi/,${PREFIX}/share/fonts/100dpi/,/Library/Fonts,${PREFIX}/share/system_fonts"

APPLICATION_PATH = $(APP_PATH)
IDENTIFIER_PREFIX = org.xquartz

APPLICATION_VERSION = 66
APPLICATION_VERSION_STRING = "66 (Super-Charger Heaven)"

XORG_CONFIG = --prefix=$(PREFIX)

## Modules
MODULES += xorg-macros
MODULES += xorgproto
MODULES += libXau

MODULES += libXdmcp

MODULES += xcb-proto
MODULES += libxcb
MODULES += libxcb-util
MODULES += libxcb-render-util
MODULES += libxcb-image
MODULES += libxcb-cursor
MODULES += libxcb-errors
MODULES += libxcb-keysyms
MODULES += libxcb-wm

MODULES += libpng16
MODULES += freetype2
MODULES += fontconfig
MODULES += font-util

MODULES += libxtrans
MODULES += libX11
MODULES += libXext
MODULES += libFS
MODULES += libICE
MODULES += libSM
MODULES += libXScrnSaver
MODULES += libXt
MODULES += libXmu
MODULES += libXpm
MODULES += libXaw
MODULES += libXfixes
MODULES += libXcomposite
MODULES += libXrender
MODULES += libXcursor
MODULES += libXdamage
MODULES += libfontenc
MODULES += libXfont2
MODULES += libXft
MODULES += libXi
MODULES += libXinerama
MODULES += libXrandr
MODULES += libXres
MODULES += libXtst
MODULES += libXv
MODULES += libXvMC
MODULES += libXxf86dga
MODULES += libXxf86vm
MODULES += libdmx
MODULES += libxkbfile
MODULES += libxshmfence

MODULES += libAppleWM

MODULES += mesa

MODULES += xbitmaps
MODULES += xcursor-themes
MODULES += xkeyboard-config

MODULES += pixman

MODULES += xorg-server

MODULES += xf86-input-void
MODULES += xf86-video-dummy
MODULES += xf86-video-nested

MODULES += xquartz-server

# # fonts
MODULES += encodings
MODULES += font-alias
MODULES += font-adobe-utopia-type1
# MODULES += font-bh-ttf
MODULES += font-bh-type1
MODULES += font-ibm-type1
MODULES += font-xfree86-type1

# # applications
MODULES += iceauth
MODULES += luit
MODULES += mkfontscale
MODULES += sessreg
MODULES += setxkbmap
MODULES += smproxy
#MODULES += x11perf
MODULES += xauth
MODULES += xbacklight
MODULES += xcmsdb
MODULES += xcursorgen
MODULES += xdpyinfo
#MODULES += xdriinfo
MODULES += xev
MODULES += xgamma
MODULES += xhost
MODULES += xinput
MODULES += xkbcomp
MODULES += xkbevd
MODULES += xkbutils
MODULES += xkill
MODULES += xlsatoms
MODULES += xlsclients
MODULES += xmessage
MODULES += xmodmap
MODULES += xpr
MODULES += xprop
MODULES += xrandr
MODULES += xrdb
MODULES += xrefresh
MODULES += xset
MODULES += xsetroot
MODULES += xvinfo
MODULES += xwd
MODULES += xwininfo
MODULES += xwud

MODULES += quartz-wm
MODULES += twm
#MODULES += xterm
MODULES += xinit

MODULES := $(filter-out $(EXCLUDE_MODULES),$(MODULES))

show-config:
	@echo >&2 "SRCROOT: $(SRCROOT)"
	@echo >&2 "ABS_SRCROOT: $(ABS_SRCROOT)"
	@echo >&2 "Config: $(XORG_CONFIG)"
	@echo >&2 "Modules: $(MODULES)"

## Package management
PKGDIR = packages
PATCHDIR = patches

define clear-module-vars
undefine PKGNAME
undefine PKGROOT
undefine SRCROOT
undefine BIN_DEPS
undefine DEPS
undefine BUILD_FLAVOR
undefine BUILD_STYLE
undefine CONFIG_OPTS
undefine MAKE_ARTIFACT
undefine INST_ARTIFACT
undefine CONFIG_PATCHES
undefine BUILD_PATCHES
endef

define make-module-vars
$(eval include $(PKGDIR)/$(m).mk)
$(m)_PKGNAME := $(PKGNAME)
$(m)_PKGROOT := $(PKGROOT)
$(m)_SRCROOT := $(SRCROOT)
$(m)_BIN_DEPS := $(BIN_DEPS)
$(m)_DEPS := $(DEPS)
$(m)_BUILD_FLAVOR := $(BUILD_FLAVOR)
$(m)_BUILD_STYLE := $(BUILD_STYLE)
$(m)_CONFIG_OPTS := $(CONFIG_OPTS)
$(m)_MAKE_ARTIFACT := $(MAKE_ARTIFACT)
$(m)_INST_ARTIFACT := $(INST_ARTIFACT)
$(m)_CONFIG_PATCHES := $(CONFIG_PATCHES:%.patch=$(PATCHDIR)/%.patch.applied)
$(m)_BUILD_PATCHES := $(BUILD_PATCHES:%.patch=$(PATCHDIR)/%.patch.applied)
$(eval $(clear-module-vars))
endef

define make-module-deps
$(m)_CONFIG_DEPS += $($(m)_CONFIG_PATCHES)
$(m)_BUILD_DEPS += $($(m)_BUILD_PATCHES)
$(m)_PATCHES += $($(m)_CONFIG_PATCHES)
$(m)_PATCHES += $($(m)_BUILD_PATCHES)
endef

show-deps:
	@echo mesa_CONFIG_DEPS= $(mesa_CONFIG_DEPS)
	@echo mesa_BUILD_DEPS= $(mesa_BUILD_DEPS)

define make-patch-rule
$($(m)_PATCHES): %.patch.applied: %.patch
	patch -d $($(m)_SRCROOT) -p1 < $$< && date > $$@
endef

$(foreach m,$(MODULES),$(eval $(make-module-vars)))
$(foreach m,$(MODULES),$(eval $(make-module-deps)))
$(foreach m,$(MODULES),$(eval $(make-patch-rule)))

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact is ignored
# 5) install artifact
define autotools-install-only
$(2)/configure: $(2)/configure.ac $(3)
	cd $(2) && autoreconf -vif

$(2)/Makefile: $(2)/configure
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(5): $(2)/Makefile
	$(MAKE) install -C $(2)

$(2)/configure: $($(1)_CONFIG_DEPS)
$(2)/Makefile: $($(1)_BUILD_DEPS)
endef

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact
# 5) install artifact
define autotools-make
$(2)/configure: $(2)/configure.ac $(3)
	cd $(2) && autoreconf -vif

$(2)/Makefile: $(2)/configure
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(4): $(2)/Makefile
	$(MAKE) -C $(2)

$(5): $(4)
	$(MAKE) install -C $(2)

$(2)/configure: $($(1)_CONFIG_DEPS)
$(2)/Makefile: $($(1)_BUILD_DEPS)
endef

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact
# 5) install artifact
define configure-make
$(2)/Makefile: $(2)/configure $(3)
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(4): $(2)/Makefile
	$(MAKE) -C $(2)

$(5): $(4)
	$(MAKE) install -C $(2)

$(2)/configure: $($(1)_CONFIG_DEPS)
$(2)/Makefile: $($(1)_BUILD_DEPS)
endef

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact
# 5) install artifact
define freetype2-autogen-make
$(2)/builds/unix/configure: $(2)/autogen.sh $(3)
	cd $(2) && ./autogen.sh

$(2)/builds/unix/unix-cc.mk: $(2)/builds/unix/configure
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(4): $(2)/builds/unix/unix-cc.mk
	$(MAKE) -C $(2)

$(5): $(4)
	$(MAKE) install -C $(2)

$(2)/builds/unix/configure: $($(1)_CONFIG_DEPS)
$(2)/builds/unix/unix-cc.mk: $($(1)_BUILD_DEPS)
endef

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact
# 5) install artifact
define meson-build
$(2)/build/build.ninja: $(2)/meson.build $(3)
	cd $(2) && meson build -Dprefix=$(PREFIX) \
		$$($(1)_CONFIG_OPTS)

$(4): $(2)/build/build.ninja
	ninja -C $(2)/build

$(5): $(4)
	ninja -C $(2)/build install
#	either ninja or meson is preserving the modification timestamp
	touch $(5)

$(2)/meson.build: $($(1)_CONFIG_DEPS)
$(2)/build/build.ninja: $($(1)_BUILD_DEPS)
endef

deps = $(foreach d,$(1),$$($(d)_INST_ARTIFACT))

$(foreach m,$(MODULES),\
	$(eval $(call $($(m)_BUILD_FLAVOR)-$($(m)_BUILD_STYLE),$(m),\
		$$($(m)_SRCROOT),\
		$(call deps,$($(m)_DEPS)),\
		$$($(m)_SRCROOT)/$$($(m)_MAKE_ARTIFACT),\
		$$($(m)_INST_ARTIFACT))))

## Extra dependencies
$(ACLDIR):
	mkdir -p $(ACLDIR)

$(REL_PREFIX)/share/aclocal/xorg-macros.m4: | $(ACLDIR)

## Default target
alltargets = $(foreach m,$(MODULES),$($(m)_INST_ARTIFACT))

.DEFAULT_GOAL = all
all: $(alltargets)

## Maintenance tasks
clean:
	-rm -rf $(REL_PREFIX) src/mesa/mesa/build
	git submodule foreach 'git clean -Xf'
