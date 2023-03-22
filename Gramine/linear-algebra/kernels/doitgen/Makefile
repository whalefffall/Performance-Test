GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

doitgen.manifest: doitgen.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: doitgen.manifest
	gramine-sgx-sign \
		--manifest doitgen.manifest \
		--output doitgen.manifest.sgx

doitgen.token: doitgen.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs doitgen.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
