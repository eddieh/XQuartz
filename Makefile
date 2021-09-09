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
# MODULES += libxcb-util
# MODULES += libxcb-render-util
# MODULES += libxcb-image
# MODULES += libxcb-cursor
# MODULES += libxcb-errors
# MODULES += libxcb-keysyms
# MODULES += libxcb-wm

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
$(m)_MAKE_ARTIFACT := $(MAKE_ARTIFACT)
$(m)_INST_ARTIFACT := $(INST_ARTIFACT)
$(eval $(clear-module-vars))
endef

$(foreach m,$(MODULES),$(eval $(make-module-vars)))

# 1) src root
# 2) dependencies
# 3) make artifact is ignored
# 4) install artifact
define autotools-install-only
$(1)/configure: $(1)/configure.ac $(2)
	cd $(1) && autoreconf -vi

$(1)/Makefile: $(1)/configure
	cd $(1) && ./configure $$(XORG_CONFIG)

$(4): $(1)/Makefile
	$(MAKE) install -C $(1)
endef

# 1) src root
# 2) dependencies
# 3) make artifact
# 4) install artifact
define autotools-make
$(1)/configure: $(1)/configure.ac $(2)
	cd $(1) && autoreconf -vi

$(1)/Makefile: $(1)/configure
	cd $(1) && ./configure $$(XORG_CONFIG)

$(3): $(1)/Makefile
	$(MAKE) -C $(1)

$(4): $(3)
	$(MAKE) install -C $(1)
endef

deps = $(foreach d,$(1),$$($(d)_INST_ARTIFACT))

$(foreach m,$(MODULES),\
	$(eval $(call $($(m)_BUILD_FLAVOR)-$($(m)_BUILD_STYLE),\
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
