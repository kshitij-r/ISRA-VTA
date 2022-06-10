unsigned int* micro_decoder_val(INSTR_VAL instr)
{
    unsigned int * arr_val = nullptr;
    unsigned int inp[3], wgt[3];
    if(instr.OPCODE==2) {
        for (int i=0;i<3;i++){
            inp[i] = instr.OPERANDS.inp_mem+i;
        }
        for (int i=0;i<3;i++){
            wgt[i] = instr.OPERANDS.wgt_mem;
        }
        arr_val = matrixMultiply(inp,wgt);
    }
    return arr_val;
}