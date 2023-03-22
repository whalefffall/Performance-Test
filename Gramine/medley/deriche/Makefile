GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

deriche.manifest: deriche.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: deriche.manifest
	gramine-sgx-sign \
		--manifest deriche.manifest \
		--output deriche.manifest.sgx

deriche.token: deriche.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs deriche.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
