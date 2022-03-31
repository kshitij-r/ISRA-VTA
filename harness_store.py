import os
import json
import inspect
# import python_test

f = open('spec_store.json',)
data = json.load(f)

def __init__(self, path, filename): 
        self.path = path
        self.filename = filename
        self.inputs = list()
        self.outputs = list()
        self.module_names = list()
        self.parameters = list()
        self.packages = list()
        self.includes = list()

def file_read(self):
        if (not self.filename.endswith('.json')):
            print('Only files ending in .json should be given')
            exit(0)
        try:
            with open(os.path.join(self.path, self.filename), 'r') as file:
                f_contents = file.read()
            f_contents = re_pat_line_comment.sub('', f_contents)      
            f_contents = re_pat_block_comment.sub('', f_contents)
            temp = (re.search(r'endmodule', f_contents)).span()[1]
            f_contents = f_contents[:(temp + 1)]
        except FileNotFoundError:
            print('File not found')
        except AttributeError:
            print('There is only commented code')
        else:
            return f_contents

def extract_headers(self):
        contents = self.file_read()
        matches_pack = re_pat_packages.findall(contents)
        matches_incl = re_pat_includes.findall(contents)
        if len(matches_pack) != 0:
            for match in matches_pack:
                if ',' in match[1]:
                    match2 = re.sub(r'\s+', '', match[1])
                    imports = match2.split(',')
                    name_header = match[0]
                    self.packages.append(tuple([name_header, tuple(imports)]))
                else:
                    self.packages.append(match)

        if len(matches_incl) != 0:
            for match in matches_incl:
                match2 = re.sub(r'([./]|\s)+', '', match)
                self.includes.append(match2.strip())

def extract_param(self):
        contents = self.file_read()
        try:
            param_range = re.search(r'#\s*[(][^(]+[)]', contents).span()
        except AttributeError as e:
            print(e)
        else:
            matches_param = re_pat_param.findall(contents[param_range[0]:param_range[1] + 1])
            #print(type(matches_param))
            if len(matches_param) != 0:
                for matches in matches_param:
                    if matches[1][-1] == ',':
                        temp_p = matches[1][:-1].split('=')
                    else:
                        temp_p = matches[1].split('=')
                    for i in range(len(temp_p)):
                        temp_p[i] = temp_p[i].strip()

                    temp_p[0] = temp_p[0].split()
                    self.parameters.append(tuple(temp_p))

with open("autogen_testharness_store.cpp",'w',encoding = 'utf-8') as f:

    #
    #ifdef __GCC__DEF__
#include <exception>
#include<iostream>
#endif
#include<ap_int.h>
#include<string>
#include<vector>
#include<stdlib.h>
#include<assert.h>
#include <klee/klee.h>
    #

    with open("header.c",'r',encoding = 'utf-8' ) as file2:
        for line in file2:
            f.write(line)
    
    with open("base_int_store.txt",'r',encoding = 'utf-8' ) as file3:
        for line in file3:
            f.write(line)
    
    with open("int2_store.txt",'r',encoding = 'utf-8' ) as file4:
        for line in file4:
            f.write(line)
    
    with open("int3_store.txt",'r',encoding = 'utf-8' ) as file4:
        for line in file4:
            f.write(line)
    
    with open("main_store.txt",'r',encoding = 'utf-8' ) as file5:
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