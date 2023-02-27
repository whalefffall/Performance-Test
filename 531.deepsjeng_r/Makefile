# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

deepsjeng_r.manifest: deepsjeng_r.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: deepsjeng_r.manifest
	gramine-sgx-sign \
		--manifest deepsjeng_r.manifest \
		--output deepsjeng_r.manifest.sgx

deepsjeng_r.token: deepsjeng_r.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs deepsjeng_r.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
