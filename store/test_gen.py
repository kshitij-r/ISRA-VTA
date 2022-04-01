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
test_var = []
test_var_init_val = []
test_var_size = []
test_var_type = []
sym_var = []
sym_var_type = []
sym_var_init = []
instr_template = []

for value in data:
    if (value == "instruction"):
        instr_template.append(data["instruction"])
instr_template = [item for sublist in instr_template for item in sublist]
# print(instr_template)

for value in data:
    if (value == "source_files"):
        source_files.append(data["source_files"])
source_files = [item for sublist in source_files for item in sublist]
source_file_top_count = len(source_files)

for value in data:
    if (value == "interpreter_names"):
        interpreter_files.append(data["interpreter_names"])
interpreter_files = [item for sublist in interpreter_files for item in sublist]
interpreter_top_count = len(interpreter_files)

for value in data:
    if (value == "test_variables"):
        test_var.append(data["test_variables"])
test_var = [item for sublist in test_var for item in sublist]
# print(test_var)

for value in data:
    if (value == "test_variables_init_val"):
        test_var_init_val.append(data["test_variables_init_val"])
test_var_init_val = [item for sublist in test_var_init_val for item in sublist]
# print(test_var_init_val)

for value in data:
    if (value == "test_variables_arr_size"):
        test_var_size.append(data["test_variables_arr_size"])
test_var_size = [item for sublist in test_var_size for item in sublist]
# print(test_var_size)

for value in data:
    if (value == "test_variables_type"):
        test_var_type.append(data["test_variables_type"])
test_var_type = [item for sublist in test_var_type for item in sublist]
# print(test_var_type)

for value in data:
    if (value == "symbolic_variables"):
        sym_var.append(data["symbolic_variables"])
sym_var = [item for sublist in sym_var for item in sublist]
# print(sym_var)

for value in data:
    if (value == "symbolic_variables_datatype"):
        sym_var_type.append(data["symbolic_variables_datatype"])
sym_var_type = [item for sublist in sym_var_type for item in sublist]
# print(sym_var_type)

for value in data:
    if (value == "execution_bound"):
        sym_var_init.append(data["execution_bound"])
sym_var_init = [item for sublist in sym_var_init for item in sublist]
# print(sym_var_init)

