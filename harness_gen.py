import os
import json
import inspect
# import python_test

f = open('specification.json',)
data = json.load(f)

# objects = [python_test.interpreter1]
# copy = ''

# with open("autogen_testharness.cpp",'w') as file
# file.write('input logic rst_ni,\n')
with open("autogen_testharness.cpp",'w',encoding = 'utf-8') as f:

    with open("header.c",'r',encoding = 'utf-8' ) as file2:
        for line in file2:
            f.write(line)
    
    with open("base_int.txt",'r',encoding = 'utf-8' ) as file3:
        for line in file3:
            f.write(line)
    
    with open("base_int2.txt",'r',encoding = 'utf-8' ) as file4:
        for line in file4:
            f.write(line)
    
    with open("base_int3.txt",'r',encoding = 'utf-8' ) as file4:
        for line in file4:
            f.write(line)
    
    with open("base_main.txt",'r',encoding = 'utf-8' ) as file5:
        for line in file5:
            f.write(line)

#store interpreter names in list
interpreters = []
for i in data['interpreter_names']:
    interpreters.append(i)
# print(*interpreters, sep = "\n") 

#store test variables in list
test_var = []
for i in data['test_variables']:
    test_var.append(i)
# print(*test_var, sep = "\n") 

#store symbolic variables in list
sym_var = []
for i in data['symbolic_variables']:
    sym_var.append(i)
# print(*sym_var, sep = "\n") 

#store execution bound in list
# for i in data['execution_bound']:
#     print(i, data[i])

#store assertions in list
# for i in data['assertion']:
#     print(i)

# f.close()