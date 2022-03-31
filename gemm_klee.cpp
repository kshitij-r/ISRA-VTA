// #include<iostream>
#include <cstring>
#include <cassert>
#include <klee/klee.h>
#include "gemm_var.h"

using namespace std;
#define ROW 3
#define COL 3
int res_index = 0;
int res_index_val = 0;
unsigned int result[9];
unsigned int result_val[9];
int product[ROW][COL];

unsigned int inp_mem[ROW][COL] = {{1,2,3},{1,2,3},{1,2,3}};
unsigned int wgt_mem[ROW][COL] = {{4,5,6},{4,5,6},{4,5,6}};
unsigned int acc_mem[ROW][COL] = {{0,0,0},{0,0,0},{0,0,0}};
unsigned int wgt_mem_prime[ROW][COL], out_mem[ROW*COL];
unsigned int acc_mem_flat[9], acc_mem_base_flat[9];

void transpose(int unsigned wgt_mem[][COL], unsigned int wgt_mem_prime[][COL])
{
    int i, j;
    for (i = 0; i < COL; i++)
        for (j = 0; j < COL; j++)
            wgt_mem_prime[i][j] = wgt_mem[j][i];
}

unsigned int * base_gemm(INSTR myinsn){
    unsigned int row, col, i;
    unsigned int sum;
    if(myinsn.OPCODE==2) {
        for (row = 0; row < ROW; row++) {
            for (col = 0; col < COL; col++) {
                sum = 0;
                for (i = 0; i < COL; i++) {
                    sum += (*(*(inp_mem + row) + i)) * (*(*(wgt_mem + i) + col));
                }
                *(*(product + row) + col) = sum;
            }
        }
        for (int i = 0; i < ROW; i++) {
            for (int j = 0; j < COL; j++) {
                acc_mem_base_flat[i * COL + j] = product[i][j];
            }
        }
    }
    return acc_mem_base_flat;
}

// Kernel for microdecoder by reference
unsigned int* matrixMultiply(unsigned int mat1[], unsigned int mat2[])
{
    unsigned int res = 0;
    for(int i = 0; i < 3; i++)
    {
        res += mat1[i] * mat2[i];
    }
    result[res_index] = res;
    res_index++;
    return result;
}

// Kernel for microdecoder by value
unsigned int* matrixMultiplyVal(unsigned int mat1[], unsigned int mat2[])
{
    unsigned int res = 0;
    for(int i = 0; i < 3; i++)
    {
        res += mat1[i] * mat2[i];
    }
    result_val[res_index_val] = res;
    res_index_val++;
    return result_val;
}

// Microdecoder Interpreter
unsigned int* micro_decoder(INSTR instr)
{
    unsigned int * arr_ref = nullptr;
    unsigned int inp[3], wgt[3];
    if(instr.OPCODE==2) {
        for (int i = 0; i < 3; i++) {
            inp[i] = *(instr.OPERANDS.inp_mem + i);
        }
        for (int i = 0; i < 3; i++) {
            wgt[i] = *(instr.OPERANDS.wgt_mem + i);
        }
        arr_ref = matrixMultiply(inp, wgt);
    }
        return arr_ref;
}

//Microdecoder Value Interpreter
unsigned int* micro_decoder_val(INSTR_VAL instr)
{
    unsigned int * arr_val = nullptr;
    unsigned int inp[3], wgt[3];
    if(instr.OPCODE==2) {
        for (int i = 0; i < 3; i++) {
            inp[i] = instr.OPERANDS.inp_mem + i;
        }
        for (int i = 0; i < 3; i++) {
            wgt[i] = instr.OPERANDS.wgt_mem;
        }
        arr_val = matrixMultiplyVal(inp, wgt);
    }
    return arr_val;
}

// Core Wrapper
unsigned int * core_wrapper(unsigned int acc[]){
    for(int i=0; i<ROW*COL; ++i)
        out_mem[i] = acc[i];
return out_mem;
}

