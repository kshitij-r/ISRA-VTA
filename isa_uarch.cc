
//#include <boost/utility/binary.hpp>
#include <ap_int.h>
#include <ap_fixed.h>
//#include <assert.h>
#include <klee/klee.h>
//#include <ap_axi_sdata.h>
//#include <hls_stream.h>
//#include <hls_math.h>
//#include <math.h>
//#include <stdint.h>
#include <string.h>
#include <ap_int.h>
//#include <iostream>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h>
#include <stdint.h>
#include <assert.h>
#include <klee/klee.h>

/*
void default_function() {
    
    #ifdef __GCC__DEF__
    for (int i = 0; i <= 10; i++) {
        printf("Array val: %d\n", array[i]);
    }
    #endif
    
}
*/
//void default_function(ap_uint<132> instr, ap_uint<8> out_mem[3][1][16], ap_uint<8> DRAM[48]) {
void default_function_isa(ap_uint<32> sram_base, ap_uint<32> dram_base,ap_uint<32> y_size, ap_uint<32> x_size, ap_uint<32> x_stride, ap_uint<8> out_mem[8][1][16], ap_uint<8> DRAM[128]) {

  ap_uint<32> _top;
/*  ap_uint<32> sram_base;
  sram_base_x: for (ap_int<32> x = 0; x < 1; ++x) {
 //   sram_base = ((ap_uint<32>)instr(24, 9));
	sram_base = 0;
  }
  ap_uint<32> dram_base;
  dram_base_x1: for (ap_int<32> x1 = 0; x1 < 1; ++x1) {
//    dram_base = ((ap_uint<32>)instr(56, 25));
	dram_base = 16;
  }
  ap_uint<32> y_size;
  y_size_x2: for (ap_int<32> x2 = 0; x2 < 1; ++x2) {
//    y_size = ((ap_uint<32>)instr(79, 64));
     y_size = 1;
  }
  ap_uint<32> x_size;
  x_size_x3: for (ap_int<32> x3 = 0; x3 < 1; ++x3) {
    //x_size = ((ap_uint<32>)instr(95, 80));
      x_size = 8;
  }
  ap_uint<32> x_stride;
  x_stride_x4: for (ap_int<32> x4 = 0; x4 < 1; ++x4) {
   // x_stride = ((ap_uint<32>)instr(111, 96));
	x_stride = 8;
  }*/

/*  sram_base = 0;
  dram_base = 16;
  y_size = 1;
  x_size = 8;
  x_stride = 8; */

  ap_uint<32> store;
  ap_uint<32> store_data;

    store_data_x5: for (ap_int<32> x5 = 0; x5 < x_size; ++x5) {
  store_data_y: for (ap_int<32> y = 0; y < y_size; ++y) {
      ap_uint<32> mutate0;
      mutate0_row: for (ap_int<32> row = 0; row < 1; ++row) {
        mutate0_col: for (ap_int<32> col = 0; col < 16; ++col) {
//	 printf("hello\n");
	 //printf("%ll\n", (((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col)));
	// printf("%ll\n", dram_base);
/*	printf("dram_index: %s\n", (((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col)).to_string().c_str());
	printf("out_mem_index1: %s\n",((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)).to_string().c_str());
	printf("out_mem_index2: %s\n", ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U).to_string().c_str());
	printf("out_mem_index3: %s\n", ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U).to_string().c_str());
*/
          DRAM[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))] = out_mem[((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U))][((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)][((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)];
	}
      }
    }

  }

//return DRAM[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))];
}

//
//UARCH
//
#include <ap_int.h>
//#include <iostream>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h>
#include <stdint.h>
#include <assert.h>
#include <klee/klee.h>
using namespace std;
  
