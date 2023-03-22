GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

bicg.manifest: bicg.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: bicg.manifest
	gramine-sgx-sign \
		--manifest bicg.manifest \
		--output bicg.manifest.sgx

bicg.token: bicg.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs bicg.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
