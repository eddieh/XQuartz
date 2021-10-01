## Config
SRCROOT = .
ABS_SRCROOT := $(shell cd $(SRCROOT) && pwd)
srctree := $(ABS_SRCROOT)

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

export srctree

## Modules
include Makefile.modules

EXCLUDE_MODULES =

# the X Display Manager Control Protocol is probably optional for
# XQuartz
WITHOUT_XDMCP = 1
ifdef WITHOUT_XDMCP
EXCLUDE_MODULES += libXdmcp
endif

MODULES := $(filter-out $(EXCLUDE_MODULES),$(MODULES))

show-config:
	@echo >&2 "SRCROOT: $(SRCROOT)"
	@echo >&2 "ABS_SRCROOT: $(ABS_SRCROOT)"
	@echo >&2 "Config: $(XORG_CONFIG)"
	@echo >&2 "Modules: $(MODULES)"

## Package management
PKGDIR = packages
PATCHDIR = patches

include Makefile.pkgmgr

## Extra dependencies
$(ACLDIR):
	mkdir -p $(ACLDIR)

$(REL_PREFIX)/share/aclocal/xorg-macros.m4: | $(ACLDIR)

## Default target
alltargets = $(foreach m,$(MODULES),$($(m)_INST_ARTIFACT))

.DEFAULT_GOAL = all
all: $(alltargets)

## Development tasks
tags TAGS: FORCE
	scripts/tags

log: FORCE
	scripts/log

## Maintenance tasks
clean:
	-rm -rf $(REL_PREFIX) src/mesa/mesa/build
	git submodule foreach 'git clean -Xf'


.PHONY: FORCE
