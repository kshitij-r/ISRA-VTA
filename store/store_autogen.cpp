// Include all header files for compilation
#include<ap_int.h>
#include<string>
#include<stdlib.h>
#include<assert.h>
#include<klee/klee.h>

// Include source files
#include "store_struct.h"
#include "store_source.h"
//Instantiating all interpreters in the configuration
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
    for (int k =0; k < 16; k++){
        dram [dram_base_]= out_mem[sram_base_][0][k] ;
	dram_base_++;
     }
}
void interpreter3(int sram_base, int dram_base, uint8_t dram[64], uint8_t out_mem[4][1][16] ){
     for (int k =0; k < 16; k++){
        dram [dram_base]= out_mem[sram_base][0][k] ;
	dram_base++;
     }
}
void interpreter4(int dram_base, uint8_t dram[64], uint8_t dram_2[64] ){
     for (int k =0; k < 16; k++){
        dram_2 [dram_base]= dram[dram_base] ;
	dram_base++;
     }
}

int main(int argc, const char *argv[]) {
uint8_t DRAM[64];
uint8_t DRAM_2[64];
uint8_t DRAM_3[64];
uint8_t DRAM_4[64];
uint8_t DRAM_5[64];
unsigned int opcode = 0;
unsigned int sram_base_scalar = 0;
unsigned int dram_base_scalar = 0;
unsigned int x_stride = 0;
unsigned int y_size = 0;
unsigned int x_size = 0;
ap_uint<8> uop_queue[40];
ap_uint<10> uop_id[1];
ap_uint<13> num_uop[1];
ap_uint<80> uop_q[4];
for(int i=0; i<40;i++){
    uop_queue[i] = 0;
    }
for(int i=0; i<1;i++){
    uop_id[i] = 0;
    }
for(int i=0; i<1;i++){
    num_uop[i] = 0;
    }
for(int i=0; i<4;i++){
    uop_q[i] = 0;
    }

int sram_base;
int dram_base;
uint8_t out_mem[4][1][16];

sram_base = 0;
dram_base = 0;
int counter = 1;
for (int i=0;i<x_size;++i){
    for (int j=0;j<y_size;++j){
        for (int k=0;k<16;++k){
            out_mem[i][j][k] = counter;
           counter++ ;}}}
for(int i = 0; i<64; i++) {
    DRAM[i]= 0;
    }
for(int i = 0; i<64; i++) {
    DRAM_2[i]= 0;
    }
for(int i = 0; i<64; i++) {
    DRAM_3[i]= 0;
    }
for(int i = 0; i<64; i++) {
    DRAM_4[i]= 0;
    }
for(int i = 0; i<64; i++) {
    DRAM_5[i]= 0;
    }
opcode = 1;
x_size = 4;
y_size = 1;
klee_make_symbolic(&opcode, sizeof(opcode), "opcode");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
if((opcode==1)&&(x_size==4)&&(y_size==1)){
instr instruction = { opcode, sram_base_scalar, dram_base_scalar, x_stride, y_size, x_size};
interpreter1(instruction, DRAM, out_mem);
store_decoder(instruction, uop_id, uop_queue, num_uop, uop_q, DRAM, out_mem);
while (num_uop[0] > 0) {
      ap_uint<79> uinstr = uop_q[0]; 
      if (num_uop[0] > 0) { 
      for (unsigned int i = 0; i < num_uop[0] -1 ; i++) {
          uop_q[i] = uop_q[i+1]; 
          }
          num_uop[0] = num_uop[0] - 1;
      }
      ap_uint<79> uinstruction = uinstr;
interpreter2(uinstruction, DRAM_2, out_mem);
uinstr_decoder_per_u(uinstruction, sram_base, dram_base);
interpreter3(sram_base, dram_base, DRAM_3, out_mem);
core(sram_base, dram_base, DRAM_4, out_mem);
interpreter4(dram_base, DRAM_4, DRAM_5);
}
int k = 0;
for(int i = 0; i < x_size; i++) {
    for(int j = 0; j < y_size; j++) {
        for (int m = 0; m < 16; m++) {
                assert(DRAM[k]!=DRAM_2[k]);
                assert(DRAM_2[k]==DRAM_3[k]);
                assert(DRAM_3[k]==DRAM_5[k]);
k++;
}
}
}
}return 0;
}