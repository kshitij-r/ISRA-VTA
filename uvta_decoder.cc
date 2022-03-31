#ifdef __GCC__DEF__
#include <exception>
#endif


#include<string>
#include<vector>
//#include<exception>
#include<stdlib.h>
#include<assert.h>
#include <klee/klee.h>

 /*
        Load 2D from DRAM into SRAM according to decoded instruction.
        x_pad_0         x_pad_1
        |<-->|          |<-->|
        000000xxxxxxxxxx000000
              |<------>|
                x_size
 */
const int SIZE = 5;
struct instr{
    unsigned int opcode;
    unsigned int *sram_base, *dram_base, y_size, x_size;
    unsigned int y_pad_0, y_pad_1, x_pad_0, x_pad_1;
};

void base_interpreter(struct instr myinsn){

  #ifdef __GCC__DEF__
//    std::cout<<"SRAM base address: "<<myinsn.sram_base<<std::endl;
//    std::cout<<"DRAM base address: "<<myinsn.dram_base<<std::endl;
    try{                //TODO : Add exceptions for out of bound memory access while accessing SRAM
    if(myinsn.opcode != 0){
        throw myinsn.opcode;
        }
    }
    catch(unsigned int exception){
   //     printf("OPCODE does not match with load, code terminating!!");
    //    std::cout << "OPCODE does not match with load, code terminating!!"<<std::endl;

         exit (EXIT_FAILURE);
    }
    try{
        if(myinsn.x_pad_0 + myinsn.x_pad_1 + myinsn.x_size > SIZE){
        throw 99;
        }
    }
    catch(int x){
     //   printf("Illegal memory access!!");
      //  std::cout<<"Illegal memory access!!"<<std::endl;
        exit (EXIT_FAILURE);
    }

#endif
    // Padding DRAM array start based on instruction value
    for (int i=0; i<myinsn.x_pad_0; i++){
        *myinsn.sram_base = 0;
        ++myinsn.dram_base;
        ++myinsn.sram_base;
    }

    // Copy SRAM values to DRAM array based on x_size
    for (int i =0; i<myinsn.x_size; i++){
       *myinsn.sram_base = *myinsn.dram_base ;
       ++myinsn.dram_base;
       ++myinsn.sram_base;
    }

    // Padding DRAM array end based on instruction value
    for (int i=0; i<myinsn.x_pad_1; i++){
        *myinsn.sram_base = 0;
        ++myinsn.sram_base;

    }
}


 
struct microinstr{
    unsigned int opcode  ;
    unsigned int  optype   ;
    unsigned int *sram_base  ;
    unsigned int *dram_base  ;

};

void uinstr_interpreter(struct microinstr myinsn){

  #ifdef __GCC__DEF__
//    std::cout<<"SRAM base address: "<<myinsn.sram_base<<std::endl;
//    std::cout<<"DRAM base address: "<<myinsn.dram_base<<std::endl;
    try{                //TODO : Add exceptions for out of bound memory access while accessing SRAM
    if(myinsn.opcode != 0){
        throw myinsn.opcode;
        }
    }
    catch(unsigned int exception){
  //      printf("OPCODE does not match with load, code terminating!!\n");
         exit (EXIT_FAILURE);
    }

#endif
   // Copy DRAM values to SRAM array for each uinstr  
       *myinsn.sram_base = *myinsn.dram_base ;
}

void interpreter1(unsigned int opcode, unsigned int *sram_base, unsigned int *dram_base,  unsigned int y_size, unsigned int x_size, unsigned int y_pad_0, unsigned int y_pad_1, unsigned int x_pad_0,unsigned int x_pad_1  )

{
	instr instruction = { opcode, sram_base, dram_base, y_size,x_size, y_pad_0, y_pad_1, x_pad_0, x_pad_1};
	base_interpreter(instruction);
 

}

void interpreter2( unsigned int opcode, unsigned int op_type, unsigned int *sram_base, unsigned int *dram_base ,microinstr *uop_q, unsigned int num_ops) {
   while (num_ops > 0) {
   microinstr uinstr = uop_q[0]; //assign the first element in uop_q to uinstr
   if (num_ops > 0) { 
   for (unsigned int i = 0; i < num_ops -1 ; i++) {
	 uop_q[i] = uop_q[i+1]; // remove the first element in uop_q, shift remaining elements forward and decrease num_ops by 1 
	}
	 num_ops = num_ops - 1;
	}
	microinstr uinstruction = uinstr;
    uinstr_interpreter(uinstruction);
  }
}


int main(int argc, const char *argv[]) {
//   uop_q[5] = {1,2,3,4,5};

unsigned int opcode,op_type;
unsigned int y_size, x_size;
unsigned int DRAM[SIZE] = {1,2,3,4,5};
unsigned int SRAM[SIZE] = {0,0,0,0,0};
unsigned int SRAM_2[SIZE] = {0,0,0,0,0};

unsigned int *sram_base_address = &SRAM[0];
unsigned int *sram2_base_address = &SRAM_2[0];
unsigned int *dram_base_address = &DRAM[0];
unsigned int num_ops = 5;

klee_make_symbolic(&op_type, sizeof(op_type), "op_type");
klee_make_symbolic(&opcode, sizeof(opcode), "opcode");
klee_make_symbolic(&y_size, sizeof(y_size), "y_size");
klee_make_symbolic(&x_size, sizeof(x_size), "x_size");
/*
opcode = 0;
op_type = 2;
y_size =0;
x_size=5;*/

if( (opcode ==0) && ((op_type >= 0) && (op_type<=3)) && (y_size ==0) && (x_size==5) ){
//klee_assume((opcode ==0) & ((op_type >= 0) & (op_type<=3)) & (y_size ==0) & (x_size==5)  );
 microinstr uop_q[5] = {  { opcode, op_type, sram2_base_address, dram_base_address}, { opcode, op_type, sram2_base_address+1, dram_base_address+1}, { opcode, op_type, sram2_base_address+2, dram_base_address+2}, { opcode, op_type, sram2_base_address+3, dram_base_address+3}, { opcode, op_type, sram2_base_address+4, dram_base_address+4}};
interpreter1(opcode, sram_base_address, dram_base_address, y_size,x_size,0,0,0,0 );


interpreter2(opcode, op_type, sram2_base_address, dram_base_address, uop_q, num_ops) ;
  /* for (int i = 0; i < sizeof(SRAM)/sizeof(int); i++) {
    std::cout << SRAM[i] << ", " ;
	printf("SRAM[%d] = %d\n", i, SRAM[i]);
    }
   std::cout << std::endl;
    for (int i = 0; i < sizeof(SRAM_2)/sizeof(int); i++) {
    std::cout << SRAM_2[i] << ", " ;
	printf("SRAM_2[%d] = %d\n", i, SRAM_2[i]);
    }
    std::cout << std::endl;
    for (int i = 0; i < sizeof(DRAM)/sizeof(int); i++) {
    std::cout<< DRAM[i] << ", ";
	printf("DRAM[%d] = %d\n", i, DRAM[i]);
       }
    std::cout << std::endl;  */
    for (int i = 0; i < SIZE; i++) {
	assert (SRAM[i] == SRAM_2[i]);
//	printf(" assertion passed\n");
    }
}
return 0;
}