unsigned int* micro_decoder(INSTR instr)
{
    unsigned int *arr_ref = nullptr;
    unsigned int inp[3], wgt[3];
    if(instr.OPCODE==2) {
        for (int i=0;i<3;i++){
            inp[i] = *(instr.OPERANDS.inp_mem+i);
        }
        for (int i=0;i<3;i++){
            wgt[i] = *(instr.OPERANDS.wgt_mem+i);
        }
        arr_ref = matrixMultiply(inp,wgt);
    }
    return arr_ref;
}