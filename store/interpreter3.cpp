//Takes the input of the core function 
void interpreter3(int sram_base, int dram_base, uint8_t dram[64], uint8_t out_mem[4][1][16] ){
   // Store OUT_MEM values to DRAM array for each decoded uinstr value
     for (int k =0; k < 16; k++){
        dram [dram_base]= out_mem[sram_base][0][k] ;
	dram_base++;
     }
}