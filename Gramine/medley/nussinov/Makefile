GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

nussinov.manifest: nussinov.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: nussinov.manifest
	gramine-sgx-sign \
		--manifest nussinov.manifest \
		--output nussinov.manifest.sgx

nussinov.token: nussinov.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs nussinov.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
