#ifdef __GCC__DEF__
#include <iostream>
#endif

#include <ap_int.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h> 
#include <stdint.h>
#include <klee/klee.h> 

void default_function_2(unsigned int insn_addr, unsigned int insn_count, ap_uint<32> memory_type, ap_uint<32> sram_base, ap_uint<32>  dram_base, ap_uint<32>  y_size, ap_uint<32>  x_size, ap_uint<32>  x_stride, ap_uint<32> uop_mem[128], ap_uint<8> inp_mem[8][1][128], ap_uint<8> wgt_mem[8][16][128], ap_uint<32> acc_mem[8][1][128], ap_uint<8> DRAM[1024]) {
#ifdef __GCC__DEF__

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
        insn_bytes[x3] = DRAM[(insn_addr1 + x3)];
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
      }
      int vta_model;
      ap_uint<128> instr;
      instr_x5: for (int x5 = 0; x5 < 1; ++x5) {
        instr = insn;
      }
/*      int opcode;
      opcode_x6: for (int x6 = 0; x6 < 1; ++x6) {
        opcode = ((int)((ap_uint<3>)instr(2, 0)));
      }
      int memory_type;
      memory_type_x7: for (int x7 = 0; x7 < 1; ++x7) {
        memory_type = ((int)((ap_uint<2>)instr(8, 7)));
      }*/
	int opcode = 0;
      if ((opcode == 0) && (memory_type == 0)) {
       
	/* ap_uint<128> scalar0;
        scalar0_x8: for (int x8 = 0; x8 < 1; ++x8) {
          scalar0 = instr;
        }
        ap_uint<16> sram_base;
        sram_basex9: for (int x9 = 0; x9 < 1; ++x9) {
          sram_base = ((ap_uint<16>)scalar0(24, 9));
        }
        unsigned int dram_base;
        dram_basex10: for (int x10 = 0; x10 < 1; ++x10) {
          dram_base = ((unsigned int)scalar0(56, 25));
        }
        int x_size;
        x_sizex11: for (int x11 = 0; x11 < 1; ++x11) {
          x_size = ((int)((ap_uint<16>)scalar0(95, 80)));
        }
	ap_uint<16> sram_base2 = (ap_uint<16>)sram_base;
        unsigned int dram_base2 = (unsigned int)dram_base;
        int x_size2 = ((int)((ap_uint<16>)x_size));*/
        ap_uint<32> load_uop_core;
        x12: for (ap_int<32> x12 = 0; x12 < x_size; ++x12) {
          ap_uint<8> burst[4];
          burst_i2: for (ap_int<32> i2 = 0; i2 < 4; ++i2) {
            burst[i2] = DRAM[(((dram_base + ((ap_uint<32>)x12)) * 4U) + ((ap_uint<32>)i2))];
          }
          ap_uint<32>  uop;
          uop_indices1: for (ap_int<32> indices1 = 0; indices1 < 1; ++indices1) {
            ap_uint<32>  uop_temp;
            uop_temp_x13: for (ap_int<32> x13 = 0; x13 < 1; ++x13) {
              uop_temp = 0U;
            }
            i3: for (ap_int<32> i3 = 0; i3 < 4; ++i3) {
              uop_temp(((i3 * 8) + 7), (i3 * 8)) = burst[((indices1 * 4) + i3)];
            }
            uop = uop_temp;
          }
          uop_mem[((sram_base) + ((ap_uint<32>)x12))] = uop;
        }
      }

      if (opcode == 0) {
      /*  ap_uint<128> scalar1;
        scalar1_x14: for (int x14 = 0; x14 < 1; ++x14) {
          scalar1 = instr;
        }
        ap_uint<16> sram_base;
        sram_basex15: for (int x15 = 0; x15 < 1; ++x15) {
          sram_base = ((ap_uint<16>)scalar1(24, 9));
        }
        unsigned int dram_base;
        dram_basex16: for (int x16 = 0; x16 < 1; ++x16) {
          dram_base = ((unsigned int)scalar1(56, 25));
        }
        int is_pad_min;
        is_pad_min_x17: for (int x17 = 0; x17 < 1; ++x17) {
          is_pad_min = ((int)((ap_uint<1>)scalar1(57, 57)));
        }
        int y_size;
        y_size_x18: for (int x18 = 0; x18 < 1; ++x18) {
          y_size = ((int)((ap_uint<16>)scalar1(79, 64)));
        }
        int x_size;
        x_sizex19: for (int x19 = 0; x19 < 1; ++x19) {
          x_size = ((int)((ap_uint<16>)scalar1(95, 80)));
        }
        int x_stride;
        x_stride_x20: for (int x20 = 0; x20 < 1; ++x20) {
          x_stride = ((int)((ap_uint<16>)scalar1(111, 96)));
        }
        int y_pad_0;
        y_pad_0_x21: for (int x21 = 0; x21 < 1; ++x21) {
          y_pad_0 = ((int)((ap_uint<4>)scalar1(115, 112)));
        }
        int y_pad_1;
        y_pad_1_x22: for (int x22 = 0; x22 < 1; ++x22) {
          y_pad_1 = ((int)((ap_uint<4>)scalar1(119, 116)));
        }
        int x_pad_0;
        x_pad_0_x23: for (int x23 = 0; x23 < 1; ++x23) {
          x_pad_0 = ((int)((ap_uint<4>)scalar1(123, 120)));
        }
        int x_pad_1;
        x_pad_1_x24: for (int x24 = 0; x24 < 1; ++x24) {
          x_pad_1 = ((int)((ap_uint<4>)scalar1(127, 124)));
        }
        int memory_type;
        memory_type_x25: for (int x25 = 0; x25 < 1; ++x25) {
          memory_type = ((int)((ap_uint<2>)scalar1(8, 7)));
        }*/
	ap_uint<32>  y_pad_0 =0;
	ap_uint<32> y_pad_1 = 0;
	ap_uint<32> x_pad_0 = 0;
	ap_uint<32> x_pad_1 = 0;
 
        if (memory_type == 1) {
          int load_2d;
          int load_data;
          load_data_y: for (int y = 0; y < y_size; ++y) {
            load_data_x26: for (int x26 = 0; x26 < x_size; ++x26) {
              int load_2d_core;
              ap_uint<8> compute0[16][16];
              compute0_r: for (int r = 0; r < 16; ++r) {
                compute0_c: for (int c = 0; c < 16; ++c) {
                  compute0[r][c] = DRAM[(((((dram_base + ((unsigned int)(y * x_stride))) + ((unsigned int)x26)) * 256U) + ((unsigned int)(r * 16))) + ((unsigned int)c))];
                }
              }
              ap_uint<8> pack0[16][16];
              pack0_indices2: for (int indices2 = 0; indices2 < 16; ++indices2) {
                pack0_temp: for (int temp = 0; temp < 16; ++temp) {
                  ap_uint<8> pack0_temp;
                  pack0_temp_x27: for (int x27 = 0; x27 < 1; ++x27) {
                    pack0_temp = (ap_uint<8>)0;
                  }
                  pack0_temp(7, 0) = compute0[indices2][temp];
                  pack0[indices2][temp] = pack0_temp;
                }
              }
              int mutate0;
              mutate0_row: for (int row = 0; row < 16; ++row) {
                mutate0_col: for (int col = 0; col < 16; ++col) {
                  wgt_mem[0U][0U][(((unsigned int)(col + (row * 16))) + ((((((unsigned int)sram_base) + ((unsigned int)(((x_size + x_pad_0) + x_pad_1) * (y_pad_0 + y)))) + ((unsigned int)x26)) + ((unsigned int)x_pad_0)) * 256U))] = pack0[row][col];
                }
              }
            }
          }
        }
        if (memory_type == 2) {
          int load_2d_;
          int load_data_;
          load_data_y1: for (int y1 = 0; y1 < y_size; ++y1) {
            load_data_x28: for (int x28 = 0; x28 < x_size; ++x28) {
              int load_2d_core_;
              ap_uint<8> compute1[1][16];
              compute1_r1: for (int r1 = 0; r1 < 1; ++r1) {
                compute1_c1: for (int c1 = 0; c1 < 16; ++c1) {
                  compute1[r1][c1] = DRAM[(((((dram_base + ((unsigned int)(y1 * x_stride))) + ((unsigned int)x28)) * 16U) + ((unsigned int)(r1 * 16))) + ((unsigned int)c1))];
                }
              }
              ap_uint<8> pack1[1][16];
              pack1_indices3: for (int indices3 = 0; indices3 < 1; ++indices3) {
                pack1_temp1: for (int temp1 = 0; temp1 < 16; ++temp1) {
                  ap_uint<8> pack1_temp;
                  pack1_temp_x29: for (int x29 = 0; x29 < 1; ++x29) {
                    pack1_temp = (ap_uint<8>)0;
                  }
                  pack1_temp(7, 0) = compute1[indices3][temp1];
                  pack1[indices3][temp1] = pack1_temp;
                }
              }
              int mutate1;
              mutate1_row1: for (int row1 = 0; row1 < 1; ++row1) {
                mutate1_col1: for (int col1 = 0; col1 < 16; ++col1) {
                  inp_mem[0U][0U][(((unsigned int)(col1 + (row1 * 16))) + ((((((unsigned int)sram_base) + ((unsigned int)(((x_size + x_pad_0) + x_pad_1) * (y_pad_0 + y1)))) + ((unsigned int)x28)) + ((unsigned int)x_pad_0)) * 16U))] = pack1[row1][col1];
                }
              }
            }
          }
        } else {
          int load_2d__;
          int load_data__;
          load_data_y2: for (ap_int<32> y2 = 0; y2 < y_size; ++y2) {
            load_data_x30: for (ap_int<32> x30 = 0; x30 < x_size; ++x30) {
              int load_2d_core__;
              ap_uint<8> compute2[1][64];
              compute2_r2: for (ap_int<32> r2 = 0; r2 < 1; ++r2) {
                compute2_c2: for (ap_int<32> c2 = 0; c2 < 64; ++c2) {
                  compute2[r2][c2] = DRAM[(((((dram_base + ((ap_uint<32>)(y2 * x_stride))) + ((ap_uint<32>)x30)) * 64U) + ((ap_uint<32>)(r2 * 16))) + ((ap_uint<32>)c2))];
                }
              }
                ap_uint<32> pack2[1][16];
              pack2_indices4: for (ap_int<32> indices4 = 0; indices4 < 1; ++indices4) {
                pack2_temp2: for (ap_int<32> temp2 = 0; temp2 < 16; ++temp2) {
                  ap_uint<32> pack2_temp;
                  pack2_temp_x31: for (ap_int<32> x31 = 0; x31 < 1; ++x31) {
                    pack2_temp = 0U;
                  }
                  i4: for (ap_int<32> i4 = 0; i4 < 4; ++i4) {
                    pack2_temp(((i4 * 8) + 7), (i4 * 8)) = compute2[indices4][((temp2 * 4) + i4)];
                  }
                  pack2[indices4][temp2] = pack2_temp;
                }
              }
              int mutate2;
              mutate2_row2: for (int row2 = 0; row2 < 1; ++row2) {
                mutate2_col2: for (int col2 = 0; col2 < 16; ++col2) {
                  acc_mem[0U][0U][(((unsigned int)(col2 + (row2 * 16))) + ((((((unsigned int)sram_base) + ((unsigned int)(((x_size + x_pad_0) + x_pad_1) * (y_pad_0 + y2)))) + ((unsigned int)x30)) + ((unsigned int)x_pad_0)) * 16U))] = pack2[row2][col2];
                }
              }
            }
          }
        }
      }
      insn_addr1 = (insn_addr1 + 16);
    }
  }
