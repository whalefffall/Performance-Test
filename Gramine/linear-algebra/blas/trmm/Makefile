GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

trmm.manifest: trmm.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: trmm.manifest
	gramine-sgx-sign \
		--manifest trmm.manifest \
		--output trmm.manifest.sgx

trmm.token: trmm.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs trmm.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
