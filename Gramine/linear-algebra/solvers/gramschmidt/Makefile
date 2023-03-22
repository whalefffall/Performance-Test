GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

gramschmidt.manifest: gramschmidt.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: gramschmidt.manifest
	gramine-sgx-sign \
		--manifest gramschmidt.manifest \
		--output gramschmidt.manifest.sgx

gramschmidt.token: gramschmidt.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs gramschmidt.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
