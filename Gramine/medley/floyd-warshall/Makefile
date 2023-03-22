GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

floyd-warshall.manifest: floyd-warshall.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: floyd-warshall.manifest
	gramine-sgx-sign \
		--manifest floyd-warshall.manifest \
		--output floyd-warshall.manifest.sgx

floyd-warshall.token: floyd-warshall.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs floyd-warshall.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
