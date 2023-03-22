GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

gemver.manifest: gemver.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: gemver.manifest
	gramine-sgx-sign \
		--manifest gemver.manifest \
		--output gemver.manifest.sgx

gemver.token: gemver.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs gemver.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
