# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

perlbench_s.manifest: perlbench_s.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: perlbench_s.manifest
	gramine-sgx-sign \
		--manifest perlbench_s.manifest \
		--output perlbench_s.manifest.sgx

perlbench_s.token: perlbench_s.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs perlbench_s.token
clean: rm *.token *.sig *.manifest.sgx *.manifest
