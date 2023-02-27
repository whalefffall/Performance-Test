# none/error/warning/debug/trace/all
GRAMINE_LOG_LEVEL = error

# directory with arch-specific libraries, used by Redis
# the below path works for Debian/Ubuntu; for CentOS/RHEL/Fedora, you should
# overwrite this default like this: `ARCH_LIBDIR=/lib64 make`
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

roms_s.manifest: roms_s.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

sgx_outputs: roms_s.manifest
	gramine-sgx-sign \
		--manifest roms_s.manifest \
		--output roms_s.manifest.sgx

roms_s.token: roms_s.sig
	gramine-sgx-get-token --output $@ --sig $<

all: sgx_outputs roms_s.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
