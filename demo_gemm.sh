python3 harness_gen.py
clang++-9 -I ~/klee/include -I ./include_new -emit-llvm -c -g autogen_testharness.cpp
klee autogen_testharness.bc 
