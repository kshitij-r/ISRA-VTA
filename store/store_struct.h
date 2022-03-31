struct instr{
    unsigned int opcode ;
    unsigned int sram_base_scalar, dram_base_scalar, x_stride; 
    unsigned int y_size, x_size;
};
/*
 struct Operands { 
    uint8_t out_mem_base  ;
    uint8_t dram_base  ;

};


 
struct microinstr{
    unsigned int  ID ;
    unsigned int opcode  ;
    unsigned int optype  ;
    Operands store_operands;
};
*/

