// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
#ifndef _FIRLIB_HPP_
#define _FIRLIB_HPP_

#include <adflibsynth.h>
#include <vector>

namespace xf {
namespace aiesynth {
namespace fir {

/**
 * @brief FirSrAsym is the Asymmetrical Single Rate FIR filter
 *
 * These are the templates to configure the Asymmetric Single Rate FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an integer which describes the number of taps in the filter.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         - 0 = floor (truncate) eg. 3.8 Would become 3.
 *         - 1 = ceiling e.g. 3.2 would become 4.
 *         - 2 = round to positive infinity.
 *         - 3 = round to negative infinity.
 *         - 4 = round symmetrical to infinity.
 *         - 5 = round symmetrical to zero.
 *         - 6 = round convergent to even.
 *         - 7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         by virtue the single rate nature of this filter.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int CoeffReload=0
        >
class FirSrAsym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize samples of DataType type.
 **/
    adf::port<output> out;
/**
 * @brief This is the constructor function for the Asymmetric Single Rate FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type CoefType.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                           in mega-samples-per-second (MSPS).
 **/
    FirSrAsym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Asymmetric Single Rate FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type CoefType.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                           in mega-samples-per-second (MSPS).
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
    FirSrAsym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascadeLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirSrAsym");
    }
};

// Specialized SR FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize
        >
class FirSrAsym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;
/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;

    FirSrAsym(int SamplingRate);
    FirSrAsym(int SamplingRate, int CascadeLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirSrAsym");
    }
};

/**
 * @brief FirSrym is a Symmetrical Single Rate FIR filter
 *
 * These are the templates to configure the Symmetric Single Rate FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         - 0 = floor (truncate) eg. 3.8 Would become 3.
 *         - 1 = ceiling e.g. 3.2 would become 4.
 *         - 2 = round to positive infinity.
 *         - 3 = round to negative infinity.
 *         - 4 = round symmetrical to infinity.
 *         - 5 = round symmetrical to zero.
 *         - 6 = round convergent to even.
 *         - 7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         by virtue the single rate nature of this filter.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function

 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int CoeffReload=0
        >
class FirSrSym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the Asymmetric Single Rate FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type CoefType.
 *                   The taps array need only be supplied for the first half
 *                   of the filter length plus the center tap for odd lengths i.e.
 *                   Coeffs[] = {c0, c1, c2, ..., cN [, cCT]} where
 *                   N = FirLength/2 and cCT is the center tap where FirLength
 *                   is odd.
 *                   For example, a 7-tap filter might use coeffs
 *                   (1, 3, 2, 5, 2, 3, 1). This could be input as
 *                   Coeffs[]= {1,3,2,5} since the context of symmetry allows
 *                   the remaining coefficients to be inferred.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                           in mega-samples-per-second (MSPS).
 **/
    FirSrSym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Asymmetric Single Rate FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type CoefType.
 *                   The taps array need only be supplied for the first half
 *                   of the filter length plus the center tap for odd lengths i.e.
 *                   Coeffs[] = {c0, c1, c2, ..., cN [, cCT]} where
 *                   N = FirLength/2 and cCT is the center tap where FirLength
 *                   is odd.
 *                   For example, a 7-tap filter might use coeffs
 *                   (1, 3, 2, 5, 2, 3, 1). This could be input as
 *                   Coeffs[]= {1,3,2,5} since the context of symmetry allows
 *                   the remaining coefficients to be inferred.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                           in mega-samples-per-second (MSPS).
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/

    FirSrSym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirSrSym");
    }
};

// Specialized SR FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize
        >
class FirSrSym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;

    FirSrSym(int SamplingRate);
    FirSrSym(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirSrSym");
    }
};

