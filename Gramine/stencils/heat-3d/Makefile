GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

heat-3d.manifest: heat-3d.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: heat-3d.manifest
	gramine-sgx-sign \
		--manifest heat-3d.manifest \
		--output heat-3d.manifest.sgx

heat-3d.token: heat-3d.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs heat-3d.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
