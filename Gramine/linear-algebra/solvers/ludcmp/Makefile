GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

ludcmp.manifest: ludcmp.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: ludcmp.manifest
	gramine-sgx-sign \
		--manifest ludcmp.manifest \
		--output ludcmp.manifest.sgx

ludcmp.token: ludcmp.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs ludcmp.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
