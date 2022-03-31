
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
void default_function(ap_uint<32> sram_base, ap_uint<32> dram_base,ap_uint<32> y_size, ap_uint<32> x_size, ap_uint<32> x_stride, ap_uint<8> out_mem[8][1][16], ap_uint<8> DRAM[128]) {

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



//void default_function_2(ap_uint<132> instr, ap_uint<8> out_mem[1][1][16], ap_uint<8> DRAM_2[4096]) {
void default_function_2(ap_uint<32> sram_base, ap_uint<32> dram_base,ap_uint<32> y_size, ap_uint<32> x_size, ap_uint<32> x_stride, ap_uint<8> out_mem[8][1][16], ap_uint<8> DRAM_2[128]) {

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

  store_data_y: for (ap_int<32> y = 0; y < y_size; ++y) {
    store_data_x5: for (ap_int<32> x5 = 0; x5 < x_size; ++x5) {
//  store_data_y: for (ap_int<32> y = 0; y < y_size; ++y) {
      ap_uint<32> mutate0;
      mutate0_row: for (ap_int<32> row = 0; row < 1; ++row) {
        mutate0_col: for (ap_int<32> col = 0; col < 16; ++col) {
//	 printf("hello\n");
	 //printf("%ll\n", (((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col)));
	// printf("%ll\n", dram_base);
/*	printf("dram2_index: %s\n", (((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col)).to_string().c_str());
	printf("out_mem2_index1: %s\n",((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)).to_string().c_str());
	printf("out_mem2_index2: %s\n", ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U).to_string().c_str());
	printf("out_mem2_index3: %s\n", ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U).to_string().c_str());*/

          DRAM_2[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))] = out_mem[((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) - ((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U))][((((((ap_uint<32>)(col + (row * 16))) - ((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) / 16U) % 1U)][((((ap_uint<32>)(col + (row * 16))) + (((sram_base + (((ap_uint<32>)y) * x_size)) + ((ap_uint<32>)x5)) * 16U)) % 16U)];
	}
      }
    }

  }

//return DRAM[(((((dram_base + (((ap_uint<32>)y) * x_stride)) + ((ap_uint<32>)x5)) * 16U) + ((ap_uint<32>)(row * 16))) + ((ap_uint<32>)col))];
}



int main () { 
ap_uint<132> instr;
ap_uint<32> sram_base; ap_uint<32> dram_base;ap_uint<32> y_size; ap_uint<32> x_size; ap_uint<32> x_stride;
ap_uint<8> out_mem[8][1][16];
//ap_uint<8> tmp_mem[32][1][16];
ap_uint<8> DRAM[128];
ap_uint<8> DRAM_2[128];
/*
010100000000000000000000100000000000000010000000000000000001000000000000000000000000000000000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000000010000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000000100000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000000110000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000001000000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000001010000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000001100000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000001110000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000010000000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000010010000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000010100000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000010110000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000011000000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000011010000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000011100000000000000000000100001
010100000000000000000000100000000000000010000000000000000001000000000000000000000000011110000000000000000000100001

*/

//klee_make_symbolic(&instr, sizeof(instr), "instr");
//klee_make_symbolic(&out_mem, sizeof(out_mem), "out_mem");
klee_make_symbolic(&sram_base, sizeof(sram_base), "sram_base");
klee_make_symbolic(&dram_base, sizeof(dram_base), "dram_base");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");
klee_make_symbolic(&x_stride, sizeof(x_stride), "x_stride");

//bool flag = 1;
//klee_assume(( sram_base == 0 ) & ( dram_base == 0 )  & ((y_size == 1) | (y_size ==1)) & (x_size ==8) & (x_stride ==8)  );
//ap_uint<132> a;
/*
 sram_base = 0;
  dram_base = 0;
  y_size = 1;
  x_size = 8;
  x_stride = 8;
*/
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
//if (instr == ap_uint<132>("0b010100000000000000000000100000000000000010000000000000000001000000000000000000000000000000000000000000000000100001", 2) ) {
//klee_assume(instr == ap_uint<132>("6490371692147998911318997151514624", 10)); 
//instr = ap_uint<132>("0b10000000000000000001000000000000000000000000000000000000000000000000100001", 2);
//a = ap_uint<132>("0b101010000000000000000000010000000000000000000000000000000001000000000000000000000000011110000000000000000000100001", 2);
//a = ap_uint<132>("0b00001", 2);

//klee_assume((instr == a) );
//instr = ap_uint<132>("0b10000000000000000001000000000000000000000000000000000000000000000000100001", 2); 
//if ((instr == a) && (flag ==1)) {
//default_function(sram_base, dram_base, y_size, x_size, x_stride, out_mem,DRAM);

//default_function_2(sram_base, dram_base, y_size, x_size, x_stride, out_mem,DRAM_2);
//default_function_2( out_mem,DRAM_2);
//ap_int<32> k = 544;

if (( sram_base == 0 ) && ( dram_base == 0 )  && (y_size == 1)  && (x_size ==8) && (x_stride ==8) ) {
	
default_function(sram_base, dram_base, y_size, x_size, x_stride, out_mem,DRAM);

default_function_2(sram_base, dram_base, y_size, x_size, x_stride, out_mem,DRAM_2);

for(int k = 0; k< 128; k++){

             //printf("DRAM[%d] = %ll, DRAM_2[%d] = %ll\n", k, DRAM[k], k, DRAM_2[k]);
             assert(DRAM[k]==DRAM_2[k]);
//		printf("successful\n");

   
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
