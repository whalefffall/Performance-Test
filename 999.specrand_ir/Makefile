# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

specrand_ir.manifest: specrand_ir.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: specrand_ir.manifest
	gramine-sgx-sign \
		--manifest specrand_ir.manifest \
		--output specrand_ir.manifest.sgx

specrand_ir.token: specrand_ir.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs specrand_ir.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
