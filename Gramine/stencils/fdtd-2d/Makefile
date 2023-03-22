GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

fdtd-2d.manifest: fdtd-2d.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: fdtd-2d.manifest
	gramine-sgx-sign \
		--manifest fdtd-2d.manifest \
		--output fdtd-2d.manifest.sgx

fdtd-2d.token: fdtd-2d.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs fdtd-2d.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
