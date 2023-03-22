GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

2mm.manifest: 2mm.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: 2mm.manifest
	gramine-sgx-sign \
		--manifest 2mm.manifest \
		--output 2mm.manifest.sgx

2mm.token: 2mm.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs 2mm.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
