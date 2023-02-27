# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

specrand_is.manifest: specrand_is.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: specrand_is.manifest
	gramine-sgx-sign \
		--manifest specrand_is.manifest \
		--output specrand_is.manifest.sgx

specrand_is.token: specrand_is.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs specrand_is.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
