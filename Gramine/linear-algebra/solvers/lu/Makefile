GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

lu.manifest: lu.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: lu.manifest
	gramine-sgx-sign \
		--manifest lu.manifest \
		--output lu.manifest.sgx

lu.token: lu.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs lu.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
