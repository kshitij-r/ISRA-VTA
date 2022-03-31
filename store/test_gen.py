import os
import json
import inspect
import string
import functools
import operator

f = open('spec.json',)
data = json.load(f)
source_files = []
interpreter_files = []
for value in data:
    if (value == "source_files"):
        source_files.append(data["source_files"])
source_file_top_count = len(source_files)
for x in source_files:
    source_file_nest_count = len(x)

for value in data:
    if (value == "interpreter_names"):
        interpreter_files.append(data["interpreter_names"])
interpreter_top_count = len(interpreter_files)
for x in interpreter_files:
    interpreter_nest_count = len(x)

with open("store_autogen.cpp",'w',encoding = 'utf-8') as file:
    file.write("// Include all header files for compilation" + '\n')
    file.write("#include<ap_int.h>" + '\n' + "#include<string>" + '\n' + \
    "#include<stdlib.h>"+ '\n' +  "#include<assert.h>"+ '\n' +  "#include<klee/klee.h>"+ '\n')
    file.write('\n') 
    file.write("// Include source files" + '\n')
    for i in range(source_file_top_count):
        for j in range(source_file_nest_count):
            file.write("#include<" + source_files[i][j] + ">" + '\n')
    
    file.write("//Instantiating all interpreters in the configuration" + '\n')
    def interpreter_instance(interpreter_name):
        with open(interpreter_name,'r',encoding = 'utf-8' ) as file2:
            for line in file2:
                file.write(line)
    
    for i in range(interpreter_top_count):
        for j in range(interpreter_nest_count):
            interpreter_instance(interpreter_files[i][j])
            file.write('\n')

        
        

    