// void default_function(unsigned int insn_addr, unsigned int insn_count, ap_uint<8> inp_mem[32768][1][16], ap_uint<8> wgt_mem[262144][16][16], unsigned int acc_mem[131072][1][16], ap_uint<8> out_mem[32768][1][16], unsigned int uop_mem[32768], ap_uint<8> DRAM[134217728]) {
void default_function_uarch(unsigned int insn_addr, unsigned int insn_count, ap_uint<8> out_mem_uarch[20][1][5], ap_uint<8> DRAM1[600]) { 
  int omem_out;
  int dram_out;
  int _top;
  int vta;
  int insn_addr1;
  insn_addr_x: for (int x = 0; x < 1; ++x) { 
    insn_addr1 = ((int)insn_addr);
  } 
  //cout<< "insn_addr1 "<< insn_addr1<<endl; 
  int num_pes;
  num_pes_x1: for (int x1 = 0; x1 < 1; ++x1) {
    num_pes = 1;
  }
  //cout<< "num_pes "<< num_pes<<endl; 
  
  p: for (int p = 0; p < num_pes; ++p) {
    int insn_count1;
    insn_count_x2: for (int x2 = 0; x2 < 1; ++x2) {
      insn_count1 = ((int)insn_count);
    }
    //cout<< "insn_count1 "<<insn_count1<<endl;
    i: for (int i = 0; i < insn_count1; ++i) { 
      ap_uint<8> insn_bytes[16];
      insn_bytes_x3: for (int x3 = 0; x3 < 16; ++x3) {
      //insn_bytes[x3] = 1 ;//DRAM[(insn_addr1 + x3)];
      insn_bytes[x3] = DRAM1[(insn_addr1 + x3)]; // can change to the value above
      }
      ap_uint<128> insn;
      insn_indices: for (int indices = 0; indices < 1; ++indices) {
        ap_uint<128> insn_temp;
        insn_temp_x4: for (int x4 = 0; x4 < 1; ++x4) { 
          insn_temp = (ap_uint<128>)0;
        }
        //insn_temp = 123456;
      //  cout<<"insn_temp "<<insn_temp<<endl;
        // i1: for (int i1 = 0; i1 < 16; ++i1) {
        //   insn_temp(((i1 * 8) + 7), (i1 * 8)) = insn_bytes[((indices * 16) + i1)];
        // }
        //cout<<"insn_temp_new "<<insn_temp<<endl;
        insn = insn_temp;
        //cout<<"insn "<<insn<<endl;
        //memset(&insn,1,sizeof(ap_uint<128>));
        // cout<<"insn memset "<<insn<<endl;
      }
      int vta_model;
      ap_uint<128> instr;
      
      instr_x5: for (int x5 = 0; x5 < 1; ++x5) {
        instr = insn;
      }
       //cout<<"instr value "<<instr<<endl;
      int opcode;    
      opcode_x6: for (int x6 = 0; x6 < 1; ++x6) {
        opcode = ((int)((ap_uint<3>)instr(2, 0)));
      }
      opcode = 1;
       //cout<<"opcode "<<opcode<<endl;
      int memtype;
      memtype_x7: for (int x7 = 0; x7 < 1; ++x7) {
         
        memtype = ((int)((ap_uint<2>)instr(8, 7)));
      }
      //cout<<"memtype "<<memtype<<endl;
      if (opcode == 1) {
        ap_uint<128> scalar0;
        scalar0_x8: for (int x8 = 0; x8 < 1; ++x8) {
          scalar0 = instr;
        }
        //cout << "scalar "<< scalar0<< endl; 
        ap_uint<16> sram_base;
        sram_base_x9: for (int x9 = 0; x9 < 1; ++x9) {
          sram_base = ((ap_uint<16>)scalar0(8, 9));
        }
        //cout<<"sram_base "<<sram_base<<endl;
        unsigned int dram_base;
        dram_base_x10: for (int x10 = 0; x10 < 1; ++x10) {
          dram_base = ((unsigned int)scalar0(10, 1));
        }
        //cout<<"dram_base "<<dram_base<<endl;

        int y_size;
        y_size_x11: for (int x11 = 0; x11 < 1; ++x11) {
          y_size = ((int)((ap_uint<16>)scalar0(79, 64)));
        }
        y_size = 2;
        //cout<<"y size "<<y_size<<endl;
        int x_size;
        x_size_x12: for (int x12 = 0; x12 < 1; ++x12) {
          x_size = ((int)((ap_uint<16>)scalar0(95, 80)));
        }
        x_size = 2;
         // cout<<"x size "<<x_size<<endl;
        int x_stride;
        x_stride_x13: for (int x13 = 0; x13 < 1; ++x13) {
          x_stride = ((int)((ap_uint<16>)scalar0(111, 96)));
        }
        x_stride =1;
         // cout<<"x stride "<<x_stride<<endl;
        
        int store;
        int store_data; 
        store_data_y: for (int y = 0; y < ((unsigned int)y_size); ++y) {
           
          store_data_x14: for (int x14 = 0; x14 < ((unsigned int)x_size); ++x14) {
          
            unsigned int scalar1;
            scalar1_x15: for (int x15 = 0; x15 < 1; ++x15) {
           
              //scalar1 = ((unsigned int)(((ap_int<67>)(((ap_int<66>)sram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_size))))) + ((ap_int<67>)x14)));
    scalar1 = ((unsigned int)(((ap_int<67>)(((ap_int<66>)sram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_size))))) + ((ap_int<67>)x14)));

            }
            unsigned int scalar2;
            scalar2_x16: for (int x16 = 0; x16 < 1; ++x16) {
           
             scalar2 = ((unsigned int)(((ap_int<67>)(((ap_int<66>)dram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_stride))))) + ((ap_int<67>)x14)));

            }
            //cout<<"Scalar 1 "<<scalar1<<endl;
            //cout<<"Scalar 2 "<<scalar2<<endl;
            
            int store_2d_tensor;
            int mutate0;
            mutate0_row: for (int row = 0; row < 1; ++row) {
             
              mutate0_col: for (int col = 0; col < 2; ++col) {
              // cout<<"DRAM index " << (((scalar2 * 4U) + ((unsigned int)(row * 16))) + ((unsigned int)col))<<endl;
              // cout<<"out mem index "<<(((unsigned int)(col + (row * 16))) + (scalar1 * 4U))<<endl;
                DRAM1[(((scalar2 * 4U) + ((unsigned int)(row * 16))) + ((unsigned int)col))] = out_mem_uarch[0U][0U][(((unsigned int)(col + (row * 16))) + (scalar1 * 4U))];
             
              }
              //cout<<"DRAM "<<DRAM<<endl;
            }
          }
        }
      }
      
      insn_addr1 = (insn_addr1 + 16);
   }
 }
}





