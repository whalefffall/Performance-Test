# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

cactuBSSN_r.manifest: cactuBSSN_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: cactuBSSN_r.manifest
	gramine-sgx-sign \
		--manifest cactuBSSN_r.manifest \
		--output cactuBSSN_r.manifest.sgx

cactuBSSN_r.token: cactuBSSN_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs cactuBSSN_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
