python3 test_gen.py
clang++-9 -I ~/klee/include -I ../include_new -emit-llvm -c -g store_autogen.cpp
klee store_autogen.bc 
