GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

syrk.manifest: syrk.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: syrk.manifest
	gramine-sgx-sign \
		--manifest syrk.manifest \
		--output syrk.manifest.sgx

syrk.token: syrk.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs syrk.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
