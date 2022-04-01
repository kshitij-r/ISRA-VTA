void interpreter4(int dram_base, uint8_t dram[64], uint8_t dram_2[64] ){
     for (int k =0; k < 16; k++){
        dram_2 [dram_base]= dram[dram_base] ;
	dram_base++;
     }
}