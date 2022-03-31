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
void default_function(ap_uint<132> instr, ap_uint<8> out_mem[32][1][16], ap_uint<8> DRAM[131072]) {​​​​​
  ap_uint<32> _top;
  ap_uint<32> sram_base;
  sram_base_x: for (ap_int<32> x = 0; x < 1; ++x) {​​​​​
    sram_base = ((ap_uint<32>)instr(24, 9));
  }​​​​​
  ap_uint<32> dram_base;
  dram_base_x1: for (ap_int<32> x1 = 0; x1 < 1; ++x1) {​​​​​
    dram_base = ((ap_uint<32>)instr(56, 25));
  }​​​​​
  ap_uint<32> y_size;
  y_size_x2: for (ap_int<32> x2 = 0; x2 < 1; ++x2) {​​​​​
    y_size = ((ap_uint<32>)instr(79, 64));
  }​​​​​
  ap_uint<32> x_size;
  x_size_x3: for (ap_int<32> x3 = 0; x3 < 1; ++x3) {​​​​​
    x_size = ((ap_uint<32>)instr(95, 80));
  }​​​​​
  ap_uint<32> x_stride;
  x_stride_x4: for (ap_int<32> x4 = 0; x4 < 1; ++x4) {​​​​​
    x_stride = ((ap_uint<32>)instr(111, 96));
  }​​​​​
  ap_uint<32> store;
  ap_uint<32> store_data;


    store_data_x5: for (ap_int<32> x5 = 0; x5 < x_size; ++x5) {​​​​​
  store_data_y: for (ap_int<32> y = 0; y < y_size; ++y) {​​​​​
      ap_uint<32> mutate0;
      mutate0_row: for (ap_int<32> row = 0; row < 1; ++row) {​​​​​
        mutate0_col: for (ap_int<32> col = 0; col < 16; ++col) {​​​​​
          DRAM[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))] = out_mem[((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U))][((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)][((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)];
        }​​​​​
      }​​​​​
    }​​​​​


  }​​​​​
//return DRAM[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))];
}​​​​​


void default_function_2(ap_uint<132> instr, ap_uint<8> out_mem[32][1][16], ap_uint<8> DRAM_2[131072]) {​​​​​
  ap_uint<32> _top;
  ap_uint<32> sram_base;
  sram_base_x: for (ap_int<32> x = 0; x < 1; ++x) {​​​​​
    sram_base = ((ap_uint<32>)instr(24, 9));
  }​​​​​
  ap_uint<32> dram_base;
  dram_base_x1: for (ap_int<32> x1 = 0; x1 < 1; ++x1) {​​​​​
    dram_base = ((ap_uint<32>)instr(56, 25));
  }​​​​​
  ap_uint<32> y_size;
  y_size_x2: for (ap_int<32> x2 = 0; x2 < 1; ++x2) {​​​​​
    y_size = ((ap_uint<32>)instr(79, 64));
  }​​​​​
  ap_uint<32> x_size;
  x_size_x3: for (ap_int<32> x3 = 0; x3 < 1; ++x3) {​​​​​
    x_size = ((ap_uint<32>)instr(95, 80));
  }​​​​​
  ap_uint<32> x_stride;
  x_stride_x4: for (ap_int<32> x4 = 0; x4 < 1; ++x4) {​​​​​
    x_stride = ((ap_uint<32>)instr(111, 96));
  }​​​​​
  ap_uint<32> store;
  ap_uint<32> store_data;
  store_data_y: for (ap_int<32> y = 0; y < y_size; ++y) {​​​​​
    store_data_x5: for (ap_int<32> x5 = 0; x5 < x_size; ++x5) {​​​​​
      ap_uint<32> mutate0;
      mutate0_row: for (ap_int<32> row = 0; row < 1; ++row) {​​​​​
        mutate0_col: for (ap_int<32> col = 0; col < 16; ++col) {​​​​​
          DRAM_2[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))] = out_mem[((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U))][((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)][((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)];
        }​​​​​
      }​​​​​
    }​​​​​
  }​​​​​
//return DRAM_2[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))];
}​​​​​




int main () {​​​​​ 
ap_uint<132> instr;
ap_uint<8> out_mem[32][1][16];
ap_uint<8> DRAM[131072];
ap_uint<8> DRAM_2[131072];


klee_make_symbolic(&instr, sizeof(instr), "instr");
klee_make_symbolic(&out_mem, sizeof(out_mem), "out_mem");


//if (instr == ap_uint<132>("0b010100000000000000000000100000000000000010000000000000000001000000000000000000000000000000000000000000000000100001", 2)) {​​​​​
//instr = ap_uint<132>("6490371692147998911318997151514624", 10); 
//instr = ap_uint<132>("0b010100000000000000000000100000000000000010000000000000000001000000000000000000000000000000000000000000000000100001", 2);



if(instr == ap_uint<132>("0b10000000000000000001000000000000000000000000000000000000000000000000100001", 2)) {​​​​​
for (ap_int<32> i = 0; i < 32; ++i) {​​​​​
        for (ap_int<32> j = 0; j < 1; ++j) {​​​​​
                for (ap_int<32> k = 0; k < 16; ++k) {​​​​​
                        out_mem[i][j][k] = 1;
                }​​​​​


        }​​​​​
}​​​​​

default_function(instr, out_mem,DRAM);


//default_function_2(instr, out_mem,DRAM_2);


// for(ap_int<32> k =0;k<131072;k++){​​​​​
//              //printf("DRAM[%d] = %c, DRAM_2[%d] = %c\n", k, DRAM[k], k, DRAM_2[k]);
//              assert(DRAM[k]==DRAM_2[k]);


   
// }​​​​​




}​​​​​
return 0;
}​​​​​
















