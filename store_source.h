void store_decoder(struct instr myinsn, ap_uint<10> uop_id[1], ap_uint<8> uop_queue[40], ap_uint<13> num_uops[1], ap_uint<80> uop_q[4], uint8_t DRAM[64], uint8_t out_mem[4][1][16] ) {
  int _top;
  int top;
  //ap_uint<80> uop_q[4];
  uop_q_indices: for (int indices = 0; indices < 4; ++indices) {
    ap_uint<80> uop_q_temp;
    uop_q_temp_x: for (int x = 0; x < 1; ++x) {
      uop_q_temp = (ap_uint<80>)0;
    }
    i: for (int i = 0; i < 10; ++i) {
      uop_q_temp(((i * 8) + 7), (i * 8)) = uop_queue[((indices * 10) + i)];
    }
    uop_q[indices] = uop_q_temp;
  } 
  int decoder;
   int opcode;
    opcode_x6: for (int x6 = 0; x6 < 1; ++x6) {
     // opcode = ((int)((ap_uint<3>)instr(2, 0)));
      opcode = ((int)((ap_uint<3>)myinsn.opcode));
    }
   if (opcode == 1) {
     ap_uint<16> sram_base;
      sram_base_x9: for (int x9 = 0; x9 < 1; ++x9) {
        sram_base = ((ap_uint<16>)myinsn.sram_base_scalar);
      }
      unsigned int dram_base;
      dram_base_x10: for (int x10 = 0; x10 < 1; ++x10) {
        dram_base = ((unsigned int)myinsn.dram_base_scalar);
      }
      int y_size;
      y_size_x11: for (int x11 = 0; x11 < 1; ++x11) {
        y_size = ((int)((ap_uint<16>)myinsn.y_size));
  //      y_size = ((int)((ap_uint<16>)1));
      }
      int x_size;
      x_size_x12: for (int x12 = 0; x12 < 1; ++x12) {
        //x_size = ((int)((ap_uint<16>)4));
        x_size = ((int)((ap_uint<16>)myinsn.x_size));
      }
      int x_stride;
      x_stride_x13: for (int x13 = 0; x13 < 1; ++x13) {
        x_stride = ((int)((ap_uint<16>)myinsn.x_stride));
      }
      int store;
      int store_data;
      store_data_y: for (int y = 0; y < ((unsigned int)y_size); ++y) {
        store_data_x14: for (int x14 = 0; x14 < ((unsigned int)x_size); ++x14) {
          ap_uint<32> scalar1;
          scalar1_x15: for (int x15 = 0; x15 < 1; ++x15) {
            scalar1 = ((ap_uint<32>)(((ap_int<67>)(((ap_int<66>)dram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_stride))))) + ((ap_int<67>)x14)));
          }
          ap_uint<64> mem_operands_cat;
          mem_operands_cat_x16: for (ap_int<32> x16 = 0; x16 < 1; ++x16) {
            ap_uint<16> _converter;
            _converter(15, 0) = ((ap_uint<16>)(((ap_int<67>)(((ap_int<66>)sram_base) + ((ap_int<66>)(((ap_int<64>)y) * ((ap_int<64>)x_size))))) + ((ap_int<67>)x14)))(15, 0);
            mem_operands_cat(15, 0) = _converter;
            ap_uint<32> _converter1;
            _converter1(31, 0) = (scalar1 * 16U)(31, 0);
            mem_operands_cat(47, 16) = _converter1;
            ap_uint<16> _converter2;
            _converter2(15, 0) = (ap_uint<16>)0;
            //_converter2(15, 0) = (ap_uint<16>)0(15, 0);
            mem_operands_cat(63, 48) = _converter2;
          }
          ap_uint<79> compute0;
          compute0_x17: for (ap_int<32> x17 = 0; x17 < 1; ++x17) {
            ap_uint<10> _converter3;
            _converter3(9, 0) = uop_id[0](9, 0);
            compute0(9, 0) = _converter3;
            ap_uint<3> _converter4;
            _converter4(2, 0) = (ap_uint<3>)1;
            //_converter4(2, 0) = (ap_uint<3>)1(2, 0);
            compute0(12, 10) = _converter4;
            ap_uint<2> _converter5;
            _converter5(1, 0) = (ap_uint<2>)0;
            //_converter5(1, 0) = (ap_uint<2>)0(1, 0);
            compute0(14, 13) = _converter5;
            ap_uint<64> _converter6;
            _converter6(63, 0) = mem_operands_cat(63, 0);
            compute0(78, 15) = _converter6;
          }
          uop_id[0] = ((ap_uint<10>)(((unsigned int)uop_id[0]) + 1U));
	  //printf("uop_id: %s\n",uop_id[0].to_string().c_str() );
          int q_enq;
          if (((unsigned int)num_uops[0]) < 4U) {
            uop_q[num_uops[0]] = ((ap_uint<80>)compute0);
	  //printf("uop_q: %s\n", uop_q[num_uops[0]].to_string().c_str()  );
            num_uops[0] = ((ap_uint<13>)(((unsigned int)num_uops[0]) + 1U));
	  //printf("num_ops[0]: %s\n", num_uops[0].to_string().c_str() );
          }
        }
      }
    }
	
}


void uinstr_decoder_per_u(ap_uint<79> instr_, int &sram_base_, int &dram_base_)
{
	
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

void core( int sram_base_, int dram_base_, uint8_t DRAM[64], uint8_t out_mem[4][1][16] )
{
	 int store_2d_tensor;
        int mutate0;
        mutate0_row: for (int row = 0; row < 1; ++row) {
          mutate0_col: for (int col = 0; col < 16; ++col) {
            DRAM[((dram_base_ + (row * 16)) + col)] = out_mem[(row + sram_base_)][0][col];
		//printf("DRAM [%d]= %u\n",((dram_base_ + (row * 16)) + col) , DRAM[((dram_base_ + (row * 16)) + col)]);
          }
        }

}