int main(int argc, const char *argv[]){
    unsigned int inp_mem_row0[ROW], inp_mem_row1[ROW], inp_mem_row2[ROW];
    unsigned int wgt_mem_row0[ROW], wgt_mem_row1[ROW], wgt_mem_row2[ROW];
    unsigned int acc_mem_row0[ROW], acc_mem_row1[ROW], acc_mem_row2[ROW];
    unsigned int acc_stage1[ROW*COL], acc_stage2[ROW*COL], acc_stage3[ROW*COL], acc_stage4[ROW*COL];
    unsigned int * acc_mem_ref;
    unsigned int * acc_mem_val;
    unsigned int * acc_mem_gemm;
    unsigned int * out_mem_core;
    unsigned int opcode, op_type;
    
    transpose(wgt_mem,wgt_mem_prime);
    
    memcpy(inp_mem_row0,inp_mem[0],sizeof(inp_mem_row0));
    memcpy(inp_mem_row1,inp_mem[1],sizeof(inp_mem_row1));
    memcpy(inp_mem_row2,inp_mem[2],sizeof(inp_mem_row2));
    memcpy(wgt_mem_row0,wgt_mem_prime[0],sizeof(wgt_mem_row0));
    memcpy(wgt_mem_row1,wgt_mem_prime[1],sizeof(wgt_mem_row1));
    memcpy(wgt_mem_row2,wgt_mem_prime[2],sizeof(wgt_mem_row2));
    memcpy(acc_mem_row0,acc_mem[0],sizeof(acc_mem_row0));
    memcpy(acc_mem_row1,acc_mem[1],sizeof(acc_mem_row1));
    memcpy(acc_mem_row2,acc_mem[2],sizeof(acc_mem_row2));
    klee_make_symbolic(&op_type, sizeof(op_type), "op_type");
    klee_make_symbolic(&opcode, sizeof(opcode), "opcode");
    
    //Big instruction for L42 Decoder
    GEMM_STRUCT_REF gemm_base = {inp_mem[0], wgt_mem[0], acc_mem[0]};
    INSTR instruction = {0,2,0, gemm_base};

    // Microperation formed by passing matrix values by reference
    GEMM_STRUCT_REF gemm_uop[9] = {{&inp_mem_row0[0],&wgt_mem_row0[0],&acc_mem_row0[0]},{&inp_mem_row0[0],&wgt_mem_row1[0],&acc_mem_row0[1]},
                                   {&inp_mem_row0[0],&wgt_mem_row2[0],&acc_mem_row0[2]},{&inp_mem_row1[0],&wgt_mem_row0[0],&acc_mem_row1[0]},
                                   {&inp_mem_row1[0],&wgt_mem_row1[0],&acc_mem_row1[1]},{&inp_mem_row1[0],&wgt_mem_row2[0],&acc_mem_row1[2]},
                                   {&inp_mem_row2[0],&wgt_mem_row0[0],&acc_mem_row2[0]},{&inp_mem_row2[0],&wgt_mem_row1[0],&acc_mem_row2[1]},
                                   {&inp_mem_row2[0],&wgt_mem_row2[0],&acc_mem_row2[2]}};

    // Microperation formed by passing matrix values by value(dereferenced)
    GEMM_STRUCT_VAL gemm[9] = {{inp_mem_row0[0],wgt_mem_row0[0],acc_mem_row0[0]},{inp_mem_row0[0],wgt_mem_row1[0],acc_mem_row0[1]},
                               {inp_mem_row0[0],wgt_mem_row2[0],acc_mem_row0[2]},{inp_mem_row1[0],wgt_mem_row0[0],acc_mem_row1[0]},
                               {inp_mem_row1[0],wgt_mem_row1[0],acc_mem_row1[1]},{inp_mem_row1[0],wgt_mem_row2[0],acc_mem_row1[2]},
                               {inp_mem_row2[0],wgt_mem_row0[0],acc_mem_row2[0]},{inp_mem_row2[0],wgt_mem_row1[0],acc_mem_row2[1]},
                               {inp_mem_row2[0],wgt_mem_row2[0],acc_mem_row2[2]}};

    INSTR microop[9] = {{0,2,0,gemm_uop[0]},{1,2,0,gemm_uop[1]},{2,2,0,gemm_uop[2]},{3,2,0,gemm_uop[3]},
                        {4,2,0,gemm_uop[4]}, {5,2,0,gemm_uop[5]},{6,2,0,gemm_uop[6]},{7,2,0,gemm_uop[7]},{8,2,0,gemm_uop[8]}};

    INSTR_VAL microop_val[9] = {{0,2,0,gemm[0]},{1,2,0,gemm[1]},{2,2,0,gemm[2]},{3,2,0,gemm[3]},
                                {4,2,0,gemm[4]}, {5,2,0,gemm[5]},{6,2,0,gemm[6]},{7,2,0,gemm[7]},{8,2,0,gemm[8]}};

    // KLEE verification assertion statements
    if((opcode == 2) && ((op_type >= 0)&& (op_type <= 3))){
        acc_mem_gemm = base_gemm(instruction);
        for (int i=0;i<9;i++){
            acc_stage1[i]=acc_mem_gemm[i];
        }
        for (int i=0;i<9;i++){
            acc_mem_ref = micro_decoder(microop[i]);
            acc_stage2[i]=acc_mem_ref[i];
        }
        for (int i=0;i<9;i++){
            acc_mem_val = micro_decoder_val(microop_val[i]);
            acc_stage3[i]=acc_mem_val[i];
        }
        out_mem_core = core_wrapper(acc_stage3);
        for (int i=0;i<9;i++){
            acc_stage4[i]=out_mem_core[i];
        }
         for (int i = 0; i < ROW*COL; i++) {
             assert(acc_stage1[i] == acc_stage2[i]); //Verification between GEMM instr and microinstructions
             assert(acc_stage2[i] == acc_stage3[i]); //Verification between microinstructions by reference and microinstructions by value
             assert(acc_stage4[i] == acc_stage3[i]); //Verification between core and microinstructions
        }
    }
    return 0;
}