include Makefile.modules

PREFIX =
BTOOLS =
SRCROOT = .

BSTYLE = debug # one of: debug alpha beta rc release

MJOBS := $(shell sysctl -n hw.activecpu)

# ENABLE_XQUARTZ_SPARKLE
# XQUARTZ_SPARKLE
# XQUARTZ_SPARKLE_FEED_URL

# FOP_

# ENABLE_DOCS
# ENBABLE_TESTS

# src/xquartz/xserver/hw/xquartz
# src/xorg/xserver/hw/xquartz

PHONY := __all
__all: report_config

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

PHONY += check_submodules
check_submodules:
	@for dir in $(MODULES); do [ -f "$${dir}/.git" ]; exit_status=$$?; \
	if [ $$exit_status -ne 0 ]; then \
		echo "submodule $${dir} not initialized"; \
		echo >&2 '***'; \
		echo >&2 '*** use'; \
		echo >&2 '***'; \
		echo >&2 '***     git submodule update --init --recursive'; \
		echo >&2 '***'; \
		echo >&2 '*** to initialize all submodules'; \
		echo >&2 '***'; \
		exit $$exit_status; fi; done;

# Declare the contents of the PHONY variable as phony. We keep that
# information in a variable so we can use it in if_changed and
# friends.
.PHONY: $(PHONY)


# xorgproto needs to be directed to the install location of
# src/xorg/util/macros
# export ACLOCAL="aclocal -I ${PREFIX}/share/aclocal"