with open("store_autogen.cpp",'w',encoding = 'utf-8') as file:
    file.write("// Include all header files for compilation" + '\n')
    file.write("#include<ap_int.h>" + '\n' + "#include<string>" + '\n' + \
    "#include<stdlib.h>"+ '\n' +  "#include<assert.h>"+ '\n' +  "#include<klee/klee.h>"+ '\n')
    file.write('\n') 
    file.write("// Include source files" + '\n')
    for i in range(source_file_top_count):
        # print(source_files[i])
        file.write("#include<" + source_files[i] + ">" + '\n')
    
    file.write("//Instantiating all interpreters in the configuration" + '\n')
    def interpreter_instance(interpreter_name):
        with open(interpreter_name,'r',encoding = 'utf-8' ) as file2:
            for line in file2:
                file.write(line)
    
    for i in range(interpreter_top_count):
            interpreter_instance(interpreter_files[i])
            file.write('\n')
    
    file.write('\n')
    file.write("int main(int argc, const char *argv[]) {" + '\n')
    for x in range(len(sym_var)):
        file.write(sym_var_type[x] + " " + sym_var[x] + ";" + '\n')
    for x in range(len(test_var)):
        file.write(test_var_type[x] + " " + test_var[x] + "[" + str(test_var_size[x]) + "];" + '\n')
    for x in range(len(instr_template)):
        file.write(instr_template[x] + " = 0" + ";" + '\n')
    #initialize microqueue values
    uqueue_name = []
    uinsn_id = []
    uinsn_no = []
    uinsn_top = []

    for value in data:
        if (value == "microqueue"):
            uqueue_name.append(data["microqueue"])
    uqueue_name = [item for sublist in uqueue_name for item in sublist]
    # print(uqueue_name)
    
    for value in data:
        if (value == "microinsn_id"):
            uinsn_id.append(data["microinsn_id"])
    uinsn_id = [item for sublist in uinsn_id for item in sublist]
    # print(uinsn_id)
    
    for value in data:
        if (value == "microinsn_number_uop"):
            uinsn_no.append(data["microinsn_number_uop"])
    uinsn_no = [item for sublist in uinsn_no for item in sublist]
    # print(uinsn_no)

    for value in data:
        if (value == "microinsn_top_insn"):
            uinsn_top.append(data["microinsn_top_insn"])
    uinsn_top = [item for sublist in uinsn_top for item in sublist]
    # print(uinsn_top)

    #declare uinsn here
    file.write(uqueue_name[3] + " " + uqueue_name[0] + "[" + str(uqueue_name[1]) + "];\n")
    file.write(uinsn_id[3] + " " + uinsn_id[0] + "[" + str(uinsn_id[1]) + "];\n")
    file.write(uinsn_no[3] + " " + uinsn_no[0] + "[" + str(uinsn_no[1]) + "];\n")
    file.write(uinsn_top[3] + " " + uinsn_top[0] + "[" + str(uinsn_top[1]) + "];\n")
    # initialize microinstruction queue components
    file.write("for(int i=0; i<" + str(uqueue_name[1]) + ";i++){\n")
    file.write("    " + uqueue_name[0] + "[i] = " + str(uqueue_name[2]) + ";\n")
    file.write("    }\n") 
    
    file.write("for(int i=0; i<" + str(uinsn_id[1]) + ";i++){\n")
    file.write("    " + uinsn_id[0] + "[i] = " + str(uinsn_id[2]) + ";\n")
    file.write("    }\n") 

    file.write("for(int i=0; i<" + str(uinsn_no[1]) + ";i++){\n")
    file.write("    " + uinsn_no[0] + "[i] = " + str(uinsn_no[2]) + ";\n")
    file.write("    }\n") 

    file.write("for(int i=0; i<" + str(uinsn_top[1]) + ";i++){\n")
    file.write("    " + uinsn_top[0] + "[i] = " + str(uinsn_top[2]) + ";\n")
    file.write("    }\n\n") 

    function_param = []
    for value in data:
        if(value == "function_param"):
            function_param.append((data["function_param"]))
    function_param = [item for sublist in function_param for item in sublist]
    print(function_param)

    file.write(function_param[0][0] + " " + function_param[0][1] + ";\n")
    file.write(function_param[1][0] + " " + function_param[1][1] + ";\n")
    file.write(function_param[2][0] + " " + function_param[2][1] + ";\n\n")

    file.write(function_param[0][1] + " = " + str(function_param[0][2]) + ";\n")
    file.write(function_param[1][1] + " = " + str(function_param[1][2]) + ";\n")
    file.write("int counter = 1;\n")
    file.write("for (int i=0;i<x_size:++i){\n")
    file.write("    for (int j=0;j<y_size:++j){\n")
    file.write("        for (int k=0;k<16:++k){\n")
    file.write("            out_mem[i][j][k] = " + "counter" + ";\n")
    file.write("           " + "counter++ ;}}}\n")


    def test_var_initialization(test_var,iterator):
        file.write("for(int i = 0; i<" + str(test_var_size[iterator]) + "; i++) {" + '\n')
        # print(test_var[iterator])
        file.write("    " + test_var + "[i]" + "= " + str(test_var_init_val[iterator]) + ";" + '\n')
        file.write("    )" + '\n')

    for count in range(len(test_var)):
        test_var_initialization(test_var[count],count)
    
    for count in range(len(sym_var)):
        file.write(sym_var[count] + " = " + str(sym_var_init[count]) + ";\n")
    
    def make_symbolic(sym_variable):
        variable_string = sym_variable
        # print(variable_string)
        file.write("klee_make_symbolic(&" + variable_string + "," + " sizeof(" + variable_string + ")" + ", " + "\""+variable_string + "\""+');\n')
    
    for count in range(len(sym_var)):
        make_symbolic(sym_var[count])
    
    file.write("if((" + sym_var[0] + "==" + str(sym_var_init[0]) + ")&&(" + sym_var[1] + "==" + str(sym_var_init[1]) + ")&&(" +sym_var[2] + "==" + str(sym_var_init[2]) + ")){\n")
    

    

