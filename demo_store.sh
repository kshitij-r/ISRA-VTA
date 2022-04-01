python3 harness_store.py
clang++-9 -I ~/klee/include -I ./include_new -emit-llvm -c -g store_2d.cpp
klee store_2d.bc 
