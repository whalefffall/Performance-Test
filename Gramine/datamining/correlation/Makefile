GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

correlation.manifest: correlation.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: correlation.manifest
	gramine-sgx-sign \
		--manifest correlation.manifest \
		--output correlation.manifest.sgx

correlation.token: correlation.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs correlation.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
