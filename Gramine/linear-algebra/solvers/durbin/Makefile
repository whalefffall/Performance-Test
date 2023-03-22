GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

durbin.manifest: durbin.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: durbin.manifest
	gramine-sgx-sign \
		--manifest durbin.manifest \
		--output durbin.manifest.sgx

durbin.token: durbin.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs durbin.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
