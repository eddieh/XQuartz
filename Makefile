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

# src/xquartz/xserver/hw/xquartz
# src/xorg/xserver/hw/xquartz

DESTDIR = ${SRCROOT}/build
PREFIX = ${DESTDIR}/${BSTYLE}

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

patches:

### Prereqs
### -------

# xorg* modules depend on these macros being in
# ${PREFIX}/share/aclocal
PREREQS += ${PREFIX}/share/aclocal/xorg-macros.m4
$(PREREQS): $(PREFIX)
	pushd ${XORG_MACROS}; \
	autoreconf -fvi; \
	./configure --prefix=${PREFIX}; \
	popd; \
	${MAKE} -C ${XORG_MACROS}; \
	${MAKE} install -C ${XORG_MACROS};

### generate configure scripts
### --------------------------

ODDBALL_MODULES_AUTOGEN = $(addsuffix /configure, $(ODDBALL_MODULES))
$(ODDBALL_MODULES_AUTOGEN):
	cd $(@D) && ./autogen.sh

MODULES_AUTORECONF = $(addsuffix /configure, $(MODULES))

# xorg* needs to be directed to the install location of
# src/xorg/util/macros
$(MODULES_AUTORECONF): _ACL = "aclocal -I ${PREFIX}/share/aclocal"

# runs autoreconf if 'configure' doesn't exist or 'configure.ac'
# changes
$(MODULES_AUTORECONF): %/configure: %/configure.ac $(PREREQS)
#	@echo "$(@D) needs autoreconf"
ifneq ($(filter $(@D), $(XORG_MODULES)),)
	cd $(@D) && ACLOCAL=${_ACL} autoreconf -fvi
else
	cd $(@D) && autoreconf -fvi
endif

# PHONY += autoreconf
# autoreconf: $(MODULES_AUTORECONF)

### generate Makefile(s)
### --------------------

# runs configure if Makefile doesn't exist or configure changes
MODULES_MAKEFILE = $(addsuffix /Makefile, $(MODULES))
$(MODULES_MAKEFILE): %/Makefile: %/configure $(ODDBALL_MODULES_AUTOGEN) $(MODULES_AUTORECONF)
#	@echo "$(@D) needs configure"
	cd $(@D) && ./configure --prefix=${PREFIX}

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

debug d: modules_install

alpha a:

beta b:

rc:

release r:

dist:

testing t:

analyze:

clean:

# Declare the contents of the PHONY variable as phony. We keep that
# information in a variable so we can use it in if_changed and
# friends.
.PHONY: $(PHONY)
