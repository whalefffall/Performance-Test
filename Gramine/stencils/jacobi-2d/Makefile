GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

jacobi-2d.manifest: jacobi-2d.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: jacobi-2d.manifest
	gramine-sgx-sign \
		--manifest jacobi-2d.manifest \
		--output jacobi-2d.manifest.sgx

jacobi-2d.token: jacobi-2d.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs jacobi-2d.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
