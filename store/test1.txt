#ifdef __GCC__DEF__
#include <exception>
#include<iostream>
#endif

#include<ap_int.h>
#include<string>
#include<vector>
#include<stdlib.h>
#include<assert.h>
#include <klee/klee.h>
#include "store_struct.h"
#include "store_source.h"

const int X_SIZE = 4;
const int Y_SIZE = 1;

//Takes the input of the instruction Decoder
void interpreter1(struct instr myinsn, uint8_t DRAM[64], uint8_t out_mem[4][1][16] ){

  #ifdef __GCC__DEF__
    try{                //TODO : Add exceptions for out of bound memory access while accessing OUT_MEM
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
    } }
	myinsn.sram_base_scalar++ ;
	 }

 }

//Takes the input of the micro-instruction decoder
void interpreter2(ap_uint<79> instr_, uint8_t dram[64], uint8_t out_mem[4][1][16]) {

    int opcode_;
      opcode_x20: for (int x20 = 0; x20 < 1; ++x20) {
        opcode_ = ((int)((ap_uint<3>)instr_(12, 10)));
	//printf("opcode: %d\n", opcode_);
      }
  #ifdef __GCC__DEF__
 try{                //TODO : Add exceptions for out of bound memory access while accessing OUT_MEM
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
	//printf("optype: %d\n", optype);
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
	//printf("sram_base: %d\n", sram_base_);
        }
        dram_base_x24: for (int x24 = 0; x24 < 1; ++x24) {
          dram_base_ = ((int)scalar2(47, 16));
	//printf("dram_base: %d\n", dram_base_);
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


int main(int argc, const char *argv[]) {

unsigned int opcode;
unsigned int y_size, x_size;
uint8_t DRAM[64];
uint8_t DRAM_2[64];
uint8_t DRAM_3[64];
uint8_t DRAM_4[64];
uint8_t DRAM_5[64];
uint8_t out_mem[4][1][16];

ap_uint<80> uop_q[4];
unsigned int sram_base_scalar;
int sram_base ;
unsigned int dram_base_scalar;
int dram_base ;
unsigned int x_stride; 
ap_uint<10> uop_id[1];
ap_uint<8> uop_queue[40];
ap_uint<13> num_uop[1];
sram_base_scalar = 0;
dram_base_scalar =0;
x_stride= 0 ; 
opcode =1;
x_size = 4;
y_size = 1;
uop_id[0] = 0;

sram_base  =0 ;

dram_base =0;

for ( int i = 0; i<64; i++) {
	 DRAM[i] = 0;
}


for ( int i = 0; i<64; i++) {
	 DRAM_3[i] = 0;
}


for ( int i = 0; i<64; i++) {
	 DRAM_2[i] = 0;
}
for ( int i = 0; i<64; i++) {
	 DRAM_4[i] = 0;
}

for ( int i = 0; i<64; i++) {
	 DRAM_5[i] = 0;
}


int u = 1;
for (int i = 0; i < x_size; ++i) {
         for (int j = 0; j < y_size; ++j) {
                 for (int k = 0; k < 16; ++k) {
		out_mem[i][j][k] = u;
		u++;
                 }
 
         }
 }

for (int i =0; i< 4; i++){

uop_q[i] = 0 ;
}

 for (int i =0; i< 40; i++){

uop_queue[i] = 0 ;
}
num_uop[0] = 0;

opcode = 1;
y_size = 1;
x_size =4;


klee_make_symbolic(&opcode, sizeof(opcode), "opcode");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");

if( (opcode ==1) && (y_size ==1) && (x_size==4) ) {


instr instruction = { opcode, sram_base_scalar, dram_base_scalar, x_stride,  y_size,x_size };

interpreter1(instruction, DRAM, out_mem );
store_decoder(instruction, uop_id, uop_queue, num_uop, uop_q ,  DRAM, out_mem);

 while (num_uop[0] > 0) {
  ap_uint<79> uinstr = uop_q[0]; //assign the first element in uop_q to uinstr
   if (num_uop[0] > 0) { 
   for (unsigned int i = 0; i < num_uop[0] -1 ; i++) {
	 uop_q[i] = uop_q[i+1]; // remove the first element in uop_q, shift remaining elements forward and decrease num_ops by 1 
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

 #ifdef __GCC__DEF__
   for (int i = 0; i < X_SIZE ; i++) {
   for (int j = 0; j < Y_SIZE; j++) {
   for (int k = 0; k < 16; k++) {
	printf("OUT_MEM[%d][%d][%d] = %u\n", i,j,k, out_mem[i][j][k]);
    } }}

	printf("\n");
   for (int i = 0; i < (x_size * y_size * 16); i++) {

	printf("DRAM[%d]= %u\n", i, DRAM[i]);
       }

for (int i = 0; i < (x_size * y_size * 16); i++) {

	printf("DRAM_2[%d]= %u\n", i, DRAM_2[i]);
       }
for (int i = 0; i < (x_size * y_size * 16); i++) {

	printf("DRAM_3[%d]= %u\n", i, DRAM_3[i]);
       }

for (int i = 0; i < (x_size * y_size * 16); i++) {

	printf("DRAM_5[%d]= %u\n", i, DRAM_4[i]);
       }


#endif

int k = 0;
    for (int i = 0; i < X_SIZE; i++) {
    for (int j = 0; j < Y_SIZE; j++) {
    for (int m = 0; m < 16; m++) {
	assert (DRAM[k] == DRAM_2[k]); //Verifying the semantic equivalence of Store instr and microinstructions


	assert (DRAM_2[k] == DRAM_3[k]); //Verifying the semantic equivalence of micro-instructions and decoded micro-instructions


	assert (DRAM_3[k] == DRAM_5[k]); //Verifying the Core unit preserving semantic equivalence  

	k++;
//	printf("assertion passed\n");
    }  } }
}
return 0;
}

