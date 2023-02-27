# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

xalancbmk_r.manifest: xalancbmk_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: xalancbmk_r.manifest
	gramine-sgx-sign \
		--manifest xalancbmk_r.manifest \
		--output xalancbmk_r.manifest.sgx

xalancbmk_r.token: xalancbmk_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs xalancbmk_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
