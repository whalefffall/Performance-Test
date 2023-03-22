GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

3mm.manifest: 3mm.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: 3mm.manifest
	gramine-sgx-sign \
		--manifest 3mm.manifest \
		--output 3mm.manifest.sgx

3mm.token: 3mm.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs 3mm.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
