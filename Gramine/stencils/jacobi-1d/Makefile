GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

jacobi-1d.manifest: jacobi-1d.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: jacobi-1d.manifest
	gramine-sgx-sign \
		--manifest jacobi-1d.manifest \
		--output jacobi-1d.manifest.sgx

jacobi-1d.token: jacobi-1d.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs jacobi-1d.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
