#include "klee/klee.h"
//#include <iostream>

//using namepsace std:

void verify(int x, int y){
  int temp;	
	if ((x>=2)&&(y>=4)){
	temp = 0;
	}
	else {
	temp = 1;
	}
}

int main() {
  int c,d;
  klee_make_symbolic(&c, sizeof(c), "c");
  klee_make_symbolic(&d, sizeof(d), "d");

  //klee_assume((c==2) && (d==3));
  verify(c,d);
  return 0;
}
