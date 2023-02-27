# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

cactuBSSN_s.manifest: cactuBSSN_s.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: cactuBSSN_s.manifest
	gramine-sgx-sign \
		--manifest cactuBSSN_s.manifest \
		--output cactuBSSN_s.manifest.sgx

cactuBSSN_s.token: cactuBSSN_s.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs cactuBSSN_s.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
