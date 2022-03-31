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
//using namespace std;
 

// void default_function(unsigned int insn_addr, unsigned int insn_count, ap_uint<8> inp_mem[32768][1][16], ap_uint<8> wgt_mem[262144][16][16], unsigned int acc_mem[131072][1][16], ap_uint<8> out_mem[32768][1][16], unsigned int uop_mem[32768], ap_uint<8> DRAM[134217728]) {
void default_function(unsigned int insn_addr, unsigned int insn_count, ap_uint<8> out_mem[40768][1][16], ap_uint<8> DRAM[1000000]) { 
  int omem_out;
  int dram_out;
  int _top;
  int vta;
  int insn_addr1;
  insn_addr_x: for (int x = 0; x < 1; ++x) { 
    insn_addr1 = ((int)insn_addr);
  } 
  int num_pes;
  num_pes_x1: for (int x1 = 0; x1 < 1; ++x1) {
    num_pes = 2;
  }
  p: for (int p = 0; p < num_pes; ++p) {
    int insn_count1;
    insn_count_x2: for (int x2 = 0; x2 < 1; ++x2) {
      insn_count1 = ((int)insn_count);
    }
    i: for (int i = 0; i < insn_count1; ++i) { 
      ap_uint<8> insn_bytes[16];
      insn_bytes_x3: for (int x3 = 0; x3 < 16; ++x3) {
      insn_bytes[x3] = 1 ;//DRAM[(insn_addr1 + x3)];
      }
      
      ap_uint<128> insn;
      
      insn_indices: for (int indices = 0; indices < 1; ++indices) {
        
        ap_uint<128> insn_temp;
        
        insn_temp_x4: for (int x4 = 0; x4 < 1; ++x4) { 
          
          insn_temp = (ap_uint<128>)0;
         
         
        }
        i1: for (int i1 = 0; i1 < 16; ++i1) {
           
          insn_temp(((i1 * 8) + 7), (i1 * 8)) = insn_bytes[((indices * 16) + i1)];
        }
        
        insn = insn_temp;
        memset(&insn,1,sizeof(ap_uint<128>));
        // memset(&insn,1,1);
         //cout<<"insn "<< insn<< endl;
         //cout<<"insn temp "<< insn_temp<< endl;
      }
      int vta_model;
      ap_uint<128> instr;
      
      instr_x5: for (int x5 = 0; x5 < 1; ++x5) {
        instr = insn;
      }
      
      int opcode;    
      opcode_x6: for (int x6 = 0; x6 < 1; ++x6) {
     
        opcode = ((int)((ap_uint<3>)instr(2, 0)));
      }
       //cout<<"op "<<opcode<<endl;
      int memtype;
      memtype_x7: for (int x7 = 0; x7 < 1; ++x7) {
         
        memtype = ((int)((ap_uint<2>)instr(8, 7)));
      }
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
        unsigned int dram_base;
        dram_base_x10: for (int x10 = 0; x10 < 1; ++x10) {
         
          dram_base = ((unsigned int)scalar0(10, 1));
        }
        //cout<<"dram base "<<dram_base<<endl;
        int y_size;
        y_size_x11: for (int x11 = 0; x11 < 1; ++x11) {
          //cout << "Y size "<<((int)((ap_uint<16>)scalar0(79, 64))) <<endl; 
          y_size = ((int)((ap_uint<16>)scalar0(79, 64)));
        }
        int x_size;
        x_size_x12: for (int x12 = 0; x12 < 1; ++x12) {
           //cout << "X size "<< ((int)((ap_uint<16>)scalar0(95, 80)))<< endl; 
          x_size = ((int)((ap_uint<16>)scalar0(95, 80)));
        }
        int x_stride;
        x_stride_x13: for (int x13 = 0; x13 < 1; ++x13) {
         
          x_stride = ((int)((ap_uint<16>)scalar0(111, 96)));
        }
        int store;
        int store_data; 
        store_data_y: for (int y = 0; y < ((unsigned int)y_size); ++y) {
           
          store_data_x14: for (int x14 = 0; x14 < ((unsigned int)x_size); ++x14) {
          
            unsigned int scalar1;
            scalar1_x15: for (int x15 = 0; x15 < 1; ++x15) {
           
              scalar1 = ((unsigned int)(((ap_int<67>)(((ap_int<66>)sram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_size))))) + ((ap_int<67>)x14)));
            }
            unsigned int scalar2;
            scalar2_x16: for (int x16 = 0; x16 < 1; ++x16) {
           
              scalar2 = ((unsigned int)(((ap_int<67>)(((ap_int<66>)dram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_stride))))) + ((ap_int<67>)x14)));
            }
            //cout<<"Scalalr 2 "<<scalar2<<endl;
            
            int store_2d_tensor;
            int mutate0;
            mutate0_row: for (int row = 0; row < 1; ++row) {
             
              mutate0_col: for (int col = 0; col < 2; ++col) {
                // cout<<"mutate"<<endl;
                
                
               // cout<< "DRAM " << (((scalar2 * 16U) + ((unsigned int)(row * 16))) + ((unsigned int)col))<< endl;
               // cout << "omem " << (((unsigned int)(col + (row * 16))) + (scalar1 * 16U))<<endl;
               // cout<<"Test 1 " <<DRAM[(((scalar2 * 16U) + ((unsigned int)(row * 16))) + ((unsigned int)col))]<<endl;
                DRAM[(((scalar2 * 4U) + ((unsigned int)(row * 16))) + ((unsigned int)col))] = out_mem[0U][0U][(((unsigned int)(col + (row * 16))) + (scalar1 * 4U))];
                
              }
              
            }
          }
        }
      }
      
      insn_addr1 = (insn_addr1 + 16);
    }
  }
}

int main () {
unsigned int insn_addr;
unsigned int insn_count;
ap_uint<8> out_mem[40768][1][16];
ap_uint<8> DRAM[1000000];

//insn_addr=0x23;
//insn_count=7;
klee_make_symbolic(&insn_addr, sizeof(insn_addr), "insn_addr");
klee_make_symbolic(&insn_count, sizeof(insn_count), "insn_count");
klee_make_symbolic(&out_mem, sizeof(out_mem), "out_mem");

klee_assume((insn_addr==0x23)&&(insn_count==7));

for (int i = 0; i < 40768; ++i) {
      for (int j = 0; j < 1; ++j) {
               for (int k = 0; k < 16; ++k) {
		     klee_assume(out_mem[i][j][k]==1);
               }
        }
}

default_function(insn_addr, insn_count, out_mem, DRAM);
return 0;

}
