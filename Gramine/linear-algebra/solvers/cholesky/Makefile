GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

cholesky.manifest: cholesky.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: cholesky.manifest
	gramine-sgx-sign \
		--manifest cholesky.manifest \
		--output cholesky.manifest.sgx

cholesky.token: cholesky.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs cholesky.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
