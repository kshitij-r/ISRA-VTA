// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef _GEMMLIB_H_
#define _GEMMLIB_H_

#include <adflibsynth.h>
#include <vector>

#define ROW_MAJOR 0
#define COL_MAJOR 1

namespace xf {
namespace aiesynth {
namespace gemm {

template <typename DataTypeA,
          typename DataTypeB,
          int DimA,
          int DimAB,
          int DimB,
          int Shift,
          int RoundMode,
          int OrderA = ROW_MAJOR,
          int OrderB = COL_MAJOR,
          int OrderOut = ROW_MAJOR,
          int HSplit = 1,
          int VSplit = 1
         >
class MatrixMult : public adflibsynth::libsynth
{
public:
  std::vector<adf::port<input>> A;
  std::vector<adf::port<input>> B;
  std::vector<adf::port<output>> Out;


  MatrixMult();

  void registerLibraryClass()
  {
    REGISTER_LIBRARY_SYNTH_API("aieSynthMatrixMult");
  }

};

}}}

#endif