#endif
}


int main() {
//ap_int<132> instr;
ap_uint<32> memory_type;
ap_uint<8> inp_mem[8][1][128];
ap_uint<32> sram_base ;
ap_uint<32>  dram_base;
ap_uint<32>  y_size ;
ap_uint<32>  x_size ;
ap_uint<32>  x_stride ;
ap_uint<8> inp_mem_2[8][1][128];
ap_uint<8> DRAM[1024] ; 
ap_uint<8> wgt_mem[8][16][128];
ap_uint<8> wgt_mem_2[8][16][128];



ap_uint<32> uop_mem[128]; ap_uint<32> acc_mem[8][1][128];
ap_uint<32> uop_mem_2[128]; ap_uint<32> acc_mem_2[8][1][128];
unsigned int insn_addr; unsigned int insn_count;

klee_make_symbolic(&insn_addr, sizeof(insn_addr), "insn_addr");
klee_make_symbolic(&insn_count, sizeof(insn_count), "insn_count");

//klee_make_symbolic(&out_mem, sizeof(out_mem), "out_mem");
klee_make_symbolic(&sram_base, sizeof(sram_base), "sram_base");
klee_make_symbolic(&dram_base, sizeof(dram_base), "dram_base");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");
klee_make_symbolic(&x_stride, sizeof(x_stride), "x_stride"); 
klee_make_symbolic(&memory_type, sizeof(memory_type), "memory_type"); 


//klee_make_symbolic(&DRAM, sizeof(DRAM), "DRAM");
//bool flag = 1;
//klee_assume(( sram_base == 0 ) & (( dram_base = 8 )| ( dram_base == 16 ) | ( dram_base == 24 )) & (y_size == 1) & (x_size ==8) & (x_stride ==8)  );

//klee_assume(( sram_base == 0 ) && (( dram_base >= 8 ) && ( dram_base <= 16 ) ) && (y_size == 1) && (x_size ==8) && (x_stride ==8)  );


for (ap_int<32> i = 0; i < 1024; ++i) {
                       //klee_assume ((DRAM[i] == 1));
			DRAM[i] = 1;

       }
for (ap_int<32> i = 0; i < 128; ++i) {
                       //klee_assume ((DRAM[i] == 1));
		uop_mem[i] = 0;
		uop_mem_2[i] = 0;

       }


 for(ap_int<32> i =1; i<8; i++){
         for(ap_int<32> j =1; j<1; j++){
                 for(ap_int<32> k =1; k<128; k++){
               //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
               inp_mem[i][j][k]= 0;
		inp_mem_2[i][j][k] = 0;
 		acc_mem[i][j][k]= 0;
		acc_mem_2[i][j][k]= 0;
 
  
  }}}

 for(ap_int<32> i =1; i<8; i++){
         for(ap_int<32> j =1; j<16; j++){
                 for(ap_int<32> k =1; k<128; k++){
               //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
               wgt_mem[i][j][k]= 0;
		wgt_mem_2[i][j][k] = 0;
  
  
  }}}

/*
memory_type = 3;
insn_addr = 0x16;
insn_count = 1;
sram_base = 0;
dram_base = 56 ;
y_size = 1;
 x_size = 8;
x_stride = 8;*/

if ( ( insn_addr == 0x16) && (insn_count == 1) && ((memory_type >= 0) && (memory_type <= 3) )&&( sram_base == 0 ) && (( dram_base >= 8 ) && ( dram_base <= 56 ) && ( dram_base %8 == 0 ) ) && (y_size == 1) && (x_size ==8) && (x_stride ==8)  ) {




//Load_ISA(sram_base, dram_base, y_size, x_size, x_stride, inp_mem, DRAM );
//Load_uArch_bsim(insn_addr, insn_count,sram_base, dram_base, y_size, x_size, x_stride, inp_mem_2, DRAM );

default_function_2(insn_addr, insn_count, memory_type, sram_base, dram_base, y_size, x_size, x_stride, uop_mem_2, inp_mem_2, wgt_mem_2, acc_mem_2, DRAM );

for(ap_int<32> i =1; i<8; i++){
	for(ap_int<32> j =1; j<16; j++){
		for(ap_int<32> k =1; k<128; k++){
              //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
		assert(wgt_mem[i][j][k]==wgt_mem_2[i][j][k]);


 }}}

for(ap_int<32> i =1; i<8; i++){
	for(ap_int<32> j =1; j<1; j++){
		for(ap_int<32> k =1; k<128; k++){
              //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
              assert(inp_mem[i][j][k]==inp_mem_2[i][j][k]);
              assert(acc_mem[i][j][k]==acc_mem_2[i][j][k]);
	
	


 }}}

for (ap_int<32> i = 0; i < 128; ++i) {
	assert(uop_mem[i] ==uop_mem_2[i]);

       }


}


return 0;
}