int main () { 
ap_uint<132> instr;
ap_uint<32> sram_base; ap_uint<32> dram_base;ap_uint<32> y_size; ap_uint<32> x_size; ap_uint<32> x_stride;
ap_uint<8> out_mem[8][1][16];
//ap_uint<8> tmp_mem[32][1][16];
ap_uint<8> DRAM[128];

//klee_make_symbolic(&instr, sizeof(instr), "instr");
//klee_make_symbolic(&out_mem, sizeof(out_mem), "out_mem");
klee_make_symbolic(&sram_base, sizeof(sram_base), "sram_base");
klee_make_symbolic(&dram_base, sizeof(dram_base), "dram_base");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");
klee_make_symbolic(&x_stride, sizeof(x_stride), "x_stride");

unsigned int insn_addr;
unsigned int insn_count;
ap_uint<8> out_mem_uarch[20][1][5];
ap_uint<8> DRAM1[600];

//insn_count=1;
//insn_addr = 0x01;
klee_make_symbolic(&insn_addr, sizeof(insn_addr), "insn_addr");
klee_make_symbolic(&insn_count, sizeof(insn_count), "insn_count");

//klee_assume((insn_addr<=0x10)&&(insn_addr%8==0));

for (int i = 0; i < 20; ++i) {
        for (int j = 0; j < 1; ++j) {
                for (int k = 0; k < 5; ++k) {
                        out_mem_uarch[i][j][k] = 1;                        
                }
        }
}

for (ap_int<32> i = 0; i < 8; ++i) {
         for (ap_int<32> j = 0; j < 1; ++j) {
                 for (ap_int<32> k = 0; k < 16; ++k) {
                        // klee_assume((out_mem[i][j][k] == 1));
			
				out_mem[i][j][k] =1;
			//if (out_mem[i][j][k] !=1) {
			//	flag =0;	}
                 }
 
         }
 }


if (( sram_base == 0 ) && ( dram_base == 0 )  && (y_size == 1)  && (x_size ==8) && (x_stride ==8) && (insn_count==1)&&(insn_addr>=0x00)&&(insn_addr<=591)&&(insn_addr%16==0) ) {
	
default_function_isa(sram_base, dram_base, y_size, x_size, x_stride, out_mem,DRAM);
default_function_uarch(insn_addr,insn_count, out_mem_uarch,  DRAM1);


for(int k = 0; k< 128; k++){

             
             assert(DRAM[k]==DRAM1[k]);


   
}
}

//}
/*

default_function(instr, out_mem,DRAM);

default_function_2(instr, out_mem,DRAM_2);

for(ap_int<32> k =0;k<10;k++){
             //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
             assert(DRAM[k]==DRAM_2[k]);

   
}

*/

//}
return 0;
}
