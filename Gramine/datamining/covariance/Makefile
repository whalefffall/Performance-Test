GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

covariance.manifest: covariance.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: covariance.manifest
	gramine-sgx-sign \
		--manifest covariance.manifest \
		--output covariance.manifest.sgx

covariance.token: covariance.sig
	gramine-sgx-get-token --output $@ --sig $< \

all: sgx_outputs covariance.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
