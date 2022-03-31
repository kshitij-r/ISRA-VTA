python3 harness_store.py
clang++-9 -I ~/klee/include -I ./include_new -emit-llvm -c -g autogen_testharness_store.cpp
klee autogen_testharness_store.bc 
