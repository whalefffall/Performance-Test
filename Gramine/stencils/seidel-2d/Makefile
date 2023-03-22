GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

seidel-2d.manifest: seidel-2d.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: seidel-2d.manifest
	gramine-sgx-sign \
		--manifest seidel-2d.manifest \
		--output seidel-2d.manifest.sgx

seidel-2d.token: seidel-2d.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs seidel-2d.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
