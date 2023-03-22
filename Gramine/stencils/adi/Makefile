GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

adi.manifest: adi.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: adi.manifest
	gramine-sgx-sign \
		--manifest adi.manifest \
		--output adi.manifest.sgx

adi.token: adi.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs adi.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
