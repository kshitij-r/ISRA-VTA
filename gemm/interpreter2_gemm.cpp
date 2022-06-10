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
    for(int i=0; i<ROW;i++){
        for(int j=0;j<COL;j++){
            acc_mem_base_flat[i*COL+j] = product[i][j];
        }
    }
    }
    return acc_mem_base_flat;
}