//Takes the input of the instruction Decoder
void interpreter1(struct instr myinsn, uint8_t DRAM[64], uint8_t out_mem[4][1][16] ){
  #ifdef __GCC__DEF__
    try{                
    if(myinsn.opcode != 1){
        throw myinsn.opcode;
        }
    }
    catch(unsigned int exception){
        printf("OPCODE does not match with store, code terminating!!");
         exit (EXIT_FAILURE);
    }
#endif
    // Store OUT_MEM values to DRAM array based on x_size and y_size
for (int i =0; i<myinsn.x_size; i++){
    for (int j =0; j<myinsn.y_size; j++){
    for (int k =0; k < 16; k++){
        DRAM [myinsn.dram_base_scalar]= out_mem[myinsn.sram_base_scalar][j][k] ;
	myinsn.dram_base_scalar++;
        } 
    }
	myinsn.sram_base_scalar++ ;
	 }
 }