/**
 * @brief FirInterpolateHb is a Halfband Interpolation FIR filter
 *
 * These are the templates to configure the halfband interpolator FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         multiplied by 2 by virtue the halfband interpolation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int CoeffReload=0
        >
class FirInterpolateHb : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize*2 samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the halfband interpolator FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type CoefType.
 *                 The taps array must be supplied in a compressed form for
 *                 this halfband application, i.e.
 *                 Coeffs[] = {c0, c2, c4, ..., cN, cCT} where
 *                 N = (FirLength+1)/4 and
 *                 cCT is the center tap.
 *                 For example, a 7-tap halfband interpolator might use coeffs
 *                 (1, 0, 2, 5, 2, 0, 1). This would be input as
 *                 Coeffs[]= {1,2,5} since the context of halfband interpolation
 *                 allows the remaining coefficients to be inferred.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirInterpolateHb(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the halfband interpolator FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
    FirInterpolateHb(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateHb");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize
        >
class FirInterpolateHb<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;
    
    FirInterpolateHb(int SamplingRate);
    FirInterpolateHb(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateHb");
    }
};

/**
 * @brief FirDecimateHb is a Halfband Decimation FIR filter
 *
 * These are the templates to configure the halfband decimator FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         divided by 2 by virtue the halfband decimation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int CoeffReload=0
        >
class FirDecimateHb : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize/2 samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the halfband decimator FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type Coeffs.
 *                 The taps array must be supplied in a compressed form for
 *                 this halfband application, i.e.
 *                 Coeffs[] = {c0, c2, c4, ..., cN, cCT} where
 *                 N = (FirLength+1)/4 and
 *                 cCT is the center tap.
 *                 For example, a 7-tap halfband decimator might use coeffs
 *                 (1, 0, 2, 5, 2, 0, 1). This would be input as
 *                 Coeffs[]= {1,2,5} since the context of halfband decimation
 *                 allows the remaining coefficients to be inferred.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirDecimateHb(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the halfband interpolator FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
    FirDecimateHb(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateHb");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize
        >
class FirDecimateHb<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;
    
    FirDecimateHb(int SamplingRate);
    FirDecimateHb(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateHb");
    }
};

/**
 * @brief FirInterpolateAsym is an Asymmetric Interpolation FIR filter
 *
 * These are the templates to configure the Asymmetric Interpolation FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         divided by 2 by virtue the halfband decimation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam InterpolateFactor is an unsigned integer which describes the
 *         interpolation factor of the filter.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int InterpolateFactor,
         int CoeffReload=0
        >
class FirInterpolateAsym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize*InterpolateFactor samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the Asymmetric Interpolation FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type Coeffs.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirInterpolateAsym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Asymmetric Interpolation FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
    FirInterpolateAsym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateAsym");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int InterpolateFactor
        >
class FirInterpolateAsym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, InterpolateFactor, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;

    
    FirInterpolateAsym(int SamplingRate);
    FirInterpolateAsym(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateAsym");
    }
};

/**
 * @brief FirDecimateAsym is an Asymmetric Decimation FIR filter
 *
 * These are the templates to configure the Asymmetric Decimation FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         divided by 2 by virtue the halfband decimation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam DecimateFactor is an unsigned integer which describes the
 *         decimation factor of the filter.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int DecimateFactor,
         int CoeffReload=0
        >
class FirDecimateAsym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize/DecimateFactor samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the Asymmetric Decimation FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type Coeffs.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirDecimateAsym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Asymmetric Decimation FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/

    FirDecimateAsym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateAsym");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int DecimateFactor
        >
class FirDecimateAsym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, DecimateFactor, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;
 
    FirDecimateAsym(int SamplingRate);
    FirDecimateAsym(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateAsym");
    }
};

/**
 * @brief FirDecimateSym is an Symmetric Decimation FIR filter
 *
 * These are the templates to configure the Symmetric Decimation FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         divided by 2 by virtue the halfband decimation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam DecimateFactor is an unsigned integer which describes the
 *         decimation factor of the filter.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int DecimateFactor,
         int CoeffReload=0
        >
class FirDecimateSym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize/DecimateFactor samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the Symmetric Decimation FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type Coeffs.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirDecimateSym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Symmetric Decimation FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
    FirDecimateSym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateSym");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int DecimateFactor
        >
class FirDecimateSym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, DecimateFactor, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;

    FirDecimateSym(int SamplingRate);
    FirDecimateSym(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirDecimateSym");
    }
};

/**
 * @brief FirInterpolateFractAsym is an Asymmetric Fractional Interpolation FIR filter
 *
 * These are the templates to configure the Asymmetric Fractional Interpolation FIR class.
 * @tparam DataType describes the type of individual data samples input to and
 *         output from the filter function. This is a typename and must be one
 *         of the following:
 *         int16, cint16, int32, cint32, float, cfloat.
 * @tparam CoefType describes the type of individual coefficients of the filter
 *         taps. It must be one of the same set of types listed for DataType
 *         and must also satisfy the following rules:
 *         - Complex types are only supported when DataType is also complex.
 *         - 32 bit types are only supported when DataType is also a 32 bit type,
 *         - CoefType must be an integer type if DataType is an integer type
 *         - CoefType must be a float type if DataType is a float type.
 * @tparam FirLength is an unsigned integer which describes the number of taps
 *         in the filter. FirLength must be in the range 4 to 240 inclusive and
 *         must satisfy (FirLength +1)/4 = N where N is a positive integer.
 * @tparam Shift is describes power of 2 shift down applied to the accumulation of
 *         FIR terms before output. Shift must be in the range 0 to 61.
 * @tparam RoundMode describes the selection of rounding to be applied during the
 *         shift down stage of processing. RoundMode must be in the range 0 to 7
 *         where
 *         0 = floor (truncate) eg. 3.8 Would become 3.
 *         1 = ceiling e.g. 3.2 would become 4.
 *         2 = round to positive infinity.
 *         3 = round to negative infinity.
 *         4 = round symmetrical to infinity.
 *         5 = round symmetrical to zero.
 *         6 = round convergent to even.
 *         7 = round convergent to odd.
 *         Modes 2 to 7 round to the nearest integer. They differ only in how
 *         they round for values of 0.5.
 * @tparam InputWindowSize describes the number of samples in the window API
 *         used for input to the filter function.
 *         The number of values in the output window will be InputWindowSize
 *         divided by 2 by virtue the halfband decimation factor.
 *         Note: Margin size should not be included in InputWindowSize.
 * @tparam InterpolateFactor is an unsigned integer which describes the
 *         interpolation factor of the filter.
 * @tparam DecimateFactor is an unsigned integer which describes the
 *         decimation factor of the filter.
 * @tparam CoeffReload allows the user to select if runtime coefficient
 *         reloading should be used. This currently is only available for single
 *         kernel filters. When defining the parameter:
 *         - 0 = static coefficients, defined in filter constructor
 *         - 1 = reloadable coefficients, passed as argument to runtime function
 **/

