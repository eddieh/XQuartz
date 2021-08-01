include Makefile.modules

PREFIX =
BTOOLS =
SRCROOT = .

MJOBS := $(shell sysctl -n hw.activecpu)

PHONY := __all
__all: report_config

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


# Declare the contents of the PHONY variable as phony. We keep that
# information in a variable so we can use it in if_changed and
# friends.
.PHONY: $(PHONY)
