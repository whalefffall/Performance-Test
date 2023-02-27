# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

x264_r.manifest: x264_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: x264_r.manifest
	gramine-sgx-sign \
		--manifest x264_r.manifest \
		--output x264_r.manifest.sgx

x264_r.token: x264_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs x264_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
