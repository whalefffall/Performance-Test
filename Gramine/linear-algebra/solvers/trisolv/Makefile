GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

trisolv.manifest: trisolv.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: trisolv.manifest
	gramine-sgx-sign \
		--manifest trisolv.manifest \
		--output trisolv.manifest.sgx

trisolv.token: trisolv.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs trisolv.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
