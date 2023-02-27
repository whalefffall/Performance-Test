# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

bwaves_r.manifest: bwaves_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: bwaves_r.manifest
	gramine-sgx-sign \
		--manifest bwaves_r.manifest \
		--output bwaves_r.manifest.sgx

bwaves_r.token: bwaves_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs bwaves_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
