# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

mcf_s.manifest: mcf_s.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: mcf_s.manifest
	gramine-sgx-sign \
		--manifest mcf_s.manifest \
		--output mcf_s.manifest.sgx

mcf_s.token: mcf_s.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs mcf_s.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
