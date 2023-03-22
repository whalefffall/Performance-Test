#!/bin/bash

# Define a recursive function to traverse through subdirectories
function traverse_dir {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            traverse_dir "$file"
        else
            if [[ -x "$file" && -f "$file" ]]; then
                # If the file is executable and a regular file, print its name
                # echo "$(basename "$file")"
                NAME="$(basename "$file")"
                DIRPATH="$(dirname "$file")"

touch $DIRPATH/Makefile
    cat > $DIRPATH/Makefile << EOF
GRAMINE_LOG_LEVEL = error
ARCH_LIBDIR ?= /lib/\$(shell \$(CC) -dumpmachine)

$NAME.manifest: $NAME.manifest.template
	gramine-manifest \\
		-Dlog_level=\$(GRAMINE_LOG_LEVEL) \\
		-Darch_libdir=\$(ARCH_LIBDIR) \\
		\$< > \$@

sgx_outputs: $NAME.manifest
	gramine-sgx-sign \\
		--manifest $NAME.manifest \\
		--output $NAME.manifest.sgx

$NAME.token: $NAME.sig
	gramine-sgx-get-token --output \$@ --sig $< \\

all: sgx_outputs $NAME.token
clean: 
	rm *.token *.sig *.manifest.sgx *.manifest
EOF


    touch $DIRPATH/$NAME.manifest.template
    cat > $DIRPATH/$NAME.manifest.template << EOF
loader.entrypoint = "file:{{ gramine.libos }}"
libos.entrypoint = "/$NAME"
loader.log_level = "{{ log_level }}"
loader.insecure__use_cmdline_argv = true
loader.env.LD_LIBRARY_PATH = "/lib:{{ arch_libdir }}:/usr/{{ arch_libdir }}"
sys.enable_sigterm_injection = true
fs.mounts = [
  { path = "/lib", uri = "file:{{ gramine.runtimedir() }}" },
  { path = "{{ arch_libdir }}", uri = "file:{{ arch_libdir }}" },
  { path = "/usr/{{ arch_libdir }}", uri = "file:/usr/{{ arch_libdir }}" },
  { path = "/etc", uri = "file:/etc" },
  { path = "/$NAME", uri = "file:$NAME" },
]
sgx.debug = true
sgx.enclave_size = "4096M"
sgx.thread_num = 1024
sgx.file_check_policy = "allow_all_but_log"
sgx.nonpie_binary = true
sgx.trusted_files = [
  "file:{{ gramine.libos }}",
  "file:$NAME",
  "file:{{ gramine.runtimedir() }}/",
  "file:{{ arch_libdir }}/",
  "file:/usr/{{ arch_libdir }}/",
]
sgx.allowed_files = [
  "file:/etc/nsswitch.conf",
  "file:/etc/ethers",
  "file:/etc/hosts",
  "file:/etc/group",
  "file:/etc/passwd",
  "file:/etc/gai.conf",
]

EOF

touch $DIRPATH/run.sh
    cat > $DIRPATH/run.sh << EOF
#!/bin/bash
let warmUp=1      #   Default warm up 100 times
let execute=1     #   Default execute 100 times
ex_path="\$PWD" 

while getopts ":w:e:p:" opt
do
    case \$opt in
        w)
            warmUp=\$OPTARG
        ;;
        e)
            execute=\$OPTARG
        ;;
        e)
            ex_path=\$OPTARG
        ;;
        ?)
        echo "Unknown parameter"
        exit 1;;
esac done

# Warm Up for Ubuntu
for((var=0; var<\$warmUp; var++))
    do
        { ./$NAME  2>&1;} >> \$ex_path/WarmUpForUbuntu.output 2>&1
done
# Execute
for((var=0; var<\$execute; var++))
    do
        { ./$NAME  2>&1;} >> \$ex_path/ResultForUbuntu.output 2>&1
done

# Warm Up for gramine-direct
for((var=0; var<\$warmUp; var++))
    do
        { gramine-direct ./$NAME  2>&1;} >> \$ex_path/WarmUpForGramine.output 2>&1
done
# Execute
for((var=0; var<\$execute; var++))
    do
        { gramine-direct ./$NAME  2>&1;} >> \$ex_path/ResultForGramine.output 2>&1
done

# Warm Up for gramine-sgx
for((var=0; var<\$warmUp; var++))
    do
        { gramine-sgx ./$NAME 2>&1;} >> \$ex_path/WarmUpForSGX.output 2>&1
done
# Execute
for((var=0; var<\$execute; var++))
    do
        { gramine-sgx ./$NAME  2>&1;} >> \$ex_path/ResultForSGX.output 2>&1
done
EOF

                break
            fi
        fi
    done
}

# Check if an argument was provided and it's a directory
if [[ $# -eq 1 && -d "$1" ]]; then
    # Call the function for the specified directory
    traverse_dir "$1"
else
    echo "Please provide a directory path as an argument."
fi

