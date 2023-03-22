GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

syr2k.manifest: syr2k.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: syr2k.manifest
	gramine-sgx-sign \
		--manifest syr2k.manifest \
		--output syr2k.manifest.sgx

syr2k.token: syr2k.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs syr2k.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
