GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

gemm.manifest: gemm.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: gemm.manifest
	gramine-sgx-sign \
		--manifest gemm.manifest \
		--output gemm.manifest.sgx

gemm.token: gemm.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs gemm.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
