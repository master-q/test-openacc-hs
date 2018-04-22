# test-openacc-hs

```
$ make
mkdir -p lib
/opt/pgi/linux86-64/17.10/bin/pgcc -shared -fpic -fast -acc -ta=tesla,cc60 -o lib/libtestacc.so cbits/acc.c
stack build
test-openacc-hs-0.1.0.0: unregistering (local file changes: README.md app/Main.hs package.yaml src/Lib.hs test-openacc-hs.cabal)
Building all executables for `test-openacc-hs' once. After a successful build of all of them, only specified executables will be rebuilt.
test-openacc-hs-0.1.0.0: configure (lib + exe)
Configuring test-openacc-hs-0.1.0.0...
test-openacc-hs-0.1.0.0: build (lib + exe)
Preprocessing library for test-openacc-hs-0.1.0.0..
Building library for test-openacc-hs-0.1.0.0..
[1 of 2] Compiling Lib              ( src/Lib.hs, .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/Lib.o )
[2 of 2] Compiling Paths_test_openacc_hs ( .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/autogen/Paths_test_openacc_hs.hs, .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/Paths_test_openacc_hs.o )
Preprocessing executable 'test-openacc-hs-exe' for test-openacc-hs-0.1.0.0..
Building executable 'test-openacc-hs-exe' for test-openacc-hs-0.1.0.0..
[1 of 2] Compiling Main             ( app/Main.hs, .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/test-openacc-hs-exe/test-openacc-hs-exe-tmp/Main.o )
[2 of 2] Compiling Paths_test_openacc_hs ( .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/test-openacc-hs-exe/autogen/Paths_test_openacc_hs.hs, .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/test-openacc-hs-exe/test-openacc-hs-exe-tmp/Paths_test_openacc_hs.o )
Linking .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/test-openacc-hs-exe/test-openacc-hs-exe ...
test-openacc-hs-0.1.0.0: copy/register
Installing library in /home/kiwamu/src/test-openacc-hs/.stack-work/install/x86_64-linux/lts-11.3/8.2.2/lib/x86_64-linux-ghc-8.2.2/test-openacc-hs-0.1.0.0-BEbANszZF7r4p0JDQtDviz
Installing executable test-openacc-hs-exe in /home/kiwamu/src/test-openacc-hs/.stack-work/install/x86_64-linux/lts-11.3/8.2.2/bin
Registering library for test-openacc-hs-0.1.0.0..
$ make run
ulimit -c unlimited
LD_LIBRARY_PATH=lib ACC_DEVICE_TYPE=NVIDIA ACC_DEVICE_NUM=1 PGI_ACC_NOTIFY=1 stack exec test-openacc-hs-exe
*** acc_init called!
total/free CUDA memory: 0/0
Segmentation fault (core dumped)
Makefile:9: recipe for target 'run' failed
make: *** [run] Error 139
$ gdb .stack-work/install/x86_64-linux/lts-11.3/8.2.2/bin/test-openacc-hs-exe core
--snip--
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Core was generated by `/home/kiwamu/src/test-openacc-hs/.stack-work/install/x86_64-linux/lts-11.3/8.2.'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x00007f6855e787ca in __pgi_uacc_cuda_error_handler () from /opt/pgi/linux86-64/17.10/lib/libaccn.so
[Current thread is 1 (Thread 0x7f6857a56740 (LWP 21368))]
(gdb) bt
#0  0x00007f6855e787ca in __pgi_uacc_cuda_error_handler () from /opt/pgi/linux86-64/17.10/lib/libaccn.so
#1  0x00007f6855e7c3c6 in __pgi_uacc_cuda_init () from /opt/pgi/linux86-64/17.10/lib/libaccn.so
#2  0x00007f685609e289 in __pgi_uacc_enumerate () from /opt/pgi/linux86-64/17.10/lib/libaccg.so
#3  0x00007f685609e5c4 in __pgi_uacc_initialize () from /opt/pgi/linux86-64/17.10/lib/libaccg.so
#4  0x00007f68562b6c05 in acc_get_device_type () from /opt/pgi/linux86-64/17.10/lib/libaccapi.so
#5  0x00007f6857355a07 in wrap_acc_init () at cbits/acc.c:5
#6  0x00000000004096cd in ?? ()
#7  0x0000000000000000 in ?? ()
```

