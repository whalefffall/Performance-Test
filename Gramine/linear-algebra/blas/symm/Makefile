GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

symm.manifest: symm.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: symm.manifest
	gramine-sgx-sign \
		--manifest symm.manifest \
		--output symm.manifest.sgx

symm.token: symm.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs symm.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
