#ifndef ISRA_GEMM_VAR_H
#define ISRA_GEMM_VAR_H

#endif //ISRA_GEMM_VAR_H
struct GEMM_STRUCT_REF{
    unsigned int *inp_mem;
    unsigned int *wgt_mem;
    unsigned int *acc_mem;
};

struct GEMM_STRUCT_BASE{
    unsigned int **inp_mem;
    unsigned int **wgt_mem;
    unsigned int **acc_mem;
};

struct GEMM_STRUCT_VAL{
    unsigned int inp_mem;
    unsigned int wgt_mem;
    unsigned int acc_mem;
};

struct INSTR{
    unsigned int ID;
    unsigned int OPCODE;
    unsigned int OPTYPE;
    GEMM_STRUCT_REF OPERANDS;
};

struct INSTR_BASE{
    unsigned int ID;
    unsigned int OPCODE;
    unsigned int OPTYPE;
    GEMM_STRUCT_BASE OPERANDS;
};

struct INSTR_VAL{
    unsigned int ID;
    unsigned int OPCODE;
    unsigned int OPTYPE;
    GEMM_STRUCT_VAL OPERANDS;
};