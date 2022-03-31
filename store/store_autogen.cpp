// Include all header files for compilation
#include<ap_int.h>
#include<string>
#include<stdlib.h>
#include<assert.h>
#include<klee/klee.h>

// Include source files
#include<store_struct.h>
#include<store_source.h>
//Instantiating all interpreters in the configuration
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
//Takes the input of the micro-instruction decoder
void interpreter2(ap_uint<79> instr_, uint8_t dram[64], uint8_t out_mem[4][1][16]) {
    int opcode_;
      opcode_x20: for (int x20 = 0; x20 < 1; ++x20) {
        opcode_ = ((int)((ap_uint<3>)instr_(12, 10)));
      }
  #ifdef __GCC__DEF__
 try{                
    if(opcode_ != 1){
        throw opcode_;
        }
    }
    catch(unsigned int exception){
        printf("OPCODE does not match with store, code terminating!!");
         exit (EXIT_FAILURE);
    }
#endif
      int optype;
      optype_x21: for (int x21 = 0; x21 < 1; ++x21) {
        optype = ((int)((ap_uint<2>)instr_(14, 13)));
      }
        int sram_base_;
        int dram_base_;
      if (opcode_ == 1) {
        ap_uint<64> scalar2;
        scalar2_x22: for (int x22 = 0; x22 < 1; ++x22) {
          scalar2 = ((ap_uint<64>)instr_(78, 15));
        }
        sram_base_x23: for (int x23 = 0; x23 < 1; ++x23) {
          sram_base_ = ((int)((ap_uint<16>)scalar2(15, 0)));
        }
        dram_base_x24: for (int x24 = 0; x24 < 1; ++x24) {
          dram_base_ = ((int)scalar2(47, 16));
        }
      }
   // Store OUT_MEM values to DRAM array for each uinstr  
    for (int k =0; k < 16; k++){
        dram [dram_base_]= out_mem[sram_base_][0][k] ;
	dram_base_++;
     }
}
//Takes the input of the core function 
void interpreter3(int out_mem_base, int dram_base, uint8_t dram[64], uint8_t out_mem[4][1][16] ){
   // Store OUT_MEM values to DRAM array for each decoded uinstr value
     for (int k =0; k < 16; k++){
        dram [dram_base]= out_mem[out_mem_base][0][k] ;
	dram_base++;
     }
}
//Takes the output of the core function 
void interpreter4(int dram_base, uint8_t dram[64], uint8_t dram_2[64] ){
   // Store the core output 
     for (int k =0; k < 16; k++){
        dram_2 [dram_base]= dram[dram_base] ;
	dram_base++;
     }
}