template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int InterpolateFactor,
         int DecimateFactor,
         int CoeffReload=0
        >
class FirInterpolateFractAsym : public adflibsynth::libsynth
{
public:
/**
 * The input data to the function. This input is a window API of
 * samples of DataType type. The number of samples in the window is
 * described by InputWindowSize.
 * Note: Margin is added internally to the graph, when connecting input port
 * with kernel port. Therefore, margin should not be added when connecting
 * graph to a higher level design unit.
 * Margin size (in Bytes) equals to FirLength rounded up to a nearest
 * multiple of 32 bytes.
 **/
    adf::port<input> in;

/**
 * A window API of InputWindowSize*InterpolateFactor/DecimateFactor samples of DataType type.
 **/
    adf::port<output> out;

/**
 * @brief This is the constructor function for the Asymmetric Fractional Interpolation FIR graph.
 * @param Coeffs - a pointer to the array of taps values of type Coeffs.
 * @param SamplingRate - specifies the input sampling rate for the filter 
 *                       in mega-samples-per-second (MSPS).
 **/
    FirInterpolateFractAsym(std::vector<CoefType> &Coeffs, int SamplingRate);

/**
 * @brief This is the constructor function for the Asymmetric Fractional Interpolation FIR graph.
 * @param Coeffs - as explained above.
 * @param SamplingRate - as explained above.
 * @param CascadeLength - specifies the number of AIE processors to split the operation
 *                        over. This allows resource to be traded for higher performance.
 *                        CascadeLength must be in the range 1 to 9. 
 **/
 
    FirInterpolateFractAsym(std::vector<CoefType> &Coeffs, int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateFractAsym");
    }
};

// Specialized FIR type template using runtime reloadable coefficients
template<typename DataType,
         typename CoefType,
         int FirLength,
         int Shift,
         int RoundMode,
         int InputWindowSize,
         int InterpolateFactor,
         int DecimateFactor
        >
class FirInterpolateFractAsym<DataType, CoefType, FirLength, Shift, RoundMode, InputWindowSize, InterpolateFactor, DecimateFactor, 1> : public adflibsynth::libsynth
{
public:
    adf::port<input> in;
    adf::port<output> out;

/**
 * A Run-time Parameter API containing the set of coefficient values. A change to these values will be detected and will cause a
 * reload of the coefficients within the kernel or kernels to be used on the next data window.
 * This port is present only when CoeffReload is set to 1.
 **/
    adf::port<input> coeff;

    FirInterpolateFractAsym(int SamplingRate);
    FirInterpolateFractAsym(int SamplingRate, int CascLength);

    void registerLibraryClass()
    {
      REGISTER_LIBRARY_SYNTH_API("aieSynthFirInterpolateFractAsym");
    }
};

}}}

#endif
