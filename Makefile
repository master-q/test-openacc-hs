.stack-work/install/x86_64-linux/lts-11.3/8.2.2/bin/test-openacc-hs-exe: src/Lib.hs lib/libtestacc.so
	stack build

lib/libtestacc.so: cbits/acc.c
	mkdir -p lib
	/opt/pgi/linux86-64/17.10/bin/pgcc -shared -fpic -fast -acc -ta=tesla,cc60 -o lib/libtestacc.so cbits/acc.c

run:
	ulimit -c unlimited
	LD_LIBRARY_PATH=lib ACC_DEVICE_TYPE=NVIDIA ACC_DEVICE_NUM=1 PGI_ACC_NOTIFY=1 stack exec test-openacc-hs-exe

clean:
	stack clean
	rm -rf lib

.PHONY: clean run
