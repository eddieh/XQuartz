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

APP_PATH = $(PREFIX)/Application/Utilities

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

MODULES := $(filter-out $(EXCLUDE_MODULES),$(MODULES))

show-config:
	@echo >&2 "SRCROOT: $(SRCROOT)"
	@echo >&2 "ABS_SRCROOT: $(ABS_SRCROOT)"
	@echo >&2 "Config: $(XORG_CONFIG)"
	@echo >&2 "Modules: $(MODULES)"

## Package management
PKGDIR = packages

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
$(eval $(clear-module-vars))
endef

$(foreach m,$(MODULES),$(eval $(make-module-vars)))

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact is ignored
# 5) install artifact
define autotools-install-only
$(2)/configure: $(2)/configure.ac $(3)
	cd $(2) && autoreconf -vi

$(2)/Makefile: $(2)/configure
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(5): $(2)/Makefile
	$(MAKE) install -C $(2)
endef

# 1) pkg name
# 2) src root
# 3) dependencies
# 4) make artifact
# 5) install artifact
define autotools-make
$(2)/configure: $(2)/configure.ac $(3)
	cd $(2) && autoreconf -vi

$(2)/Makefile: $(2)/configure
	cd $(2) && ./configure $$(XORG_CONFIG) \
		$$($(1)_CONFIG_OPTS)

$(4): $(2)/Makefile
	$(MAKE) -C $(2)

$(5): $(4)
	$(MAKE) install -C $(2)
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

$(REL_PREFIX)/share/aclocal/xorg-macros.m4: $(ACLDIR)

## Maintenance tasks
clean:
	-rm -rf $(REL_PREFIX)
	git submodule foreach 'git clean -Xf'
