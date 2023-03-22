GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

mvt.manifest: mvt.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: mvt.manifest
	gramine-sgx-sign \
		--manifest mvt.manifest \
		--output mvt.manifest.sgx

mvt.token: mvt.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs mvt.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
