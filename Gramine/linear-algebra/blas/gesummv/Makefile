GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

gesummv.manifest: gesummv.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: gesummv.manifest
	gramine-sgx-sign \
		--manifest gesummv.manifest \
		--output gesummv.manifest.sgx

gesummv.token: gesummv.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs gesummv.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
