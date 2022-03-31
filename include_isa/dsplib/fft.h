// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef _FFTLIB_H_
#define _FFTLIB_H_

#include <adflibsynth.h>
#include <vector>

namespace xf {
namespace aiesynth {
namespace fft {

template <typename DataType,
          int PointSize,
          int Shift,
          bool isInverseFFT
         >
class FftDit1Ch : public adflibsynth::libsynth
{
public:
  adf::port<input> in;
  adf::port<output> out;


  FftDit1Ch();
  FftDit1Ch(int CascadeLength);

  void registerLibraryClass()
  {
    REGISTER_LIBRARY_SYNTH_API("aieSynthFFTDit1Ch");
  }

};

}}}

#endif 
