# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

xz_r.manifest: xz_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: xz_r.manifest
	gramine-sgx-sign \
		--manifest xz_r.manifest \
		--output xz_r.manifest.sgx

xz_r.token: xz_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs xz_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
