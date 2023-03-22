GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

atax.manifest: atax.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: atax.manifest
	gramine-sgx-sign \
		--manifest atax.manifest \
		--output atax.manifest.sgx

atax.token: atax.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs atax.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
