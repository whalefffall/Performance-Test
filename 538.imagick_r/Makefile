# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

imagick_r.manifest: imagick_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: imagick_r.manifest
	gramine-sgx-sign \
		--manifest imagick_r.manifest \
		--output imagick_r.manifest.sgx

imagick_r.token: imagick_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs imagick_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
