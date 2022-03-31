; ModuleID = 'store_v1.bc'
source_filename = "store_v1.cc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int_sim }
%struct.ssdm_int_sim = type { %class.ap_private }
%class.ap_private = type { i8 }
%struct.ap_uint.0 = type { %struct.ap_int_base.1 }
%struct.ap_int_base.1 = type { %struct.ssdm_int_sim.2 }
%struct.ssdm_int_sim.2 = type { %class.ap_private.3 }
%class.ap_private.3 = type { [2 x i64] }
%struct.ap_range_ref = type { %struct.ap_int_base.1*, i32, i32 }
%struct.ap_uint.4 = type { %struct.ap_int_base.5 }
%struct.ap_int_base.5 = type { %struct.ssdm_int_sim.6 }
%struct.ssdm_int_sim.6 = type { %class.ap_private.7 }
%class.ap_private.7 = type { i8 }
%struct.ap_uint.8 = type { %struct.ap_int_base.9 }
%struct.ap_int_base.9 = type { %struct.ssdm_int_sim.10 }
%struct.ssdm_int_sim.10 = type { %class.ap_private.11 }
%class.ap_private.11 = type { i8 }
%struct.ap_uint.12 = type { %struct.ap_int_base.13 }
%struct.ap_int_base.13 = type { %struct.ssdm_int_sim.14 }
%struct.ssdm_int_sim.14 = type { %class.ap_private.15 }
%class.ap_private.15 = type { i16 }
%struct.ap_int = type { %struct.ap_int_base.16 }
%struct.ap_int_base.16 = type { %struct.ssdm_int_sim.17 }
%struct.ssdm_int_sim.17 = type { %class.ap_private.18 }
%class.ap_private.18 = type { [2 x i64] }
%struct.ap_int.22 = type { %struct.ap_int_base.19 }
%struct.ap_int_base.19 = type { %struct.ssdm_int_sim.20 }
%struct.ssdm_int_sim.20 = type { %class.ap_private.21 }
%class.ap_private.21 = type { [2 x i64] }
%struct.ap_int.26 = type { %struct.ap_int_base.23 }
%struct.ap_int_base.23 = type { %struct.ssdm_int_sim.24 }
%struct.ssdm_int_sim.24 = type { %class.ap_private.25 }
%class.ap_private.25 = type { [2 x i64] }
%struct.ap_int.27 = type { %struct.ap_int_base.28 }
%struct.ap_int_base.28 = type { %struct.ssdm_int_sim.29 }
%struct.ssdm_int_sim.29 = type { %class.ap_private.30 }
%class.ap_private.30 = type { [2 x i64] }
%struct.ap_int.34 = type { %struct.ap_int_base.31 }
%struct.ap_int_base.31 = type { %struct.ssdm_int_sim.32 }
%struct.ssdm_int_sim.32 = type { %class.ap_private.33 }
%class.ap_private.33 = type { i64 }
%class.ap_private.40 = type { [2 x i64] }
%class.ap_private.39 = type { [4 x i64] }
%struct.ap_int.35 = type { %struct.ap_int_base.36 }
%struct.ap_int_base.36 = type { %struct.ssdm_int_sim.37 }
%struct.ssdm_int_sim.37 = type { %class.ap_private.38 }
%class.ap_private.38 = type { i32 }
%struct.ap_int_base.43 = type { %struct.ssdm_int_sim.44 }
%struct.ssdm_int_sim.44 = type { %class.ap_private.45 }
%class.ap_private.45 = type { i8 }
%struct._private_range_ref = type { %class.ap_private.3*, i32, i32 }
%struct._private_bit_ref = type <{ %class.ap_private.3*, i32, [4 x i8] }>
%class.ap_private.41 = type { i32 }
%class.ap_private.42 = type { i64 }

$_ZN7ap_uintILi8EEC2Ev = comdat any

$_ZN7ap_uintILi8EED2Ev = comdat any

$_ZN7ap_uintILi8EEaSERKS0_ = comdat any

$_ZN7ap_uintILi128EEC2Ev = comdat any

$_ZN7ap_uintILi128EEC2Ei = comdat any

$_ZN7ap_uintILi128EEaSERKS0_ = comdat any

$_ZN7ap_uintILi128EED2Ev = comdat any

$_ZN11ap_int_baseILi128ELb0EEclEii = comdat any

$_ZN12ap_range_refILi128ELb0EEaSILi8ELb0EEERS0_RK11ap_int_baseIXT_EXT0_EE = comdat any

$_ZN7ap_uintILi3EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZNK11ap_int_baseILi3ELb0EEcvyEv = comdat any

$_ZN7ap_uintILi3EED2Ev = comdat any

$_ZN7ap_uintILi2EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZNK11ap_int_baseILi2ELb0EEcvyEv = comdat any

$_ZN7ap_uintILi2EED2Ev = comdat any

$_ZN7ap_uintILi16EEC2Ev = comdat any

$_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZN7ap_uintILi16EEaSERKS0_ = comdat any

$_ZN7ap_uintILi16EED2Ev = comdat any

$_ZNK12ap_range_refILi128ELb0EEcvyEv = comdat any

$_ZNK11ap_int_baseILi16ELb0EEcvyEv = comdat any

$_ZplILi67ELb1ELi67ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE = comdat any

$_ZplILi66ELb1ELi66ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE = comdat any

$_ZN6ap_intILi66EEC2ILi16EEERK7ap_uintIXT_EE = comdat any

$_ZmlILi64ELb1ELi64ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4multERKS1_RKS0_IXT1_EXT2_EE = comdat any

$_ZN6ap_intILi64EEC2Ei = comdat any

$_ZN6ap_intILi66EEC2ILi128EEERKS_IXT_EE = comdat any

$_ZN6ap_intILi67EEC2Ei = comdat any

$_ZNK11ap_int_baseILi68ELb1EEcvxEv = comdat any

$_ZN6ap_intILi68EED2Ev = comdat any

$_ZN6ap_intILi67EED2Ev = comdat any

$_ZN6ap_intILi66EED2Ev = comdat any

$_ZN6ap_intILi128EED2Ev = comdat any

$_ZN6ap_intILi64EED2Ev = comdat any

$_ZN6ap_intILi66EEC2Ej = comdat any

$_ZN6ap_intILi32EEC2Ei = comdat any

$_ZltILi32ELb1EEbRK11ap_int_baseIXT_EXT0_EEi = comdat any

$_ZN7ap_uintILi8EEC2Ei = comdat any

$_ZNK11ap_int_baseILi32ELb1EEcvxEv = comdat any

$_ZN11ap_int_baseILi32ELb1EEppEv = comdat any

$_ZN6ap_intILi32EED2Ev = comdat any

$_ZN11ap_int_baseILi8ELb0EED2Ev = comdat any

$_ZN12ssdm_int_simILi8ELb0EED2Ev = comdat any

$_ZN10ap_privateILi8ELb0ELb1EED2Ev = comdat any

$_ZN10ap_privateILi8ELb0ELb1EE12check_canaryEv = comdat any

$__clang_call_terminate = comdat any

$_ZN12ssdm_int_simILi128ELb0EED2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EED2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi3ELb0EED2Ev = comdat any

$_ZN12ssdm_int_simILi3ELb0EED2Ev = comdat any

$_ZN10ap_privateILi3ELb0ELb1EED2Ev = comdat any

$_ZN10ap_privateILi3ELb0ELb1EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi2ELb0EED2Ev = comdat any

$_ZN12ssdm_int_simILi2ELb0EED2Ev = comdat any

$_ZN10ap_privateILi2ELb0ELb1EED2Ev = comdat any

$_ZN10ap_privateILi2ELb0ELb1EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi16ELb0EED2Ev = comdat any

$_ZN12ssdm_int_simILi16ELb0EED2Ev = comdat any

$_ZN10ap_privateILi16ELb0ELb1EED2Ev = comdat any

$_ZN10ap_privateILi16ELb0ELb1EE12check_canaryEv = comdat any

$_ZN12ssdm_int_simILi68ELb1EED2Ev = comdat any

$_ZN10ap_privateILi68ELb1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE12check_canaryEv = comdat any

$_ZN12ssdm_int_simILi67ELb1EED2Ev = comdat any

$_ZN10ap_privateILi67ELb1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi66ELb1EED2Ev = comdat any

$_ZN12ssdm_int_simILi66ELb1EED2Ev = comdat any

$_ZN10ap_privateILi66ELb1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE12check_canaryEv = comdat any

$_ZN12ssdm_int_simILi128ELb1EED2Ev = comdat any

$_ZN10ap_privateILi128ELb1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi64ELb1EED2Ev = comdat any

$_ZN12ssdm_int_simILi64ELb1EED2Ev = comdat any

$_ZN10ap_privateILi64ELb1ELb1EED2Ev = comdat any

$_ZN10ap_privateILi64ELb1ELb1EE12check_canaryEv = comdat any

$_ZN12ssdm_int_simILi32ELb1EED2Ev = comdat any

$_ZN10ap_privateILi32ELb1ELb1EED2Ev = comdat any

$_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv = comdat any

$_ZN11ap_int_baseILi8ELb0EEC2Ev = comdat any

$_ZN12ssdm_int_simILi8ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi8ELb0ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi8ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi8ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi8ELb0ELb1EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi8ELb0ELb1EE7get_VALEv = comdat any

$_ZN12ssdm_int_simILi128ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaSEi = comdat any

$_ZN10ap_privateILi32ELb1ELb1EEC2Ei = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi32ELb1ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi32ELb1ELb1EE10isNegativeEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEv = comdat any

$_ZN11ap_int_baseILi128ELb0EE5rangeEii = comdat any

$_ZN12ap_range_refILi128ELb0EEC2EP11ap_int_baseILi128ELb0EEii = comdat any

$_ZN11ap_int_baseILi128ELb0EEC2ILi8ELb0EEERKS_IXT_EXT0_EE = comdat any

$_Z21_AP_ROOT_op_set_rangeI10ap_privateILi128ELb0ELb0EEiiS1_ERT_S3_RKT0_RKT1_RKT2_ = comdat any

$_ZN11ap_int_baseILi128ELb0EED2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaSILi8ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE13cpZextOrTruncILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi8ELb0ELb1EE8get_pValEi = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE5rangeEii = comdat any

$_ZN18_private_range_refILi128ELb0EEaSILi128ELb0EEERS0_RK10ap_privateIXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN18_private_range_refILi128ELb0EEC2EP10ap_privateILi128ELb0ELb0EEii = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_ = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEixEi = comdat any

$_ZNK16_private_bit_refILi128ELb0EEcvbEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE3setEj = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE5clearEj = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEC2Eib = comdat any

$_ZlSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i = comdat any

$_ZrSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE4flipEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEoRILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN16_private_bit_refILi128ELb0EEC2ER10ap_privateILi128ELb0ELb0EEi = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE7maskBitEj = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE9whichWordEj = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE8whichBitEj = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EElsEi = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EErsEi = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE3shlEj = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE10isNegativeEv = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE4lshrEj = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE8get_pValEv = comdat any

$_ZN8AESL_std3minIiEET_S1_S1_ = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEi = comdat any

$_ZN11ap_int_baseILi3ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZN12ssdm_int_simILi3ELb0EEC2Ev = comdat any

$_ZNK12ap_range_refILi128ELb0EE3getEv = comdat any

$_ZN10ap_privateILi3ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi3ELb0ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi3ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi3ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZN11ap_int_baseILi128ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEaSILi128ELb0EEERS0_RK18_private_range_refIXT_EXT0_EE = comdat any

$_ZN10ap_privateILi128ELb0ELb0EEC2ILi128ELb0EEERK18_private_range_refIXT_EXT0_EE = comdat any

$_ZNK18_private_range_refILi128ELb0EE3getEv = comdat any

$_ZN10ap_privateILi128ELb0ELb0EE6reportEv = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv = comdat any

$_ZNK10ap_privateILi3ELb0ELb1EEcvhEv = comdat any

$_ZNK10ap_privateILi3ELb0ELb1EE7get_VALEv = comdat any

$_ZN11ap_int_baseILi2ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZN12ssdm_int_simILi2ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi2ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi2ELb0ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi2ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi2ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZNK10ap_privateILi2ELb0ELb1EEcvhEv = comdat any

$_ZNK10ap_privateILi2ELb0ELb1EE7get_VALEv = comdat any

$_ZN11ap_int_baseILi16ELb0EEC2Ev = comdat any

$_ZN12ssdm_int_simILi16ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi16ELb0ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi16ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi16ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZN11ap_int_baseILi16ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE = comdat any

$_ZN10ap_privateILi16ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi16ELb0ELb1EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi16ELb0ELb1EE7get_VALEv = comdat any

$_ZNK12ap_range_refILi128ELb0EE9to_uint64Ev = comdat any

$_ZNK18_private_range_refILi128ELb0EEcvyEv = comdat any

$_ZNK18_private_range_refILi128ELb0EE9to_uint64Ev = comdat any

$_ZNK10ap_privateILi128ELb0ELb0EE9to_uint64Ev = comdat any

$_ZNK10ap_privateILi16ELb0ELb1EEcvtEv = comdat any

$_ZN11ap_int_baseILi66ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi66ELb1ELb0EEaSILi16ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN12ssdm_int_simILi66ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi66ELb1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi16ELb0ELb1EE8get_pValEi = comdat any

$_ZN11ap_int_baseILi64ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi64ELb1ELb1EEaSEi = comdat any

$_ZN12ssdm_int_simILi64ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi64ELb1ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi64ELb1ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi64ELb1ELb1EE15clearUnusedBitsEv = comdat any

$_ZN11ap_int_baseILi128ELb1EEC2ILi64ELb1EEERKS_IXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi128ELb1EEC2Ev = comdat any

$_ZNK10ap_privateILi128ELb1ELb0EEmlILi128ELb1EEENS0_5RTypeIXT_EXT0_EE4multERKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb1ELb0EEaSILi256ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi256ELb1ELb0EED2Ev = comdat any

$_ZN6ap_intILi128EEC2ILi128ELb1EEERK11ap_int_baseIXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi128ELb1EED2Ev = comdat any

$_ZN12ssdm_int_simILi128ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi128ELb1ELb0EEaSILi64ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE6cpSextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi64ELb1ELb1EE10isNegativeEv = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE6cpZextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi64ELb1ELb1EE8get_pValEi = comdat any

$_ZN10ap_privateILi256ELb1ELb0EEC2ILi128ELb1EEERKS_IXT_EXT0_ELb0EE = comdat any

$_ZN10ap_privateILi256ELb1ELb0EEmLILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE10set_canaryEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE12check_canaryEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE6cpSextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi128ELb1ELb0EE10isNegativeEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE6cpZextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEi = comdat any

$_ZNK10ap_privateILi256ELb1ELb0EE13getActiveBitsEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE9whichWordEj = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE5clearEv = comdat any

$_ZN10ap_privateILi256ELb1ELb0EE8get_pValEv = comdat any

$_ZNK10ap_privateILi256ELb1ELb0EE10isNegativeEv = comdat any

$_ZNK10ap_privateILi256ELb1ELb0EE17countLeadingZerosEv = comdat any

$_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi256ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi256ELb1ELb0EE8get_pValEi = comdat any

$_ZN10ap_privateILi128ELb1ELb0EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEv = comdat any

$_ZN10ap_privateILi66ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN11ap_int_baseILi67ELb1EEC2ILi66ELb1EEERKS_IXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi67ELb1EEC2Ev = comdat any

$_ZNK10ap_privateILi67ELb1ELb0EEplILi67ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN6ap_intILi67EEC2ILi67ELb1EEERK11ap_int_baseIXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi67ELb1EED2Ev = comdat any

$_ZN12ssdm_int_simILi67ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEaSILi66ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi66ELb1ELb0EE10isNegativeEv = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi66ELb1ELb0EE8get_pValEi = comdat any

$_ZN10ap_privateILi68ELb1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi68ELb1ELb0EEC2ILi67ELb1EEERKS_IXT_EXT0_ELb0EE = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE8get_pValEv = comdat any

$_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE10set_canaryEv = comdat any

$_ZN10ap_privateILi68ELb1ELb0EEaSILi67ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi67ELb1ELb0EE10isNegativeEv = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE6cpZextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEi = comdat any

$_ZN8AESL_std3minIjEET_S1_S1_ = comdat any

$_ZN8AESL_std3minImEET_S1_S1_ = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEi = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEv = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEaSEi = comdat any

$_ZN10ap_privateILi67ELb1ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN11ap_int_baseILi68ELb1EEC2ILi67ELb1EEERKS_IXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi68ELb1EEC2Ev = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EEplILi68ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi68ELb1ELb0EEaSILi69ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi69ELb1ELb0EED2Ev = comdat any

$_ZN6ap_intILi68EEC2ILi68ELb1EEERK11ap_int_baseIXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi68ELb1EED2Ev = comdat any

$_ZN12ssdm_int_simILi68ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi69ELb1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi69ELb1ELb0EEC2ILi68ELb1EEERKS_IXT_EXT0_ELb0EE = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE8get_pValEv = comdat any

$_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE10set_canaryEv = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE12check_canaryEv = comdat any

$_ZN10ap_privateILi69ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EE10isNegativeEv = comdat any

$_ZN10ap_privateILi69ELb1ELb0EE6cpZextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi69ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi69ELb1ELb0EE8get_pValEi = comdat any

$_ZN10ap_privateILi68ELb1ELb0EEaSERKS0_ = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEv = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EEcvlEv = comdat any

$_ZNK10ap_privateILi68ELb1ELb0EE7get_VALEv = comdat any

$_ZN10ap_privateILi66ELb1ELb0EEaSEj = comdat any

$_ZN10ap_privateILi32ELb0ELb1EEC2Ej = comdat any

$_ZN10ap_privateILi66ELb1ELb0EEaSILi32ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi32ELb0ELb1EED2Ev = comdat any

$_ZN10ap_privateILi32ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi32ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi32ELb0ELb1EE12check_canaryEv = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi32ELb0ELb1EE8get_pValEi = comdat any

$_ZN11ap_int_baseILi32ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi32ELb1ELb1EEaSEi = comdat any

$_ZN12ssdm_int_simILi32ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi32ELb1ELb1EEC2Ev = comdat any

$_ZNK11ap_int_baseILi32ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi32ELb1EEC2Ei = comdat any

$_ZN11ap_int_baseILi32ELb1EED2Ev = comdat any

$_ZNK10ap_privateILi32ELb1ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi33ELb1ELb1EEC2ILi32ELb1ELb1EEERKS_IXT_EXT0_EXT1_EE = comdat any

$_ZNK10ap_privateILi33ELb1ELb1EE3sltILi33ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZN10ap_privateILi33ELb1ELb1EED2Ev = comdat any

$_ZNK10ap_privateILi32ELb1ELb1EE7get_VALEv = comdat any

$_ZN10ap_privateILi33ELb1ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi33ELb1ELb1EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi33ELb1ELb1EE12check_canaryEv = comdat any

$_ZNK10ap_privateILi33ELb1ELb1EE7get_VALEv = comdat any

$_ZN11ap_int_baseILi32ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EE = comdat any

$_ZN11ap_int_baseILi1ELb0EEC2Ei = comdat any

$_ZN11ap_int_baseILi1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi32ELb1ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE = comdat any

$_ZNK10ap_privateILi1ELb0ELb1EE7get_VALEv = comdat any

$_ZN12ssdm_int_simILi1ELb0EEC2Ev = comdat any

$_ZN10ap_privateILi1ELb0ELb1EEaSEi = comdat any

$_ZN12ssdm_int_simILi1ELb0EED2Ev = comdat any

$_ZN10ap_privateILi1ELb0ELb1EEC2Ev = comdat any

$_ZN10ap_privateILi1ELb0ELb1EE10set_canaryEv = comdat any

$_ZNV10ap_privateILi1ELb0ELb1EE15clearUnusedBitsEv = comdat any

$_ZN10ap_privateILi1ELb0ELb1EE12check_canaryEv = comdat any

$_ZN10ap_privateILi1ELb0ELb1EED2Ev = comdat any

$_ZNK10ap_privateILi32ELb1ELb1EEcviEv = comdat any

$_ZN10ap_privateILi8ELb0ELb1EEaSEi = comdat any

$_ZZN10ap_privateILi128ELb0ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi32ELb1ELb1EE10isNegativeEvE9sign_mask = comdat any

$_ZZNK10ap_privateILi128ELb0ELb0EE10isNegativeEvE4mask = comdat any

$_ZZN10ap_privateILi128ELb1ELb0EE6cpSextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi64ELb1ELb1EE10isNegativeEvE9sign_mask = comdat any

$_ZZN10ap_privateILi256ELb1ELb0EE6cpSextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi128ELb1ELb0EE10isNegativeEvE4mask = comdat any

$_ZZNK10ap_privateILi256ELb1ELb0EE10isNegativeEvE4mask = comdat any

$_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = comdat any

$_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi66ELb1ELb0EE10isNegativeEvE4mask = comdat any

$_ZZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = comdat any

$_ZZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi67ELb1ELb0EE10isNegativeEvE4mask = comdat any

$_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = comdat any

$_ZZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = comdat any

$_ZZNK10ap_privateILi68ELb1ELb0EE10isNegativeEvE4mask = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@_ZZN10ap_privateILi128ELb0ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 -4294967296, comdat, align 8
@_ZZNK10ap_privateILi32ELb1ELb1EE10isNegativeEvE9sign_mask = linkonce_odr dso_local constant i64 2147483648, comdat, align 8
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [41 x i8] c"ERROR: Hi(%d)out of bound(%d) in range()\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [41 x i8] c"ERROR: Lo(%d)out of bound(%d) in range()\00", align 1
@.str.3 = private unnamed_addr constant [68 x i8] c"WARNING: Higher bound (%d) and lower bound (%d) cannot be negative.\00", align 1
@.str.4 = private unnamed_addr constant [66 x i8] c"WARNING: Higher bound (%d) or lower bound (%d) out of range (%d).\00", align 1
@.str.5 = private unnamed_addr constant [56 x i8] c"WARNING: Index of bit vector  (%d) cannot be negative.\0A\00", align 1
@.str.6 = private unnamed_addr constant [54 x i8] c"WARNING: Index of bit vector (%d) out of range (%d).\0A\00", align 1
@.str.7 = private unnamed_addr constant [43 x i8] c"Attempting to read bit with negative index\00", align 1
@.str.8 = private unnamed_addr constant [55 x i8] c"i >= 0 && \22Attempting to read bit with negative index\22\00", align 1
@.str.9 = private unnamed_addr constant [27 x i8] c"./include/etc/ap_private.h\00", align 1
@__PRETTY_FUNCTION__._ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi = private unnamed_addr constant [99 x i8] c"bool ap_private<128, false, false>::get_bit(int) const [_AP_W = 128, _AP_S = false, _AP_C = false]\00", align 1
@.str.10 = private unnamed_addr constant [34 x i8] c"Attempting to read bit beyond MSB\00", align 1
@.str.11 = private unnamed_addr constant [49 x i8] c"i < _AP_W && \22Attempting to read bit beyond MSB\22\00", align 1
@_ZZNK10ap_privateILi128ELb0ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 -9223372036854775808, comdat, align 8
@.str.12 = private unnamed_addr constant [30 x i8] c"Invalid shift amount, too big\00", align 1
@.str.13 = private unnamed_addr constant [56 x i8] c"shiftAmt <= BitWidth && \22Invalid shift amount, too big\22\00", align 1
@__PRETTY_FUNCTION__._ZNK10ap_privateILi128ELb0ELb0EE3shlEj = private unnamed_addr constant [127 x i8] c"ap_private<_AP_W, _AP_S, false> ap_private<128, false, false>::shl(uint32_t) const [_AP_W = 128, _AP_S = false, _AP_C = false]\00", align 1
@_ZZN10ap_privateILi128ELb1ELb0EE6cpSextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 0, comdat, align 8
@_ZZNK10ap_privateILi64ELb1ELb1EE10isNegativeEvE9sign_mask = linkonce_odr dso_local constant i64 -9223372036854775808, comdat, align 8
@_ZZN10ap_privateILi256ELb1ELb0EE6cpSextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 0, comdat, align 8
@_ZZNK10ap_privateILi128ELb1ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 -9223372036854775808, comdat, align 8
@.str.14 = private unnamed_addr constant [9 x i8] c"xlen > 0\00", align 1
@__PRETTY_FUNCTION__._ZN14ap_private_opsL3mulEPmPKmjS2_jj = private unnamed_addr constant [103 x i8] c"void ap_private_ops::mul(uint64_t *, const uint64_t *, uint32_t, const uint64_t *, uint32_t, uint32_t)\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"ylen > 0\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"destlen >= xlen + ylen\00", align 1
@_ZZN14ap_private_opsL5mul_1EPmPKmjmE12two_power_32 = internal constant i64 4294967296, align 8
@_ZZNK10ap_privateILi256ELb1ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 -9223372036854775808, comdat, align 8
@_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = linkonce_odr dso_local constant i64 -4, comdat, align 8
@_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 -4, comdat, align 8
@_ZZNK10ap_privateILi66ELb1ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 2, comdat, align 8
@_ZZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = linkonce_odr dso_local constant i64 -8, comdat, align 8
@_ZZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 -8, comdat, align 8
@_ZZNK10ap_privateILi67ELb1ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 4, comdat, align 8
@_ZZN10ap_privateILi67ELb1ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 -4294967296, comdat, align 8
@_ZZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask = linkonce_odr dso_local constant i64 -16, comdat, align 8
@_ZZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEEE4mask_0 = linkonce_odr dso_local constant i64 -16, comdat, align 8
@_ZZNK10ap_privateILi68ELb1ELb0EE10isNegativeEvE4mask = linkonce_odr dso_local constant i64 8, comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_store_v1.cc, i8* null }]
@__dso_handle = hidden global i8* null, align 8, !dbg !0
@.str.17 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.18 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.19 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* bitcast (i8** @__dso_handle to i8*)) #3
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z16default_functionjjPA1_A16_7ap_uintILi8EEPS0_(i32, i32, [1 x [16 x %struct.ap_uint]]*, %struct.ap_uint*) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1 x [16 x %struct.ap_uint]]*, align 8
  %8 = alloca %struct.ap_uint*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca [16 x %struct.ap_uint], align 16
  %20 = alloca i8*
  %21 = alloca i32
  %22 = alloca i32, align 4
  %23 = alloca %struct.ap_uint.0, align 8
  %24 = alloca i32, align 4
  %25 = alloca %struct.ap_uint.0, align 8
  %26 = alloca i32, align 4
  %27 = alloca %struct.ap_uint.0, align 8
  %28 = alloca i32, align 4
  %29 = alloca %struct.ap_range_ref, align 8
  %30 = alloca i32, align 4
  %31 = alloca %struct.ap_uint.0, align 8
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca %struct.ap_uint.4, align 1
  %36 = alloca %struct.ap_range_ref, align 8
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca %struct.ap_uint.8, align 1
  %40 = alloca %struct.ap_range_ref, align 8
  %41 = alloca %struct.ap_uint.0, align 8
  %42 = alloca i32, align 4
  %43 = alloca %struct.ap_uint.12, align 2
  %44 = alloca i32, align 4
  %45 = alloca %struct.ap_uint.12, align 2
  %46 = alloca %struct.ap_range_ref, align 8
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca %struct.ap_range_ref, align 8
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca %struct.ap_uint.12, align 2
  %53 = alloca %struct.ap_range_ref, align 8
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca %struct.ap_uint.12, align 2
  %57 = alloca %struct.ap_range_ref, align 8
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca %struct.ap_uint.12, align 2
  %61 = alloca %struct.ap_range_ref, align 8
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i32, align 4
  %67 = alloca i32, align 4
  %68 = alloca %struct.ap_int, align 8
  %69 = alloca %struct.ap_int.22, align 8
  %70 = alloca %struct.ap_int.26, align 8
  %71 = alloca %struct.ap_int.26, align 8
  %72 = alloca %struct.ap_int.27, align 8
  %73 = alloca %struct.ap_int.34, align 8
  %74 = alloca %struct.ap_int.34, align 8
  %75 = alloca %struct.ap_int.22, align 8
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca %struct.ap_int, align 8
  %79 = alloca %struct.ap_int.22, align 8
  %80 = alloca %struct.ap_int.26, align 8
  %81 = alloca %struct.ap_int.26, align 8
  %82 = alloca %struct.ap_int.27, align 8
  %83 = alloca %struct.ap_int.34, align 8
  %84 = alloca %struct.ap_int.34, align 8
  %85 = alloca %struct.ap_int.22, align 8
  %86 = alloca i32, align 4
  %87 = alloca i32, align 4
  %88 = alloca i32, align 4
  %89 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [1 x [16 x %struct.ap_uint]]* %2, [1 x [16 x %struct.ap_uint]]** %7, align 8
  store %struct.ap_uint* %3, %struct.ap_uint** %8, align 8
  br label %90

90:                                               ; preds = %4
  store i32 0, i32* %12, align 4
  br label %91

91:                                               ; preds = %96, %90
  %92 = load i32, i32* %12, align 4
  %93 = icmp slt i32 %92, 1
  br i1 %93, label %94, label %99

94:                                               ; preds = %91
  %95 = load i32, i32* %5, align 4
  store i32 %95, i32* %11, align 4
  br label %96

96:                                               ; preds = %94
  %97 = load i32, i32* %12, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %12, align 4
  br label %91

99:                                               ; preds = %91
  br label %100

100:                                              ; preds = %99
  store i32 0, i32* %14, align 4
  br label %101

101:                                              ; preds = %105, %100
  %102 = load i32, i32* %14, align 4
  %103 = icmp slt i32 %102, 1
  br i1 %103, label %104, label %108

104:                                              ; preds = %101
  store i32 2, i32* %13, align 4
  br label %105

105:                                              ; preds = %104
  %106 = load i32, i32* %14, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %14, align 4
  br label %101

108:                                              ; preds = %101
  br label %109

109:                                              ; preds = %108
  store i32 0, i32* %15, align 4
  br label %110

110:                                              ; preds = %635, %109
  %111 = load i32, i32* %15, align 4
  %112 = load i32, i32* %13, align 4
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %114, label %638

114:                                              ; preds = %110
  br label %115

115:                                              ; preds = %114
  store i32 0, i32* %17, align 4
  br label %116

116:                                              ; preds = %121, %115
  %117 = load i32, i32* %17, align 4
  %118 = icmp slt i32 %117, 1
  br i1 %118, label %119, label %124

119:                                              ; preds = %116
  %120 = load i32, i32* %6, align 4
  store i32 %120, i32* %16, align 4
  br label %121

121:                                              ; preds = %119
  %122 = load i32, i32* %17, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %17, align 4
  br label %116

124:                                              ; preds = %116
  br label %125

125:                                              ; preds = %124
  store i32 0, i32* %18, align 4
  br label %126

126:                                              ; preds = %621, %125
  %127 = load i32, i32* %18, align 4
  %128 = load i32, i32* %16, align 4
  %129 = icmp slt i32 %127, %128
  br i1 %129, label %130, label %634

130:                                              ; preds = %126
  %131 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %19, i32 0, i32 0
  %132 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %131, i64 16
  br label %133

133:                                              ; preds = %135, %130
  %134 = phi %struct.ap_uint* [ %131, %130 ], [ %136, %135 ]
  invoke void @_ZN7ap_uintILi8EEC2Ev(%struct.ap_uint* %134)
          to label %135 unwind label %158

135:                                              ; preds = %133
  %136 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %134, i64 1
  %137 = icmp eq %struct.ap_uint* %136, %132
  br i1 %137, label %138, label %133

138:                                              ; preds = %135
  br label %139

139:                                              ; preds = %138
  store i32 0, i32* %22, align 4
  br label %140

140:                                              ; preds = %155, %139
  %141 = load i32, i32* %22, align 4
  %142 = icmp slt i32 %141, 16
  br i1 %142, label %143, label %172

143:                                              ; preds = %140
  %144 = load %struct.ap_uint*, %struct.ap_uint** %8, align 8
  %145 = load i32, i32* %11, align 4
  %146 = load i32, i32* %22, align 4
  %147 = add nsw i32 %145, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %144, i64 %148
  %150 = load i32, i32* %22, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %19, i64 0, i64 %151
  %153 = invoke dereferenceable(1) %struct.ap_uint* @_ZN7ap_uintILi8EEaSERKS0_(%struct.ap_uint* %152, %struct.ap_uint* dereferenceable(1) %149)
          to label %154 unwind label %168

154:                                              ; preds = %143
  br label %155

155:                                              ; preds = %154
  %156 = load i32, i32* %22, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %22, align 4
  br label %140

158:                                              ; preds = %133
  %159 = landingpad { i8*, i32 }
          cleanup
  %160 = extractvalue { i8*, i32 } %159, 0
  store i8* %160, i8** %20, align 8
  %161 = extractvalue { i8*, i32 } %159, 1
  store i32 %161, i32* %21, align 4
  %162 = icmp eq %struct.ap_uint* %131, %134
  br i1 %162, label %167, label %163

163:                                              ; preds = %163, %158
  %164 = phi %struct.ap_uint* [ %134, %158 ], [ %165, %163 ]
  %165 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %164, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %165) #3
  %166 = icmp eq %struct.ap_uint* %165, %131
  br i1 %166, label %167, label %163

167:                                              ; preds = %163, %158
  br label %639

168:                                              ; preds = %172, %143
  %169 = landingpad { i8*, i32 }
          cleanup
  %170 = extractvalue { i8*, i32 } %169, 0
  store i8* %170, i8** %20, align 8
  %171 = extractvalue { i8*, i32 } %169, 1
  store i32 %171, i32* %21, align 4
  br label %626

172:                                              ; preds = %140
  invoke void @_ZN7ap_uintILi128EEC2Ev(%struct.ap_uint.0* %23)
          to label %173 unwind label %168

173:                                              ; preds = %172
  br label %174

174:                                              ; preds = %173
  store i32 0, i32* %24, align 4
  br label %175

175:                                              ; preds = %231, %174
  %176 = load i32, i32* %24, align 4
  %177 = icmp slt i32 %176, 1
  br i1 %177, label %178, label %235

178:                                              ; preds = %175
  invoke void @_ZN7ap_uintILi128EEC2Ev(%struct.ap_uint.0* %25)
          to label %179 unwind label %191

179:                                              ; preds = %178
  br label %180

180:                                              ; preds = %179
  store i32 0, i32* %26, align 4
  br label %181

181:                                              ; preds = %188, %180
  %182 = load i32, i32* %26, align 4
  %183 = icmp slt i32 %182, 1
  br i1 %183, label %184, label %203

184:                                              ; preds = %181
  invoke void @_ZN7ap_uintILi128EEC2Ei(%struct.ap_uint.0* %27, i32 0)
          to label %185 unwind label %195

185:                                              ; preds = %184
  %186 = invoke dereferenceable(16) %struct.ap_uint.0* @_ZN7ap_uintILi128EEaSERKS0_(%struct.ap_uint.0* %25, %struct.ap_uint.0* dereferenceable(16) %27)
          to label %187 unwind label %199

187:                                              ; preds = %185
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %27) #3
  br label %188

188:                                              ; preds = %187
  %189 = load i32, i32* %26, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %26, align 4
  br label %181

191:                                              ; preds = %235, %178
  %192 = landingpad { i8*, i32 }
          cleanup
  %193 = extractvalue { i8*, i32 } %192, 0
  store i8* %193, i8** %20, align 8
  %194 = extractvalue { i8*, i32 } %192, 1
  store i32 %194, i32* %21, align 4
  br label %625

195:                                              ; preds = %228, %222, %208, %184
  %196 = landingpad { i8*, i32 }
          cleanup
  %197 = extractvalue { i8*, i32 } %196, 0
  store i8* %197, i8** %20, align 8
  %198 = extractvalue { i8*, i32 } %196, 1
  store i32 %198, i32* %21, align 4
  br label %234

199:                                              ; preds = %185
  %200 = landingpad { i8*, i32 }
          cleanup
  %201 = extractvalue { i8*, i32 } %200, 0
  store i8* %201, i8** %20, align 8
  %202 = extractvalue { i8*, i32 } %200, 1
  store i32 %202, i32* %21, align 4
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %27) #3
  br label %234

203:                                              ; preds = %181
  br label %204

204:                                              ; preds = %203
  store i32 0, i32* %28, align 4
  br label %205

205:                                              ; preds = %225, %204
  %206 = load i32, i32* %28, align 4
  %207 = icmp slt i32 %206, 16
  br i1 %207, label %208, label %228

208:                                              ; preds = %205
  %209 = load i32, i32* %24, align 4
  %210 = mul nsw i32 %209, 16
  %211 = load i32, i32* %28, align 4
  %212 = add nsw i32 %210, %211
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %19, i64 0, i64 %213
  %215 = bitcast %struct.ap_uint* %214 to %struct.ap_int_base*
  %216 = bitcast %struct.ap_uint.0* %25 to %struct.ap_int_base.1*
  %217 = load i32, i32* %28, align 4
  %218 = mul nsw i32 %217, 8
  %219 = add nsw i32 %218, 7
  %220 = load i32, i32* %28, align 4
  %221 = mul nsw i32 %220, 8
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %29, %struct.ap_int_base.1* %216, i32 %219, i32 %221)
          to label %222 unwind label %195

222:                                              ; preds = %208
  %223 = invoke dereferenceable(16) %struct.ap_range_ref* @_ZN12ap_range_refILi128ELb0EEaSILi8ELb0EEERS0_RK11ap_int_baseIXT_EXT0_EE(%struct.ap_range_ref* %29, %struct.ap_int_base* dereferenceable(1) %215)
          to label %224 unwind label %195

224:                                              ; preds = %222
  br label %225

225:                                              ; preds = %224
  %226 = load i32, i32* %28, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %28, align 4
  br label %205

228:                                              ; preds = %205
  %229 = invoke dereferenceable(16) %struct.ap_uint.0* @_ZN7ap_uintILi128EEaSERKS0_(%struct.ap_uint.0* %23, %struct.ap_uint.0* dereferenceable(16) %25)
          to label %230 unwind label %195

230:                                              ; preds = %228
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %25) #3
  br label %231

231:                                              ; preds = %230
  %232 = load i32, i32* %24, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %24, align 4
  br label %175

234:                                              ; preds = %199, %195
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %25) #3
  br label %625

235:                                              ; preds = %175
  invoke void @_ZN7ap_uintILi128EEC2Ev(%struct.ap_uint.0* %31)
          to label %236 unwind label %191

236:                                              ; preds = %235
  br label %237

237:                                              ; preds = %236
  store i32 0, i32* %32, align 4
  br label %238

238:                                              ; preds = %244, %237
  %239 = load i32, i32* %32, align 4
  %240 = icmp slt i32 %239, 1
  br i1 %240, label %241, label %251

241:                                              ; preds = %238
  %242 = invoke dereferenceable(16) %struct.ap_uint.0* @_ZN7ap_uintILi128EEaSERKS0_(%struct.ap_uint.0* %31, %struct.ap_uint.0* dereferenceable(16) %23)
          to label %243 unwind label %247

243:                                              ; preds = %241
  br label %244

244:                                              ; preds = %243
  %245 = load i32, i32* %32, align 4
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* %32, align 4
  br label %238

247:                                              ; preds = %294, %278, %276, %258, %256, %241
  %248 = landingpad { i8*, i32 }
          cleanup
  %249 = extractvalue { i8*, i32 } %248, 0
  store i8* %249, i8** %20, align 8
  %250 = extractvalue { i8*, i32 } %248, 1
  store i32 %250, i32* %21, align 4
  br label %624

251:                                              ; preds = %238
  br label %252

252:                                              ; preds = %251
  store i32 0, i32* %34, align 4
  br label %253

253:                                              ; preds = %264, %252
  %254 = load i32, i32* %34, align 4
  %255 = icmp slt i32 %254, 1
  br i1 %255, label %256, label %271

256:                                              ; preds = %253
  %257 = bitcast %struct.ap_uint.0* %31 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %36, %struct.ap_int_base.1* %257, i32 2, i32 0)
          to label %258 unwind label %247

258:                                              ; preds = %256
  invoke void @_ZN7ap_uintILi3EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.4* %35, %struct.ap_range_ref* dereferenceable(16) %36)
          to label %259 unwind label %247

259:                                              ; preds = %258
  %260 = bitcast %struct.ap_uint.4* %35 to %struct.ap_int_base.5*
  %261 = invoke i64 @_ZNK11ap_int_baseILi3ELb0EEcvyEv(%struct.ap_int_base.5* %260)
          to label %262 unwind label %267

262:                                              ; preds = %259
  %263 = trunc i64 %261 to i32
  store i32 %263, i32* %33, align 4
  call void @_ZN7ap_uintILi3EED2Ev(%struct.ap_uint.4* %35) #3
  br label %264

264:                                              ; preds = %262
  %265 = load i32, i32* %34, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, i32* %34, align 4
  br label %253

267:                                              ; preds = %259
  %268 = landingpad { i8*, i32 }
          cleanup
  %269 = extractvalue { i8*, i32 } %268, 0
  store i8* %269, i8** %20, align 8
  %270 = extractvalue { i8*, i32 } %268, 1
  store i32 %270, i32* %21, align 4
  call void @_ZN7ap_uintILi3EED2Ev(%struct.ap_uint.4* %35) #3
  br label %624

271:                                              ; preds = %253
  br label %272

272:                                              ; preds = %271
  store i32 0, i32* %38, align 4
  br label %273

273:                                              ; preds = %284, %272
  %274 = load i32, i32* %38, align 4
  %275 = icmp slt i32 %274, 1
  br i1 %275, label %276, label %291

276:                                              ; preds = %273
  %277 = bitcast %struct.ap_uint.0* %31 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %40, %struct.ap_int_base.1* %277, i32 8, i32 7)
          to label %278 unwind label %247

278:                                              ; preds = %276
  invoke void @_ZN7ap_uintILi2EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.8* %39, %struct.ap_range_ref* dereferenceable(16) %40)
          to label %279 unwind label %247

279:                                              ; preds = %278
  %280 = bitcast %struct.ap_uint.8* %39 to %struct.ap_int_base.9*
  %281 = invoke i64 @_ZNK11ap_int_baseILi2ELb0EEcvyEv(%struct.ap_int_base.9* %280)
          to label %282 unwind label %287

282:                                              ; preds = %279
  %283 = trunc i64 %281 to i32
  store i32 %283, i32* %37, align 4
  call void @_ZN7ap_uintILi2EED2Ev(%struct.ap_uint.8* %39) #3
  br label %284

284:                                              ; preds = %282
  %285 = load i32, i32* %38, align 4
  %286 = add nsw i32 %285, 1
  store i32 %286, i32* %38, align 4
  br label %273

287:                                              ; preds = %279
  %288 = landingpad { i8*, i32 }
          cleanup
  %289 = extractvalue { i8*, i32 } %288, 0
  store i8* %289, i8** %20, align 8
  %290 = extractvalue { i8*, i32 } %288, 1
  store i32 %290, i32* %21, align 4
  call void @_ZN7ap_uintILi2EED2Ev(%struct.ap_uint.8* %39) #3
  br label %624

291:                                              ; preds = %273
  %292 = load i32, i32* %33, align 4
  %293 = icmp eq i32 %292, 1
  br i1 %293, label %294, label %611

294:                                              ; preds = %291
  invoke void @_ZN7ap_uintILi128EEC2Ev(%struct.ap_uint.0* %41)
          to label %295 unwind label %247

295:                                              ; preds = %294
  br label %296

296:                                              ; preds = %295
  store i32 0, i32* %42, align 4
  br label %297

297:                                              ; preds = %303, %296
  %298 = load i32, i32* %42, align 4
  %299 = icmp slt i32 %298, 1
  br i1 %299, label %300, label %310

300:                                              ; preds = %297
  %301 = invoke dereferenceable(16) %struct.ap_uint.0* @_ZN7ap_uintILi128EEaSERKS0_(%struct.ap_uint.0* %41, %struct.ap_uint.0* dereferenceable(16) %31)
          to label %302 unwind label %306

302:                                              ; preds = %300
  br label %303

303:                                              ; preds = %302
  %304 = load i32, i32* %42, align 4
  %305 = add nsw i32 %304, 1
  store i32 %305, i32* %42, align 4
  br label %297

306:                                              ; preds = %310, %300
  %307 = landingpad { i8*, i32 }
          cleanup
  %308 = extractvalue { i8*, i32 } %307, 0
  store i8* %308, i8** %20, align 8
  %309 = extractvalue { i8*, i32 } %307, 1
  store i32 %309, i32* %21, align 4
  br label %610

310:                                              ; preds = %297
  invoke void @_ZN7ap_uintILi16EEC2Ev(%struct.ap_uint.12* %43)
          to label %311 unwind label %306

311:                                              ; preds = %310
  br label %312

312:                                              ; preds = %311
  store i32 0, i32* %44, align 4
  br label %313

313:                                              ; preds = %322, %312
  %314 = load i32, i32* %44, align 4
  %315 = icmp slt i32 %314, 1
  br i1 %315, label %316, label %333

316:                                              ; preds = %313
  %317 = bitcast %struct.ap_uint.0* %41 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %46, %struct.ap_int_base.1* %317, i32 24, i32 9)
          to label %318 unwind label %325

318:                                              ; preds = %316
  invoke void @_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.12* %45, %struct.ap_range_ref* dereferenceable(16) %46)
          to label %319 unwind label %325

319:                                              ; preds = %318
  %320 = invoke dereferenceable(2) %struct.ap_uint.12* @_ZN7ap_uintILi16EEaSERKS0_(%struct.ap_uint.12* %43, %struct.ap_uint.12* dereferenceable(2) %45)
          to label %321 unwind label %329

321:                                              ; preds = %319
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %45) #3
  br label %322

322:                                              ; preds = %321
  %323 = load i32, i32* %44, align 4
  %324 = add nsw i32 %323, 1
  store i32 %324, i32* %44, align 4
  br label %313

325:                                              ; preds = %568, %493, %424, %394, %392, %374, %372, %354, %352, %340, %338, %318, %316
  %326 = landingpad { i8*, i32 }
          cleanup
  %327 = extractvalue { i8*, i32 } %326, 0
  store i8* %327, i8** %20, align 8
  %328 = extractvalue { i8*, i32 } %326, 1
  store i32 %328, i32* %21, align 4
  br label %609

329:                                              ; preds = %319
  %330 = landingpad { i8*, i32 }
          cleanup
  %331 = extractvalue { i8*, i32 } %330, 0
  store i8* %331, i8** %20, align 8
  %332 = extractvalue { i8*, i32 } %330, 1
  store i32 %332, i32* %21, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %45) #3
  br label %609

333:                                              ; preds = %313
  br label %334

334:                                              ; preds = %333
  store i32 0, i32* %48, align 4
  br label %335

335:                                              ; preds = %344, %334
  %336 = load i32, i32* %48, align 4
  %337 = icmp slt i32 %336, 1
  br i1 %337, label %338, label %347

338:                                              ; preds = %335
  %339 = bitcast %struct.ap_uint.0* %41 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %49, %struct.ap_int_base.1* %339, i32 56, i32 25)
          to label %340 unwind label %325

340:                                              ; preds = %338
  %341 = invoke i64 @_ZNK12ap_range_refILi128ELb0EEcvyEv(%struct.ap_range_ref* %49)
          to label %342 unwind label %325

342:                                              ; preds = %340
  %343 = trunc i64 %341 to i32
  store i32 %343, i32* %47, align 4
  br label %344

344:                                              ; preds = %342
  %345 = load i32, i32* %48, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, i32* %48, align 4
  br label %335

347:                                              ; preds = %335
  br label %348

348:                                              ; preds = %347
  store i32 0, i32* %51, align 4
  br label %349

349:                                              ; preds = %360, %348
  %350 = load i32, i32* %51, align 4
  %351 = icmp slt i32 %350, 1
  br i1 %351, label %352, label %367

352:                                              ; preds = %349
  %353 = bitcast %struct.ap_uint.0* %41 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %53, %struct.ap_int_base.1* %353, i32 79, i32 64)
          to label %354 unwind label %325

354:                                              ; preds = %352
  invoke void @_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.12* %52, %struct.ap_range_ref* dereferenceable(16) %53)
          to label %355 unwind label %325

355:                                              ; preds = %354
  %356 = bitcast %struct.ap_uint.12* %52 to %struct.ap_int_base.13*
  %357 = invoke i64 @_ZNK11ap_int_baseILi16ELb0EEcvyEv(%struct.ap_int_base.13* %356)
          to label %358 unwind label %363

358:                                              ; preds = %355
  %359 = trunc i64 %357 to i32
  store i32 %359, i32* %50, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %52) #3
  br label %360

360:                                              ; preds = %358
  %361 = load i32, i32* %51, align 4
  %362 = add nsw i32 %361, 1
  store i32 %362, i32* %51, align 4
  br label %349

363:                                              ; preds = %355
  %364 = landingpad { i8*, i32 }
          cleanup
  %365 = extractvalue { i8*, i32 } %364, 0
  store i8* %365, i8** %20, align 8
  %366 = extractvalue { i8*, i32 } %364, 1
  store i32 %366, i32* %21, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %52) #3
  br label %609

367:                                              ; preds = %349
  br label %368

368:                                              ; preds = %367
  store i32 0, i32* %55, align 4
  br label %369

369:                                              ; preds = %380, %368
  %370 = load i32, i32* %55, align 4
  %371 = icmp slt i32 %370, 1
  br i1 %371, label %372, label %387

372:                                              ; preds = %369
  %373 = bitcast %struct.ap_uint.0* %41 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %57, %struct.ap_int_base.1* %373, i32 95, i32 80)
          to label %374 unwind label %325

374:                                              ; preds = %372
  invoke void @_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.12* %56, %struct.ap_range_ref* dereferenceable(16) %57)
          to label %375 unwind label %325

375:                                              ; preds = %374
  %376 = bitcast %struct.ap_uint.12* %56 to %struct.ap_int_base.13*
  %377 = invoke i64 @_ZNK11ap_int_baseILi16ELb0EEcvyEv(%struct.ap_int_base.13* %376)
          to label %378 unwind label %383

378:                                              ; preds = %375
  %379 = trunc i64 %377 to i32
  store i32 %379, i32* %54, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %56) #3
  br label %380

380:                                              ; preds = %378
  %381 = load i32, i32* %55, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %55, align 4
  br label %369

383:                                              ; preds = %375
  %384 = landingpad { i8*, i32 }
          cleanup
  %385 = extractvalue { i8*, i32 } %384, 0
  store i8* %385, i8** %20, align 8
  %386 = extractvalue { i8*, i32 } %384, 1
  store i32 %386, i32* %21, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %56) #3
  br label %609

387:                                              ; preds = %369
  br label %388

388:                                              ; preds = %387
  store i32 0, i32* %59, align 4
  br label %389

389:                                              ; preds = %400, %388
  %390 = load i32, i32* %59, align 4
  %391 = icmp slt i32 %390, 1
  br i1 %391, label %392, label %407

392:                                              ; preds = %389
  %393 = bitcast %struct.ap_uint.0* %41 to %struct.ap_int_base.1*
  invoke void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* sret %61, %struct.ap_int_base.1* %393, i32 111, i32 96)
          to label %394 unwind label %325

394:                                              ; preds = %392
  invoke void @_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.12* %60, %struct.ap_range_ref* dereferenceable(16) %61)
          to label %395 unwind label %325

395:                                              ; preds = %394
  %396 = bitcast %struct.ap_uint.12* %60 to %struct.ap_int_base.13*
  %397 = invoke i64 @_ZNK11ap_int_baseILi16ELb0EEcvyEv(%struct.ap_int_base.13* %396)
          to label %398 unwind label %403

398:                                              ; preds = %395
  %399 = trunc i64 %397 to i32
  store i32 %399, i32* %58, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %60) #3
  br label %400

400:                                              ; preds = %398
  %401 = load i32, i32* %59, align 4
  %402 = add nsw i32 %401, 1
  store i32 %402, i32* %59, align 4
  br label %389

403:                                              ; preds = %395
  %404 = landingpad { i8*, i32 }
          cleanup
  %405 = extractvalue { i8*, i32 } %404, 0
  store i8* %405, i8** %20, align 8
  %406 = extractvalue { i8*, i32 } %404, 1
  store i32 %406, i32* %21, align 4
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %60) #3
  br label %609

407:                                              ; preds = %389
  br label %408

408:                                              ; preds = %407
  store i32 0, i32* %64, align 4
  br label %409

409:                                              ; preds = %605, %408
  %410 = load i32, i32* %64, align 4
  %411 = load i32, i32* %50, align 4
  %412 = icmp ult i32 %410, %411
  br i1 %412, label %413, label %608

413:                                              ; preds = %409
  br label %414

414:                                              ; preds = %413
  store i32 0, i32* %65, align 4
  br label %415

415:                                              ; preds = %601, %414
  %416 = load i32, i32* %65, align 4
  %417 = load i32, i32* %54, align 4
  %418 = icmp ult i32 %416, %417
  br i1 %418, label %419, label %604

419:                                              ; preds = %415
  br label %420

420:                                              ; preds = %419
  store i32 0, i32* %67, align 4
  br label %421

421:                                              ; preds = %446, %420
  %422 = load i32, i32* %67, align 4
  %423 = icmp slt i32 %422, 1
  br i1 %423, label %424, label %488

424:                                              ; preds = %421
  invoke void @_ZN6ap_intILi66EEC2ILi16EEERK7ap_uintIXT_EE(%struct.ap_int.26* %70, %struct.ap_uint.12* dereferenceable(2) %43)
          to label %425 unwind label %325

425:                                              ; preds = %424
  %426 = bitcast %struct.ap_int.26* %70 to %struct.ap_int_base.23*
  %427 = load i32, i32* %64, align 4
  invoke void @_ZN6ap_intILi64EEC2Ei(%struct.ap_int.34* %73, i32 %427)
          to label %428 unwind label %449

428:                                              ; preds = %425
  %429 = bitcast %struct.ap_int.34* %73 to %struct.ap_int_base.31*
  %430 = load i32, i32* %54, align 4
  invoke void @_ZN6ap_intILi64EEC2Ei(%struct.ap_int.34* %74, i32 %430)
          to label %431 unwind label %453

431:                                              ; preds = %428
  %432 = bitcast %struct.ap_int.34* %74 to %struct.ap_int_base.31*
  invoke void @_ZmlILi64ELb1ELi64ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4multERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.27* sret %72, %struct.ap_int_base.31* dereferenceable(8) %429, %struct.ap_int_base.31* dereferenceable(8) %432)
          to label %433 unwind label %457

433:                                              ; preds = %431
  invoke void @_ZN6ap_intILi66EEC2ILi128EEERKS_IXT_EE(%struct.ap_int.26* %71, %struct.ap_int.27* dereferenceable(16) %72)
          to label %434 unwind label %461

434:                                              ; preds = %433
  %435 = bitcast %struct.ap_int.26* %71 to %struct.ap_int_base.23*
  invoke void @_ZplILi66ELb1ELi66ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.22* sret %69, %struct.ap_int_base.23* dereferenceable(16) %426, %struct.ap_int_base.23* dereferenceable(16) %435)
          to label %436 unwind label %465

436:                                              ; preds = %434
  %437 = bitcast %struct.ap_int.22* %69 to %struct.ap_int_base.19*
  %438 = load i32, i32* %65, align 4
  invoke void @_ZN6ap_intILi67EEC2Ei(%struct.ap_int.22* %75, i32 %438)
          to label %439 unwind label %469

439:                                              ; preds = %436
  %440 = bitcast %struct.ap_int.22* %75 to %struct.ap_int_base.19*
  invoke void @_ZplILi67ELb1ELi67ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int* sret %68, %struct.ap_int_base.19* dereferenceable(16) %437, %struct.ap_int_base.19* dereferenceable(16) %440)
          to label %441 unwind label %473

441:                                              ; preds = %439
  %442 = bitcast %struct.ap_int* %68 to %struct.ap_int_base.16*
  %443 = invoke i64 @_ZNK11ap_int_baseILi68ELb1EEcvxEv(%struct.ap_int_base.16* %442)
          to label %444 unwind label %477

444:                                              ; preds = %441
  %445 = trunc i64 %443 to i32
  store i32 %445, i32* %66, align 4
  call void @_ZN6ap_intILi68EED2Ev(%struct.ap_int* %68) #3
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %75) #3
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %69) #3
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %71) #3
  call void @_ZN6ap_intILi128EED2Ev(%struct.ap_int.27* %72) #3
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %74) #3
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %73) #3
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %70) #3
  br label %446

446:                                              ; preds = %444
  %447 = load i32, i32* %67, align 4
  %448 = add nsw i32 %447, 1
  store i32 %448, i32* %67, align 4
  br label %421

449:                                              ; preds = %425
  %450 = landingpad { i8*, i32 }
          cleanup
  %451 = extractvalue { i8*, i32 } %450, 0
  store i8* %451, i8** %20, align 8
  %452 = extractvalue { i8*, i32 } %450, 1
  store i32 %452, i32* %21, align 4
  br label %487

453:                                              ; preds = %428
  %454 = landingpad { i8*, i32 }
          cleanup
  %455 = extractvalue { i8*, i32 } %454, 0
  store i8* %455, i8** %20, align 8
  %456 = extractvalue { i8*, i32 } %454, 1
  store i32 %456, i32* %21, align 4
  br label %486

457:                                              ; preds = %431
  %458 = landingpad { i8*, i32 }
          cleanup
  %459 = extractvalue { i8*, i32 } %458, 0
  store i8* %459, i8** %20, align 8
  %460 = extractvalue { i8*, i32 } %458, 1
  store i32 %460, i32* %21, align 4
  br label %485

461:                                              ; preds = %433
  %462 = landingpad { i8*, i32 }
          cleanup
  %463 = extractvalue { i8*, i32 } %462, 0
  store i8* %463, i8** %20, align 8
  %464 = extractvalue { i8*, i32 } %462, 1
  store i32 %464, i32* %21, align 4
  br label %484

465:                                              ; preds = %434
  %466 = landingpad { i8*, i32 }
          cleanup
  %467 = extractvalue { i8*, i32 } %466, 0
  store i8* %467, i8** %20, align 8
  %468 = extractvalue { i8*, i32 } %466, 1
  store i32 %468, i32* %21, align 4
  br label %483

469:                                              ; preds = %436
  %470 = landingpad { i8*, i32 }
          cleanup
  %471 = extractvalue { i8*, i32 } %470, 0
  store i8* %471, i8** %20, align 8
  %472 = extractvalue { i8*, i32 } %470, 1
  store i32 %472, i32* %21, align 4
  br label %482

473:                                              ; preds = %439
  %474 = landingpad { i8*, i32 }
          cleanup
  %475 = extractvalue { i8*, i32 } %474, 0
  store i8* %475, i8** %20, align 8
  %476 = extractvalue { i8*, i32 } %474, 1
  store i32 %476, i32* %21, align 4
  br label %481

477:                                              ; preds = %441
  %478 = landingpad { i8*, i32 }
          cleanup
  %479 = extractvalue { i8*, i32 } %478, 0
  store i8* %479, i8** %20, align 8
  %480 = extractvalue { i8*, i32 } %478, 1
  store i32 %480, i32* %21, align 4
  call void @_ZN6ap_intILi68EED2Ev(%struct.ap_int* %68) #3
  br label %481

481:                                              ; preds = %477, %473
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %75) #3
  br label %482

482:                                              ; preds = %481, %469
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %69) #3
  br label %483

483:                                              ; preds = %482, %465
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %71) #3
  br label %484

484:                                              ; preds = %483, %461
  call void @_ZN6ap_intILi128EED2Ev(%struct.ap_int.27* %72) #3
  br label %485

485:                                              ; preds = %484, %457
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %74) #3
  br label %486

486:                                              ; preds = %485, %453
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %73) #3
  br label %487

487:                                              ; preds = %486, %449
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %70) #3
  br label %609

488:                                              ; preds = %421
  br label %489

489:                                              ; preds = %488
  store i32 0, i32* %77, align 4
  br label %490

490:                                              ; preds = %516, %489
  %491 = load i32, i32* %77, align 4
  %492 = icmp slt i32 %491, 1
  br i1 %492, label %493, label %558

493:                                              ; preds = %490
  %494 = load i32, i32* %47, align 4
  invoke void @_ZN6ap_intILi66EEC2Ej(%struct.ap_int.26* %80, i32 %494)
          to label %495 unwind label %325

495:                                              ; preds = %493
  %496 = bitcast %struct.ap_int.26* %80 to %struct.ap_int_base.23*
  %497 = load i32, i32* %64, align 4
  invoke void @_ZN6ap_intILi64EEC2Ei(%struct.ap_int.34* %83, i32 %497)
          to label %498 unwind label %519

498:                                              ; preds = %495
  %499 = bitcast %struct.ap_int.34* %83 to %struct.ap_int_base.31*
  %500 = load i32, i32* %58, align 4
  invoke void @_ZN6ap_intILi64EEC2Ei(%struct.ap_int.34* %84, i32 %500)
          to label %501 unwind label %523

501:                                              ; preds = %498
  %502 = bitcast %struct.ap_int.34* %84 to %struct.ap_int_base.31*
  invoke void @_ZmlILi64ELb1ELi64ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4multERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.27* sret %82, %struct.ap_int_base.31* dereferenceable(8) %499, %struct.ap_int_base.31* dereferenceable(8) %502)
          to label %503 unwind label %527

503:                                              ; preds = %501
  invoke void @_ZN6ap_intILi66EEC2ILi128EEERKS_IXT_EE(%struct.ap_int.26* %81, %struct.ap_int.27* dereferenceable(16) %82)
          to label %504 unwind label %531

504:                                              ; preds = %503
  %505 = bitcast %struct.ap_int.26* %81 to %struct.ap_int_base.23*
  invoke void @_ZplILi66ELb1ELi66ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.22* sret %79, %struct.ap_int_base.23* dereferenceable(16) %496, %struct.ap_int_base.23* dereferenceable(16) %505)
          to label %506 unwind label %535

506:                                              ; preds = %504
  %507 = bitcast %struct.ap_int.22* %79 to %struct.ap_int_base.19*
  %508 = load i32, i32* %65, align 4
  invoke void @_ZN6ap_intILi67EEC2Ei(%struct.ap_int.22* %85, i32 %508)
          to label %509 unwind label %539

509:                                              ; preds = %506
  %510 = bitcast %struct.ap_int.22* %85 to %struct.ap_int_base.19*
  invoke void @_ZplILi67ELb1ELi67ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int* sret %78, %struct.ap_int_base.19* dereferenceable(16) %507, %struct.ap_int_base.19* dereferenceable(16) %510)
          to label %511 unwind label %543

511:                                              ; preds = %509
  %512 = bitcast %struct.ap_int* %78 to %struct.ap_int_base.16*
  %513 = invoke i64 @_ZNK11ap_int_baseILi68ELb1EEcvxEv(%struct.ap_int_base.16* %512)
          to label %514 unwind label %547

514:                                              ; preds = %511
  %515 = trunc i64 %513 to i32
  store i32 %515, i32* %76, align 4
  call void @_ZN6ap_intILi68EED2Ev(%struct.ap_int* %78) #3
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %85) #3
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %79) #3
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %81) #3
  call void @_ZN6ap_intILi128EED2Ev(%struct.ap_int.27* %82) #3
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %84) #3
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %83) #3
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %80) #3
  br label %516

516:                                              ; preds = %514
  %517 = load i32, i32* %77, align 4
  %518 = add nsw i32 %517, 1
  store i32 %518, i32* %77, align 4
  br label %490

519:                                              ; preds = %495
  %520 = landingpad { i8*, i32 }
          cleanup
  %521 = extractvalue { i8*, i32 } %520, 0
  store i8* %521, i8** %20, align 8
  %522 = extractvalue { i8*, i32 } %520, 1
  store i32 %522, i32* %21, align 4
  br label %557

523:                                              ; preds = %498
  %524 = landingpad { i8*, i32 }
          cleanup
  %525 = extractvalue { i8*, i32 } %524, 0
  store i8* %525, i8** %20, align 8
  %526 = extractvalue { i8*, i32 } %524, 1
  store i32 %526, i32* %21, align 4
  br label %556

527:                                              ; preds = %501
  %528 = landingpad { i8*, i32 }
          cleanup
  %529 = extractvalue { i8*, i32 } %528, 0
  store i8* %529, i8** %20, align 8
  %530 = extractvalue { i8*, i32 } %528, 1
  store i32 %530, i32* %21, align 4
  br label %555

531:                                              ; preds = %503
  %532 = landingpad { i8*, i32 }
          cleanup
  %533 = extractvalue { i8*, i32 } %532, 0
  store i8* %533, i8** %20, align 8
  %534 = extractvalue { i8*, i32 } %532, 1
  store i32 %534, i32* %21, align 4
  br label %554

535:                                              ; preds = %504
  %536 = landingpad { i8*, i32 }
          cleanup
  %537 = extractvalue { i8*, i32 } %536, 0
  store i8* %537, i8** %20, align 8
  %538 = extractvalue { i8*, i32 } %536, 1
  store i32 %538, i32* %21, align 4
  br label %553

539:                                              ; preds = %506
  %540 = landingpad { i8*, i32 }
          cleanup
  %541 = extractvalue { i8*, i32 } %540, 0
  store i8* %541, i8** %20, align 8
  %542 = extractvalue { i8*, i32 } %540, 1
  store i32 %542, i32* %21, align 4
  br label %552

543:                                              ; preds = %509
  %544 = landingpad { i8*, i32 }
          cleanup
  %545 = extractvalue { i8*, i32 } %544, 0
  store i8* %545, i8** %20, align 8
  %546 = extractvalue { i8*, i32 } %544, 1
  store i32 %546, i32* %21, align 4
  br label %551

547:                                              ; preds = %511
  %548 = landingpad { i8*, i32 }
          cleanup
  %549 = extractvalue { i8*, i32 } %548, 0
  store i8* %549, i8** %20, align 8
  %550 = extractvalue { i8*, i32 } %548, 1
  store i32 %550, i32* %21, align 4
  call void @_ZN6ap_intILi68EED2Ev(%struct.ap_int* %78) #3
  br label %551

551:                                              ; preds = %547, %543
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %85) #3
  br label %552

552:                                              ; preds = %551, %539
  call void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22* %79) #3
  br label %553

553:                                              ; preds = %552, %535
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %81) #3
  br label %554

554:                                              ; preds = %553, %531
  call void @_ZN6ap_intILi128EED2Ev(%struct.ap_int.27* %82) #3
  br label %555

555:                                              ; preds = %554, %527
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %84) #3
  br label %556

556:                                              ; preds = %555, %523
  call void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34* %83) #3
  br label %557

557:                                              ; preds = %556, %519
  call void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26* %80) #3
  br label %609

558:                                              ; preds = %490
  br label %559

559:                                              ; preds = %558
  store i32 0, i32* %88, align 4
  br label %560

560:                                              ; preds = %597, %559
  %561 = load i32, i32* %88, align 4
  %562 = icmp slt i32 %561, 1
  br i1 %562, label %563, label %600

563:                                              ; preds = %560
  br label %564

564:                                              ; preds = %563
  store i32 0, i32* %89, align 4
  br label %565

565:                                              ; preds = %593, %564
  %566 = load i32, i32* %89, align 4
  %567 = icmp slt i32 %566, 16
  br i1 %567, label %568, label %596

568:                                              ; preds = %565
  %569 = load [1 x [16 x %struct.ap_uint]]*, [1 x [16 x %struct.ap_uint]]** %7, align 8
  %570 = getelementptr inbounds [1 x [16 x %struct.ap_uint]], [1 x [16 x %struct.ap_uint]]* %569, i64 0
  %571 = getelementptr inbounds [1 x [16 x %struct.ap_uint]], [1 x [16 x %struct.ap_uint]]* %570, i64 0, i64 0
  %572 = load i32, i32* %89, align 4
  %573 = load i32, i32* %88, align 4
  %574 = mul nsw i32 %573, 16
  %575 = add nsw i32 %572, %574
  %576 = load i32, i32* %66, align 4
  %577 = mul i32 %576, 16
  %578 = add i32 %575, %577
  %579 = zext i32 %578 to i64
  %580 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %571, i64 0, i64 %579
  %581 = load %struct.ap_uint*, %struct.ap_uint** %8, align 8
  %582 = load i32, i32* %76, align 4
  %583 = mul i32 %582, 16
  %584 = load i32, i32* %88, align 4
  %585 = mul nsw i32 %584, 16
  %586 = add i32 %583, %585
  %587 = load i32, i32* %89, align 4
  %588 = add i32 %586, %587
  %589 = zext i32 %588 to i64
  %590 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %581, i64 %589
  %591 = invoke dereferenceable(1) %struct.ap_uint* @_ZN7ap_uintILi8EEaSERKS0_(%struct.ap_uint* %590, %struct.ap_uint* dereferenceable(1) %580)
          to label %592 unwind label %325

592:                                              ; preds = %568
  br label %593

593:                                              ; preds = %592
  %594 = load i32, i32* %89, align 4
  %595 = add nsw i32 %594, 1
  store i32 %595, i32* %89, align 4
  br label %565

596:                                              ; preds = %565
  br label %597

597:                                              ; preds = %596
  %598 = load i32, i32* %88, align 4
  %599 = add nsw i32 %598, 1
  store i32 %599, i32* %88, align 4
  br label %560

600:                                              ; preds = %560
  br label %601

601:                                              ; preds = %600
  %602 = load i32, i32* %65, align 4
  %603 = add nsw i32 %602, 1
  store i32 %603, i32* %65, align 4
  br label %415

604:                                              ; preds = %415
  br label %605

605:                                              ; preds = %604
  %606 = load i32, i32* %64, align 4
  %607 = add nsw i32 %606, 1
  store i32 %607, i32* %64, align 4
  br label %409

608:                                              ; preds = %409
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %43) #3
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %41) #3
  br label %611

609:                                              ; preds = %557, %487, %403, %383, %363, %329, %325
  call void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12* %43) #3
  br label %610

610:                                              ; preds = %609, %306
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %41) #3
  br label %624

611:                                              ; preds = %608, %291
  %612 = load i32, i32* %11, align 4
  %613 = add nsw i32 %612, 16
  store i32 %613, i32* %11, align 4
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %31) #3
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %23) #3
  %614 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %19, i32 0, i32 0
  %615 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %614, i64 16
  br label %616

616:                                              ; preds = %616, %611
  %617 = phi %struct.ap_uint* [ %615, %611 ], [ %618, %616 ]
  %618 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %617, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %618) #3
  %619 = icmp eq %struct.ap_uint* %618, %614
  br i1 %619, label %620, label %616

620:                                              ; preds = %616
  br label %621

621:                                              ; preds = %620
  %622 = load i32, i32* %18, align 4
  %623 = add nsw i32 %622, 1
  store i32 %623, i32* %18, align 4
  br label %126

624:                                              ; preds = %610, %287, %267, %247
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %31) #3
  br label %625

625:                                              ; preds = %624, %234, %191
  call void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0* %23) #3
  br label %626

626:                                              ; preds = %625, %168
  %627 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %19, i32 0, i32 0
  %628 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %627, i64 16
  br label %629

629:                                              ; preds = %629, %626
  %630 = phi %struct.ap_uint* [ %628, %626 ], [ %631, %629 ]
  %631 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %630, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %631) #3
  %632 = icmp eq %struct.ap_uint* %631, %627
  br i1 %632, label %633, label %629

633:                                              ; preds = %629
  br label %639

634:                                              ; preds = %126
  br label %635

635:                                              ; preds = %634
  %636 = load i32, i32* %15, align 4
  %637 = add nsw i32 %636, 1
  store i32 %637, i32* %15, align 4
  br label %110

638:                                              ; preds = %110
  ret void

639:                                              ; preds = %633, %167
  %640 = load i8*, i8** %20, align 8
  %641 = load i32, i32* %21, align 4
  %642 = insertvalue { i8*, i32 } undef, i8* %640, 0
  %643 = insertvalue { i8*, i32 } %642, i32 %641, 1
  resume { i8*, i32 } %643
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi8EEC2Ev(%struct.ap_uint*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_uint*, align 8
  store %struct.ap_uint* %0, %struct.ap_uint** %2, align 8
  %3 = load %struct.ap_uint*, %struct.ap_uint** %2, align 8
  %4 = bitcast %struct.ap_uint* %3 to %struct.ap_int_base*
  call void @_ZN11ap_int_baseILi8ELb0EEC2Ev(%struct.ap_int_base* %4)
  ret void
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_uint*, align 8
  store %struct.ap_uint* %0, %struct.ap_uint** %2, align 8
  %3 = load %struct.ap_uint*, %struct.ap_uint** %2, align 8
  %4 = bitcast %struct.ap_uint* %3 to %struct.ap_int_base*
  call void @_ZN11ap_int_baseILi8ELb0EED2Ev(%struct.ap_int_base* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %struct.ap_uint* @_ZN7ap_uintILi8EEaSERKS0_(%struct.ap_uint*, %struct.ap_uint* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %struct.ap_uint*, align 8
  %4 = alloca %struct.ap_uint*, align 8
  store %struct.ap_uint* %0, %struct.ap_uint** %3, align 8
  store %struct.ap_uint* %1, %struct.ap_uint** %4, align 8
  %5 = load %struct.ap_uint*, %struct.ap_uint** %3, align 8
  %6 = load %struct.ap_uint*, %struct.ap_uint** %4, align 8
  %7 = bitcast %struct.ap_uint* %6 to %struct.ssdm_int_sim*
  %8 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %7, i32 0, i32 0
  %9 = bitcast %struct.ap_uint* %5 to %struct.ap_int_base*
  %10 = bitcast %struct.ap_int_base* %9 to %struct.ssdm_int_sim*
  %11 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %10, i32 0, i32 0
  %12 = call dereferenceable(1) %class.ap_private* @_ZN10ap_privateILi8ELb0ELb1EEaSERKS0_(%class.ap_private* %11, %class.ap_private* dereferenceable(1) %8)
  ret %struct.ap_uint* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi128EEC2Ev(%struct.ap_uint.0*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_uint.0*, align 8
  store %struct.ap_uint.0* %0, %struct.ap_uint.0** %2, align 8
  %3 = load %struct.ap_uint.0*, %struct.ap_uint.0** %2, align 8
  %4 = bitcast %struct.ap_uint.0* %3 to %struct.ap_int_base.1*
  call void @_ZN11ap_int_baseILi128ELb0EEC2Ev(%struct.ap_int_base.1* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi128EEC2Ei(%struct.ap_uint.0*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_uint.0*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_uint.0* %0, %struct.ap_uint.0** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_uint.0*, %struct.ap_uint.0** %3, align 8
  %8 = bitcast %struct.ap_uint.0* %7 to %struct.ap_int_base.1*
  call void @_ZN11ap_int_baseILi128ELb0EEC2Ev(%struct.ap_int_base.1* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_uint.0* %7 to %struct.ap_int_base.1*
  %11 = bitcast %struct.ap_int_base.1* %10 to %struct.ssdm_int_sim.2*
  %12 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %11, i32 0, i32 0
  %13 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSEi(%class.ap_private.3* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_uint.0* %7 to %struct.ap_int_base.1*
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %struct.ap_uint.0* @_ZN7ap_uintILi128EEaSERKS0_(%struct.ap_uint.0*, %struct.ap_uint.0* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %struct.ap_uint.0*, align 8
  %4 = alloca %struct.ap_uint.0*, align 8
  store %struct.ap_uint.0* %0, %struct.ap_uint.0** %3, align 8
  store %struct.ap_uint.0* %1, %struct.ap_uint.0** %4, align 8
  %5 = load %struct.ap_uint.0*, %struct.ap_uint.0** %3, align 8
  %6 = load %struct.ap_uint.0*, %struct.ap_uint.0** %4, align 8
  %7 = bitcast %struct.ap_uint.0* %6 to %struct.ssdm_int_sim.2*
  %8 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %7, i32 0, i32 0
  %9 = bitcast %struct.ap_uint.0* %5 to %struct.ap_int_base.1*
  %10 = bitcast %struct.ap_int_base.1* %9 to %struct.ssdm_int_sim.2*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %10, i32 0, i32 0
  %12 = call dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %11, %class.ap_private.3* dereferenceable(16) %8)
  ret %struct.ap_uint.0* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi128EED2Ev(%struct.ap_uint.0*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_uint.0*, align 8
  store %struct.ap_uint.0* %0, %struct.ap_uint.0** %2, align 8
  %3 = load %struct.ap_uint.0*, %struct.ap_uint.0** %2, align 8
  %4 = bitcast %struct.ap_uint.0* %3 to %struct.ap_int_base.1*
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb0EEclEii(%struct.ap_range_ref* noalias sret, %struct.ap_int_base.1*, i32, i32) #4 comdat align 2 {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.ap_int_base.1*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = bitcast %struct.ap_range_ref* %0 to i8*
  store i8* %9, i8** %5, align 8
  store %struct.ap_int_base.1* %1, %struct.ap_int_base.1** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %8, align 4
  call void @_ZN11ap_int_baseILi128ELb0EE5rangeEii(%struct.ap_range_ref* sret %0, %struct.ap_int_base.1* %10, i32 %11, i32 %12)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %struct.ap_range_ref* @_ZN12ap_range_refILi128ELb0EEaSILi8ELb0EEERS0_RK11ap_int_baseIXT_EXT0_EE(%struct.ap_range_ref*, %struct.ap_int_base* dereferenceable(1)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_range_ref*, align 8
  %4 = alloca %struct.ap_int_base*, align 8
  %5 = alloca %struct.ap_int_base.1, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %struct.ap_range_ref* %0, %struct.ap_range_ref** %3, align 8
  store %struct.ap_int_base* %1, %struct.ap_int_base** %4, align 8
  %8 = load %struct.ap_range_ref*, %struct.ap_range_ref** %3, align 8
  %9 = load %struct.ap_int_base*, %struct.ap_int_base** %4, align 8
  call void @_ZN11ap_int_baseILi128ELb0EEC2ILi8ELb0EEERKS_IXT_EXT0_EE(%struct.ap_int_base.1* %5, %struct.ap_int_base* dereferenceable(1) %9)
  %10 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %8, i32 0, i32 0
  %11 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %10, align 8
  %12 = bitcast %struct.ap_int_base.1* %11 to %struct.ssdm_int_sim.2*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %12, i32 0, i32 0
  %14 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %8, i32 0, i32 1
  %15 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %8, i32 0, i32 2
  %16 = bitcast %struct.ap_int_base.1* %5 to %struct.ssdm_int_sim.2*
  %17 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %16, i32 0, i32 0
  %18 = invoke dereferenceable(16) %class.ap_private.3* @_Z21_AP_ROOT_op_set_rangeI10ap_privateILi128ELb0ELb0EEiiS1_ERT_S3_RKT0_RKT1_RKT2_(%class.ap_private.3* dereferenceable(16) %13, i32* dereferenceable(4) %14, i32* dereferenceable(4) %15, %class.ap_private.3* dereferenceable(16) %17)
          to label %19 unwind label %26

19:                                               ; preds = %2
  %20 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %8, i32 0, i32 0
  %21 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %20, align 8
  %22 = bitcast %struct.ap_int_base.1* %21 to %struct.ssdm_int_sim.2*
  %23 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %22, i32 0, i32 0
  %24 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %23, %class.ap_private.3* dereferenceable(16) %18)
          to label %25 unwind label %26

25:                                               ; preds = %19
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  ret %struct.ap_range_ref* %8

26:                                               ; preds = %19, %2
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  store i8* %28, i8** %6, align 8
  %29 = extractvalue { i8*, i32 } %27, 1
  store i32 %29, i32* %7, align 4
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  br label %30

30:                                               ; preds = %26
  %31 = load i8*, i8** %6, align 8
  %32 = load i32, i32* %7, align 4
  %33 = insertvalue { i8*, i32 } undef, i8* %31, 0
  %34 = insertvalue { i8*, i32 } %33, i32 %32, 1
  resume { i8*, i32 } %34
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi3EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.4*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %struct.ap_uint.4*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  store %struct.ap_uint.4* %0, %struct.ap_uint.4** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %5 = load %struct.ap_uint.4*, %struct.ap_uint.4** %3, align 8
  %6 = bitcast %struct.ap_uint.4* %5 to %struct.ap_int_base.5*
  %7 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  call void @_ZN11ap_int_baseILi3ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.5* %6, %struct.ap_range_ref* dereferenceable(16) %7)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK11ap_int_baseILi3ELb0EEcvyEv(%struct.ap_int_base.5*) #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.5*, align 8
  store %struct.ap_int_base.5* %0, %struct.ap_int_base.5** %2, align 8
  %3 = load %struct.ap_int_base.5*, %struct.ap_int_base.5** %2, align 8
  %4 = bitcast %struct.ap_int_base.5* %3 to %struct.ssdm_int_sim.6*
  %5 = getelementptr inbounds %struct.ssdm_int_sim.6, %struct.ssdm_int_sim.6* %4, i32 0, i32 0
  %6 = call zeroext i8 @_ZNK10ap_privateILi3ELb0ELb1EEcvhEv(%class.ap_private.7* %5)
  %7 = zext i8 %6 to i64
  ret i64 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi3EED2Ev(%struct.ap_uint.4*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_uint.4*, align 8
  store %struct.ap_uint.4* %0, %struct.ap_uint.4** %2, align 8
  %3 = load %struct.ap_uint.4*, %struct.ap_uint.4** %2, align 8
  %4 = bitcast %struct.ap_uint.4* %3 to %struct.ap_int_base.5*
  call void @_ZN11ap_int_baseILi3ELb0EED2Ev(%struct.ap_int_base.5* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi2EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.8*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %struct.ap_uint.8*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  store %struct.ap_uint.8* %0, %struct.ap_uint.8** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %5 = load %struct.ap_uint.8*, %struct.ap_uint.8** %3, align 8
  %6 = bitcast %struct.ap_uint.8* %5 to %struct.ap_int_base.9*
  %7 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  call void @_ZN11ap_int_baseILi2ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.9* %6, %struct.ap_range_ref* dereferenceable(16) %7)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK11ap_int_baseILi2ELb0EEcvyEv(%struct.ap_int_base.9*) #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.9*, align 8
  store %struct.ap_int_base.9* %0, %struct.ap_int_base.9** %2, align 8
  %3 = load %struct.ap_int_base.9*, %struct.ap_int_base.9** %2, align 8
  %4 = bitcast %struct.ap_int_base.9* %3 to %struct.ssdm_int_sim.10*
  %5 = getelementptr inbounds %struct.ssdm_int_sim.10, %struct.ssdm_int_sim.10* %4, i32 0, i32 0
  %6 = call zeroext i8 @_ZNK10ap_privateILi2ELb0ELb1EEcvhEv(%class.ap_private.11* %5)
  %7 = zext i8 %6 to i64
  ret i64 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi2EED2Ev(%struct.ap_uint.8*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_uint.8*, align 8
  store %struct.ap_uint.8* %0, %struct.ap_uint.8** %2, align 8
  %3 = load %struct.ap_uint.8*, %struct.ap_uint.8** %2, align 8
  %4 = bitcast %struct.ap_uint.8* %3 to %struct.ap_int_base.9*
  call void @_ZN11ap_int_baseILi2ELb0EED2Ev(%struct.ap_int_base.9* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi16EEC2Ev(%struct.ap_uint.12*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_uint.12*, align 8
  store %struct.ap_uint.12* %0, %struct.ap_uint.12** %2, align 8
  %3 = load %struct.ap_uint.12*, %struct.ap_uint.12** %2, align 8
  %4 = bitcast %struct.ap_uint.12* %3 to %struct.ap_int_base.13*
  call void @_ZN11ap_int_baseILi16ELb0EEC2Ev(%struct.ap_int_base.13* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi16EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_uint.12*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %struct.ap_uint.12*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  store %struct.ap_uint.12* %0, %struct.ap_uint.12** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %5 = load %struct.ap_uint.12*, %struct.ap_uint.12** %3, align 8
  %6 = bitcast %struct.ap_uint.12* %5 to %struct.ap_int_base.13*
  %7 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  call void @_ZN11ap_int_baseILi16ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.13* %6, %struct.ap_range_ref* dereferenceable(16) %7)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(2) %struct.ap_uint.12* @_ZN7ap_uintILi16EEaSERKS0_(%struct.ap_uint.12*, %struct.ap_uint.12* dereferenceable(2)) #4 comdat align 2 {
  %3 = alloca %struct.ap_uint.12*, align 8
  %4 = alloca %struct.ap_uint.12*, align 8
  store %struct.ap_uint.12* %0, %struct.ap_uint.12** %3, align 8
  store %struct.ap_uint.12* %1, %struct.ap_uint.12** %4, align 8
  %5 = load %struct.ap_uint.12*, %struct.ap_uint.12** %3, align 8
  %6 = load %struct.ap_uint.12*, %struct.ap_uint.12** %4, align 8
  %7 = bitcast %struct.ap_uint.12* %6 to %struct.ssdm_int_sim.14*
  %8 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %7, i32 0, i32 0
  %9 = bitcast %struct.ap_uint.12* %5 to %struct.ap_int_base.13*
  %10 = bitcast %struct.ap_int_base.13* %9 to %struct.ssdm_int_sim.14*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %10, i32 0, i32 0
  %12 = call dereferenceable(2) %class.ap_private.15* @_ZN10ap_privateILi16ELb0ELb1EEaSERKS0_(%class.ap_private.15* %11, %class.ap_private.15* dereferenceable(2) %8)
  ret %struct.ap_uint.12* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi16EED2Ev(%struct.ap_uint.12*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_uint.12*, align 8
  store %struct.ap_uint.12* %0, %struct.ap_uint.12** %2, align 8
  %3 = load %struct.ap_uint.12*, %struct.ap_uint.12** %2, align 8
  %4 = bitcast %struct.ap_uint.12* %3 to %struct.ap_int_base.13*
  call void @_ZN11ap_int_baseILi16ELb0EED2Ev(%struct.ap_int_base.13* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK12ap_range_refILi128ELb0EEcvyEv(%struct.ap_range_ref*) #4 comdat align 2 {
  %2 = alloca %struct.ap_range_ref*, align 8
  store %struct.ap_range_ref* %0, %struct.ap_range_ref** %2, align 8
  %3 = load %struct.ap_range_ref*, %struct.ap_range_ref** %2, align 8
  %4 = call i64 @_ZNK12ap_range_refILi128ELb0EE9to_uint64Ev(%struct.ap_range_ref* %3)
  ret i64 %4
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK11ap_int_baseILi16ELb0EEcvyEv(%struct.ap_int_base.13*) #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.13*, align 8
  store %struct.ap_int_base.13* %0, %struct.ap_int_base.13** %2, align 8
  %3 = load %struct.ap_int_base.13*, %struct.ap_int_base.13** %2, align 8
  %4 = bitcast %struct.ap_int_base.13* %3 to %struct.ssdm_int_sim.14*
  %5 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %4, i32 0, i32 0
  %6 = call zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EEcvtEv(%class.ap_private.15* %5)
  %7 = zext i16 %6 to i64
  ret i64 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZplILi67ELb1ELi67ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int* noalias sret, %struct.ap_int_base.19* dereferenceable(16), %struct.ap_int_base.19* dereferenceable(16)) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %struct.ap_int_base.19*, align 8
  %6 = alloca %struct.ap_int_base.19*, align 8
  %7 = alloca %struct.ap_int_base.16, align 8
  %8 = alloca %struct.ap_int_base.16, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %struct.ap_int_base.16, align 8
  %12 = alloca %class.ap_private.40, align 8
  %13 = bitcast %struct.ap_int* %0 to i8*
  store i8* %13, i8** %4, align 8
  store %struct.ap_int_base.19* %1, %struct.ap_int_base.19** %5, align 8
  store %struct.ap_int_base.19* %2, %struct.ap_int_base.19** %6, align 8
  %14 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %5, align 8
  call void @_ZN11ap_int_baseILi68ELb1EEC2ILi67ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.16* %7, %struct.ap_int_base.19* dereferenceable(16) %14)
  %15 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %6, align 8
  invoke void @_ZN11ap_int_baseILi68ELb1EEC2ILi67ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.16* %8, %struct.ap_int_base.19* dereferenceable(16) %15)
          to label %16 unwind label %28

16:                                               ; preds = %3
  invoke void @_ZN11ap_int_baseILi68ELb1EEC2Ev(%struct.ap_int_base.16* %11)
          to label %17 unwind label %32

17:                                               ; preds = %16
  %18 = bitcast %struct.ap_int_base.16* %7 to %struct.ssdm_int_sim.17*
  %19 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %18, i32 0, i32 0
  %20 = bitcast %struct.ap_int_base.16* %8 to %struct.ssdm_int_sim.17*
  %21 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %20, i32 0, i32 0
  invoke void @_ZNK10ap_privateILi68ELb1ELb0EEplILi68ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* sret %12, %class.ap_private.18* %19, %class.ap_private.18* dereferenceable(16) %21)
          to label %22 unwind label %36

22:                                               ; preds = %17
  %23 = bitcast %struct.ap_int_base.16* %11 to %struct.ssdm_int_sim.17*
  %24 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %23, i32 0, i32 0
  %25 = invoke dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSILi69ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %24, %class.ap_private.40* dereferenceable(16) %12)
          to label %26 unwind label %40

26:                                               ; preds = %22
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %12) #3
  invoke void @_ZN6ap_intILi68EEC2ILi68ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int* %0, %struct.ap_int_base.16* dereferenceable(16) %11)
          to label %27 unwind label %36

27:                                               ; preds = %26
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %11) #3
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %8) #3
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %7) #3
  ret void

28:                                               ; preds = %3
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %9, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %10, align 4
  br label %46

32:                                               ; preds = %16
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  store i8* %34, i8** %9, align 8
  %35 = extractvalue { i8*, i32 } %33, 1
  store i32 %35, i32* %10, align 4
  br label %45

36:                                               ; preds = %26, %17
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %9, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %10, align 4
  br label %44

40:                                               ; preds = %22
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %9, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %10, align 4
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %12) #3
  br label %44

44:                                               ; preds = %40, %36
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %11) #3
  br label %45

45:                                               ; preds = %44, %32
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %8) #3
  br label %46

46:                                               ; preds = %45, %28
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %7) #3
  br label %47

47:                                               ; preds = %46
  %48 = load i8*, i8** %9, align 8
  %49 = load i32, i32* %10, align 4
  %50 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %51 = insertvalue { i8*, i32 } %50, i32 %49, 1
  resume { i8*, i32 } %51
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZplILi66ELb1ELi66ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4plusERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.22* noalias sret, %struct.ap_int_base.23* dereferenceable(16), %struct.ap_int_base.23* dereferenceable(16)) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %struct.ap_int_base.23*, align 8
  %6 = alloca %struct.ap_int_base.23*, align 8
  %7 = alloca %struct.ap_int_base.19, align 8
  %8 = alloca %struct.ap_int_base.19, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %struct.ap_int_base.19, align 8
  %12 = alloca %class.ap_private.18, align 8
  %13 = bitcast %struct.ap_int.22* %0 to i8*
  store i8* %13, i8** %4, align 8
  store %struct.ap_int_base.23* %1, %struct.ap_int_base.23** %5, align 8
  store %struct.ap_int_base.23* %2, %struct.ap_int_base.23** %6, align 8
  %14 = load %struct.ap_int_base.23*, %struct.ap_int_base.23** %5, align 8
  call void @_ZN11ap_int_baseILi67ELb1EEC2ILi66ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.19* %7, %struct.ap_int_base.23* dereferenceable(16) %14)
  %15 = load %struct.ap_int_base.23*, %struct.ap_int_base.23** %6, align 8
  invoke void @_ZN11ap_int_baseILi67ELb1EEC2ILi66ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.19* %8, %struct.ap_int_base.23* dereferenceable(16) %15)
          to label %16 unwind label %28

16:                                               ; preds = %3
  invoke void @_ZN11ap_int_baseILi67ELb1EEC2Ev(%struct.ap_int_base.19* %11)
          to label %17 unwind label %32

17:                                               ; preds = %16
  %18 = bitcast %struct.ap_int_base.19* %7 to %struct.ssdm_int_sim.20*
  %19 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %18, i32 0, i32 0
  %20 = bitcast %struct.ap_int_base.19* %8 to %struct.ssdm_int_sim.20*
  %21 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %20, i32 0, i32 0
  invoke void @_ZNK10ap_privateILi67ELb1ELb0EEplILi67ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* sret %12, %class.ap_private.21* %19, %class.ap_private.21* dereferenceable(16) %21)
          to label %22 unwind label %36

22:                                               ; preds = %17
  %23 = bitcast %struct.ap_int_base.19* %11 to %struct.ssdm_int_sim.20*
  %24 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %23, i32 0, i32 0
  %25 = invoke dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %24, %class.ap_private.18* dereferenceable(16) %12)
          to label %26 unwind label %40

26:                                               ; preds = %22
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %12) #3
  invoke void @_ZN6ap_intILi67EEC2ILi67ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int.22* %0, %struct.ap_int_base.19* dereferenceable(16) %11)
          to label %27 unwind label %36

27:                                               ; preds = %26
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %11) #3
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %8) #3
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %7) #3
  ret void

28:                                               ; preds = %3
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %9, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %10, align 4
  br label %46

32:                                               ; preds = %16
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  store i8* %34, i8** %9, align 8
  %35 = extractvalue { i8*, i32 } %33, 1
  store i32 %35, i32* %10, align 4
  br label %45

36:                                               ; preds = %26, %17
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %9, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %10, align 4
  br label %44

40:                                               ; preds = %22
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %9, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %10, align 4
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %12) #3
  br label %44

44:                                               ; preds = %40, %36
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %11) #3
  br label %45

45:                                               ; preds = %44, %32
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %8) #3
  br label %46

46:                                               ; preds = %45, %28
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %7) #3
  br label %47

47:                                               ; preds = %46
  %48 = load i8*, i8** %9, align 8
  %49 = load i32, i32* %10, align 4
  %50 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %51 = insertvalue { i8*, i32 } %50, i32 %49, 1
  resume { i8*, i32 } %51
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi66EEC2ILi16EEERK7ap_uintIXT_EE(%struct.ap_int.26*, %struct.ap_uint.12* dereferenceable(2)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.26*, align 8
  %4 = alloca %struct.ap_uint.12*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.26* %0, %struct.ap_int.26** %3, align 8
  store %struct.ap_uint.12* %1, %struct.ap_uint.12** %4, align 8
  %7 = load %struct.ap_int.26*, %struct.ap_int.26** %3, align 8
  %8 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EEC2Ev(%struct.ap_int_base.23* %8)
  %9 = load %struct.ap_uint.12*, %struct.ap_uint.12** %4, align 8
  %10 = bitcast %struct.ap_uint.12* %9 to %struct.ssdm_int_sim.14*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  %13 = bitcast %struct.ap_int_base.23* %12 to %struct.ssdm_int_sim.24*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %13, i32 0, i32 0
  %15 = invoke dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi16ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %14, %class.ap_private.15* dereferenceable(2) %11)
          to label %16 unwind label %17

16:                                               ; preds = %2
  ret void

17:                                               ; preds = %2
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %5, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %6, align 4
  %21 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EED2Ev(%struct.ap_int_base.23* %21) #3
  br label %22

22:                                               ; preds = %17
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %6, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZmlILi64ELb1ELi64ELb1EEN11ap_int_baseIXT_EXT0_EE5RTypeIXT1_EXT2_EE4multERKS1_RKS0_IXT1_EXT2_EE(%struct.ap_int.27* noalias sret, %struct.ap_int_base.31* dereferenceable(8), %struct.ap_int_base.31* dereferenceable(8)) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %struct.ap_int_base.31*, align 8
  %6 = alloca %struct.ap_int_base.31*, align 8
  %7 = alloca %struct.ap_int_base.28, align 8
  %8 = alloca %struct.ap_int_base.28, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %struct.ap_int_base.28, align 8
  %12 = alloca %class.ap_private.39, align 8
  %13 = bitcast %struct.ap_int.27* %0 to i8*
  store i8* %13, i8** %4, align 8
  store %struct.ap_int_base.31* %1, %struct.ap_int_base.31** %5, align 8
  store %struct.ap_int_base.31* %2, %struct.ap_int_base.31** %6, align 8
  %14 = load %struct.ap_int_base.31*, %struct.ap_int_base.31** %5, align 8
  call void @_ZN11ap_int_baseILi128ELb1EEC2ILi64ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.28* %7, %struct.ap_int_base.31* dereferenceable(8) %14)
  %15 = load %struct.ap_int_base.31*, %struct.ap_int_base.31** %6, align 8
  invoke void @_ZN11ap_int_baseILi128ELb1EEC2ILi64ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.28* %8, %struct.ap_int_base.31* dereferenceable(8) %15)
          to label %16 unwind label %28

16:                                               ; preds = %3
  invoke void @_ZN11ap_int_baseILi128ELb1EEC2Ev(%struct.ap_int_base.28* %11)
          to label %17 unwind label %32

17:                                               ; preds = %16
  %18 = bitcast %struct.ap_int_base.28* %7 to %struct.ssdm_int_sim.29*
  %19 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %18, i32 0, i32 0
  %20 = bitcast %struct.ap_int_base.28* %8 to %struct.ssdm_int_sim.29*
  %21 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %20, i32 0, i32 0
  invoke void @_ZNK10ap_privateILi128ELb1ELb0EEmlILi128ELb1EEENS0_5RTypeIXT_EXT0_EE4multERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* sret %12, %class.ap_private.30* %19, %class.ap_private.30* dereferenceable(16) %21)
          to label %22 unwind label %36

22:                                               ; preds = %17
  %23 = bitcast %struct.ap_int_base.28* %11 to %struct.ssdm_int_sim.29*
  %24 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %23, i32 0, i32 0
  %25 = invoke dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSILi256ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %24, %class.ap_private.39* dereferenceable(32) %12)
          to label %26 unwind label %40

26:                                               ; preds = %22
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %12) #3
  invoke void @_ZN6ap_intILi128EEC2ILi128ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int.27* %0, %struct.ap_int_base.28* dereferenceable(16) %11)
          to label %27 unwind label %36

27:                                               ; preds = %26
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %11) #3
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %8) #3
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %7) #3
  ret void

28:                                               ; preds = %3
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %9, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %10, align 4
  br label %46

32:                                               ; preds = %16
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  store i8* %34, i8** %9, align 8
  %35 = extractvalue { i8*, i32 } %33, 1
  store i32 %35, i32* %10, align 4
  br label %45

36:                                               ; preds = %26, %17
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %9, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %10, align 4
  br label %44

40:                                               ; preds = %22
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %9, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %10, align 4
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %12) #3
  br label %44

44:                                               ; preds = %40, %36
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %11) #3
  br label %45

45:                                               ; preds = %44, %32
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %8) #3
  br label %46

46:                                               ; preds = %45, %28
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %7) #3
  br label %47

47:                                               ; preds = %46
  %48 = load i8*, i8** %9, align 8
  %49 = load i32, i32* %10, align 4
  %50 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %51 = insertvalue { i8*, i32 } %50, i32 %49, 1
  resume { i8*, i32 } %51
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi64EEC2Ei(%struct.ap_int.34*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.34*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.34* %0, %struct.ap_int.34** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int.34*, %struct.ap_int.34** %3, align 8
  %8 = bitcast %struct.ap_int.34* %7 to %struct.ap_int_base.31*
  call void @_ZN11ap_int_baseILi64ELb1EEC2Ev(%struct.ap_int_base.31* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int.34* %7 to %struct.ap_int_base.31*
  %11 = bitcast %struct.ap_int_base.31* %10 to %struct.ssdm_int_sim.32*
  %12 = getelementptr inbounds %struct.ssdm_int_sim.32, %struct.ssdm_int_sim.32* %11, i32 0, i32 0
  %13 = invoke dereferenceable(8) %class.ap_private.33* @_ZN10ap_privateILi64ELb1ELb1EEaSEi(%class.ap_private.33* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_int.34* %7 to %struct.ap_int_base.31*
  call void @_ZN11ap_int_baseILi64ELb1EED2Ev(%struct.ap_int_base.31* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi66EEC2ILi128EEERKS_IXT_EE(%struct.ap_int.26*, %struct.ap_int.27* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.26*, align 8
  %4 = alloca %struct.ap_int.27*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.26* %0, %struct.ap_int.26** %3, align 8
  store %struct.ap_int.27* %1, %struct.ap_int.27** %4, align 8
  %7 = load %struct.ap_int.26*, %struct.ap_int.26** %3, align 8
  %8 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EEC2Ev(%struct.ap_int_base.23* %8)
  %9 = load %struct.ap_int.27*, %struct.ap_int.27** %4, align 8
  %10 = bitcast %struct.ap_int.27* %9 to %struct.ssdm_int_sim.29*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  %13 = bitcast %struct.ap_int_base.23* %12 to %struct.ssdm_int_sim.24*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %13, i32 0, i32 0
  %15 = invoke dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %14, %class.ap_private.30* dereferenceable(16) %11)
          to label %16 unwind label %17

16:                                               ; preds = %2
  ret void

17:                                               ; preds = %2
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %5, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %6, align 4
  %21 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EED2Ev(%struct.ap_int_base.23* %21) #3
  br label %22

22:                                               ; preds = %17
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %6, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi67EEC2Ei(%struct.ap_int.22*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.22*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.22* %0, %struct.ap_int.22** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int.22*, %struct.ap_int.22** %3, align 8
  %8 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  call void @_ZN11ap_int_baseILi67ELb1EEC2Ev(%struct.ap_int_base.19* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  %11 = bitcast %struct.ap_int_base.19* %10 to %struct.ssdm_int_sim.20*
  %12 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %11, i32 0, i32 0
  %13 = invoke dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSEi(%class.ap_private.21* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK11ap_int_baseILi68ELb1EEcvxEv(%struct.ap_int_base.16*) #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.16*, align 8
  store %struct.ap_int_base.16* %0, %struct.ap_int_base.16** %2, align 8
  %3 = load %struct.ap_int_base.16*, %struct.ap_int_base.16** %2, align 8
  %4 = bitcast %struct.ap_int_base.16* %3 to %struct.ssdm_int_sim.17*
  %5 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %4, i32 0, i32 0
  %6 = call i64 @_ZNK10ap_privateILi68ELb1ELb0EEcvlEv(%class.ap_private.18* %5)
  ret i64 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi68EED2Ev(%struct.ap_int*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int*, align 8
  store %struct.ap_int* %0, %struct.ap_int** %2, align 8
  %3 = load %struct.ap_int*, %struct.ap_int** %2, align 8
  %4 = bitcast %struct.ap_int* %3 to %struct.ap_int_base.16*
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi67EED2Ev(%struct.ap_int.22*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int.22*, align 8
  store %struct.ap_int.22* %0, %struct.ap_int.22** %2, align 8
  %3 = load %struct.ap_int.22*, %struct.ap_int.22** %2, align 8
  %4 = bitcast %struct.ap_int.22* %3 to %struct.ap_int_base.19*
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi66EED2Ev(%struct.ap_int.26*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int.26*, align 8
  store %struct.ap_int.26* %0, %struct.ap_int.26** %2, align 8
  %3 = load %struct.ap_int.26*, %struct.ap_int.26** %2, align 8
  %4 = bitcast %struct.ap_int.26* %3 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EED2Ev(%struct.ap_int_base.23* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi128EED2Ev(%struct.ap_int.27*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int.27*, align 8
  store %struct.ap_int.27* %0, %struct.ap_int.27** %2, align 8
  %3 = load %struct.ap_int.27*, %struct.ap_int.27** %2, align 8
  %4 = bitcast %struct.ap_int.27* %3 to %struct.ap_int_base.28*
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi64EED2Ev(%struct.ap_int.34*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int.34*, align 8
  store %struct.ap_int.34* %0, %struct.ap_int.34** %2, align 8
  %3 = load %struct.ap_int.34*, %struct.ap_int.34** %2, align 8
  %4 = bitcast %struct.ap_int.34* %3 to %struct.ap_int_base.31*
  call void @_ZN11ap_int_baseILi64ELb1EED2Ev(%struct.ap_int_base.31* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi66EEC2Ej(%struct.ap_int.26*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.26*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.26* %0, %struct.ap_int.26** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int.26*, %struct.ap_int.26** %3, align 8
  %8 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EEC2Ev(%struct.ap_int_base.23* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  %11 = bitcast %struct.ap_int_base.23* %10 to %struct.ssdm_int_sim.24*
  %12 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %11, i32 0, i32 0
  %13 = invoke dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSEj(%class.ap_private.25* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_int.26* %7 to %struct.ap_int_base.23*
  call void @_ZN11ap_int_baseILi66ELb1EED2Ev(%struct.ap_int_base.23* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  call void @klee.ctor_stub()
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [32768 x [1 x [16 x %struct.ap_uint]]], align 16
  %5 = alloca i8*
  %6 = alloca i32
  %7 = alloca [134217728 x %struct.ap_uint], align 16
  %8 = alloca %struct.ap_int.35, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.ap_int.35, align 4
  %11 = alloca %struct.ap_int.35, align 4
  %12 = alloca %struct.ap_uint, align 1
  store i32 0, i32* %1, align 4
  %13 = getelementptr inbounds [32768 x [1 x [16 x %struct.ap_uint]]], [32768 x [1 x [16 x %struct.ap_uint]]]* %4, i32 0, i32 0, i32 0, i32 0
  %14 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %13, i64 524288
  br label %15

15:                                               ; preds = %17, %0
  %16 = phi %struct.ap_uint* [ %13, %0 ], [ %18, %17 ]
  invoke void @_ZN7ap_uintILi8EEC2Ev(%struct.ap_uint* %16)
          to label %17 unwind label %35

17:                                               ; preds = %15
  %18 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %16, i64 1
  %19 = icmp eq %struct.ap_uint* %18, %14
  br i1 %19, label %20, label %15

20:                                               ; preds = %17
  %21 = getelementptr inbounds [134217728 x %struct.ap_uint], [134217728 x %struct.ap_uint]* %7, i32 0, i32 0
  %22 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %21, i64 134217728
  br label %23

23:                                               ; preds = %25, %20
  %24 = phi %struct.ap_uint* [ %21, %20 ], [ %26, %25 ]
  invoke void @_ZN7ap_uintILi8EEC2Ev(%struct.ap_uint* %24)
          to label %25 unwind label %45

25:                                               ; preds = %23
  %26 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %24, i64 1
  %27 = icmp eq %struct.ap_uint* %26, %22
  br i1 %27, label %28, label %23

28:                                               ; preds = %25
  store i32 7, i32* %3, align 4
  store i32 33566720, i32* %2, align 4
  invoke void @_ZN6ap_intILi32EEC2Ei(%struct.ap_int.35* %8, i32 0)
          to label %29 unwind label %55

29:                                               ; preds = %28
  br label %30

30:                                               ; preds = %120, %29
  %31 = bitcast %struct.ap_int.35* %8 to %struct.ap_int_base.36*
  %32 = invoke zeroext i1 @_ZltILi32ELb1EEbRK11ap_int_baseIXT_EXT0_EEi(%struct.ap_int_base.36* dereferenceable(4) %31, i32 32768)
          to label %33 unwind label %59

33:                                               ; preds = %30
  br i1 %32, label %63, label %34

34:                                               ; preds = %33
  store i32 2, i32* %9, align 4
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %8) #3
  br label %122

35:                                               ; preds = %15
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  store i8* %37, i8** %5, align 8
  %38 = extractvalue { i8*, i32 } %36, 1
  store i32 %38, i32* %6, align 4
  %39 = icmp eq %struct.ap_uint* %13, %16
  br i1 %39, label %44, label %40

40:                                               ; preds = %40, %35
  %41 = phi %struct.ap_uint* [ %16, %35 ], [ %42, %40 ]
  %42 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %41, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %42) #3
  %43 = icmp eq %struct.ap_uint* %42, %13
  br i1 %43, label %44, label %40

44:                                               ; preds = %40, %35
  br label %159

45:                                               ; preds = %23
  %46 = landingpad { i8*, i32 }
          cleanup
  %47 = extractvalue { i8*, i32 } %46, 0
  store i8* %47, i8** %5, align 8
  %48 = extractvalue { i8*, i32 } %46, 1
  store i32 %48, i32* %6, align 4
  %49 = icmp eq %struct.ap_uint* %21, %24
  br i1 %49, label %54, label %50

50:                                               ; preds = %50, %45
  %51 = phi %struct.ap_uint* [ %24, %45 ], [ %52, %50 ]
  %52 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %51, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %52) #3
  %53 = icmp eq %struct.ap_uint* %52, %21
  br i1 %53, label %54, label %50

54:                                               ; preds = %50, %45
  br label %151

55:                                               ; preds = %122, %28
  %56 = landingpad { i8*, i32 }
          cleanup
  %57 = extractvalue { i8*, i32 } %56, 0
  store i8* %57, i8** %5, align 8
  %58 = extractvalue { i8*, i32 } %56, 1
  store i32 %58, i32* %6, align 4
  br label %137

59:                                               ; preds = %117, %63, %30
  %60 = landingpad { i8*, i32 }
          cleanup
  %61 = extractvalue { i8*, i32 } %60, 0
  store i8* %61, i8** %5, align 8
  %62 = extractvalue { i8*, i32 } %60, 1
  store i32 %62, i32* %6, align 4
  br label %121

63:                                               ; preds = %33
  invoke void @_ZN6ap_intILi32EEC2Ei(%struct.ap_int.35* %10, i32 0)
          to label %64 unwind label %59

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %114, %64
  %66 = bitcast %struct.ap_int.35* %10 to %struct.ap_int_base.36*
  %67 = invoke zeroext i1 @_ZltILi32ELb1EEbRK11ap_int_baseIXT_EXT0_EEi(%struct.ap_int_base.36* dereferenceable(4) %66, i32 1)
          to label %68 unwind label %70

68:                                               ; preds = %65
  br i1 %67, label %74, label %69

69:                                               ; preds = %68
  store i32 5, i32* %9, align 4
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %10) #3
  br label %116

70:                                               ; preds = %111, %74, %65
  %71 = landingpad { i8*, i32 }
          cleanup
  %72 = extractvalue { i8*, i32 } %71, 0
  store i8* %72, i8** %5, align 8
  %73 = extractvalue { i8*, i32 } %71, 1
  store i32 %73, i32* %6, align 4
  br label %115

74:                                               ; preds = %68
  invoke void @_ZN6ap_intILi32EEC2Ei(%struct.ap_int.35* %11, i32 0)
          to label %75 unwind label %70

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %104, %75
  %77 = bitcast %struct.ap_int.35* %11 to %struct.ap_int_base.36*
  %78 = invoke zeroext i1 @_ZltILi32ELb1EEbRK11ap_int_baseIXT_EXT0_EEi(%struct.ap_int_base.36* dereferenceable(4) %77, i32 16)
          to label %79 unwind label %81

79:                                               ; preds = %76
  br i1 %78, label %85, label %80

80:                                               ; preds = %79
  store i32 8, i32* %9, align 4
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %11) #3
  br label %110

81:                                               ; preds = %101, %85, %76
  %82 = landingpad { i8*, i32 }
          cleanup
  %83 = extractvalue { i8*, i32 } %82, 0
  store i8* %83, i8** %5, align 8
  %84 = extractvalue { i8*, i32 } %82, 1
  store i32 %84, i32* %6, align 4
  br label %109

85:                                               ; preds = %79
  invoke void @_ZN7ap_uintILi8EEC2Ei(%struct.ap_uint* %12, i32 1)
          to label %86 unwind label %81

86:                                               ; preds = %85
  %87 = bitcast %struct.ap_int.35* %8 to %struct.ap_int_base.36*
  %88 = invoke i64 @_ZNK11ap_int_baseILi32ELb1EEcvxEv(%struct.ap_int_base.36* %87)
          to label %89 unwind label %105

89:                                               ; preds = %86
  %90 = getelementptr inbounds [32768 x [1 x [16 x %struct.ap_uint]]], [32768 x [1 x [16 x %struct.ap_uint]]]* %4, i64 0, i64 %88
  %91 = bitcast %struct.ap_int.35* %10 to %struct.ap_int_base.36*
  %92 = invoke i64 @_ZNK11ap_int_baseILi32ELb1EEcvxEv(%struct.ap_int_base.36* %91)
          to label %93 unwind label %105

93:                                               ; preds = %89
  %94 = getelementptr inbounds [1 x [16 x %struct.ap_uint]], [1 x [16 x %struct.ap_uint]]* %90, i64 0, i64 %92
  %95 = bitcast %struct.ap_int.35* %11 to %struct.ap_int_base.36*
  %96 = invoke i64 @_ZNK11ap_int_baseILi32ELb1EEcvxEv(%struct.ap_int_base.36* %95)
          to label %97 unwind label %105

97:                                               ; preds = %93
  %98 = getelementptr inbounds [16 x %struct.ap_uint], [16 x %struct.ap_uint]* %94, i64 0, i64 %96
  %99 = invoke dereferenceable(1) %struct.ap_uint* @_ZN7ap_uintILi8EEaSERKS0_(%struct.ap_uint* %98, %struct.ap_uint* dereferenceable(1) %12)
          to label %100 unwind label %105

100:                                              ; preds = %97
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %12) #3
  br label %101

101:                                              ; preds = %100
  %102 = bitcast %struct.ap_int.35* %11 to %struct.ap_int_base.36*
  %103 = invoke dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEppEv(%struct.ap_int_base.36* %102)
          to label %104 unwind label %81

104:                                              ; preds = %101
  br label %76

105:                                              ; preds = %97, %93, %89, %86
  %106 = landingpad { i8*, i32 }
          cleanup
  %107 = extractvalue { i8*, i32 } %106, 0
  store i8* %107, i8** %5, align 8
  %108 = extractvalue { i8*, i32 } %106, 1
  store i32 %108, i32* %6, align 4
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %12) #3
  br label %109

109:                                              ; preds = %105, %81
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %11) #3
  br label %115

110:                                              ; preds = %80
  br label %111

111:                                              ; preds = %110
  %112 = bitcast %struct.ap_int.35* %10 to %struct.ap_int_base.36*
  %113 = invoke dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEppEv(%struct.ap_int_base.36* %112)
          to label %114 unwind label %70

114:                                              ; preds = %111
  br label %65

115:                                              ; preds = %109, %70
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %10) #3
  br label %121

116:                                              ; preds = %69
  br label %117

117:                                              ; preds = %116
  %118 = bitcast %struct.ap_int.35* %8 to %struct.ap_int_base.36*
  %119 = invoke dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEppEv(%struct.ap_int_base.36* %118)
          to label %120 unwind label %59

120:                                              ; preds = %117
  br label %30

121:                                              ; preds = %115, %59
  call void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35* %8) #3
  br label %137

122:                                              ; preds = %34
  %123 = load i32, i32* %2, align 4
  %124 = load i32, i32* %3, align 4
  %125 = getelementptr inbounds [32768 x [1 x [16 x %struct.ap_uint]]], [32768 x [1 x [16 x %struct.ap_uint]]]* %4, i64 0, i64 0
  %126 = getelementptr inbounds [134217728 x %struct.ap_uint], [134217728 x %struct.ap_uint]* %7, i64 0, i64 0
  invoke void @_Z16default_functionjjPA1_A16_7ap_uintILi8EEPS0_(i32 %123, i32 %124, [1 x [16 x %struct.ap_uint]]* %125, %struct.ap_uint* %126)
          to label %127 unwind label %55

127:                                              ; preds = %122
  store i32 0, i32* %1, align 4
  store i32 1, i32* %9, align 4
  %128 = getelementptr inbounds [134217728 x %struct.ap_uint], [134217728 x %struct.ap_uint]* %7, i32 0, i32 0
  %129 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %128, i64 134217728
  br label %130

130:                                              ; preds = %130, %127
  %131 = phi %struct.ap_uint* [ %129, %127 ], [ %132, %130 ]
  %132 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %131, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %132) #3
  %133 = icmp eq %struct.ap_uint* %132, %128
  br i1 %133, label %134, label %130

134:                                              ; preds = %130
  %135 = getelementptr inbounds [32768 x [1 x [16 x %struct.ap_uint]]], [32768 x [1 x [16 x %struct.ap_uint]]]* %4, i32 0, i32 0, i32 0, i32 0
  %136 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %135, i64 524288
  br label %145

137:                                              ; preds = %121, %55
  %138 = getelementptr inbounds [134217728 x %struct.ap_uint], [134217728 x %struct.ap_uint]* %7, i32 0, i32 0
  %139 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %138, i64 134217728
  br label %140

140:                                              ; preds = %140, %137
  %141 = phi %struct.ap_uint* [ %139, %137 ], [ %142, %140 ]
  %142 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %141, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %142) #3
  %143 = icmp eq %struct.ap_uint* %142, %138
  br i1 %143, label %144, label %140

144:                                              ; preds = %140
  br label %151

145:                                              ; preds = %145, %134
  %146 = phi %struct.ap_uint* [ %136, %134 ], [ %147, %145 ]
  %147 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %146, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %147) #3
  %148 = icmp eq %struct.ap_uint* %147, %135
  br i1 %148, label %149, label %145

149:                                              ; preds = %145
  %150 = load i32, i32* %1, align 4
  ret i32 %150

151:                                              ; preds = %144, %54
  %152 = getelementptr inbounds [32768 x [1 x [16 x %struct.ap_uint]]], [32768 x [1 x [16 x %struct.ap_uint]]]* %4, i32 0, i32 0, i32 0, i32 0
  %153 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %152, i64 524288
  br label %154

154:                                              ; preds = %154, %151
  %155 = phi %struct.ap_uint* [ %153, %151 ], [ %156, %154 ]
  %156 = getelementptr inbounds %struct.ap_uint, %struct.ap_uint* %155, i64 -1
  call void @_ZN7ap_uintILi8EED2Ev(%struct.ap_uint* %156) #3
  %157 = icmp eq %struct.ap_uint* %156, %152
  br i1 %157, label %158, label %154

158:                                              ; preds = %154
  br label %159

159:                                              ; preds = %158, %44
  %160 = load i8*, i8** %5, align 8
  %161 = load i32, i32* %6, align 4
  %162 = insertvalue { i8*, i32 } undef, i8* %160, 0
  %163 = insertvalue { i8*, i32 } %162, i32 %161, 1
  resume { i8*, i32 } %163
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi32EEC2Ei(%struct.ap_int.35*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.35*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.35* %0, %struct.ap_int.35** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int.35*, %struct.ap_int.35** %3, align 8
  %8 = bitcast %struct.ap_int.35* %7 to %struct.ap_int_base.36*
  call void @_ZN11ap_int_baseILi32ELb1EEC2Ev(%struct.ap_int_base.36* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int.35* %7 to %struct.ap_int_base.36*
  %11 = bitcast %struct.ap_int_base.36* %10 to %struct.ssdm_int_sim.37*
  %12 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %11, i32 0, i32 0
  %13 = invoke dereferenceable(4) %class.ap_private.38* @_ZN10ap_privateILi32ELb1ELb1EEaSEi(%class.ap_private.38* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_int.35* %7 to %struct.ap_int_base.36*
  call void @_ZN11ap_int_baseILi32ELb1EED2Ev(%struct.ap_int_base.36* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZltILi32ELb1EEbRK11ap_int_baseIXT_EXT0_EEi(%struct.ap_int_base.36* dereferenceable(4), i32) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.36*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.ap_int_base.36, align 4
  %6 = alloca i8*
  %7 = alloca i32
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZN11ap_int_baseILi32ELb1EEC2Ei(%struct.ap_int_base.36* %5, i32 %9)
  %10 = invoke zeroext i1 @_ZNK11ap_int_baseILi32ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EE(%struct.ap_int_base.36* %8, %struct.ap_int_base.36* dereferenceable(4) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN11ap_int_baseILi32ELb1EED2Ev(%struct.ap_int_base.36* %5) #3
  ret i1 %10

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN11ap_int_baseILi32ELb1EED2Ev(%struct.ap_int_base.36* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN7ap_uintILi8EEC2Ei(%struct.ap_uint*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_uint*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_uint* %0, %struct.ap_uint** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_uint*, %struct.ap_uint** %3, align 8
  %8 = bitcast %struct.ap_uint* %7 to %struct.ap_int_base*
  call void @_ZN11ap_int_baseILi8ELb0EEC2Ev(%struct.ap_int_base* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_uint* %7 to %struct.ap_int_base*
  %11 = bitcast %struct.ap_int_base* %10 to %struct.ssdm_int_sim*
  %12 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %11, i32 0, i32 0
  %13 = invoke dereferenceable(1) %class.ap_private* @_ZN10ap_privateILi8ELb0ELb1EEaSEi(%class.ap_private* %12, i32 %9)
          to label %14 unwind label %15

14:                                               ; preds = %2
  ret void

15:                                               ; preds = %2
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %struct.ap_uint* %7 to %struct.ap_int_base*
  call void @_ZN11ap_int_baseILi8ELb0EED2Ev(%struct.ap_int_base* %19) #3
  br label %20

20:                                               ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK11ap_int_baseILi32ELb1EEcvxEv(%struct.ap_int_base.36*) #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.36*, align 8
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %2, align 8
  %3 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %2, align 8
  %4 = bitcast %struct.ap_int_base.36* %3 to %struct.ssdm_int_sim.37*
  %5 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %4, i32 0, i32 0
  %6 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EEcviEv(%class.ap_private.38* %5)
  %7 = sext i32 %6 to i64
  ret i64 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEppEv(%struct.ap_int_base.36*) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %struct.ap_int_base.36*, align 8
  %3 = alloca %struct.ap_int_base.43, align 1
  %4 = alloca i8*
  %5 = alloca i32
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %2, align 8
  %6 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %2, align 8
  call void @_ZN11ap_int_baseILi1ELb0EEC2Ei(%struct.ap_int_base.43* %3, i32 1)
  %7 = invoke dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EE(%struct.ap_int_base.36* %6, %struct.ap_int_base.43* dereferenceable(1) %3)
          to label %8 unwind label %9

8:                                                ; preds = %1
  call void @_ZN11ap_int_baseILi1ELb0EED2Ev(%struct.ap_int_base.43* %3) #3
  ret %struct.ap_int_base.36* %6

9:                                                ; preds = %1
  %10 = landingpad { i8*, i32 }
          cleanup
  %11 = extractvalue { i8*, i32 } %10, 0
  store i8* %11, i8** %4, align 8
  %12 = extractvalue { i8*, i32 } %10, 1
  store i32 %12, i32* %5, align 4
  call void @_ZN11ap_int_baseILi1ELb0EED2Ev(%struct.ap_int_base.43* %3) #3
  br label %13

13:                                               ; preds = %9
  %14 = load i8*, i8** %4, align 8
  %15 = load i32, i32* %5, align 4
  %16 = insertvalue { i8*, i32 } undef, i8* %14, 0
  %17 = insertvalue { i8*, i32 } %16, i32 %15, 1
  resume { i8*, i32 } %17
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi32EED2Ev(%struct.ap_int.35*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int.35*, align 8
  store %struct.ap_int.35* %0, %struct.ap_int.35** %2, align 8
  %3 = load %struct.ap_int.35*, %struct.ap_int.35** %2, align 8
  %4 = bitcast %struct.ap_int.35* %3 to %struct.ap_int_base.36*
  call void @_ZN11ap_int_baseILi32ELb1EED2Ev(%struct.ap_int_base.36* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi8ELb0EED2Ev(%struct.ap_int_base*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base*, align 8
  store %struct.ap_int_base* %0, %struct.ap_int_base** %2, align 8
  %3 = load %struct.ap_int_base*, %struct.ap_int_base** %2, align 8
  %4 = bitcast %struct.ap_int_base* %3 to %struct.ssdm_int_sim*
  call void @_ZN12ssdm_int_simILi8ELb0EED2Ev(%struct.ssdm_int_sim* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi8ELb0EED2Ev(%struct.ssdm_int_sim*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim*, align 8
  store %struct.ssdm_int_sim* %0, %struct.ssdm_int_sim** %2, align 8
  %3 = load %struct.ssdm_int_sim*, %struct.ssdm_int_sim** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi8ELb0ELb1EED2Ev(%class.ap_private* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi8ELb0ELb1EED2Ev(%class.ap_private*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  invoke void @_ZN10ap_privateILi8ELb0ELb1EE12check_canaryEv(%class.ap_private* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi8ELb0ELb1EE12check_canaryEv(%class.ap_private*) #5 comdat align 2 {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  ret void
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #7 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  call void @_ZSt9terminatev() #13
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi128ELb0EED2Ev(%struct.ssdm_int_sim.2*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.2*, align 8
  store %struct.ssdm_int_sim.2* %0, %struct.ssdm_int_sim.2** %2, align 8
  %3 = load %struct.ssdm_int_sim.2*, %struct.ssdm_int_sim.2** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  invoke void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi3ELb0EED2Ev(%struct.ap_int_base.5*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.5*, align 8
  store %struct.ap_int_base.5* %0, %struct.ap_int_base.5** %2, align 8
  %3 = load %struct.ap_int_base.5*, %struct.ap_int_base.5** %2, align 8
  %4 = bitcast %struct.ap_int_base.5* %3 to %struct.ssdm_int_sim.6*
  call void @_ZN12ssdm_int_simILi3ELb0EED2Ev(%struct.ssdm_int_sim.6* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi3ELb0EED2Ev(%struct.ssdm_int_sim.6*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.6*, align 8
  store %struct.ssdm_int_sim.6* %0, %struct.ssdm_int_sim.6** %2, align 8
  %3 = load %struct.ssdm_int_sim.6*, %struct.ssdm_int_sim.6** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.6, %struct.ssdm_int_sim.6* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi3ELb0ELb1EED2Ev(%class.ap_private.7* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi3ELb0ELb1EED2Ev(%class.ap_private.7*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  invoke void @_ZN10ap_privateILi3ELb0ELb1EE12check_canaryEv(%class.ap_private.7* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi3ELb0ELb1EE12check_canaryEv(%class.ap_private.7*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi2ELb0EED2Ev(%struct.ap_int_base.9*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.9*, align 8
  store %struct.ap_int_base.9* %0, %struct.ap_int_base.9** %2, align 8
  %3 = load %struct.ap_int_base.9*, %struct.ap_int_base.9** %2, align 8
  %4 = bitcast %struct.ap_int_base.9* %3 to %struct.ssdm_int_sim.10*
  call void @_ZN12ssdm_int_simILi2ELb0EED2Ev(%struct.ssdm_int_sim.10* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi2ELb0EED2Ev(%struct.ssdm_int_sim.10*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.10*, align 8
  store %struct.ssdm_int_sim.10* %0, %struct.ssdm_int_sim.10** %2, align 8
  %3 = load %struct.ssdm_int_sim.10*, %struct.ssdm_int_sim.10** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.10, %struct.ssdm_int_sim.10* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi2ELb0ELb1EED2Ev(%class.ap_private.11* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi2ELb0ELb1EED2Ev(%class.ap_private.11*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  invoke void @_ZN10ap_privateILi2ELb0ELb1EE12check_canaryEv(%class.ap_private.11* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi2ELb0ELb1EE12check_canaryEv(%class.ap_private.11*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi16ELb0EED2Ev(%struct.ap_int_base.13*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.13*, align 8
  store %struct.ap_int_base.13* %0, %struct.ap_int_base.13** %2, align 8
  %3 = load %struct.ap_int_base.13*, %struct.ap_int_base.13** %2, align 8
  %4 = bitcast %struct.ap_int_base.13* %3 to %struct.ssdm_int_sim.14*
  call void @_ZN12ssdm_int_simILi16ELb0EED2Ev(%struct.ssdm_int_sim.14* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi16ELb0EED2Ev(%struct.ssdm_int_sim.14*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.14*, align 8
  store %struct.ssdm_int_sim.14* %0, %struct.ssdm_int_sim.14** %2, align 8
  %3 = load %struct.ssdm_int_sim.14*, %struct.ssdm_int_sim.14** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi16ELb0ELb1EED2Ev(%class.ap_private.15* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi16ELb0ELb1EED2Ev(%class.ap_private.15*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  invoke void @_ZN10ap_privateILi16ELb0ELb1EE12check_canaryEv(%class.ap_private.15* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi16ELb0ELb1EE12check_canaryEv(%class.ap_private.15*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi68ELb1EED2Ev(%struct.ssdm_int_sim.17*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.17*, align 8
  store %struct.ssdm_int_sim.17* %0, %struct.ssdm_int_sim.17** %2, align 8
  %3 = load %struct.ssdm_int_sim.17*, %struct.ssdm_int_sim.17** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  invoke void @_ZN10ap_privateILi68ELb1ELb0EE12check_canaryEv(%class.ap_private.18* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE12check_canaryEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi67ELb1EED2Ev(%struct.ssdm_int_sim.20*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.20*, align 8
  store %struct.ssdm_int_sim.20* %0, %struct.ssdm_int_sim.20** %2, align 8
  %3 = load %struct.ssdm_int_sim.20*, %struct.ssdm_int_sim.20** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi67ELb1ELb0EED2Ev(%class.ap_private.21* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EED2Ev(%class.ap_private.21*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  invoke void @_ZN10ap_privateILi67ELb1ELb0EE12check_canaryEv(%class.ap_private.21* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE12check_canaryEv(%class.ap_private.21*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi66ELb1EED2Ev(%struct.ap_int_base.23*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.23*, align 8
  store %struct.ap_int_base.23* %0, %struct.ap_int_base.23** %2, align 8
  %3 = load %struct.ap_int_base.23*, %struct.ap_int_base.23** %2, align 8
  %4 = bitcast %struct.ap_int_base.23* %3 to %struct.ssdm_int_sim.24*
  call void @_ZN12ssdm_int_simILi66ELb1EED2Ev(%struct.ssdm_int_sim.24* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi66ELb1EED2Ev(%struct.ssdm_int_sim.24*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.24*, align 8
  store %struct.ssdm_int_sim.24* %0, %struct.ssdm_int_sim.24** %2, align 8
  %3 = load %struct.ssdm_int_sim.24*, %struct.ssdm_int_sim.24** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi66ELb1ELb0EED2Ev(%class.ap_private.25* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EED2Ev(%class.ap_private.25*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  invoke void @_ZN10ap_privateILi66ELb1ELb0EE12check_canaryEv(%class.ap_private.25* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE12check_canaryEv(%class.ap_private.25*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi128ELb1EED2Ev(%struct.ssdm_int_sim.29*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.29*, align 8
  store %struct.ssdm_int_sim.29* %0, %struct.ssdm_int_sim.29** %2, align 8
  %3 = load %struct.ssdm_int_sim.29*, %struct.ssdm_int_sim.29** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi128ELb1ELb0EED2Ev(%class.ap_private.30* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EED2Ev(%class.ap_private.30*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  invoke void @_ZN10ap_privateILi128ELb1ELb0EE12check_canaryEv(%class.ap_private.30* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE12check_canaryEv(%class.ap_private.30*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi64ELb1EED2Ev(%struct.ap_int_base.31*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.31*, align 8
  store %struct.ap_int_base.31* %0, %struct.ap_int_base.31** %2, align 8
  %3 = load %struct.ap_int_base.31*, %struct.ap_int_base.31** %2, align 8
  %4 = bitcast %struct.ap_int_base.31* %3 to %struct.ssdm_int_sim.32*
  call void @_ZN12ssdm_int_simILi64ELb1EED2Ev(%struct.ssdm_int_sim.32* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi64ELb1EED2Ev(%struct.ssdm_int_sim.32*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.32*, align 8
  store %struct.ssdm_int_sim.32* %0, %struct.ssdm_int_sim.32** %2, align 8
  %3 = load %struct.ssdm_int_sim.32*, %struct.ssdm_int_sim.32** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.32, %struct.ssdm_int_sim.32* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi64ELb1ELb1EED2Ev(%class.ap_private.33* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi64ELb1ELb1EED2Ev(%class.ap_private.33*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  invoke void @_ZN10ap_privateILi64ELb1ELb1EE12check_canaryEv(%class.ap_private.33* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi64ELb1ELb1EE12check_canaryEv(%class.ap_private.33*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi32ELb1EED2Ev(%struct.ssdm_int_sim.37*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.37*, align 8
  store %struct.ssdm_int_sim.37* %0, %struct.ssdm_int_sim.37** %2, align 8
  %3 = load %struct.ssdm_int_sim.37*, %struct.ssdm_int_sim.37** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  invoke void @_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv(%class.ap_private.38* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi8ELb0EEC2Ev(%struct.ap_int_base*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base*, align 8
  store %struct.ap_int_base* %0, %struct.ap_int_base** %2, align 8
  %3 = load %struct.ap_int_base*, %struct.ap_int_base** %2, align 8
  %4 = bitcast %struct.ap_int_base* %3 to %struct.ssdm_int_sim*
  call void @_ZN12ssdm_int_simILi8ELb0EEC2Ev(%struct.ssdm_int_sim* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi8ELb0EEC2Ev(%struct.ssdm_int_sim*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim*, align 8
  store %struct.ssdm_int_sim* %0, %struct.ssdm_int_sim** %2, align 8
  %3 = load %struct.ssdm_int_sim*, %struct.ssdm_int_sim** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi8ELb0ELb1EEC2Ev(%class.ap_private* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi8ELb0ELb1EEC2Ev(%class.ap_private*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  call void @_ZN10ap_privateILi8ELb0ELb1EE10set_canaryEv(%class.ap_private* %3)
  call void @_ZNV10ap_privateILi8ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private* %3)
  call void @_ZN10ap_privateILi8ELb0ELb1EE12check_canaryEv(%class.ap_private* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi8ELb0ELb1EE10set_canaryEv(%class.ap_private*) #5 comdat align 2 {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi8ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private*) #5 comdat align 2 {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  %4 = getelementptr inbounds %class.ap_private, %class.ap_private* %3, i32 0, i32 0
  %5 = load volatile i8, i8* %4, align 1
  %6 = zext i8 %5 to i64
  %7 = shl i64 %6, 56
  %8 = lshr i64 %7, 56
  %9 = trunc i64 %8 to i8
  %10 = getelementptr inbounds %class.ap_private, %class.ap_private* %3, i32 0, i32 0
  store volatile i8 %9, i8* %10, align 1
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %class.ap_private* @_ZN10ap_privateILi8ELb0ELb1EEaSERKS0_(%class.ap_private*, %class.ap_private* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %class.ap_private*, align 8
  %4 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %3, align 8
  store %class.ap_private* %1, %class.ap_private** %4, align 8
  %5 = load %class.ap_private*, %class.ap_private** %3, align 8
  %6 = load %class.ap_private*, %class.ap_private** %4, align 8
  %7 = call zeroext i8 @_ZNK10ap_privateILi8ELb0ELb1EE7get_VALEv(%class.ap_private* %6)
  %8 = getelementptr inbounds %class.ap_private, %class.ap_private* %5, i32 0, i32 0
  store i8 %7, i8* %8, align 1
  call void @_ZNV10ap_privateILi8ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private* %5)
  ret %class.ap_private* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi8ELb0ELb1EE7get_VALEv(%class.ap_private*) #5 comdat align 2 {
  %2 = alloca %class.ap_private*, align 8
  store %class.ap_private* %0, %class.ap_private** %2, align 8
  %3 = load %class.ap_private*, %class.ap_private** %2, align 8
  %4 = getelementptr inbounds %class.ap_private, %class.ap_private* %3, i32 0, i32 0
  %5 = load i8, i8* %4, align 1
  ret i8 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi128ELb0EEC2Ev(%struct.ssdm_int_sim.2*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.2*, align 8
  store %struct.ssdm_int_sim.2* %0, %struct.ssdm_int_sim.2** %2, align 8
  %3 = load %struct.ssdm_int_sim.2*, %struct.ssdm_int_sim.2** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Ev(%class.ap_private.3* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EEC2Ev(%class.ap_private.3*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv(%class.ap_private.3* %3)
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %3)
  call void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %3, i32 0, i32 0
  %8 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  store volatile i64 %6, i64* %8, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSEi(%class.ap_private.3*, i32) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ap_private.38, align 4
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZN10ap_privateILi32ELb1ELb1EEC2Ei(%class.ap_private.38* %5, i32 %9)
  %10 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %8, %class.ap_private.38* dereferenceable(4) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38* %5) #3
  ret %class.ap_private.3* %8

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb1ELb1EEC2Ei(%class.ap_private.38*, i32) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.38*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.38* %0, %class.ap_private.38** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.38*, %class.ap_private.38** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  store i32 %7, i32* %6, align 4
  call void @_ZN10ap_privateILi32ELb1ELb1EE10set_canaryEv(%class.ap_private.38* %5)
  call void @_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.38* %5)
  call void @_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv(%class.ap_private.38* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %5, %class.ap_private.38* dereferenceable(4) %6)
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  ret %class.ap_private.3* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb1ELb1EE10set_canaryEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %3, i32 0, i32 0
  %5 = load volatile i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = shl i64 %6, 32
  %8 = ashr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %3, i32 0, i32 0
  store volatile i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %5, %class.ap_private.38* dereferenceable(4) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %7 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %8 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %9 = call zeroext i1 @_ZNK10ap_privateILi32ELb1ELb1EE10isNegativeEv(%class.ap_private.38* %8)
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %7, %class.ap_private.38* dereferenceable(4) %11)
  br label %52

12:                                               ; preds = %2
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %13

13:                                               ; preds = %25, %12
  %14 = load i32, i32* %6, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %28

16:                                               ; preds = %13
  %17 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %18 = load i32, i32* %6, align 4
  %19 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi(%class.ap_private.38* %17, i32 %18)
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 %23
  store i64 %20, i64* %24, align 8
  br label %25

25:                                               ; preds = %16
  %26 = load i32, i32* %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4
  br label %13

28:                                               ; preds = %13
  %29 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %30 = load i32, i32* %6, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2 x i64], [2 x i64]* %29, i64 0, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = or i64 %34, -4294967296
  store i64 %35, i64* %33, align 8
  br label %36

36:                                               ; preds = %44, %28
  %37 = load i32, i32* %6, align 4
  %38 = icmp slt i32 %37, 1
  br i1 %38, label %39, label %47

39:                                               ; preds = %36
  %40 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %41 = load i32, i32* %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2 x i64], [2 x i64]* %40, i64 0, i64 %42
  store i64 -1, i64* %43, align 8
  br label %44

44:                                               ; preds = %39
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %36

47:                                               ; preds = %36
  %48 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %49 = load i32, i32* %6, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [2 x i64], [2 x i64]* %48, i64 0, i64 %50
  store i64 -1, i64* %51, align 8
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
  br label %52

52:                                               ; preds = %47, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi32ELb1ELb1EE10isNegativeEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = and i64 2147483648, %6
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %7 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %20, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi(%class.ap_private.38* %12, i32 %13)
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 %18
  store i64 %15, i64* %19, align 8
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %8

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %32, %23
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 2
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %30
  store i64 0, i64* %31, align 8
  br label %32

32:                                               ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %24

35:                                               ; preds = %24
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi(%class.ap_private.38*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.38*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.38* %0, %class.ap_private.38** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.38*, %class.ap_private.38** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  ret i32 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3*, %class.ap_private.3* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %7 = icmp ne %class.ap_private.3* %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 0
  %11 = bitcast i64* %10 to i8*
  %12 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %13 = call i64* @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3* %12)
  %14 = bitcast i64* %13 to i8*
  %15 = call i8* @memcpy(i8* %11, i8* %14, i64 16)
  br label %16

16:                                               ; preds = %8, %2
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  ret %class.ap_private.3* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #8

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb0EE5rangeEii(%struct.ap_range_ref* noalias sret, %struct.ap_int_base.1*, i32, i32) #4 comdat align 2 {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.ap_int_base.1*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = bitcast %struct.ap_range_ref* %0 to i8*
  store i8* %9, i8** %5, align 8
  store %struct.ap_int_base.1* %1, %struct.ap_int_base.1** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %6, align 8
  br label %11

11:                                               ; preds = %4
  %12 = load i32, i32* %7, align 4
  %13 = icmp sge i32 %12, 128
  br i1 %13, label %14, label %20

14:                                               ; preds = %11
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load i32, i32* %7, align 4
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i64 0, i64 0), i32 %16, i32 128)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  call void @abort() #13
  unreachable

20:                                               ; preds = %11
  br label %21

21:                                               ; preds = %20
  br label %22

22:                                               ; preds = %21
  %23 = load i32, i32* %8, align 4
  %24 = icmp sge i32 %23, 128
  br i1 %24, label %25, label %31

25:                                               ; preds = %22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = load i32, i32* %8, align 4
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2, i64 0, i64 0), i32 %27, i32 128)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  call void @abort() #13
  unreachable

31:                                               ; preds = %22
  br label %32

32:                                               ; preds = %31
  %33 = load i32, i32* %7, align 4
  %34 = load i32, i32* %8, align 4
  call void @_ZN12ap_range_refILi128ELb0EEC2EP11ap_int_baseILi128ELb0EEii(%struct.ap_range_ref* %0, %struct.ap_int_base.1* %10, i32 %33, i32 %34)
  ret void
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #9

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ap_range_refILi128ELb0EEC2EP11ap_int_baseILi128ELb0EEii(%struct.ap_range_ref*, %struct.ap_int_base.1*, i32, i32) unnamed_addr #5 comdat align 2 {
  %5 = alloca %struct.ap_range_ref*, align 8
  %6 = alloca %struct.ap_int_base.1*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.ap_range_ref* %0, %struct.ap_range_ref** %5, align 8
  store %struct.ap_int_base.1* %1, %struct.ap_int_base.1** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %9 = load %struct.ap_range_ref*, %struct.ap_range_ref** %5, align 8
  %10 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %9, i32 0, i32 0
  %11 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %6, align 8
  store %struct.ap_int_base.1* %11, %struct.ap_int_base.1** %10, align 8
  %12 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %9, i32 0, i32 1
  %13 = load i32, i32* %8, align 4
  store i32 %13, i32* %12, align 8
  %14 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %9, i32 0, i32 2
  %15 = load i32, i32* %7, align 4
  store i32 %15, i32* %14, align 4
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb0EEC2ILi8ELb0EEERKS_IXT_EXT0_EE(%struct.ap_int_base.1*, %struct.ap_int_base* dereferenceable(1)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.1*, align 8
  %4 = alloca %struct.ap_int_base*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.1* %0, %struct.ap_int_base.1** %3, align 8
  store %struct.ap_int_base* %1, %struct.ap_int_base** %4, align 8
  %7 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %3, align 8
  %8 = bitcast %struct.ap_int_base.1* %7 to %struct.ssdm_int_sim.2*
  call void @_ZN12ssdm_int_simILi128ELb0EEC2Ev(%struct.ssdm_int_sim.2* %8)
  %9 = load %struct.ap_int_base*, %struct.ap_int_base** %4, align 8
  %10 = bitcast %struct.ap_int_base* %9 to %struct.ssdm_int_sim*
  %11 = getelementptr inbounds %struct.ssdm_int_sim, %struct.ssdm_int_sim* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int_base.1* %7 to %struct.ssdm_int_sim.2*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %12, i32 0, i32 0
  %14 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi8ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %13, %class.ap_private* dereferenceable(1) %11)
          to label %15 unwind label %16

15:                                               ; preds = %2
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %5, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %6, align 4
  %20 = bitcast %struct.ap_int_base.1* %7 to %struct.ssdm_int_sim.2*
  call void @_ZN12ssdm_int_simILi128ELb0EED2Ev(%struct.ssdm_int_sim.2* %20) #3
  br label %21

21:                                               ; preds = %16
  %22 = load i8*, i8** %5, align 8
  %23 = load i32, i32* %6, align 4
  %24 = insertvalue { i8*, i32 } undef, i8* %22, 0
  %25 = insertvalue { i8*, i32 } %24, i32 %23, 1
  resume { i8*, i32 } %25
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_Z21_AP_ROOT_op_set_rangeI10ap_privateILi128ELb0ELb0EEiiS1_ERT_S3_RKT0_RKT1_RKT2_(%class.ap_private.3* dereferenceable(16), i32* dereferenceable(4), i32* dereferenceable(4), %class.ap_private.3* dereferenceable(16)) #4 comdat {
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %class.ap_private.3*, align 8
  %9 = alloca %struct._private_range_ref, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store %class.ap_private.3* %3, %class.ap_private.3** %8, align 8
  %10 = load %class.ap_private.3*, %class.ap_private.3** %8, align 8
  %11 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %12 = load i32*, i32** %7, align 8
  %13 = load i32, i32* %12, align 4
  %14 = load i32*, i32** %6, align 8
  %15 = load i32, i32* %14, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EE5rangeEii(%struct._private_range_ref* sret %9, %class.ap_private.3* %11, i32 %13, i32 %15)
  %16 = call dereferenceable(16) %struct._private_range_ref* @_ZN18_private_range_refILi128ELb0EEaSILi128ELb0EEERS0_RK10ap_privateIXT_EXT0_EXleT_Li64EEE(%struct._private_range_ref* %9, %class.ap_private.3* dereferenceable(16) %10)
  %17 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  ret %class.ap_private.3* %17
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.1*, align 8
  store %struct.ap_int_base.1* %0, %struct.ap_int_base.1** %2, align 8
  %3 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %2, align 8
  %4 = bitcast %struct.ap_int_base.1* %3 to %struct.ssdm_int_sim.2*
  call void @_ZN12ssdm_int_simILi128ELb0EED2Ev(%struct.ssdm_int_sim.2* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi8ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private* %1, %class.ap_private** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load %class.ap_private*, %class.ap_private** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE13cpZextOrTruncILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %5, %class.ap_private* dereferenceable(1) %6)
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  ret %class.ap_private.3* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE13cpZextOrTruncILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private* %1, %class.ap_private** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load %class.ap_private*, %class.ap_private** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %5, %class.ap_private* dereferenceable(1) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE6cpZextILi8ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private* %1, %class.ap_private** %4, align 8
  %7 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %20, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = load %class.ap_private*, %class.ap_private** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call zeroext i8 @_ZNK10ap_privateILi8ELb0ELb1EE8get_pValEi(%class.ap_private* %12, i32 %13)
  %15 = zext i8 %14 to i64
  %16 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 %18
  store i64 %15, i64* %19, align 8
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %8

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %32, %23
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 2
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %30
  store i64 0, i64* %31, align 8
  br label %32

32:                                               ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %24

35:                                               ; preds = %24
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi8ELb0ELb1EE8get_pValEi(%class.ap_private*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private* %0, %class.ap_private** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private*, %class.ap_private** %3, align 8
  %6 = getelementptr inbounds %class.ap_private, %class.ap_private* %5, i32 0, i32 0
  %7 = load i8, i8* %6, align 1
  ret i8 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE5rangeEii(%struct._private_range_ref* noalias sret, %class.ap_private.3*, i32, i32) #4 comdat align 2 {
  %5 = alloca i8*, align 8
  %6 = alloca %class.ap_private.3*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = bitcast %struct._private_range_ref* %0 to i8*
  store i8* %9, i8** %5, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load %class.ap_private.3*, %class.ap_private.3** %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %8, align 4
  call void @_ZN18_private_range_refILi128ELb0EEC2EP10ap_privateILi128ELb0ELb0EEii(%struct._private_range_ref* %0, %class.ap_private.3* %10, i32 %11, i32 %12)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %struct._private_range_ref* @_ZN18_private_range_refILi128ELb0EEaSILi128ELb0EEERS0_RK10ap_privateIXT_EXT0_EXleT_Li64EEE(%struct._private_range_ref*, %class.ap_private.3* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct._private_range_ref*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  %5 = alloca %class.ap_private.3, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct._private_bit_ref, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %class.ap_private.3, align 8
  %12 = alloca %class.ap_private.3, align 8
  store %struct._private_range_ref* %0, %struct._private_range_ref** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %13 = load %struct._private_range_ref*, %struct._private_range_ref** %3, align 8
  %14 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %5, %class.ap_private.3* dereferenceable(16) %14)
  %15 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %18 = load i32, i32* %17, align 4
  %19 = icmp sgt i32 %16, %18
  br i1 %19, label %20, label %62

20:                                               ; preds = %2
  store i32 0, i32* %6, align 4
  %21 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %22 = load i32, i32* %21, align 8
  store i32 %22, i32* %7, align 4
  br label %23

23:                                               ; preds = %52, %20
  %24 = load i32, i32* %7, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %31

26:                                               ; preds = %23
  %27 = load i32, i32* %7, align 4
  %28 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = icmp sge i32 %27, %29
  br label %31

31:                                               ; preds = %26, %23
  %32 = phi i1 [ false, %23 ], [ %30, %26 ]
  br i1 %32, label %33, label %61

33:                                               ; preds = %31
  %34 = load i32, i32* %6, align 4
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEixEi(%struct._private_bit_ref* sret %8, %class.ap_private.3* %5, i32 %34)
          to label %35 unwind label %57

35:                                               ; preds = %33
  %36 = invoke zeroext i1 @_ZNK16_private_bit_refILi128ELb0EEcvbEv(%struct._private_bit_ref* %8)
          to label %37 unwind label %57

37:                                               ; preds = %35
  br i1 %36, label %38, label %44

38:                                               ; preds = %37
  %39 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %40 = load %class.ap_private.3*, %class.ap_private.3** %39, align 8
  %41 = load i32, i32* %7, align 4
  %42 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE3setEj(%class.ap_private.3* %40, i32 %41)
          to label %43 unwind label %57

43:                                               ; preds = %38
  br label %50

44:                                               ; preds = %37
  %45 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %46 = load %class.ap_private.3*, %class.ap_private.3** %45, align 8
  %47 = load i32, i32* %7, align 4
  %48 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE5clearEj(%class.ap_private.3* %46, i32 %47)
          to label %49 unwind label %57

49:                                               ; preds = %44
  br label %50

50:                                               ; preds = %49, %43
  %51 = phi %class.ap_private.3* [ %42, %43 ], [ %48, %49 ]
  br label %52

52:                                               ; preds = %50
  %53 = load i32, i32* %7, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, i32* %7, align 4
  %55 = load i32, i32* %6, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %6, align 4
  br label %23

57:                                               ; preds = %62, %44, %38, %35, %33
  %58 = landingpad { i8*, i32 }
          cleanup
  %59 = extractvalue { i8*, i32 } %58, 0
  store i8* %59, i8** %9, align 8
  %60 = extractvalue { i8*, i32 } %58, 1
  store i32 %60, i32* %10, align 4
  br label %113

61:                                               ; preds = %31
  br label %112

62:                                               ; preds = %2
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %11, i32 -1, i1 zeroext true)
          to label %63 unwind label %57

63:                                               ; preds = %62
  %64 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %65 = load i32, i32* %64, align 8
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %67, label %80

67:                                               ; preds = %63
  %68 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %69 = load i32, i32* %68, align 8
  %70 = invoke dereferenceable(16) %class.ap_private.3* @_ZlSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16) %11, i32 %69)
          to label %71 unwind label %76

71:                                               ; preds = %67
  %72 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %73 = load i32, i32* %72, align 8
  %74 = invoke dereferenceable(16) %class.ap_private.3* @_ZlSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16) %5, i32 %73)
          to label %75 unwind label %76

75:                                               ; preds = %71
  br label %80

76:                                               ; preds = %106, %102, %100, %84, %71, %67
  %77 = landingpad { i8*, i32 }
          cleanup
  %78 = extractvalue { i8*, i32 } %77, 0
  store i8* %78, i8** %9, align 8
  %79 = extractvalue { i8*, i32 } %77, 1
  store i32 %79, i32* %10, align 4
  br label %111

80:                                               ; preds = %75, %63
  %81 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %82 = load i32, i32* %81, align 4
  %83 = icmp slt i32 %82, 127
  br i1 %83, label %84, label %100

84:                                               ; preds = %80
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %12, i32 -1, i1 zeroext true)
          to label %85 unwind label %76

85:                                               ; preds = %84
  %86 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %87 = load i32, i32* %86, align 4
  %88 = sub nsw i32 128, %87
  %89 = sub nsw i32 %88, 1
  %90 = invoke dereferenceable(16) %class.ap_private.3* @_ZrSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16) %12, i32 %89)
          to label %91 unwind label %96

91:                                               ; preds = %85
  %92 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %11, %class.ap_private.3* dereferenceable(16) %12)
          to label %93 unwind label %96

93:                                               ; preds = %91
  %94 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %5, %class.ap_private.3* dereferenceable(16) %12)
          to label %95 unwind label %96

95:                                               ; preds = %93
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %12) #3
  br label %100

96:                                               ; preds = %93, %91, %85
  %97 = landingpad { i8*, i32 }
          cleanup
  %98 = extractvalue { i8*, i32 } %97, 0
  store i8* %98, i8** %9, align 8
  %99 = extractvalue { i8*, i32 } %97, 1
  store i32 %99, i32* %10, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %12) #3
  br label %111

100:                                              ; preds = %95, %80
  %101 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE4flipEv(%class.ap_private.3* %11)
          to label %102 unwind label %76

102:                                              ; preds = %100
  %103 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %104 = load %class.ap_private.3*, %class.ap_private.3** %103, align 8
  %105 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %104, %class.ap_private.3* dereferenceable(16) %11)
          to label %106 unwind label %76

106:                                              ; preds = %102
  %107 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %108 = load %class.ap_private.3*, %class.ap_private.3** %107, align 8
  %109 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEoRILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %108, %class.ap_private.3* dereferenceable(16) %5)
          to label %110 unwind label %76

110:                                              ; preds = %106
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %11) #3
  br label %112

111:                                              ; preds = %96, %76
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %11) #3
  br label %113

112:                                              ; preds = %110, %61
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  ret %struct._private_range_ref* %13

113:                                              ; preds = %111, %57
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  br label %114

114:                                              ; preds = %113
  %115 = load i8*, i8** %9, align 8
  %116 = load i32, i32* %10, align 4
  %117 = insertvalue { i8*, i32 } undef, i8* %115, 0
  %118 = insertvalue { i8*, i32 } %117, i32 %116, 1
  resume { i8*, i32 } %118
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN18_private_range_refILi128ELb0EEC2EP10ap_privateILi128ELb0ELb0EEii(%struct._private_range_ref*, %class.ap_private.3*, i32, i32) unnamed_addr #4 comdat align 2 {
  %5 = alloca %struct._private_range_ref*, align 8
  %6 = alloca %class.ap_private.3*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct._private_range_ref* %0, %struct._private_range_ref** %5, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %9 = load %struct._private_range_ref*, %struct._private_range_ref** %5, align 8
  %10 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %9, i32 0, i32 0
  %11 = load %class.ap_private.3*, %class.ap_private.3** %6, align 8
  store %class.ap_private.3* %11, %class.ap_private.3** %10, align 8
  %12 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %9, i32 0, i32 1
  %13 = load i32, i32* %8, align 4
  store i32 %13, i32* %12, align 8
  %14 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %9, i32 0, i32 2
  %15 = load i32, i32* %7, align 4
  store i32 %15, i32* %14, align 4
  br label %16

16:                                               ; preds = %4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %16
  %20 = load i32, i32* %8, align 4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %29

22:                                               ; preds = %19, %16
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = load i32, i32* %7, align 4
  %25 = load i32, i32* %8, align 4
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.3, i64 0, i64 0), i32 %24, i32 %25)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %29

29:                                               ; preds = %22, %19
  br label %30

30:                                               ; preds = %29
  br label %31

31:                                               ; preds = %30
  %32 = load i32, i32* %7, align 4
  %33 = icmp sge i32 %32, 128
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = load i32, i32* %8, align 4
  %36 = icmp sge i32 %35, 128
  br i1 %36, label %37, label %44

37:                                               ; preds = %34, %31
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = load i32, i32* %7, align 4
  %40 = load i32, i32* %8, align 4
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.4, i64 0, i64 0), i32 %39, i32 %40, i32 128)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %44

44:                                               ; preds = %37, %34
  br label %45

45:                                               ; preds = %44
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3*, %class.ap_private.3* dereferenceable(16)) unnamed_addr #5 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv(%class.ap_private.3* %5)
  %6 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %7 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 0
  %8 = bitcast i64* %7 to i8*
  %9 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %10 = call i64* @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3* %9)
  %11 = bitcast i64* %10 to i8*
  %12 = call i8* @memcpy(i8* %8, i8* %11, i64 16)
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  call void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EEixEi(%struct._private_bit_ref* noalias sret, %class.ap_private.3*, i32) #4 comdat align 2 {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  %7 = bitcast %struct._private_bit_ref* %0 to i8*
  store i8* %7, i8** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %9 = load i32, i32* %6, align 4
  call void @_ZN16_private_bit_refILi128ELb0EEC2ER10ap_privateILi128ELb0ELb0EEi(%struct._private_bit_ref* %0, %class.ap_private.3* dereferenceable(16) %8, i32 %9)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK16_private_bit_refILi128ELb0EEcvbEv(%struct._private_bit_ref*) #4 comdat align 2 {
  %2 = alloca %struct._private_bit_ref*, align 8
  store %struct._private_bit_ref* %0, %struct._private_bit_ref** %2, align 8
  %3 = load %struct._private_bit_ref*, %struct._private_bit_ref** %2, align 8
  %4 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %3, i32 0, i32 0
  %5 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %6 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %3, i32 0, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = call zeroext i1 @_ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi(%class.ap_private.3* %5, i32 %7)
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE3setEj(%class.ap_private.3*, i32) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i64 @_ZN10ap_privateILi128ELb0ELb0EE7maskBitEj(i32 %6)
  %8 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @_ZN10ap_privateILi128ELb0ELb0EE9whichWordEj(i32 %9)
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 %11
  %13 = load i64, i64* %12, align 8
  %14 = or i64 %13, %7
  store i64 %14, i64* %12, align 8
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  ret %class.ap_private.3* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE5clearEj(%class.ap_private.3*, i32) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = call i64 @_ZN10ap_privateILi128ELb0ELb0EE7maskBitEj(i32 %6)
  %8 = xor i64 %7, -1
  %9 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %10 = load i32, i32* %4, align 4
  %11 = call i32 @_ZN10ap_privateILi128ELb0ELb0EE9whichWordEj(i32 %10)
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 %12
  %14 = load i64, i64* %13, align 8
  %15 = and i64 %14, %8
  store i64 %15, i64* %13, align 8
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %5)
  ret %class.ap_private.3* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3*, i32, i1 zeroext) unnamed_addr #5 comdat align 2 {
  %4 = alloca %class.ap_private.3*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  store %class.ap_private.3* %0, %class.ap_private.3** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = zext i1 %2 to i8
  store i8 %7, i8* %6, align 1
  %8 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv(%class.ap_private.3* %8)
  %9 = load i32, i32* %5, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %12 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 0
  store i64 %10, i64* %12, align 8
  %13 = load i8, i8* %6, align 1
  %14 = trunc i8 %13 to i1
  br i1 %14, label %15, label %26

15:                                               ; preds = %3
  %16 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = icmp slt i64 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %15
  %21 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %22 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 0
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i8*
  %25 = call i8* @memset(i8* %24, i32 255, i64 8)
  br label %32

26:                                               ; preds = %15, %3
  %27 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %28 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 0
  %29 = getelementptr inbounds i64, i64* %28, i64 1
  %30 = bitcast i64* %29 to i8*
  %31 = call i8* @memset(i8* %30, i32 0, i64 8)
  br label %32

32:                                               ; preds = %26, %20
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %8)
  call void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3* %8)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZlSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16), i32) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ap_private.3, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZNK10ap_privateILi128ELb0ELb0EElsEi(%class.ap_private.3* sret %5, %class.ap_private.3* %8, i32 %9)
  %10 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %11 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %10, %class.ap_private.3* dereferenceable(16) %5)
          to label %12 unwind label %14

12:                                               ; preds = %2
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  %13 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  ret %class.ap_private.3* %13

14:                                               ; preds = %2
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %6, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %7, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  br label %18

18:                                               ; preds = %14
  %19 = load i8*, i8** %6, align 8
  %20 = load i32, i32* %7, align 4
  %21 = insertvalue { i8*, i32 } undef, i8* %19, 0
  %22 = insertvalue { i8*, i32 } %21, i32 %20, 1
  resume { i8*, i32 } %22
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZrSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16), i32) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ap_private.3, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZNK10ap_privateILi128ELb0ELb0EErsEi(%class.ap_private.3* sret %5, %class.ap_private.3* %8, i32 %9)
  %10 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %11 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %10, %class.ap_private.3* dereferenceable(16) %5)
          to label %12 unwind label %14

12:                                               ; preds = %2
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  %13 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  ret %class.ap_private.3* %13

14:                                               ; preds = %2
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %6, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %7, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  br label %18

18:                                               ; preds = %14
  %19 = load i8*, i8** %6, align 8
  %20 = load i32, i32* %7, align 4
  %21 = insertvalue { i8*, i32 } undef, i8* %19, 0
  %22 = insertvalue { i8*, i32 } %21, i32 %20, 1
  resume { i8*, i32 } %22
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.3* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  store i32 2, i32* %5, align 4
  %9 = call i32 @_ZN8AESL_std3minIiEET_S1_S1_(i32 2, i32 2)
  store i32 %9, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %10

10:                                               ; preds = %24, %2
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp ult i32 %11, %12
  br i1 %13, label %14, label %27

14:                                               ; preds = %10
  %15 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %16 = load i32, i32* %7, align 4
  %17 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEi(%class.ap_private.3* %15, i32 %16)
  %18 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %19 = load i32, i32* %7, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [2 x i64], [2 x i64]* %18, i64 0, i64 %20
  %22 = load i64, i64* %21, align 8
  %23 = and i64 %22, %17
  store i64 %23, i64* %21, align 8
  br label %24

24:                                               ; preds = %14
  %25 = load i32, i32* %7, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %7, align 4
  br label %10

27:                                               ; preds = %10
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %8)
  ret %class.ap_private.3* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE4flipEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  %3 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %4 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %15, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %18

8:                                                ; preds = %5
  %9 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %4, i32 0, i32 0
  %10 = load i32, i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 %11
  %13 = load i64, i64* %12, align 8
  %14 = xor i64 %13, -1
  store i64 %14, i64* %12, align 8
  br label %15

15:                                               ; preds = %8
  %16 = load i32, i32* %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %3, align 4
  br label %5

18:                                               ; preds = %5
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %4)
  ret %class.ap_private.3* %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEoRILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3*, %class.ap_private.3* dereferenceable(16)) #5 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  store i32 2, i32* %5, align 4
  %9 = call i32 @_ZN8AESL_std3minIiEET_S1_S1_(i32 2, i32 2)
  store i32 %9, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %10

10:                                               ; preds = %24, %2
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp ult i32 %11, %12
  br i1 %13, label %14, label %27

14:                                               ; preds = %10
  %15 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %16 = load i32, i32* %7, align 4
  %17 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEi(%class.ap_private.3* %15, i32 %16)
  %18 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %8, i32 0, i32 0
  %19 = load i32, i32* %7, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [2 x i64], [2 x i64]* %18, i64 0, i64 %20
  %22 = load i64, i64* %21, align 8
  %23 = or i64 %22, %17
  store i64 %23, i64* %21, align 8
  br label %24

24:                                               ; preds = %14
  %25 = load i32, i32* %7, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %7, align 4
  br label %10

27:                                               ; preds = %10
  call void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %8)
  ret %class.ap_private.3* %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN16_private_bit_refILi128ELb0EEC2ER10ap_privateILi128ELb0ELb0EEi(%struct._private_bit_ref*, %class.ap_private.3* dereferenceable(16), i32) unnamed_addr #4 comdat align 2 {
  %4 = alloca %struct._private_bit_ref*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  store %struct._private_bit_ref* %0, %struct._private_bit_ref** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct._private_bit_ref*, %struct._private_bit_ref** %4, align 8
  %8 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 0
  %9 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  store %class.ap_private.3* %9, %class.ap_private.3** %8, align 8
  %10 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 1
  %11 = load i32, i32* %6, align 4
  store i32 %11, i32* %10, align 8
  br label %12

12:                                               ; preds = %3
  %13 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 1
  %14 = load i32, i32* %13, align 8
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 1
  %19 = load i32, i32* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.5, i64 0, i64 0), i32 %19)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %23

23:                                               ; preds = %16, %12
  br label %24

24:                                               ; preds = %23
  br label %25

25:                                               ; preds = %24
  %26 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 1
  %27 = load i32, i32* %26, align 8
  %28 = icmp sge i32 %27, 128
  br i1 %28, label %29, label %36

29:                                               ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds %struct._private_bit_ref, %struct._private_bit_ref* %7, i32 0, i32 1
  %32 = load i32, i32* %31, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.6, i64 0, i64 0), i32 %32, i32 128)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %36

36:                                               ; preds = %29, %25
  br label %37

37:                                               ; preds = %36
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi(%class.ap_private.3*, i32) #4 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %8, %2
  %10 = phi i1 [ false, %2 ], [ true, %8 ]
  br i1 %10, label %11, label %12

11:                                               ; preds = %9
  br label %14

12:                                               ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 3658, i8* getelementptr inbounds ([99 x i8], [99 x i8]* @__PRETTY_FUNCTION__._ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi, i64 0, i64 0)) #13
  unreachable

13:                                               ; No predecessors!
  br label %14

14:                                               ; preds = %13, %11
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %15, 128
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %18

18:                                               ; preds = %17, %14
  %19 = phi i1 [ false, %14 ], [ true, %17 ]
  br i1 %19, label %20, label %21

20:                                               ; preds = %18
  br label %23

21:                                               ; preds = %18
  call void @__assert_fail(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 3659, i8* getelementptr inbounds ([99 x i8], [99 x i8]* @__PRETTY_FUNCTION__._ZNK10ap_privateILi128ELb0ELb0EE7get_bitEi, i64 0, i64 0)) #13
  unreachable

22:                                               ; No predecessors!
  br label %23

23:                                               ; preds = %22, %20
  %24 = load i32, i32* %4, align 4
  %25 = call i64 @_ZN10ap_privateILi128ELb0ELb0EE7maskBitEj(i32 %24)
  %26 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %27 = load i32, i32* %4, align 4
  %28 = call i32 @_ZN10ap_privateILi128ELb0ELb0EE9whichWordEj(i32 %27)
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %26, i64 0, i64 %29
  %31 = load i64, i64* %30, align 8
  %32 = and i64 %25, %31
  %33 = icmp ne i64 %32, 0
  ret i1 %33
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #9

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZN10ap_privateILi128ELb0ELb0EE7maskBitEj(i32) #4 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 @_ZN10ap_privateILi128ELb0ELb0EE8whichBitEj(i32 %3)
  %5 = zext i32 %4 to i64
  call void @klee_overshift_check(i64 64, i64 %5)
  %6 = shl i64 1, %5, !klee.check.shift !18
  ret i64 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZN10ap_privateILi128ELb0ELb0EE9whichWordEj(i32) #5 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = lshr i32 %3, 6
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZN10ap_privateILi128ELb0ELb0EE8whichBitEj(i32) #5 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = and i32 %3, 63
  ret i32 %4
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi128ELb0ELb0EElsEi(%class.ap_private.3* noalias sret, %class.ap_private.3*, i32) #4 comdat align 2 {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  %7 = bitcast %class.ap_private.3* %0 to i8*
  store i8* %7, i8** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %9 = load i32, i32* %6, align 4
  %10 = icmp sge i32 %9, 128
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 0, i1 zeroext true)
  br label %20

12:                                               ; preds = %3
  %13 = load i32, i32* %6, align 4
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = load i32, i32* %6, align 4
  %17 = sub nsw i32 0, %16
  call void @_ZNK10ap_privateILi128ELb0ELb0EErsEi(%class.ap_private.3* sret %0, %class.ap_private.3* %8, i32 %17)
  br label %20

18:                                               ; preds = %12
  %19 = load i32, i32* %6, align 4
  call void @_ZNK10ap_privateILi128ELb0ELb0EE3shlEj(%class.ap_private.3* sret %0, %class.ap_private.3* %8, i32 %19)
  br label %20

20:                                               ; preds = %18, %15, %11
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi128ELb0ELb0EErsEi(%class.ap_private.3* noalias sret, %class.ap_private.3*, i32) #4 comdat align 2 {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  %7 = bitcast %class.ap_private.3* %0 to i8*
  store i8* %7, i8** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %9 = load i32, i32* %6, align 4
  %10 = icmp sge i32 %9, 128
  br i1 %10, label %11, label %15

11:                                               ; preds = %3
  %12 = call zeroext i1 @_ZNK10ap_privateILi128ELb0ELb0EE10isNegativeEv(%class.ap_private.3* %8)
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 -1, i1 zeroext true)
  br label %23

14:                                               ; preds = %11
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 0, i1 zeroext true)
  br label %23

15:                                               ; preds = %3
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 0, %19
  call void @_ZNK10ap_privateILi128ELb0ELb0EElsEi(%class.ap_private.3* sret %0, %class.ap_private.3* %8, i32 %20)
  br label %23

21:                                               ; preds = %15
  %22 = load i32, i32* %6, align 4
  call void @_ZNK10ap_privateILi128ELb0ELb0EE4lshrEj(%class.ap_private.3* sret %0, %class.ap_private.3* %8, i32 %22)
  br label %23

23:                                               ; preds = %21, %18, %14, %13
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi128ELb0ELb0EE3shlEj(%class.ap_private.3* noalias sret, %class.ap_private.3*, i32) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %class.ap_private.3, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = bitcast %class.ap_private.3* %0 to i8*
  store i8* %19, i8** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %20 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %21 = load i32, i32* %6, align 4
  %22 = icmp ule i32 %21, 128
  br i1 %22, label %23, label %24

23:                                               ; preds = %3
  br label %24

24:                                               ; preds = %23, %3
  %25 = phi i1 [ false, %3 ], [ true, %23 ]
  br i1 %25, label %26, label %27

26:                                               ; preds = %24
  br label %29

27:                                               ; preds = %24
  call void @__assert_fail(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 4909, i8* getelementptr inbounds ([127 x i8], [127 x i8]* @__PRETTY_FUNCTION__._ZNK10ap_privateILi128ELb0ELb0EE3shlEj, i64 0, i64 0)) #13
  unreachable

28:                                               ; No predecessors!
  br label %29

29:                                               ; preds = %28, %26
  %30 = load i32, i32* %6, align 4
  %31 = icmp eq i32 %30, 128
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 0, i1 zeroext true)
  br label %186

33:                                               ; preds = %29
  %34 = load i32, i32* %6, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %20)
  br label %186

37:                                               ; preds = %33
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %7, i32 0, i1 zeroext true)
  %38 = invoke i64* @_ZN10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3* %7)
          to label %39 unwind label %73

39:                                               ; preds = %37
  store i64* %38, i64** %8, align 8
  %40 = load i32, i32* %6, align 4
  %41 = icmp ult i32 %40, 64
  br i1 %41, label %42, label %80

42:                                               ; preds = %39
  store i64 0, i64* %11, align 8
  store i32 0, i32* %12, align 4
  br label %43

43:                                               ; preds = %70, %42
  %44 = load i32, i32* %12, align 4
  %45 = icmp slt i32 %44, 2
  br i1 %45, label %46, label %77

46:                                               ; preds = %43
  %47 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %48 = load i32, i32* %12, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [2 x i64], [2 x i64]* %47, i64 0, i64 %49
  %51 = load i64, i64* %50, align 8
  %52 = load i32, i32* %6, align 4
  %53 = zext i32 %52 to i64
  call void @klee_overshift_check(i64 64, i64 %53)
  %54 = shl i64 %51, %53, !klee.check.shift !18
  %55 = load i64, i64* %11, align 8
  %56 = or i64 %54, %55
  %57 = load i64*, i64** %8, align 8
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i64, i64* %57, i64 %59
  store i64 %56, i64* %60, align 8
  %61 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %62 = load i32, i32* %12, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [2 x i64], [2 x i64]* %61, i64 0, i64 %63
  %65 = load i64, i64* %64, align 8
  %66 = load i32, i32* %6, align 4
  %67 = sub i32 64, %66
  %68 = zext i32 %67 to i64
  call void @klee_overshift_check(i64 64, i64 %68)
  %69 = lshr i64 %65, %68, !klee.check.shift !18
  store i64 %69, i64* %11, align 8
  br label %70

70:                                               ; preds = %46
  %71 = load i32, i32* %12, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %12, align 4
  br label %43

73:                                               ; preds = %183, %182, %121, %120, %78, %77, %37
  %74 = landingpad { i8*, i32 }
          cleanup
  %75 = extractvalue { i8*, i32 } %74, 0
  store i8* %75, i8** %9, align 8
  %76 = extractvalue { i8*, i32 } %74, 1
  store i32 %76, i32* %10, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %7) #3
  br label %187

77:                                               ; preds = %43
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %78 unwind label %73

78:                                               ; preds = %77
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %79 unwind label %73

79:                                               ; preds = %78
  store i32 1, i32* %13, align 4
  br label %185

80:                                               ; preds = %39
  %81 = load i32, i32* %6, align 4
  %82 = urem i32 %81, 64
  store i32 %82, i32* %14, align 4
  %83 = load i32, i32* %6, align 4
  %84 = udiv i32 %83, 64
  store i32 %84, i32* %15, align 4
  %85 = load i32, i32* %14, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %123

87:                                               ; preds = %80
  store i32 0, i32* %16, align 4
  br label %88

88:                                               ; preds = %97, %87
  %89 = load i32, i32* %16, align 4
  %90 = load i32, i32* %15, align 4
  %91 = icmp ult i32 %89, %90
  br i1 %91, label %92, label %100

92:                                               ; preds = %88
  %93 = load i64*, i64** %8, align 8
  %94 = load i32, i32* %16, align 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i64, i64* %93, i64 %95
  store i64 0, i64* %96, align 8
  br label %97

97:                                               ; preds = %92
  %98 = load i32, i32* %16, align 4
  %99 = add i32 %98, 1
  store i32 %99, i32* %16, align 4
  br label %88

100:                                              ; preds = %88
  %101 = load i32, i32* %15, align 4
  store i32 %101, i32* %17, align 4
  br label %102

102:                                              ; preds = %117, %100
  %103 = load i32, i32* %17, align 4
  %104 = icmp slt i32 %103, 2
  br i1 %104, label %105, label %120

105:                                              ; preds = %102
  %106 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %107 = load i32, i32* %17, align 4
  %108 = load i32, i32* %15, align 4
  %109 = sub i32 %107, %108
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds [2 x i64], [2 x i64]* %106, i64 0, i64 %110
  %112 = load i64, i64* %111, align 8
  %113 = load i64*, i64** %8, align 8
  %114 = load i32, i32* %17, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i64, i64* %113, i64 %115
  store i64 %112, i64* %116, align 8
  br label %117

117:                                              ; preds = %105
  %118 = load i32, i32* %17, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %17, align 4
  br label %102

120:                                              ; preds = %102
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %121 unwind label %73

121:                                              ; preds = %120
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %122 unwind label %73

122:                                              ; preds = %121
  store i32 1, i32* %13, align 4
  br label %185

123:                                              ; preds = %80
  store i32 1, i32* %18, align 4
  br label %124

124:                                              ; preds = %156, %123
  %125 = load i32, i32* %18, align 4
  %126 = load i32, i32* %15, align 4
  %127 = icmp ugt i32 %125, %126
  br i1 %127, label %128, label %159

128:                                              ; preds = %124
  %129 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %130 = load i32, i32* %18, align 4
  %131 = load i32, i32* %15, align 4
  %132 = sub i32 %130, %131
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds [2 x i64], [2 x i64]* %129, i64 0, i64 %133
  %135 = load i64, i64* %134, align 8
  %136 = load i32, i32* %14, align 4
  %137 = zext i32 %136 to i64
  call void @klee_overshift_check(i64 64, i64 %137)
  %138 = shl i64 %135, %137, !klee.check.shift !18
  %139 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %140 = load i32, i32* %18, align 4
  %141 = load i32, i32* %15, align 4
  %142 = sub i32 %140, %141
  %143 = sub i32 %142, 1
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [2 x i64], [2 x i64]* %139, i64 0, i64 %144
  %146 = load i64, i64* %145, align 8
  %147 = load i32, i32* %14, align 4
  %148 = sub i32 64, %147
  %149 = zext i32 %148 to i64
  call void @klee_overshift_check(i64 64, i64 %149)
  %150 = lshr i64 %146, %149, !klee.check.shift !18
  %151 = or i64 %138, %150
  %152 = load i64*, i64** %8, align 8
  %153 = load i32, i32* %18, align 4
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds i64, i64* %152, i64 %154
  store i64 %151, i64* %155, align 8
  br label %156

156:                                              ; preds = %128
  %157 = load i32, i32* %18, align 4
  %158 = add i32 %157, -1
  store i32 %158, i32* %18, align 4
  br label %124

159:                                              ; preds = %124
  %160 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %20, i32 0, i32 0
  %161 = getelementptr inbounds [2 x i64], [2 x i64]* %160, i64 0, i64 0
  %162 = load i64, i64* %161, align 8
  %163 = load i32, i32* %14, align 4
  %164 = zext i32 %163 to i64
  call void @klee_overshift_check(i64 64, i64 %164)
  %165 = shl i64 %162, %164, !klee.check.shift !18
  %166 = load i64*, i64** %8, align 8
  %167 = load i32, i32* %15, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds i64, i64* %166, i64 %168
  store i64 %165, i64* %169, align 8
  store i32 0, i32* %18, align 4
  br label %170

170:                                              ; preds = %179, %159
  %171 = load i32, i32* %18, align 4
  %172 = load i32, i32* %15, align 4
  %173 = icmp ult i32 %171, %172
  br i1 %173, label %174, label %182

174:                                              ; preds = %170
  %175 = load i64*, i64** %8, align 8
  %176 = load i32, i32* %18, align 4
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds i64, i64* %175, i64 %177
  store i64 0, i64* %178, align 8
  br label %179

179:                                              ; preds = %174
  %180 = load i32, i32* %18, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* %18, align 4
  br label %170

182:                                              ; preds = %170
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %183 unwind label %73

183:                                              ; preds = %182
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %184 unwind label %73

184:                                              ; preds = %183
  store i32 1, i32* %13, align 4
  br label %185

185:                                              ; preds = %184, %122, %79
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %7) #3
  br label %186

186:                                              ; preds = %185, %36, %32
  ret void

187:                                              ; preds = %73
  %188 = load i8*, i8** %9, align 8
  %189 = load i32, i32* %10, align 4
  %190 = insertvalue { i8*, i32 } undef, i8* %188, 0
  %191 = insertvalue { i8*, i32 } %190, i32 %189, 1
  resume { i8*, i32 } %191
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi128ELb0ELb0EE10isNegativeEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  ret i1 false
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi128ELb0ELb0EE4lshrEj(%class.ap_private.3* noalias sret, %class.ap_private.3*, i32) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.3*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %class.ap_private.3, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = bitcast %class.ap_private.3* %0 to i8*
  store i8* %21, i8** %4, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %5, align 8
  store i32 %2, i32* %6, align 4
  %22 = load %class.ap_private.3*, %class.ap_private.3** %5, align 8
  %23 = load i32, i32* %6, align 4
  %24 = icmp eq i32 %23, 128
  br i1 %24, label %25, label %26

25:                                               ; preds = %3
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 0, i1 zeroext true)
  br label %189

26:                                               ; preds = %3
  %27 = load i32, i32* %6, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %22)
  br label %189

30:                                               ; preds = %26
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %7, i32 0, i1 zeroext true)
  %31 = invoke i64* @_ZN10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3* %7)
          to label %32 unwind label %66

32:                                               ; preds = %30
  store i64* %31, i64** %8, align 8
  %33 = load i32, i32* %6, align 4
  %34 = icmp ult i32 %33, 64
  br i1 %34, label %35, label %73

35:                                               ; preds = %32
  store i64 0, i64* %11, align 8
  store i32 1, i32* %12, align 4
  br label %36

36:                                               ; preds = %63, %35
  %37 = load i32, i32* %12, align 4
  %38 = icmp sge i32 %37, 0
  br i1 %38, label %39, label %70

39:                                               ; preds = %36
  %40 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %41 = load i32, i32* %12, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2 x i64], [2 x i64]* %40, i64 0, i64 %42
  %44 = load i64, i64* %43, align 8
  %45 = load i32, i32* %6, align 4
  %46 = zext i32 %45 to i64
  call void @klee_overshift_check(i64 64, i64 %46)
  %47 = lshr i64 %44, %46, !klee.check.shift !18
  %48 = load i64, i64* %11, align 8
  %49 = or i64 %47, %48
  %50 = load i64*, i64** %8, align 8
  %51 = load i32, i32* %12, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i64, i64* %50, i64 %52
  store i64 %49, i64* %53, align 8
  %54 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %55 = load i32, i32* %12, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [2 x i64], [2 x i64]* %54, i64 0, i64 %56
  %58 = load i64, i64* %57, align 8
  %59 = load i32, i32* %6, align 4
  %60 = sub i32 64, %59
  %61 = zext i32 %60 to i64
  call void @klee_overshift_check(i64 64, i64 %61)
  %62 = shl i64 %58, %61, !klee.check.shift !18
  store i64 %62, i64* %11, align 8
  br label %63

63:                                               ; preds = %39
  %64 = load i32, i32* %12, align 4
  %65 = add nsw i32 %64, -1
  store i32 %65, i32* %12, align 4
  br label %36

66:                                               ; preds = %186, %185, %116, %115, %71, %70, %30
  %67 = landingpad { i8*, i32 }
          cleanup
  %68 = extractvalue { i8*, i32 } %67, 0
  store i8* %68, i8** %9, align 8
  %69 = extractvalue { i8*, i32 } %67, 1
  store i32 %69, i32* %10, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %7) #3
  br label %190

70:                                               ; preds = %36
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %71 unwind label %66

71:                                               ; preds = %70
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %72 unwind label %66

72:                                               ; preds = %71
  store i32 1, i32* %13, align 4
  br label %188

73:                                               ; preds = %32
  %74 = load i32, i32* %6, align 4
  %75 = urem i32 %74, 64
  store i32 %75, i32* %14, align 4
  %76 = load i32, i32* %6, align 4
  %77 = udiv i32 %76, 64
  store i32 %77, i32* %15, align 4
  %78 = load i32, i32* %14, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %118

80:                                               ; preds = %73
  store i32 0, i32* %16, align 4
  br label %81

81:                                               ; preds = %98, %80
  %82 = load i32, i32* %16, align 4
  %83 = load i32, i32* %15, align 4
  %84 = sub i32 2, %83
  %85 = icmp ult i32 %82, %84
  br i1 %85, label %86, label %101

86:                                               ; preds = %81
  %87 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %88 = load i32, i32* %16, align 4
  %89 = load i32, i32* %15, align 4
  %90 = add i32 %88, %89
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [2 x i64], [2 x i64]* %87, i64 0, i64 %91
  %93 = load i64, i64* %92, align 8
  %94 = load i64*, i64** %8, align 8
  %95 = load i32, i32* %16, align 4
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i64, i64* %94, i64 %96
  store i64 %93, i64* %97, align 8
  br label %98

98:                                               ; preds = %86
  %99 = load i32, i32* %16, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %16, align 4
  br label %81

101:                                              ; preds = %81
  %102 = load i32, i32* %15, align 4
  %103 = sub i32 2, %102
  store i32 %103, i32* %17, align 4
  br label %104

104:                                              ; preds = %112, %101
  %105 = load i32, i32* %17, align 4
  %106 = icmp ult i32 %105, 2
  br i1 %106, label %107, label %115

107:                                              ; preds = %104
  %108 = load i64*, i64** %8, align 8
  %109 = load i32, i32* %17, align 4
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i64, i64* %108, i64 %110
  store i64 0, i64* %111, align 8
  br label %112

112:                                              ; preds = %107
  %113 = load i32, i32* %17, align 4
  %114 = add i32 %113, 1
  store i32 %114, i32* %17, align 4
  br label %104

115:                                              ; preds = %104
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %116 unwind label %66

116:                                              ; preds = %115
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %117 unwind label %66

117:                                              ; preds = %116
  store i32 1, i32* %13, align 4
  br label %188

118:                                              ; preds = %73
  %119 = load i32, i32* %15, align 4
  %120 = sub i32 2, %119
  %121 = sub i32 %120, 1
  store i32 %121, i32* %18, align 4
  store i32 0, i32* %19, align 4
  br label %122

122:                                              ; preds = %154, %118
  %123 = load i32, i32* %19, align 4
  %124 = load i32, i32* %18, align 4
  %125 = icmp ult i32 %123, %124
  br i1 %125, label %126, label %157

126:                                              ; preds = %122
  %127 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %128 = load i32, i32* %19, align 4
  %129 = load i32, i32* %15, align 4
  %130 = add i32 %128, %129
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds [2 x i64], [2 x i64]* %127, i64 0, i64 %131
  %133 = load i64, i64* %132, align 8
  %134 = load i32, i32* %14, align 4
  %135 = zext i32 %134 to i64
  call void @klee_overshift_check(i64 64, i64 %135)
  %136 = lshr i64 %133, %135, !klee.check.shift !18
  %137 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %138 = load i32, i32* %19, align 4
  %139 = load i32, i32* %15, align 4
  %140 = add i32 %138, %139
  %141 = add i32 %140, 1
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds [2 x i64], [2 x i64]* %137, i64 0, i64 %142
  %144 = load i64, i64* %143, align 8
  %145 = load i32, i32* %14, align 4
  %146 = sub i32 64, %145
  %147 = zext i32 %146 to i64
  call void @klee_overshift_check(i64 64, i64 %147)
  %148 = shl i64 %144, %147, !klee.check.shift !18
  %149 = or i64 %136, %148
  %150 = load i64*, i64** %8, align 8
  %151 = load i32, i32* %19, align 4
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i64, i64* %150, i64 %152
  store i64 %149, i64* %153, align 8
  br label %154

154:                                              ; preds = %126
  %155 = load i32, i32* %19, align 4
  %156 = add i32 %155, 1
  store i32 %156, i32* %19, align 4
  br label %122

157:                                              ; preds = %122
  %158 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %22, i32 0, i32 0
  %159 = load i32, i32* %18, align 4
  %160 = load i32, i32* %15, align 4
  %161 = add i32 %159, %160
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds [2 x i64], [2 x i64]* %158, i64 0, i64 %162
  %164 = load i64, i64* %163, align 8
  %165 = load i32, i32* %14, align 4
  %166 = zext i32 %165 to i64
  call void @klee_overshift_check(i64 64, i64 %166)
  %167 = lshr i64 %164, %166, !klee.check.shift !18
  %168 = load i64*, i64** %8, align 8
  %169 = load i32, i32* %18, align 4
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds i64, i64* %168, i64 %170
  store i64 %167, i64* %171, align 8
  %172 = load i32, i32* %18, align 4
  %173 = add i32 %172, 1
  store i32 %173, i32* %20, align 4
  br label %174

174:                                              ; preds = %182, %157
  %175 = load i32, i32* %20, align 4
  %176 = icmp slt i32 %175, 2
  br i1 %176, label %177, label %185

177:                                              ; preds = %174
  %178 = load i64*, i64** %8, align 8
  %179 = load i32, i32* %20, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i64, i64* %178, i64 %180
  store i64 0, i64* %181, align 8
  br label %182

182:                                              ; preds = %177
  %183 = load i32, i32* %20, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %20, align 4
  br label %174

185:                                              ; preds = %174
  invoke void @_ZNV10ap_privateILi128ELb0ELb0EE15clearUnusedBitsEv(%class.ap_private.3* %7)
          to label %186 unwind label %66

186:                                              ; preds = %185
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2ERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %7)
          to label %187 unwind label %66

187:                                              ; preds = %186
  store i32 1, i32* %13, align 4
  br label %188

188:                                              ; preds = %187, %117, %72
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %7) #3
  br label %189

189:                                              ; preds = %188, %29, %25
  ret void

190:                                              ; preds = %66
  %191 = load i8*, i8** %9, align 8
  %192 = load i32, i32* %10, align 4
  %193 = insertvalue { i8*, i32 } undef, i8* %191, 0
  %194 = insertvalue { i8*, i32 } %193, i32 %192, 1
  resume { i8*, i32 } %194
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZN10ap_privateILi128ELb0ELb0EE8get_pValEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZN8AESL_std3minIiEET_S1_S1_(i32, i32) #5 comdat {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = icmp sge i32 %5, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i32, i32* %4, align 4
  br label %12

10:                                               ; preds = %2
  %11 = load i32, i32* %3, align 4
  br label %12

12:                                               ; preds = %10, %8
  %13 = phi i32 [ %9, %8 ], [ %11, %10 ]
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi128ELb0ELb0EE8get_pValEi(%class.ap_private.3*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi3ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.5*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.5*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  %5 = alloca %struct.ap_int_base.1, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %struct.ap_int_base.5* %0, %struct.ap_int_base.5** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %8 = load %struct.ap_int_base.5*, %struct.ap_int_base.5** %3, align 8
  %9 = bitcast %struct.ap_int_base.5* %8 to %struct.ssdm_int_sim.6*
  call void @_ZN12ssdm_int_simILi3ELb0EEC2Ev(%struct.ssdm_int_sim.6* %9)
  %10 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  invoke void @_ZNK12ap_range_refILi128ELb0EE3getEv(%struct.ap_int_base.1* sret %5, %struct.ap_range_ref* %10)
          to label %11 unwind label %18

11:                                               ; preds = %2
  %12 = bitcast %struct.ap_int_base.1* %5 to %struct.ssdm_int_sim.2*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %12, i32 0, i32 0
  %14 = bitcast %struct.ap_int_base.5* %8 to %struct.ssdm_int_sim.6*
  %15 = getelementptr inbounds %struct.ssdm_int_sim.6, %struct.ssdm_int_sim.6* %14, i32 0, i32 0
  %16 = invoke dereferenceable(1) %class.ap_private.7* @_ZN10ap_privateILi3ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.7* %15, %class.ap_private.3* dereferenceable(16) %13)
          to label %17 unwind label %22

17:                                               ; preds = %11
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  ret void

18:                                               ; preds = %2
  %19 = landingpad { i8*, i32 }
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %6, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %7, align 4
  br label %26

22:                                               ; preds = %11
  %23 = landingpad { i8*, i32 }
          cleanup
  %24 = extractvalue { i8*, i32 } %23, 0
  store i8* %24, i8** %6, align 8
  %25 = extractvalue { i8*, i32 } %23, 1
  store i32 %25, i32* %7, align 4
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  br label %26

26:                                               ; preds = %22, %18
  %27 = bitcast %struct.ap_int_base.5* %8 to %struct.ssdm_int_sim.6*
  call void @_ZN12ssdm_int_simILi3ELb0EED2Ev(%struct.ssdm_int_sim.6* %27) #3
  br label %28

28:                                               ; preds = %26
  %29 = load i8*, i8** %6, align 8
  %30 = load i32, i32* %7, align 4
  %31 = insertvalue { i8*, i32 } undef, i8* %29, 0
  %32 = insertvalue { i8*, i32 } %31, i32 %30, 1
  resume { i8*, i32 } %32
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi3ELb0EEC2Ev(%struct.ssdm_int_sim.6*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.6*, align 8
  store %struct.ssdm_int_sim.6* %0, %struct.ssdm_int_sim.6** %2, align 8
  %3 = load %struct.ssdm_int_sim.6*, %struct.ssdm_int_sim.6** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.6, %struct.ssdm_int_sim.6* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi3ELb0ELb1EEC2Ev(%class.ap_private.7* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK12ap_range_refILi128ELb0EE3getEv(%struct.ap_int_base.1* noalias sret, %struct.ap_range_ref*) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  %5 = alloca i1, align 1
  %6 = alloca %struct._private_range_ref, align 8
  %7 = alloca i8*
  %8 = alloca i32
  %9 = bitcast %struct.ap_int_base.1* %0 to i8*
  store i8* %9, i8** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %10 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  store i1 false, i1* %5, align 1
  call void @_ZN11ap_int_baseILi128ELb0EEC2Ev(%struct.ap_int_base.1* %0)
  %11 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %10, i32 0, i32 0
  %12 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %11, align 8
  %13 = bitcast %struct.ap_int_base.1* %12 to %struct.ssdm_int_sim.2*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %10, i32 0, i32 2
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %10, i32 0, i32 1
  %18 = load i32, i32* %17, align 8
  invoke void @_ZN10ap_privateILi128ELb0ELb0EE5rangeEii(%struct._private_range_ref* sret %6, %class.ap_private.3* %14, i32 %16, i32 %18)
          to label %19 unwind label %25

19:                                               ; preds = %2
  %20 = bitcast %struct.ap_int_base.1* %0 to %struct.ssdm_int_sim.2*
  %21 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %20, i32 0, i32 0
  %22 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi128ELb0EEERS0_RK18_private_range_refIXT_EXT0_EE(%class.ap_private.3* %21, %struct._private_range_ref* dereferenceable(16) %6)
          to label %23 unwind label %25

23:                                               ; preds = %19
  store i1 true, i1* %5, align 1
  %24 = load i1, i1* %5, align 1
  br i1 %24, label %30, label %29

25:                                               ; preds = %19, %2
  %26 = landingpad { i8*, i32 }
          cleanup
  %27 = extractvalue { i8*, i32 } %26, 0
  store i8* %27, i8** %7, align 8
  %28 = extractvalue { i8*, i32 } %26, 1
  store i32 %28, i32* %8, align 4
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %0) #3
  br label %31

29:                                               ; preds = %23
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %0) #3
  br label %30

30:                                               ; preds = %29, %23
  ret void

31:                                               ; preds = %25
  %32 = load i8*, i8** %7, align 8
  %33 = load i32, i32* %8, align 4
  %34 = insertvalue { i8*, i32 } undef, i8* %32, 0
  %35 = insertvalue { i8*, i32 } %34, i32 %33, 1
  resume { i8*, i32 } %35
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %class.ap_private.7* @_ZN10ap_privateILi3ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.7*, %class.ap_private.3* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.7*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %5 = load %class.ap_private.7*, %class.ap_private.7** %3, align 8
  %6 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %7 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv(%class.ap_private.3* %6)
  %8 = trunc i64 %7 to i8
  %9 = getelementptr inbounds %class.ap_private.7, %class.ap_private.7* %5, i32 0, i32 0
  store i8 %8, i8* %9, align 1
  call void @_ZNV10ap_privateILi3ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.7* %5)
  ret %class.ap_private.7* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi3ELb0ELb1EEC2Ev(%class.ap_private.7*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  call void @_ZN10ap_privateILi3ELb0ELb1EE10set_canaryEv(%class.ap_private.7* %3)
  call void @_ZNV10ap_privateILi3ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.7* %3)
  call void @_ZN10ap_privateILi3ELb0ELb1EE12check_canaryEv(%class.ap_private.7* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi3ELb0ELb1EE10set_canaryEv(%class.ap_private.7*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi3ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.7*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.7, %class.ap_private.7* %3, i32 0, i32 0
  %5 = load volatile i8, i8* %4, align 1
  %6 = zext i8 %5 to i64
  %7 = shl i64 %6, 61
  %8 = lshr i64 %7, 61
  %9 = trunc i64 %8 to i8
  %10 = getelementptr inbounds %class.ap_private.7, %class.ap_private.7* %3, i32 0, i32 0
  store volatile i8 %9, i8* %10, align 1
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb0EEC2Ev(%struct.ap_int_base.1*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.1*, align 8
  store %struct.ap_int_base.1* %0, %struct.ap_int_base.1** %2, align 8
  %3 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %2, align 8
  %4 = bitcast %struct.ap_int_base.1* %3 to %struct.ssdm_int_sim.2*
  call void @_ZN12ssdm_int_simILi128ELb0EEC2Ev(%struct.ssdm_int_sim.2* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSILi128ELb0EEERS0_RK18_private_range_refIXT_EXT0_EE(%class.ap_private.3*, %struct._private_range_ref* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %struct._private_range_ref*, align 8
  %5 = alloca %class.ap_private.3, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %struct._private_range_ref* %1, %struct._private_range_ref** %4, align 8
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  %9 = load %struct._private_range_ref*, %struct._private_range_ref** %4, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2ILi128ELb0EEERK18_private_range_refIXT_EXT0_EE(%class.ap_private.3* %5, %struct._private_range_ref* dereferenceable(16) %9)
  %10 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %8, %class.ap_private.3* dereferenceable(16) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  ret %class.ap_private.3* %8

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EEC2ILi128ELb0EEERK18_private_range_refIXT_EXT0_EE(%class.ap_private.3*, %struct._private_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.3*, align 8
  %4 = alloca %struct._private_range_ref*, align 8
  %5 = alloca %class.ap_private.3, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.3* %0, %class.ap_private.3** %3, align 8
  store %struct._private_range_ref* %1, %struct._private_range_ref** %4, align 8
  %8 = load %class.ap_private.3*, %class.ap_private.3** %3, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE10set_canaryEv(%class.ap_private.3* %8)
  %9 = load %struct._private_range_ref*, %struct._private_range_ref** %4, align 8
  call void @_ZNK18_private_range_refILi128ELb0EE3getEv(%class.ap_private.3* sret %5, %struct._private_range_ref* %9)
  %10 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %8, %class.ap_private.3* dereferenceable(16) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  call void @_ZN10ap_privateILi128ELb0ELb0EE6reportEv(%class.ap_private.3* %8)
  call void @_ZN10ap_privateILi128ELb0ELb0EE12check_canaryEv(%class.ap_private.3* %8)
  ret void

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK18_private_range_refILi128ELb0EE3getEv(%class.ap_private.3* noalias sret, %struct._private_range_ref*) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca i8*, align 8
  %4 = alloca %struct._private_range_ref*, align 8
  %5 = alloca i1, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct._private_bit_ref, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %class.ap_private.3, align 8
  %12 = bitcast %class.ap_private.3* %0 to i8*
  store i8* %12, i8** %3, align 8
  store %struct._private_range_ref* %1, %struct._private_range_ref** %4, align 8
  %13 = load %struct._private_range_ref*, %struct._private_range_ref** %4, align 8
  store i1 false, i1* %5, align 1
  call void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %0, i32 0, i1 zeroext true)
  %14 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %17 = load i32, i32* %16, align 8
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %54

19:                                               ; preds = %2
  store i32 0, i32* %6, align 4
  %20 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %21 = load i32, i32* %20, align 8
  store i32 %21, i32* %7, align 4
  br label %22

22:                                               ; preds = %48, %19
  %23 = load i32, i32* %7, align 4
  %24 = icmp sge i32 %23, 0
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load i32, i32* %7, align 4
  %27 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %28 = load i32, i32* %27, align 4
  %29 = icmp sge i32 %26, %28
  br label %30

30:                                               ; preds = %25, %22
  %31 = phi i1 [ false, %22 ], [ %29, %25 ]
  br i1 %31, label %32, label %53

32:                                               ; preds = %30
  %33 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %34 = load %class.ap_private.3*, %class.ap_private.3** %33, align 8
  %35 = load i32, i32* %7, align 4
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEixEi(%struct._private_bit_ref* sret %8, %class.ap_private.3* %34, i32 %35)
          to label %36 unwind label %43

36:                                               ; preds = %32
  %37 = invoke zeroext i1 @_ZNK16_private_bit_refILi128ELb0EEcvbEv(%struct._private_bit_ref* %8)
          to label %38 unwind label %43

38:                                               ; preds = %36
  br i1 %37, label %39, label %47

39:                                               ; preds = %38
  %40 = load i32, i32* %6, align 4
  %41 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EE3setEj(%class.ap_private.3* %0, i32 %40)
          to label %42 unwind label %43

42:                                               ; preds = %39
  br label %47

43:                                               ; preds = %66, %58, %54, %39, %36, %32
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = extractvalue { i8*, i32 } %44, 0
  store i8* %45, i8** %9, align 8
  %46 = extractvalue { i8*, i32 } %44, 1
  store i32 %46, i32* %10, align 4
  br label %88

47:                                               ; preds = %42, %38
  br label %48

48:                                               ; preds = %47
  %49 = load i32, i32* %7, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, i32* %7, align 4
  %51 = load i32, i32* %6, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %6, align 4
  br label %22

53:                                               ; preds = %30
  br label %84

54:                                               ; preds = %2
  %55 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 0
  %56 = load %class.ap_private.3*, %class.ap_private.3** %55, align 8
  %57 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaSERKS0_(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %56)
          to label %58 unwind label %43

58:                                               ; preds = %54
  %59 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %60 = load i32, i32* %59, align 8
  %61 = invoke dereferenceable(16) %class.ap_private.3* @_ZrSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16) %0, i32 %60)
          to label %62 unwind label %43

62:                                               ; preds = %58
  %63 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %64 = load i32, i32* %63, align 4
  %65 = icmp slt i32 %64, 127
  br i1 %65, label %66, label %83

66:                                               ; preds = %62
  invoke void @_ZN10ap_privateILi128ELb0ELb0EEC2Eib(%class.ap_private.3* %11, i32 -1, i1 zeroext true)
          to label %67 unwind label %43

67:                                               ; preds = %66
  %68 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 2
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds %struct._private_range_ref, %struct._private_range_ref* %13, i32 0, i32 1
  %71 = load i32, i32* %70, align 8
  %72 = sub nsw i32 %69, %71
  %73 = add nsw i32 %72, 1
  %74 = sub nsw i32 128, %73
  %75 = invoke dereferenceable(16) %class.ap_private.3* @_ZrSILi128ELb0EER10ap_privateIXT_EXT0_EXleT_Li64EEES2_i(%class.ap_private.3* dereferenceable(16) %11, i32 %74)
          to label %76 unwind label %79

76:                                               ; preds = %67
  %77 = invoke dereferenceable(16) %class.ap_private.3* @_ZN10ap_privateILi128ELb0ELb0EEaNILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.3* %0, %class.ap_private.3* dereferenceable(16) %11)
          to label %78 unwind label %79

78:                                               ; preds = %76
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %11) #3
  br label %83

79:                                               ; preds = %76, %67
  %80 = landingpad { i8*, i32 }
          cleanup
  %81 = extractvalue { i8*, i32 } %80, 0
  store i8* %81, i8** %9, align 8
  %82 = extractvalue { i8*, i32 } %80, 1
  store i32 %82, i32* %10, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %11) #3
  br label %88

83:                                               ; preds = %78, %62
  br label %84

84:                                               ; preds = %83, %53
  store i1 true, i1* %5, align 1
  %85 = load i1, i1* %5, align 1
  br i1 %85, label %87, label %86

86:                                               ; preds = %84
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %0) #3
  br label %87

87:                                               ; preds = %86, %84
  ret void

88:                                               ; preds = %79, %43
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %0) #3
  br label %89

89:                                               ; preds = %88
  %90 = load i8*, i8** %9, align 8
  %91 = load i32, i32* %10, align 4
  %92 = insertvalue { i8*, i32 } undef, i8* %90, 0
  %93 = insertvalue { i8*, i32 } %92, i32 %91, 1
  resume { i8*, i32 } %93
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb0ELb0EE6reportEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  br label %4

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.3, %class.ap_private.3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  %6 = load i64, i64* %5, align 8
  ret i64 %6
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi3ELb0ELb1EEcvhEv(%class.ap_private.7*) #4 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  %4 = call zeroext i8 @_ZNK10ap_privateILi3ELb0ELb1EE7get_VALEv(%class.ap_private.7* %3)
  ret i8 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi3ELb0ELb1EE7get_VALEv(%class.ap_private.7*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.7*, align 8
  store %class.ap_private.7* %0, %class.ap_private.7** %2, align 8
  %3 = load %class.ap_private.7*, %class.ap_private.7** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.7, %class.ap_private.7* %3, i32 0, i32 0
  %5 = load i8, i8* %4, align 1
  ret i8 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi2ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.9*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.9*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  %5 = alloca %struct.ap_int_base.1, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %struct.ap_int_base.9* %0, %struct.ap_int_base.9** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %8 = load %struct.ap_int_base.9*, %struct.ap_int_base.9** %3, align 8
  %9 = bitcast %struct.ap_int_base.9* %8 to %struct.ssdm_int_sim.10*
  call void @_ZN12ssdm_int_simILi2ELb0EEC2Ev(%struct.ssdm_int_sim.10* %9)
  %10 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  invoke void @_ZNK12ap_range_refILi128ELb0EE3getEv(%struct.ap_int_base.1* sret %5, %struct.ap_range_ref* %10)
          to label %11 unwind label %18

11:                                               ; preds = %2
  %12 = bitcast %struct.ap_int_base.1* %5 to %struct.ssdm_int_sim.2*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %12, i32 0, i32 0
  %14 = bitcast %struct.ap_int_base.9* %8 to %struct.ssdm_int_sim.10*
  %15 = getelementptr inbounds %struct.ssdm_int_sim.10, %struct.ssdm_int_sim.10* %14, i32 0, i32 0
  %16 = invoke dereferenceable(1) %class.ap_private.11* @_ZN10ap_privateILi2ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.11* %15, %class.ap_private.3* dereferenceable(16) %13)
          to label %17 unwind label %22

17:                                               ; preds = %11
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  ret void

18:                                               ; preds = %2
  %19 = landingpad { i8*, i32 }
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %6, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %7, align 4
  br label %26

22:                                               ; preds = %11
  %23 = landingpad { i8*, i32 }
          cleanup
  %24 = extractvalue { i8*, i32 } %23, 0
  store i8* %24, i8** %6, align 8
  %25 = extractvalue { i8*, i32 } %23, 1
  store i32 %25, i32* %7, align 4
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  br label %26

26:                                               ; preds = %22, %18
  %27 = bitcast %struct.ap_int_base.9* %8 to %struct.ssdm_int_sim.10*
  call void @_ZN12ssdm_int_simILi2ELb0EED2Ev(%struct.ssdm_int_sim.10* %27) #3
  br label %28

28:                                               ; preds = %26
  %29 = load i8*, i8** %6, align 8
  %30 = load i32, i32* %7, align 4
  %31 = insertvalue { i8*, i32 } undef, i8* %29, 0
  %32 = insertvalue { i8*, i32 } %31, i32 %30, 1
  resume { i8*, i32 } %32
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi2ELb0EEC2Ev(%struct.ssdm_int_sim.10*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.10*, align 8
  store %struct.ssdm_int_sim.10* %0, %struct.ssdm_int_sim.10** %2, align 8
  %3 = load %struct.ssdm_int_sim.10*, %struct.ssdm_int_sim.10** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.10, %struct.ssdm_int_sim.10* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi2ELb0ELb1EEC2Ev(%class.ap_private.11* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %class.ap_private.11* @_ZN10ap_privateILi2ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.11*, %class.ap_private.3* dereferenceable(16)) #5 comdat align 2 {
  %3 = alloca %class.ap_private.11*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %5 = load %class.ap_private.11*, %class.ap_private.11** %3, align 8
  %6 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %7 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv(%class.ap_private.3* %6)
  %8 = trunc i64 %7 to i8
  %9 = getelementptr inbounds %class.ap_private.11, %class.ap_private.11* %5, i32 0, i32 0
  store i8 %8, i8* %9, align 1
  call void @_ZNV10ap_privateILi2ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.11* %5)
  ret %class.ap_private.11* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi2ELb0ELb1EEC2Ev(%class.ap_private.11*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  call void @_ZN10ap_privateILi2ELb0ELb1EE10set_canaryEv(%class.ap_private.11* %3)
  call void @_ZNV10ap_privateILi2ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.11* %3)
  call void @_ZN10ap_privateILi2ELb0ELb1EE12check_canaryEv(%class.ap_private.11* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi2ELb0ELb1EE10set_canaryEv(%class.ap_private.11*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi2ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.11*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.11, %class.ap_private.11* %3, i32 0, i32 0
  %5 = load volatile i8, i8* %4, align 1
  %6 = zext i8 %5 to i64
  %7 = shl i64 %6, 62
  %8 = lshr i64 %7, 62
  %9 = trunc i64 %8 to i8
  %10 = getelementptr inbounds %class.ap_private.11, %class.ap_private.11* %3, i32 0, i32 0
  store volatile i8 %9, i8* %10, align 1
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi2ELb0ELb1EEcvhEv(%class.ap_private.11*) #4 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  %4 = call zeroext i8 @_ZNK10ap_privateILi2ELb0ELb1EE7get_VALEv(%class.ap_private.11* %3)
  ret i8 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi2ELb0ELb1EE7get_VALEv(%class.ap_private.11*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.11*, align 8
  store %class.ap_private.11* %0, %class.ap_private.11** %2, align 8
  %3 = load %class.ap_private.11*, %class.ap_private.11** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.11, %class.ap_private.11* %3, i32 0, i32 0
  %5 = load i8, i8* %4, align 1
  ret i8 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi16ELb0EEC2Ev(%struct.ap_int_base.13*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.13*, align 8
  store %struct.ap_int_base.13* %0, %struct.ap_int_base.13** %2, align 8
  %3 = load %struct.ap_int_base.13*, %struct.ap_int_base.13** %2, align 8
  %4 = bitcast %struct.ap_int_base.13* %3 to %struct.ssdm_int_sim.14*
  call void @_ZN12ssdm_int_simILi16ELb0EEC2Ev(%struct.ssdm_int_sim.14* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi16ELb0EEC2Ev(%struct.ssdm_int_sim.14*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.14*, align 8
  store %struct.ssdm_int_sim.14* %0, %struct.ssdm_int_sim.14** %2, align 8
  %3 = load %struct.ssdm_int_sim.14*, %struct.ssdm_int_sim.14** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi16ELb0ELb1EEC2Ev(%class.ap_private.15* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi16ELb0ELb1EEC2Ev(%class.ap_private.15*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  call void @_ZN10ap_privateILi16ELb0ELb1EE10set_canaryEv(%class.ap_private.15* %3)
  call void @_ZNV10ap_privateILi16ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.15* %3)
  call void @_ZN10ap_privateILi16ELb0ELb1EE12check_canaryEv(%class.ap_private.15* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi16ELb0ELb1EE10set_canaryEv(%class.ap_private.15*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi16ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.15*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %3, i32 0, i32 0
  %5 = load volatile i16, i16* %4, align 2
  %6 = zext i16 %5 to i64
  %7 = shl i64 %6, 48
  %8 = lshr i64 %7, 48
  %9 = trunc i64 %8 to i16
  %10 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %3, i32 0, i32 0
  store volatile i16 %9, i16* %10, align 2
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi16ELb0EEC2ILi128ELb0EEERK12ap_range_refIXT_EXT0_EE(%struct.ap_int_base.13*, %struct.ap_range_ref* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.13*, align 8
  %4 = alloca %struct.ap_range_ref*, align 8
  %5 = alloca %struct.ap_int_base.1, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store %struct.ap_int_base.13* %0, %struct.ap_int_base.13** %3, align 8
  store %struct.ap_range_ref* %1, %struct.ap_range_ref** %4, align 8
  %8 = load %struct.ap_int_base.13*, %struct.ap_int_base.13** %3, align 8
  %9 = bitcast %struct.ap_int_base.13* %8 to %struct.ssdm_int_sim.14*
  call void @_ZN12ssdm_int_simILi16ELb0EEC2Ev(%struct.ssdm_int_sim.14* %9)
  %10 = load %struct.ap_range_ref*, %struct.ap_range_ref** %4, align 8
  invoke void @_ZNK12ap_range_refILi128ELb0EE3getEv(%struct.ap_int_base.1* sret %5, %struct.ap_range_ref* %10)
          to label %11 unwind label %18

11:                                               ; preds = %2
  %12 = bitcast %struct.ap_int_base.1* %5 to %struct.ssdm_int_sim.2*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %12, i32 0, i32 0
  %14 = bitcast %struct.ap_int_base.13* %8 to %struct.ssdm_int_sim.14*
  %15 = getelementptr inbounds %struct.ssdm_int_sim.14, %struct.ssdm_int_sim.14* %14, i32 0, i32 0
  %16 = invoke dereferenceable(2) %class.ap_private.15* @_ZN10ap_privateILi16ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.15* %15, %class.ap_private.3* dereferenceable(16) %13)
          to label %17 unwind label %22

17:                                               ; preds = %11
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  ret void

18:                                               ; preds = %2
  %19 = landingpad { i8*, i32 }
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %6, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %7, align 4
  br label %26

22:                                               ; preds = %11
  %23 = landingpad { i8*, i32 }
          cleanup
  %24 = extractvalue { i8*, i32 } %23, 0
  store i8* %24, i8** %6, align 8
  %25 = extractvalue { i8*, i32 } %23, 1
  store i32 %25, i32* %7, align 4
  call void @_ZN11ap_int_baseILi128ELb0EED2Ev(%struct.ap_int_base.1* %5) #3
  br label %26

26:                                               ; preds = %22, %18
  %27 = bitcast %struct.ap_int_base.13* %8 to %struct.ssdm_int_sim.14*
  call void @_ZN12ssdm_int_simILi16ELb0EED2Ev(%struct.ssdm_int_sim.14* %27) #3
  br label %28

28:                                               ; preds = %26
  %29 = load i8*, i8** %6, align 8
  %30 = load i32, i32* %7, align 4
  %31 = insertvalue { i8*, i32 } undef, i8* %29, 0
  %32 = insertvalue { i8*, i32 } %31, i32 %30, 1
  resume { i8*, i32 } %32
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(2) %class.ap_private.15* @_ZN10ap_privateILi16ELb0ELb1EEaSILi128ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.15*, %class.ap_private.3* dereferenceable(16)) #5 comdat align 2 {
  %3 = alloca %class.ap_private.15*, align 8
  %4 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %3, align 8
  store %class.ap_private.3* %1, %class.ap_private.3** %4, align 8
  %5 = load %class.ap_private.15*, %class.ap_private.15** %3, align 8
  %6 = load %class.ap_private.3*, %class.ap_private.3** %4, align 8
  %7 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv(%class.ap_private.3* %6)
  %8 = trunc i64 %7 to i16
  %9 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %5, i32 0, i32 0
  store i16 %8, i16* %9, align 2
  call void @_ZNV10ap_privateILi16ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.15* %5)
  ret %class.ap_private.15* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(2) %class.ap_private.15* @_ZN10ap_privateILi16ELb0ELb1EEaSERKS0_(%class.ap_private.15*, %class.ap_private.15* dereferenceable(2)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.15*, align 8
  %4 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %3, align 8
  store %class.ap_private.15* %1, %class.ap_private.15** %4, align 8
  %5 = load %class.ap_private.15*, %class.ap_private.15** %3, align 8
  %6 = load %class.ap_private.15*, %class.ap_private.15** %4, align 8
  %7 = call zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EE7get_VALEv(%class.ap_private.15* %6)
  %8 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %5, i32 0, i32 0
  store i16 %7, i16* %8, align 2
  call void @_ZNV10ap_privateILi16ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.15* %5)
  ret %class.ap_private.15* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EE7get_VALEv(%class.ap_private.15*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %3, i32 0, i32 0
  %5 = load i16, i16* %4, align 2
  ret i16 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK12ap_range_refILi128ELb0EE9to_uint64Ev(%struct.ap_range_ref*) #4 comdat align 2 {
  %2 = alloca %struct.ap_range_ref*, align 8
  %3 = alloca %struct._private_range_ref, align 8
  store %struct.ap_range_ref* %0, %struct.ap_range_ref** %2, align 8
  %4 = load %struct.ap_range_ref*, %struct.ap_range_ref** %2, align 8
  %5 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %4, i32 0, i32 0
  %6 = load %struct.ap_int_base.1*, %struct.ap_int_base.1** %5, align 8
  %7 = bitcast %struct.ap_int_base.1* %6 to %struct.ssdm_int_sim.2*
  %8 = getelementptr inbounds %struct.ssdm_int_sim.2, %struct.ssdm_int_sim.2* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %4, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %struct.ap_range_ref, %struct.ap_range_ref* %4, i32 0, i32 1
  %12 = load i32, i32* %11, align 8
  call void @_ZN10ap_privateILi128ELb0ELb0EE5rangeEii(%struct._private_range_ref* sret %3, %class.ap_private.3* %8, i32 %10, i32 %12)
  %13 = call i64 @_ZNK18_private_range_refILi128ELb0EEcvyEv(%struct._private_range_ref* %3)
  ret i64 %13
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK18_private_range_refILi128ELb0EEcvyEv(%struct._private_range_ref*) #4 comdat align 2 {
  %2 = alloca %struct._private_range_ref*, align 8
  store %struct._private_range_ref* %0, %struct._private_range_ref** %2, align 8
  %3 = load %struct._private_range_ref*, %struct._private_range_ref** %2, align 8
  %4 = call i64 @_ZNK18_private_range_refILi128ELb0EE9to_uint64Ev(%struct._private_range_ref* %3)
  ret i64 %4
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK18_private_range_refILi128ELb0EE9to_uint64Ev(%struct._private_range_ref*) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %struct._private_range_ref*, align 8
  %3 = alloca %class.ap_private.3, align 8
  %4 = alloca i8*
  %5 = alloca i32
  store %struct._private_range_ref* %0, %struct._private_range_ref** %2, align 8
  %6 = load %struct._private_range_ref*, %struct._private_range_ref** %2, align 8
  call void @_ZNK18_private_range_refILi128ELb0EE3getEv(%class.ap_private.3* sret %3, %struct._private_range_ref* %6)
  %7 = invoke i64 @_ZNK10ap_privateILi128ELb0ELb0EE9to_uint64Ev(%class.ap_private.3* %3)
          to label %8 unwind label %9

8:                                                ; preds = %1
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %3) #3
  ret i64 %7

9:                                                ; preds = %1
  %10 = landingpad { i8*, i32 }
          cleanup
  %11 = extractvalue { i8*, i32 } %10, 0
  store i8* %11, i8** %4, align 8
  %12 = extractvalue { i8*, i32 } %10, 1
  store i32 %12, i32* %5, align 4
  call void @_ZN10ap_privateILi128ELb0ELb0EED2Ev(%class.ap_private.3* %3) #3
  br label %13

13:                                               ; preds = %9
  %14 = load i8*, i8** %4, align 8
  %15 = load i32, i32* %5, align 4
  %16 = insertvalue { i8*, i32 } undef, i8* %14, 0
  %17 = insertvalue { i8*, i32 } %16, i32 %15, 1
  resume { i8*, i32 } %17
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi128ELb0ELb0EE9to_uint64Ev(%class.ap_private.3*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.3*, align 8
  store %class.ap_private.3* %0, %class.ap_private.3** %2, align 8
  %3 = load %class.ap_private.3*, %class.ap_private.3** %2, align 8
  %4 = call i64 @_ZNK10ap_privateILi128ELb0ELb0EE7get_VALEv(%class.ap_private.3* %3)
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EEcvtEv(%class.ap_private.15*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.15* %0, %class.ap_private.15** %2, align 8
  %3 = load %class.ap_private.15*, %class.ap_private.15** %2, align 8
  %4 = call zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EE7get_VALEv(%class.ap_private.15* %3)
  ret i16 %4
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi66ELb1EEC2Ev(%struct.ap_int_base.23*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.23*, align 8
  store %struct.ap_int_base.23* %0, %struct.ap_int_base.23** %2, align 8
  %3 = load %struct.ap_int_base.23*, %struct.ap_int_base.23** %2, align 8
  %4 = bitcast %struct.ap_int_base.23* %3 to %struct.ssdm_int_sim.24*
  call void @_ZN12ssdm_int_simILi66ELb1EEC2Ev(%struct.ssdm_int_sim.24* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi16ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.15* dereferenceable(2)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.15* %1, %class.ap_private.15** %4, align 8
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = load %class.ap_private.15*, %class.ap_private.15** %4, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %5, %class.ap_private.15* dereferenceable(2) %6)
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %5)
  ret %class.ap_private.25* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi66ELb1EEC2Ev(%struct.ssdm_int_sim.24*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.24*, align 8
  store %struct.ssdm_int_sim.24* %0, %struct.ssdm_int_sim.24** %2, align 8
  %3 = load %struct.ssdm_int_sim.24*, %struct.ssdm_int_sim.24** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi66ELb1ELb0EEC2Ev(%class.ap_private.25* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EEC2Ev(%class.ap_private.25*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE10set_canaryEv(%class.ap_private.25* %3)
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %3)
  call void @_ZN10ap_privateILi66ELb1ELb0EE12check_canaryEv(%class.ap_private.25* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE10set_canaryEv(%class.ap_private.25*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 62
  %8 = ashr i64 %7, 62
  %9 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %3, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 1
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.15* dereferenceable(2)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.15*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.15* %1, %class.ap_private.15** %4, align 8
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = load %class.ap_private.15*, %class.ap_private.15** %4, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %5, %class.ap_private.15* dereferenceable(2) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi16ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.15* dereferenceable(2)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.15*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.15* %1, %class.ap_private.15** %4, align 8
  %7 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %20, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = load %class.ap_private.15*, %class.ap_private.15** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EE8get_pValEi(%class.ap_private.15* %12, i32 %13)
  %15 = zext i16 %14 to i64
  %16 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %7, i32 0, i32 0
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 %18
  store i64 %15, i64* %19, align 8
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %8

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %32, %23
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 2
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %30
  store i64 0, i64* %31, align 8
  br label %32

32:                                               ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %24

35:                                               ; preds = %24
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i16 @_ZNK10ap_privateILi16ELb0ELb1EE8get_pValEi(%class.ap_private.15*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.15*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.15* %0, %class.ap_private.15** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.15*, %class.ap_private.15** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.15, %class.ap_private.15* %5, i32 0, i32 0
  %7 = load i16, i16* %6, align 2
  ret i16 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi64ELb1EEC2Ev(%struct.ap_int_base.31*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.31*, align 8
  store %struct.ap_int_base.31* %0, %struct.ap_int_base.31** %2, align 8
  %3 = load %struct.ap_int_base.31*, %struct.ap_int_base.31** %2, align 8
  %4 = bitcast %struct.ap_int_base.31* %3 to %struct.ssdm_int_sim.32*
  call void @_ZN12ssdm_int_simILi64ELb1EEC2Ev(%struct.ssdm_int_sim.32* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %class.ap_private.33* @_ZN10ap_privateILi64ELb1ELb1EEaSEi(%class.ap_private.33*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.33*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.33* %0, %class.ap_private.33** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.33*, %class.ap_private.33** %3, align 8
  call void @_ZN10ap_privateILi64ELb1ELb1EE10set_canaryEv(%class.ap_private.33* %5)
  %6 = load i32, i32* %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %class.ap_private.33, %class.ap_private.33* %5, i32 0, i32 0
  store i64 %7, i64* %8, align 8
  call void @_ZNV10ap_privateILi64ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.33* %5)
  call void @_ZN10ap_privateILi64ELb1ELb1EE12check_canaryEv(%class.ap_private.33* %5)
  ret %class.ap_private.33* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi64ELb1EEC2Ev(%struct.ssdm_int_sim.32*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.32*, align 8
  store %struct.ssdm_int_sim.32* %0, %struct.ssdm_int_sim.32** %2, align 8
  %3 = load %struct.ssdm_int_sim.32*, %struct.ssdm_int_sim.32** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.32, %struct.ssdm_int_sim.32* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi64ELb1ELb1EEC2Ev(%class.ap_private.33* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi64ELb1ELb1EEC2Ev(%class.ap_private.33*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  call void @_ZN10ap_privateILi64ELb1ELb1EE10set_canaryEv(%class.ap_private.33* %3)
  call void @_ZNV10ap_privateILi64ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.33* %3)
  call void @_ZN10ap_privateILi64ELb1ELb1EE12check_canaryEv(%class.ap_private.33* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi64ELb1ELb1EE10set_canaryEv(%class.ap_private.33*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi64ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.33*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.33, %class.ap_private.33* %3, i32 0, i32 0
  %5 = load volatile i64, i64* %4, align 8
  %6 = shl i64 %5, 0
  %7 = ashr i64 %6, 0
  %8 = getelementptr inbounds %class.ap_private.33, %class.ap_private.33* %3, i32 0, i32 0
  store volatile i64 %7, i64* %8, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb1EEC2ILi64ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.28*, %struct.ap_int_base.31* dereferenceable(8)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.28*, align 8
  %4 = alloca %struct.ap_int_base.31*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.28* %0, %struct.ap_int_base.28** %3, align 8
  store %struct.ap_int_base.31* %1, %struct.ap_int_base.31** %4, align 8
  %7 = load %struct.ap_int_base.28*, %struct.ap_int_base.28** %3, align 8
  %8 = bitcast %struct.ap_int_base.28* %7 to %struct.ssdm_int_sim.29*
  call void @_ZN12ssdm_int_simILi128ELb1EEC2Ev(%struct.ssdm_int_sim.29* %8)
  %9 = load %struct.ap_int_base.31*, %struct.ap_int_base.31** %4, align 8
  %10 = bitcast %struct.ap_int_base.31* %9 to %struct.ssdm_int_sim.32*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.32, %struct.ssdm_int_sim.32* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int_base.28* %7 to %struct.ssdm_int_sim.29*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %12, i32 0, i32 0
  %14 = invoke dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSILi64ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %13, %class.ap_private.33* dereferenceable(8) %11)
          to label %15 unwind label %16

15:                                               ; preds = %2
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %5, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %6, align 4
  %20 = bitcast %struct.ap_int_base.28* %7 to %struct.ssdm_int_sim.29*
  call void @_ZN12ssdm_int_simILi128ELb1EED2Ev(%struct.ssdm_int_sim.29* %20) #3
  br label %21

21:                                               ; preds = %16
  %22 = load i8*, i8** %5, align 8
  %23 = load i32, i32* %6, align 4
  %24 = insertvalue { i8*, i32 } undef, i8* %22, 0
  %25 = insertvalue { i8*, i32 } %24, i32 %23, 1
  resume { i8*, i32 } %25
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb1EEC2Ev(%struct.ap_int_base.28*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.28*, align 8
  store %struct.ap_int_base.28* %0, %struct.ap_int_base.28** %2, align 8
  %3 = load %struct.ap_int_base.28*, %struct.ap_int_base.28** %2, align 8
  %4 = bitcast %struct.ap_int_base.28* %3 to %struct.ssdm_int_sim.29*
  call void @_ZN12ssdm_int_simILi128ELb1EEC2Ev(%struct.ssdm_int_sim.29* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi128ELb1ELb0EEmlILi128ELb1EEENS0_5RTypeIXT_EXT0_EE4multERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* noalias sret, %class.ap_private.30*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.30*, align 8
  %6 = alloca %class.ap_private.30*, align 8
  %7 = alloca i1, align 1
  %8 = alloca i8*
  %9 = alloca i32
  %10 = bitcast %class.ap_private.39* %0 to i8*
  store i8* %10, i8** %4, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %5, align 8
  store %class.ap_private.30* %2, %class.ap_private.30** %6, align 8
  %11 = load %class.ap_private.30*, %class.ap_private.30** %5, align 8
  store i1 false, i1* %7, align 1
  call void @_ZN10ap_privateILi256ELb1ELb0EEC2ILi128ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.39* %0, %class.ap_private.30* dereferenceable(16) %11)
  %12 = load %class.ap_private.30*, %class.ap_private.30** %6, align 8
  %13 = invoke dereferenceable(32) %class.ap_private.39* @_ZN10ap_privateILi256ELb1ELb0EEmLILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* %0, %class.ap_private.30* dereferenceable(16) %12)
          to label %14 unwind label %16

14:                                               ; preds = %3
  store i1 true, i1* %7, align 1
  %15 = load i1, i1* %7, align 1
  br i1 %15, label %21, label %20

16:                                               ; preds = %3
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %8, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %9, align 4
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %0) #3
  br label %22

20:                                               ; preds = %14
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %0) #3
  br label %21

21:                                               ; preds = %20, %14
  ret void

22:                                               ; preds = %16
  %23 = load i8*, i8** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSILi256ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.39* dereferenceable(32)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.39* %1, %class.ap_private.39** %4, align 8
  %5 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %6 = load %class.ap_private.39*, %class.ap_private.39** %4, align 8
  call void @_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi256ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %5, %class.ap_private.39* dereferenceable(32) %6)
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %5)
  ret %class.ap_private.30* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  invoke void @_ZN10ap_privateILi256ELb1ELb0EE12check_canaryEv(%class.ap_private.39* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi128EEC2ILi128ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int.27*, %struct.ap_int_base.28* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.27*, align 8
  %4 = alloca %struct.ap_int_base.28*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.27* %0, %struct.ap_int.27** %3, align 8
  store %struct.ap_int_base.28* %1, %struct.ap_int_base.28** %4, align 8
  %7 = load %struct.ap_int.27*, %struct.ap_int.27** %3, align 8
  %8 = bitcast %struct.ap_int.27* %7 to %struct.ap_int_base.28*
  call void @_ZN11ap_int_baseILi128ELb1EEC2Ev(%struct.ap_int_base.28* %8)
  %9 = load %struct.ap_int_base.28*, %struct.ap_int_base.28** %4, align 8
  %10 = bitcast %struct.ap_int_base.28* %9 to %struct.ssdm_int_sim.29*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int.27* %7 to %struct.ap_int_base.28*
  %13 = bitcast %struct.ap_int_base.28* %12 to %struct.ssdm_int_sim.29*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %13, i32 0, i32 0
  %15 = invoke dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSERKS0_(%class.ap_private.30* %14, %class.ap_private.30* dereferenceable(16) %11)
          to label %16 unwind label %17

16:                                               ; preds = %2
  ret void

17:                                               ; preds = %2
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %5, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %6, align 4
  %21 = bitcast %struct.ap_int.27* %7 to %struct.ap_int_base.28*
  call void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28* %21) #3
  br label %22

22:                                               ; preds = %17
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %6, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi128ELb1EED2Ev(%struct.ap_int_base.28*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.28*, align 8
  store %struct.ap_int_base.28* %0, %struct.ap_int_base.28** %2, align 8
  %3 = load %struct.ap_int_base.28*, %struct.ap_int_base.28** %2, align 8
  %4 = bitcast %struct.ap_int_base.28* %3 to %struct.ssdm_int_sim.29*
  call void @_ZN12ssdm_int_simILi128ELb1EED2Ev(%struct.ssdm_int_sim.29* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi128ELb1EEC2Ev(%struct.ssdm_int_sim.29*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.29*, align 8
  store %struct.ssdm_int_sim.29* %0, %struct.ssdm_int_sim.29** %2, align 8
  %3 = load %struct.ssdm_int_sim.29*, %struct.ssdm_int_sim.29** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.29, %struct.ssdm_int_sim.29* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi128ELb1ELb0EEC2Ev(%class.ap_private.30* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSILi64ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.33* dereferenceable(8)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.33* %1, %class.ap_private.33** %4, align 8
  %5 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %6 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  call void @_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %5, %class.ap_private.33* dereferenceable(8) %6)
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %5)
  ret %class.ap_private.30* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EEC2Ev(%class.ap_private.30*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  call void @_ZN10ap_privateILi128ELb1ELb0EE10set_canaryEv(%class.ap_private.30* %3)
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %3)
  call void @_ZN10ap_privateILi128ELb1ELb0EE12check_canaryEv(%class.ap_private.30* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE10set_canaryEv(%class.ap_private.30*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 0
  %8 = ashr i64 %7, 0
  %9 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %3, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 1
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.33* dereferenceable(8)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.33* %1, %class.ap_private.33** %4, align 8
  %5 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %6 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  call void @_ZN10ap_privateILi128ELb1ELb0EE6cpSextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %5, %class.ap_private.33* dereferenceable(8) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE6cpSextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.33* dereferenceable(8)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.33*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.33* %1, %class.ap_private.33** %4, align 8
  %7 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %8 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  %9 = call zeroext i1 @_ZNK10ap_privateILi64ELb1ELb1EE10isNegativeEv(%class.ap_private.33* %8)
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  call void @_ZN10ap_privateILi128ELb1ELb0EE6cpZextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30* %7, %class.ap_private.33* dereferenceable(8) %11)
  br label %50

12:                                               ; preds = %2
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %13

13:                                               ; preds = %24, %12
  %14 = load i32, i32* %6, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %27

16:                                               ; preds = %13
  %17 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  %18 = load i32, i32* %6, align 4
  %19 = call i64 @_ZNK10ap_privateILi64ELb1ELb1EE8get_pValEi(%class.ap_private.33* %17, i32 %18)
  %20 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 %22
  store i64 %19, i64* %23, align 8
  br label %24

24:                                               ; preds = %16
  %25 = load i32, i32* %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  br label %13

27:                                               ; preds = %13
  %28 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sub nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %31
  %33 = load i64, i64* %32, align 8
  store i64 %33, i64* %32, align 8
  br label %34

34:                                               ; preds = %42, %27
  %35 = load i32, i32* %6, align 4
  %36 = icmp slt i32 %35, 1
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %39 = load i32, i32* %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [2 x i64], [2 x i64]* %38, i64 0, i64 %40
  store i64 -1, i64* %41, align 8
  br label %42

42:                                               ; preds = %37
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %6, align 4
  br label %34

45:                                               ; preds = %34
  %46 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %47 = load i32, i32* %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [2 x i64], [2 x i64]* %46, i64 0, i64 %48
  store i64 -1, i64* %49, align 8
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %7)
  br label %50

50:                                               ; preds = %45, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi64ELb1ELb1EE10isNegativeEv(%class.ap_private.33*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.33*, align 8
  store %class.ap_private.33* %0, %class.ap_private.33** %2, align 8
  %3 = load %class.ap_private.33*, %class.ap_private.33** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.33, %class.ap_private.33* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = and i64 -9223372036854775808, %5
  %7 = icmp ne i64 %6, 0
  ret i1 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE6cpZextILi64ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.33* dereferenceable(8)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.33*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.33* %1, %class.ap_private.33** %4, align 8
  %7 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load %class.ap_private.33*, %class.ap_private.33** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i64 @_ZNK10ap_privateILi64ELb1ELb1EE8get_pValEi(%class.ap_private.33* %12, i32 %13)
  %15 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 %17
  store i64 %14, i64* %18, align 8
  br label %19

19:                                               ; preds = %11
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %8

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %24, 2
  br i1 %25, label %26, label %34

26:                                               ; preds = %23
  %27 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %7, i32 0, i32 0
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 %29
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %26
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %23

34:                                               ; preds = %23
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi64ELb1ELb1EE8get_pValEi(%class.ap_private.33*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.33*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.33* %0, %class.ap_private.33** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.33*, %class.ap_private.33** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.33, %class.ap_private.33* %5, i32 0, i32 0
  %7 = load i64, i64* %6, align 8
  ret i64 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EEC2ILi128ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %5 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  call void @_ZN10ap_privateILi256ELb1ELb0EE10set_canaryEv(%class.ap_private.39* %5)
  %6 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %7 = call dereferenceable(32) %class.ap_private.39* @_ZN10ap_privateILi256ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* %5, %class.ap_private.30* dereferenceable(16) %6)
  call void @_ZN10ap_privateILi256ELb1ELb0EE12check_canaryEv(%class.ap_private.39* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(32) %class.ap_private.39* @_ZN10ap_privateILi256ELb1ELb0EEmLILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.39*, align 8
  %5 = alloca %class.ap_private.30*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %class.ap_private.39, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*
  %11 = alloca i32
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %4, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %5, align 8
  %19 = load %class.ap_private.39*, %class.ap_private.39** %4, align 8
  %20 = call i32 @_ZNK10ap_privateILi256ELb1ELb0EE13getActiveBitsEv(%class.ap_private.39* %19)
  store i32 %20, i32* %6, align 4
  %21 = load i32, i32* %6, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %2
  br label %29

24:                                               ; preds = %2
  %25 = load i32, i32* %6, align 4
  %26 = sub i32 %25, 1
  %27 = call i32 @_ZN10ap_privateILi256ELb1ELb0EE9whichWordEj(i32 %26)
  %28 = add i32 %27, 1
  br label %29

29:                                               ; preds = %24, %23
  %30 = phi i32 [ 0, %23 ], [ %28, %24 ]
  store i32 %30, i32* %7, align 4
  %31 = load i32, i32* %7, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %34, label %33

33:                                               ; preds = %29
  store %class.ap_private.39* %19, %class.ap_private.39** %3, align 8
  br label %121

34:                                               ; preds = %29
  %35 = load %class.ap_private.30*, %class.ap_private.30** %5, align 8
  call void @_ZN10ap_privateILi256ELb1ELb0EEC2ILi128ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.39* %8, %class.ap_private.30* dereferenceable(16) %35)
  %36 = invoke i32 @_ZNK10ap_privateILi256ELb1ELb0EE13getActiveBitsEv(%class.ap_private.39* %8)
          to label %37 unwind label %53

37:                                               ; preds = %34
  store i32 %36, i32* %9, align 4
  %38 = load i32, i32* %9, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %41, label %40

40:                                               ; preds = %37
  br label %47

41:                                               ; preds = %37
  %42 = load i32, i32* %9, align 4
  %43 = sub i32 %42, 1
  %44 = invoke i32 @_ZN10ap_privateILi256ELb1ELb0EE9whichWordEj(i32 %43)
          to label %45 unwind label %53

45:                                               ; preds = %41
  %46 = add i32 %44, 1
  br label %47

47:                                               ; preds = %45, %40
  %48 = phi i32 [ 0, %40 ], [ %46, %45 ]
  store i32 %48, i32* %12, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %57, label %51

51:                                               ; preds = %47
  invoke void @_ZN10ap_privateILi256ELb1ELb0EE5clearEv(%class.ap_private.39* %19)
          to label %52 unwind label %53

52:                                               ; preds = %51
  store %class.ap_private.39* %19, %class.ap_private.39** %3, align 8
  store i32 1, i32* %13, align 4
  br label %120

53:                                               ; preds = %116, %93, %81, %74, %71, %57, %51, %41, %34
  %54 = landingpad { i8*, i32 }
          cleanup
  %55 = extractvalue { i8*, i32 } %54, 0
  store i8* %55, i8** %10, align 8
  %56 = extractvalue { i8*, i32 } %54, 1
  store i32 %56, i32* %11, align 4
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %8) #3
  br label %123

57:                                               ; preds = %47
  %58 = load i32, i32* %12, align 4
  %59 = load i32, i32* %7, align 4
  %60 = add i32 %58, %59
  store i32 %60, i32* %14, align 4
  %61 = load i32, i32* %14, align 4
  %62 = zext i32 %61 to i64
  %63 = mul i64 %62, 8
  %64 = call noalias i8* @malloc(i64 %63) #3
  %65 = bitcast i8* %64 to i64*
  store i64* %65, i64** %15, align 8
  %66 = load i64*, i64** %15, align 8
  %67 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %19, i32 0, i32 0
  %68 = getelementptr inbounds [4 x i64], [4 x i64]* %67, i64 0, i64 0
  %69 = load i32, i32* %7, align 4
  %70 = invoke i64* @_ZN10ap_privateILi256ELb1ELb0EE8get_pValEv(%class.ap_private.39* %8)
          to label %71 unwind label %53

71:                                               ; preds = %57
  %72 = load i32, i32* %12, align 4
  %73 = load i32, i32* %14, align 4
  invoke void @_ZN14ap_private_opsL3mulEPmPKmjS2_jj(i64* %66, i64* %68, i32 %69, i64* %70, i32 %72, i32 %73)
          to label %74 unwind label %53

74:                                               ; preds = %71
  invoke void @_ZN10ap_privateILi256ELb1ELb0EE5clearEv(%class.ap_private.39* %19)
          to label %75 unwind label %53

75:                                               ; preds = %74
  %76 = load i32, i32* %14, align 4
  %77 = icmp uge i32 %76, 4
  br i1 %77, label %78, label %79

78:                                               ; preds = %75
  br label %81

79:                                               ; preds = %75
  %80 = load i32, i32* %14, align 4
  br label %81

81:                                               ; preds = %79, %78
  %82 = phi i32 [ 4, %78 ], [ %80, %79 ]
  store i32 %82, i32* %16, align 4
  %83 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %19, i32 0, i32 0
  %84 = getelementptr inbounds [4 x i64], [4 x i64]* %83, i64 0, i64 0
  %85 = bitcast i64* %84 to i8*
  %86 = load i64*, i64** %15, align 8
  %87 = bitcast i64* %86 to i8*
  %88 = load i32, i32* %16, align 4
  %89 = mul i32 %88, 8
  %90 = zext i32 %89 to i64
  %91 = call i8* @memcpy(i8* %85, i8* %87, i64 %90)
  %92 = invoke zeroext i1 @_ZNK10ap_privateILi256ELb1ELb0EE10isNegativeEv(%class.ap_private.39* %19)
          to label %93 unwind label %53

93:                                               ; preds = %81
  %94 = zext i1 %92 to i32
  %95 = load %class.ap_private.30*, %class.ap_private.30** %5, align 8
  %96 = invoke zeroext i1 @_ZNK10ap_privateILi128ELb1ELb0EE10isNegativeEv(%class.ap_private.30* %95)
          to label %97 unwind label %53

97:                                               ; preds = %93
  %98 = zext i1 %96 to i32
  %99 = xor i32 %94, %98
  %100 = icmp ne i32 %99, 0
  %101 = zext i1 %100 to i64
  %102 = select i1 %100, i64 -1, i64 0
  store i64 %102, i64* %17, align 8
  %103 = load i32, i32* %16, align 4
  store i32 %103, i32* %18, align 4
  br label %104

104:                                              ; preds = %113, %97
  %105 = load i32, i32* %18, align 4
  %106 = icmp slt i32 %105, 4
  br i1 %106, label %107, label %116

107:                                              ; preds = %104
  %108 = load i64, i64* %17, align 8
  %109 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %19, i32 0, i32 0
  %110 = load i32, i32* %18, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [4 x i64], [4 x i64]* %109, i64 0, i64 %111
  store i64 %108, i64* %112, align 8
  br label %113

113:                                              ; preds = %107
  %114 = load i32, i32* %18, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %18, align 4
  br label %104

116:                                              ; preds = %104
  invoke void @_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.39* %19)
          to label %117 unwind label %53

117:                                              ; preds = %116
  %118 = load i64*, i64** %15, align 8
  %119 = bitcast i64* %118 to i8*
  call void @free(i8* %119) #3
  store %class.ap_private.39* %19, %class.ap_private.39** %3, align 8
  store i32 1, i32* %13, align 4
  br label %120

120:                                              ; preds = %117, %52
  call void @_ZN10ap_privateILi256ELb1ELb0EED2Ev(%class.ap_private.39* %8) #3
  br label %121

121:                                              ; preds = %120, %33
  %122 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  ret %class.ap_private.39* %122

123:                                              ; preds = %53
  %124 = load i8*, i8** %10, align 8
  %125 = load i32, i32* %11, align 4
  %126 = insertvalue { i8*, i32 } undef, i8* %124, 0
  %127 = insertvalue { i8*, i32 } %126, i32 %125, 1
  resume { i8*, i32 } %127
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE10set_canaryEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(32) %class.ap_private.39* @_ZN10ap_privateILi256ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %5 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  %6 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  call void @_ZN10ap_privateILi256ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* %5, %class.ap_private.30* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.39* %5)
  ret %class.ap_private.39* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE12check_canaryEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %5 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  %6 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  call void @_ZN10ap_privateILi256ELb1ELb0EE6cpSextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* %5, %class.ap_private.30* dereferenceable(16) %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %3, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i64], [4 x i64]* %4, i64 0, i64 3
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 0
  %8 = ashr i64 %7, 0
  %9 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %3, i32 0, i32 0
  %10 = getelementptr inbounds [4 x i64], [4 x i64]* %9, i64 0, i64 3
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE6cpSextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %7 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  %8 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %9 = call zeroext i1 @_ZNK10ap_privateILi128ELb1ELb0EE10isNegativeEv(%class.ap_private.30* %8)
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  call void @_ZN10ap_privateILi256ELb1ELb0EE6cpZextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39* %7, %class.ap_private.30* dereferenceable(16) %11)
  br label %50

12:                                               ; preds = %2
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %13

13:                                               ; preds = %24, %12
  %14 = load i32, i32* %6, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %27

16:                                               ; preds = %13
  %17 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %18 = load i32, i32* %6, align 4
  %19 = call i64 @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEi(%class.ap_private.30* %17, i32 %18)
  %20 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x i64], [4 x i64]* %20, i64 0, i64 %22
  store i64 %19, i64* %23, align 8
  br label %24

24:                                               ; preds = %16
  %25 = load i32, i32* %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  br label %13

27:                                               ; preds = %13
  %28 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sub nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i64], [4 x i64]* %28, i64 0, i64 %31
  %33 = load i64, i64* %32, align 8
  store i64 %33, i64* %32, align 8
  br label %34

34:                                               ; preds = %42, %27
  %35 = load i32, i32* %6, align 4
  %36 = icmp slt i32 %35, 3
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %39 = load i32, i32* %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [4 x i64], [4 x i64]* %38, i64 0, i64 %40
  store i64 -1, i64* %41, align 8
  br label %42

42:                                               ; preds = %37
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %6, align 4
  br label %34

45:                                               ; preds = %34
  %46 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %47 = load i32, i32* %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [4 x i64], [4 x i64]* %46, i64 0, i64 %48
  store i64 -1, i64* %49, align 8
  call void @_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.39* %7)
  br label %50

50:                                               ; preds = %45, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi128ELb1ELb0EE10isNegativeEv(%class.ap_private.30*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, -9223372036854775808
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE6cpZextILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.39*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %7 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i64 @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEi(%class.ap_private.30* %12, i32 %13)
  %15 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x i64], [4 x i64]* %15, i64 0, i64 %17
  store i64 %14, i64* %18, align 8
  br label %19

19:                                               ; preds = %11
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %8

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %24, 4
  br i1 %25, label %26, label %34

26:                                               ; preds = %23
  %27 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %7, i32 0, i32 0
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x i64], [4 x i64]* %27, i64 0, i64 %29
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %26
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %23

34:                                               ; preds = %23
  call void @_ZNV10ap_privateILi256ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.39* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEi(%class.ap_private.30*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi256ELb1ELb0EE13getActiveBitsEv(%class.ap_private.39*) #4 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  %3 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %4 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %5 = call i32 @_ZNK10ap_privateILi256ELb1ELb0EE17countLeadingZerosEv(%class.ap_private.39* %4)
  %6 = sub i32 256, %5
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = load i32, i32* %3, align 4
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %9
  %13 = phi i32 [ %10, %9 ], [ 1, %11 ]
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZN10ap_privateILi256ELb1ELb0EE9whichWordEj(i32) #5 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = lshr i32 %3, 6
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi256ELb1ELb0EE5clearEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %3, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i64], [4 x i64]* %4, i64 0, i64 0
  %6 = bitcast i64* %5 to i8*
  %7 = call i8* @memset(i8* %6, i32 0, i64 32)
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline optnone uwtable
define internal void @_ZN14ap_private_opsL3mulEPmPKmjS2_jj(i64*, i64*, i32, i64*, i32, i32) #4 {
  %7 = alloca i64*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i32, align 4
  %20 = alloca i8, align 1
  %21 = alloca i64, align 8
  store i64* %0, i64** %7, align 8
  store i64* %1, i64** %8, align 8
  store i32 %2, i32* %9, align 4
  store i64* %3, i64** %10, align 8
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %22 = load i32, i32* %9, align 4
  %23 = icmp ugt i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %6
  br label %27

25:                                               ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 683, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @__PRETTY_FUNCTION__._ZN14ap_private_opsL3mulEPmPKmjS2_jj, i64 0, i64 0)) #13
  unreachable

26:                                               ; No predecessors!
  br label %27

27:                                               ; preds = %26, %24
  %28 = load i32, i32* %11, align 4
  %29 = icmp ugt i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  br label %33

31:                                               ; preds = %27
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 684, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @__PRETTY_FUNCTION__._ZN14ap_private_opsL3mulEPmPKmjS2_jj, i64 0, i64 0)) #13
  unreachable

32:                                               ; No predecessors!
  br label %33

33:                                               ; preds = %32, %30
  %34 = load i32, i32* %12, align 4
  %35 = load i32, i32* %9, align 4
  %36 = load i32, i32* %11, align 4
  %37 = add i32 %35, %36
  %38 = icmp uge i32 %34, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %33
  br label %42

40:                                               ; preds = %33
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i32 685, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @__PRETTY_FUNCTION__._ZN14ap_private_opsL3mulEPmPKmjS2_jj, i64 0, i64 0)) #13
  unreachable

41:                                               ; No predecessors!
  br label %42

42:                                               ; preds = %41, %39
  %43 = load i32, i32* %9, align 4
  %44 = load i32, i32* %12, align 4
  %45 = icmp ult i32 %43, %44
  br i1 %45, label %46, label %58

46:                                               ; preds = %42
  %47 = load i64*, i64** %7, align 8
  %48 = load i64*, i64** %8, align 8
  %49 = load i32, i32* %9, align 4
  %50 = load i64*, i64** %10, align 8
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = load i64, i64* %51, align 8
  %53 = call i64 @_ZN14ap_private_opsL5mul_1EPmPKmjm(i64* %47, i64* %48, i32 %49, i64 %52)
  %54 = load i64*, i64** %7, align 8
  %55 = load i32, i32* %9, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i64, i64* %54, i64 %56
  store i64 %53, i64* %57, align 8
  br label %58

58:                                               ; preds = %46, %42
  store i32 1, i32* %13, align 4
  br label %59

59:                                               ; preds = %214, %58
  %60 = load i32, i32* %13, align 4
  %61 = load i32, i32* %11, align 4
  %62 = icmp ult i32 %60, %61
  br i1 %62, label %63, label %217

63:                                               ; preds = %59
  %64 = load i64*, i64** %10, align 8
  %65 = load i32, i32* %13, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i64, i64* %64, i64 %66
  %68 = load i64, i64* %67, align 8
  %69 = and i64 %68, 4294967295
  store i64 %69, i64* %14, align 8
  %70 = load i64*, i64** %10, align 8
  %71 = load i32, i32* %13, align 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i64, i64* %70, i64 %72
  %74 = load i64, i64* %73, align 8
  %75 = lshr i64 %74, 32
  store i64 %75, i64* %15, align 8
  store i64 0, i64* %16, align 8
  store i64 0, i64* %17, align 8
  store i64 0, i64* %18, align 8
  store i32 0, i32* %19, align 4
  br label %76

76:                                               ; preds = %196, %63
  %77 = load i32, i32* %19, align 4
  %78 = load i32, i32* %9, align 4
  %79 = icmp ult i32 %77, %78
  br i1 %79, label %80, label %199

80:                                               ; preds = %76
  %81 = load i64*, i64** %8, align 8
  %82 = load i32, i32* %19, align 4
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i64, i64* %81, i64 %83
  %85 = load i64, i64* %84, align 8
  %86 = and i64 %85, 4294967295
  store i64 %86, i64* %17, align 8
  %87 = load i64*, i64** %8, align 8
  %88 = load i32, i32* %19, align 4
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i64, i64* %87, i64 %89
  %91 = load i64, i64* %90, align 8
  %92 = lshr i64 %91, 32
  store i64 %92, i64* %18, align 8
  store i8 0, i8* %20, align 1
  %93 = load i64, i64* %16, align 8
  %94 = load i64, i64* %17, align 8
  %95 = load i64, i64* %14, align 8
  %96 = mul i64 %94, %95
  %97 = add i64 %93, %96
  store i64 %97, i64* %21, align 8
  %98 = load i64, i64* %21, align 8
  %99 = load i64, i64* %16, align 8
  %100 = icmp ult i64 %98, %99
  %101 = zext i1 %100 to i64
  %102 = select i1 %100, i32 1, i32 0
  %103 = trunc i32 %102 to i8
  store i8 %103, i8* %20, align 1
  %104 = load i8, i8* %20, align 1
  %105 = icmp ne i8 %104, 0
  %106 = zext i1 %105 to i64
  %107 = select i1 %105, i64 4294967296, i64 0
  %108 = load i64, i64* %18, align 8
  %109 = load i64, i64* %14, align 8
  %110 = mul i64 %108, %109
  %111 = add i64 %107, %110
  %112 = load i64, i64* %21, align 8
  %113 = lshr i64 %112, 32
  %114 = add i64 %111, %113
  store i64 %114, i64* %16, align 8
  %115 = load i64, i64* %16, align 8
  %116 = icmp ne i64 %115, 0
  br i1 %116, label %121, label %117

117:                                              ; preds = %80
  %118 = load i8, i8* %20, align 1
  %119 = icmp ne i8 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %117
  br label %127

121:                                              ; preds = %117, %80
  %122 = load i64, i64* %16, align 8
  %123 = icmp ne i64 %122, 0
  %124 = xor i1 %123, true
  %125 = zext i1 %124 to i64
  %126 = select i1 %124, i32 2, i32 0
  br label %127

127:                                              ; preds = %121, %120
  %128 = phi i32 [ 1, %120 ], [ %126, %121 ]
  %129 = trunc i32 %128 to i8
  store i8 %129, i8* %20, align 1
  %130 = load i64, i64* %17, align 8
  %131 = load i64, i64* %15, align 8
  %132 = mul i64 %130, %131
  %133 = and i64 %132, 4294967295
  %134 = load i64, i64* %16, align 8
  %135 = add i64 %134, %133
  store i64 %135, i64* %16, align 8
  %136 = load i64, i64* %16, align 8
  %137 = shl i64 %136, 32
  %138 = load i64, i64* %21, align 8
  %139 = and i64 %138, 4294967295
  %140 = or i64 %137, %139
  store i64 %140, i64* %21, align 8
  %141 = load i32, i32* %13, align 4
  %142 = load i32, i32* %19, align 4
  %143 = add i32 %141, %142
  %144 = load i32, i32* %12, align 4
  %145 = icmp ult i32 %143, %144
  br i1 %145, label %146, label %156

146:                                              ; preds = %127
  %147 = load i64, i64* %21, align 8
  %148 = load i64*, i64** %7, align 8
  %149 = load i32, i32* %13, align 4
  %150 = load i32, i32* %19, align 4
  %151 = add i32 %149, %150
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i64, i64* %148, i64 %152
  %154 = load i64, i64* %153, align 8
  %155 = add i64 %154, %147
  store i64 %155, i64* %153, align 8
  br label %156

156:                                              ; preds = %146, %127
  %157 = load i64, i64* %16, align 8
  %158 = icmp ne i64 %157, 0
  br i1 %158, label %163, label %159

159:                                              ; preds = %156
  %160 = load i8, i8* %20, align 1
  %161 = zext i8 %160 to i32
  %162 = icmp ne i32 %161, 2
  br i1 %162, label %167, label %163

163:                                              ; preds = %159, %156
  %164 = load i8, i8* %20, align 1
  %165 = zext i8 %164 to i32
  %166 = icmp eq i32 %165, 1
  br label %167

167:                                              ; preds = %163, %159
  %168 = phi i1 [ true, %159 ], [ %166, %163 ]
  %169 = zext i1 %168 to i64
  %170 = select i1 %168, i64 4294967296, i64 0
  %171 = load i64, i64* %16, align 8
  %172 = lshr i64 %171, 32
  %173 = add i64 %170, %172
  %174 = load i64*, i64** %7, align 8
  %175 = load i32, i32* %13, align 4
  %176 = load i32, i32* %19, align 4
  %177 = add i32 %175, %176
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds i64, i64* %174, i64 %178
  %180 = load i64, i64* %179, align 8
  %181 = load i64, i64* %21, align 8
  %182 = icmp ult i64 %180, %181
  %183 = zext i1 %182 to i64
  %184 = select i1 %182, i32 1, i32 0
  %185 = sext i32 %184 to i64
  %186 = add i64 %173, %185
  %187 = load i64, i64* %17, align 8
  %188 = load i64, i64* %15, align 8
  %189 = mul i64 %187, %188
  %190 = lshr i64 %189, 32
  %191 = add i64 %186, %190
  %192 = load i64, i64* %18, align 8
  %193 = load i64, i64* %15, align 8
  %194 = mul i64 %192, %193
  %195 = add i64 %191, %194
  store i64 %195, i64* %16, align 8
  br label %196

196:                                              ; preds = %167
  %197 = load i32, i32* %19, align 4
  %198 = add i32 %197, 1
  store i32 %198, i32* %19, align 4
  br label %76

199:                                              ; preds = %76
  %200 = load i32, i32* %13, align 4
  %201 = load i32, i32* %9, align 4
  %202 = add i32 %200, %201
  %203 = load i32, i32* %12, align 4
  %204 = icmp ult i32 %202, %203
  br i1 %204, label %205, label %213

205:                                              ; preds = %199
  %206 = load i64, i64* %16, align 8
  %207 = load i64*, i64** %7, align 8
  %208 = load i32, i32* %13, align 4
  %209 = load i32, i32* %9, align 4
  %210 = add i32 %208, %209
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds i64, i64* %207, i64 %211
  store i64 %206, i64* %212, align 8
  br label %213

213:                                              ; preds = %205, %199
  br label %214

214:                                              ; preds = %213
  %215 = load i32, i32* %13, align 4
  %216 = add i32 %215, 1
  store i32 %216, i32* %13, align 4
  br label %59

217:                                              ; preds = %59
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZN10ap_privateILi256ELb1ELb0EE8get_pValEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %3, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i64], [4 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi256ELb1ELb0EE10isNegativeEv(%class.ap_private.39*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %3 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %3, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i64], [4 x i64]* %4, i64 0, i64 3
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, -9223372036854775808
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi256ELb1ELb0EE17countLeadingZerosEv(%class.ap_private.39*) #4 comdat align 2 {
  %2 = alloca %class.ap_private.39*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %2, align 8
  %5 = load %class.ap_private.39*, %class.ap_private.39** %2, align 8
  %6 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %5, i32 0, i32 0
  %7 = getelementptr inbounds [4 x i64], [4 x i64]* %6, i64 0, i64 3
  %8 = load i64, i64* %7, align 8
  %9 = call i32 @_ZN14ap_private_opsL20CountLeadingZeros_64Em(i64 %8)
  store i32 %9, i32* %3, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp uge i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %1
  %13 = load i32, i32* %3, align 4
  %14 = sub i32 %13, 0
  store i32 %14, i32* %3, align 4
  br label %15

15:                                               ; preds = %12, %1
  %16 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %5, i32 0, i32 0
  %17 = getelementptr inbounds [4 x i64], [4 x i64]* %16, i64 0, i64 3
  %18 = load i64, i64* %17, align 8
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %50, label %20

20:                                               ; preds = %15
  store i32 3, i32* %4, align 4
  br label %21

21:                                               ; preds = %46, %20
  %22 = load i32, i32* %4, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %49

24:                                               ; preds = %21
  %25 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %5, i32 0, i32 0
  %26 = load i32, i32* %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [4 x i64], [4 x i64]* %25, i64 0, i64 %28
  %30 = load i64, i64* %29, align 8
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %24
  %33 = load i32, i32* %3, align 4
  %34 = add i32 %33, 64
  store i32 %34, i32* %3, align 4
  br label %45

35:                                               ; preds = %24
  %36 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %5, i32 0, i32 0
  %37 = load i32, i32* %4, align 4
  %38 = sub nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i64], [4 x i64]* %36, i64 0, i64 %39
  %41 = load i64, i64* %40, align 8
  %42 = call i32 @_ZN14ap_private_opsL20CountLeadingZeros_64Em(i64 %41)
  %43 = load i32, i32* %3, align 4
  %44 = add i32 %43, %42
  store i32 %44, i32* %3, align 4
  br label %49

45:                                               ; preds = %32
  br label %46

46:                                               ; preds = %45
  %47 = load i32, i32* %4, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, i32* %4, align 4
  br label %21

49:                                               ; preds = %35, %21
  br label %50

50:                                               ; preds = %49, %15
  %51 = load i32, i32* %3, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_ZN14ap_private_opsL20CountLeadingZeros_64Em(i64) #5 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store i64 %0, i64* %3, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %1
  store i32 64, i32* %2, align 4
  br label %13

8:                                                ; preds = %1
  %9 = load i64, i64* %3, align 8
  %ctlz.sh = lshr i64 %9, 1
  %ctlz.step = or i64 %9, %ctlz.sh
  %ctlz.sh1 = lshr i64 %ctlz.step, 2
  %ctlz.step2 = or i64 %ctlz.step, %ctlz.sh1
  %ctlz.sh3 = lshr i64 %ctlz.step2, 4
  %ctlz.step4 = or i64 %ctlz.step2, %ctlz.sh3
  %ctlz.sh5 = lshr i64 %ctlz.step4, 8
  %ctlz.step6 = or i64 %ctlz.step4, %ctlz.sh5
  %ctlz.sh7 = lshr i64 %ctlz.step6, 16
  %ctlz.step8 = or i64 %ctlz.step6, %ctlz.sh7
  %ctlz.sh9 = lshr i64 %ctlz.step8, 32
  %ctlz.step10 = or i64 %ctlz.step8, %ctlz.sh9
  %10 = xor i64 %ctlz.step10, -1
  %cppop.and1 = and i64 %10, 6148914691236517205
  %ctpop.sh = lshr i64 %10, 1
  %cppop.and2 = and i64 %ctpop.sh, 6148914691236517205
  %ctpop.step = add i64 %cppop.and1, %cppop.and2
  %cppop.and111 = and i64 %ctpop.step, 3689348814741910323
  %ctpop.sh12 = lshr i64 %ctpop.step, 2
  %cppop.and213 = and i64 %ctpop.sh12, 3689348814741910323
  %ctpop.step14 = add i64 %cppop.and111, %cppop.and213
  %cppop.and115 = and i64 %ctpop.step14, 1085102592571150095
  %ctpop.sh16 = lshr i64 %ctpop.step14, 4
  %cppop.and217 = and i64 %ctpop.sh16, 1085102592571150095
  %ctpop.step18 = add i64 %cppop.and115, %cppop.and217
  %cppop.and119 = and i64 %ctpop.step18, 71777214294589695
  %ctpop.sh20 = lshr i64 %ctpop.step18, 8
  %cppop.and221 = and i64 %ctpop.sh20, 71777214294589695
  %ctpop.step22 = add i64 %cppop.and119, %cppop.and221
  %cppop.and123 = and i64 %ctpop.step22, 281470681808895
  %ctpop.sh24 = lshr i64 %ctpop.step22, 16
  %cppop.and225 = and i64 %ctpop.sh24, 281470681808895
  %ctpop.step26 = add i64 %cppop.and123, %cppop.and225
  %cppop.and127 = and i64 %ctpop.step26, 4294967295
  %ctpop.sh28 = lshr i64 %ctpop.step26, 32
  %cppop.and229 = and i64 %ctpop.sh28, 4294967295
  %ctpop.step30 = add i64 %cppop.and127, %cppop.and229
  %ctpop.part = add i64 %ctpop.step30, 0
  %11 = trunc i64 %ctpop.part to i32
  store i32 %11, i32* %4, align 4
  %12 = load i32, i32* %4, align 4
  store i32 %12, i32* %2, align 4
  br label %13

13:                                               ; preds = %8, %7
  %14 = load i32, i32* %2, align 4
  ret i32 %14
}

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #10

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @_ZN14ap_private_opsL5mul_1EPmPKmjm(i64*, i64*, i32, i64) #5 {
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i8, align 1
  store i64* %0, i64** %5, align 8
  store i64* %1, i64** %6, align 8
  store i32 %2, i32* %7, align 4
  store i64 %3, i64* %8, align 8
  %16 = load i64, i64* %8, align 8
  %17 = and i64 %16, 4294967295
  store i64 %17, i64* %9, align 8
  %18 = load i64, i64* %8, align 8
  %19 = lshr i64 %18, 32
  store i64 %19, i64* %10, align 8
  store i64 0, i64* %11, align 8
  store i32 0, i32* %12, align 4
  br label %20

20:                                               ; preds = %131, %4
  %21 = load i32, i32* %12, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp ult i32 %21, %22
  br i1 %23, label %24, label %134

24:                                               ; preds = %20
  %25 = load i64*, i64** %6, align 8
  %26 = load i32, i32* %12, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i64, i64* %25, i64 %27
  %29 = load i64, i64* %28, align 8
  %30 = and i64 %29, 4294967295
  store i64 %30, i64* %13, align 8
  %31 = load i64*, i64** %6, align 8
  %32 = load i32, i32* %12, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i64, i64* %31, i64 %33
  %35 = load i64, i64* %34, align 8
  %36 = lshr i64 %35, 32
  store i64 %36, i64* %14, align 8
  store i8 0, i8* %15, align 1
  %37 = load i64, i64* %11, align 8
  %38 = load i64, i64* %13, align 8
  %39 = load i64, i64* %9, align 8
  %40 = mul i64 %38, %39
  %41 = add i64 %37, %40
  %42 = load i64*, i64** %5, align 8
  %43 = load i32, i32* %12, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i64, i64* %42, i64 %44
  store i64 %41, i64* %45, align 8
  %46 = load i64*, i64** %5, align 8
  %47 = load i32, i32* %12, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i64, i64* %46, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = load i64, i64* %11, align 8
  %52 = icmp ult i64 %50, %51
  %53 = zext i1 %52 to i64
  %54 = select i1 %52, i32 1, i32 0
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %15, align 1
  %56 = load i64, i64* %14, align 8
  %57 = load i64, i64* %9, align 8
  %58 = mul i64 %56, %57
  %59 = load i64*, i64** %5, align 8
  %60 = load i32, i32* %12, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i64, i64* %59, i64 %61
  %63 = load i64, i64* %62, align 8
  %64 = lshr i64 %63, 32
  %65 = add i64 %58, %64
  %66 = load i8, i8* %15, align 1
  %67 = icmp ne i8 %66, 0
  %68 = zext i1 %67 to i64
  %69 = select i1 %67, i64 4294967296, i64 0
  %70 = add i64 %65, %69
  store i64 %70, i64* %11, align 8
  %71 = load i64, i64* %11, align 8
  %72 = icmp ne i64 %71, 0
  br i1 %72, label %77, label %73

73:                                               ; preds = %24
  %74 = load i8, i8* %15, align 1
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %77

76:                                               ; preds = %73
  br label %83

77:                                               ; preds = %73, %24
  %78 = load i64, i64* %11, align 8
  %79 = icmp ne i64 %78, 0
  %80 = xor i1 %79, true
  %81 = zext i1 %80 to i64
  %82 = select i1 %80, i32 2, i32 0
  br label %83

83:                                               ; preds = %77, %76
  %84 = phi i32 [ 1, %76 ], [ %82, %77 ]
  %85 = trunc i32 %84 to i8
  store i8 %85, i8* %15, align 1
  %86 = load i64, i64* %13, align 8
  %87 = load i64, i64* %10, align 8
  %88 = mul i64 %86, %87
  %89 = and i64 %88, 4294967295
  %90 = load i64, i64* %11, align 8
  %91 = add i64 %90, %89
  store i64 %91, i64* %11, align 8
  %92 = load i64, i64* %11, align 8
  %93 = shl i64 %92, 32
  %94 = load i64*, i64** %5, align 8
  %95 = load i32, i32* %12, align 4
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i64, i64* %94, i64 %96
  %98 = load i64, i64* %97, align 8
  %99 = and i64 %98, 4294967295
  %100 = or i64 %93, %99
  %101 = load i64*, i64** %5, align 8
  %102 = load i32, i32* %12, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i64, i64* %101, i64 %103
  store i64 %100, i64* %104, align 8
  %105 = load i64, i64* %11, align 8
  %106 = icmp ne i64 %105, 0
  br i1 %106, label %111, label %107

107:                                              ; preds = %83
  %108 = load i8, i8* %15, align 1
  %109 = zext i8 %108 to i32
  %110 = icmp ne i32 %109, 2
  br i1 %110, label %115, label %111

111:                                              ; preds = %107, %83
  %112 = load i8, i8* %15, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 1
  br label %115

115:                                              ; preds = %111, %107
  %116 = phi i1 [ true, %107 ], [ %114, %111 ]
  %117 = zext i1 %116 to i64
  %118 = select i1 %116, i64 4294967296, i64 0
  %119 = load i64, i64* %11, align 8
  %120 = lshr i64 %119, 32
  %121 = add i64 %118, %120
  %122 = load i64, i64* %13, align 8
  %123 = load i64, i64* %10, align 8
  %124 = mul i64 %122, %123
  %125 = lshr i64 %124, 32
  %126 = add i64 %121, %125
  %127 = load i64, i64* %14, align 8
  %128 = load i64, i64* %10, align 8
  %129 = mul i64 %127, %128
  %130 = add i64 %126, %129
  store i64 %130, i64* %11, align 8
  br label %131

131:                                              ; preds = %115
  %132 = load i32, i32* %12, align 4
  %133 = add i32 %132, 1
  store i32 %133, i32* %12, align 4
  br label %20

134:                                              ; preds = %20
  %135 = load i64, i64* %11, align 8
  ret i64 %135
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi128ELb1ELb0EE13cpSextOrTruncILi256ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.30*, %class.ap_private.39* dereferenceable(32)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.39*, align 8
  %5 = alloca i32, align 4
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.39* %1, %class.ap_private.39** %4, align 8
  %6 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %21

10:                                               ; preds = %7
  %11 = load %class.ap_private.39*, %class.ap_private.39** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = call i64 @_ZNK10ap_privateILi256ELb1ELb0EE8get_pValEi(%class.ap_private.39* %11, i32 %12)
  %14 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %6, i32 0, i32 0
  %15 = load i32, i32* %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 %16
  store i64 %13, i64* %17, align 8
  br label %18

18:                                               ; preds = %10
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %5, align 4
  br label %7

21:                                               ; preds = %7
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi256ELb1ELb0EE8get_pValEi(%class.ap_private.39*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.39*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.39* %0, %class.ap_private.39** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.39*, %class.ap_private.39** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.39, %class.ap_private.39* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i64], [4 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.30* @_ZN10ap_privateILi128ELb1ELb0EEaSERKS0_(%class.ap_private.30*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.30*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %5 = load %class.ap_private.30*, %class.ap_private.30** %3, align 8
  %6 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %7 = icmp ne %class.ap_private.30* %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %5, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 0
  %11 = bitcast i64* %10 to i8*
  %12 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %13 = call i64* @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEv(%class.ap_private.30* %12)
  %14 = bitcast i64* %13 to i8*
  %15 = call i8* @memcpy(i8* %11, i8* %14, i64 16)
  br label %16

16:                                               ; preds = %8, %2
  call void @_ZNV10ap_privateILi128ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.30* %5)
  ret %class.ap_private.30* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEv(%class.ap_private.30*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.30* %0, %class.ap_private.30** %2, align 8
  %3 = load %class.ap_private.30*, %class.ap_private.30** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.30, %class.ap_private.30* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi128ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.30* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %5, %class.ap_private.30* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %5)
  ret %class.ap_private.25* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE13cpSextOrTruncILi128ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.30* dereferenceable(16)) #5 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.30*, align 8
  %5 = alloca i32, align 4
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.30* %1, %class.ap_private.30** %4, align 8
  %6 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %21

10:                                               ; preds = %7
  %11 = load %class.ap_private.30*, %class.ap_private.30** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = call i64 @_ZNK10ap_privateILi128ELb1ELb0EE8get_pValEi(%class.ap_private.30* %11, i32 %12)
  %14 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %6, i32 0, i32 0
  %15 = load i32, i32* %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 %16
  store i64 %13, i64* %17, align 8
  br label %18

18:                                               ; preds = %10
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %5, align 4
  br label %7

21:                                               ; preds = %7
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi67ELb1EEC2ILi66ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.19*, %struct.ap_int_base.23* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.19*, align 8
  %4 = alloca %struct.ap_int_base.23*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.19* %0, %struct.ap_int_base.19** %3, align 8
  store %struct.ap_int_base.23* %1, %struct.ap_int_base.23** %4, align 8
  %7 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %3, align 8
  %8 = bitcast %struct.ap_int_base.19* %7 to %struct.ssdm_int_sim.20*
  call void @_ZN12ssdm_int_simILi67ELb1EEC2Ev(%struct.ssdm_int_sim.20* %8)
  %9 = load %struct.ap_int_base.23*, %struct.ap_int_base.23** %4, align 8
  %10 = bitcast %struct.ap_int_base.23* %9 to %struct.ssdm_int_sim.24*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.24, %struct.ssdm_int_sim.24* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int_base.19* %7 to %struct.ssdm_int_sim.20*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %12, i32 0, i32 0
  %14 = invoke dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi66ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %13, %class.ap_private.25* dereferenceable(16) %11)
          to label %15 unwind label %16

15:                                               ; preds = %2
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %5, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %6, align 4
  %20 = bitcast %struct.ap_int_base.19* %7 to %struct.ssdm_int_sim.20*
  call void @_ZN12ssdm_int_simILi67ELb1EED2Ev(%struct.ssdm_int_sim.20* %20) #3
  br label %21

21:                                               ; preds = %16
  %22 = load i8*, i8** %5, align 8
  %23 = load i32, i32* %6, align 4
  %24 = insertvalue { i8*, i32 } undef, i8* %22, 0
  %25 = insertvalue { i8*, i32 } %24, i32 %23, 1
  resume { i8*, i32 } %25
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi67ELb1EEC2Ev(%struct.ap_int_base.19*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.19*, align 8
  store %struct.ap_int_base.19* %0, %struct.ap_int_base.19** %2, align 8
  %3 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %2, align 8
  %4 = bitcast %struct.ap_int_base.19* %3 to %struct.ssdm_int_sim.20*
  call void @_ZN12ssdm_int_simILi67ELb1EEC2Ev(%struct.ssdm_int_sim.20* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi67ELb1ELb0EEplILi67ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* noalias sret, %class.ap_private.21*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.21*, align 8
  %6 = alloca %class.ap_private.21*, align 8
  %7 = alloca i1, align 1
  %8 = alloca %class.ap_private.18, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %class.ap_private.18, align 8
  %12 = alloca i32, align 4
  %13 = bitcast %class.ap_private.18* %0 to i8*
  store i8* %13, i8** %4, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %5, align 8
  store %class.ap_private.21* %2, %class.ap_private.21** %6, align 8
  %14 = load %class.ap_private.21*, %class.ap_private.21** %5, align 8
  store i1 false, i1* %7, align 1
  call void @_ZN10ap_privateILi68ELb1ELb0EEC2Ev(%class.ap_private.18* %0)
  invoke void @_ZN10ap_privateILi68ELb1ELb0EEC2ILi67ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.18* %8, %class.ap_private.21* dereferenceable(16) %14)
          to label %15 unwind label %28

15:                                               ; preds = %3
  %16 = load %class.ap_private.21*, %class.ap_private.21** %6, align 8
  invoke void @_ZN10ap_privateILi68ELb1ELb0EEC2ILi67ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.18* %11, %class.ap_private.21* dereferenceable(16) %16)
          to label %17 unwind label %32

17:                                               ; preds = %15
  store i32 2, i32* %12, align 4
  %18 = invoke i64* @_ZN10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18* %0)
          to label %19 unwind label %36

19:                                               ; preds = %17
  %20 = invoke i64* @_ZN10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18* %8)
          to label %21 unwind label %36

21:                                               ; preds = %19
  %22 = invoke i64* @_ZN10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18* %11)
          to label %23 unwind label %36

23:                                               ; preds = %21
  %24 = invoke zeroext i1 @_ZN14ap_private_opsL3addEPmPKmS2_jjjbb(i64* %18, i64* %20, i64* %22, i32 2, i32 2, i32 2, i1 zeroext true, i1 zeroext true)
          to label %25 unwind label %36

25:                                               ; preds = %23
  invoke void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %0)
          to label %26 unwind label %36

26:                                               ; preds = %25
  store i1 true, i1* %7, align 1
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %11) #3
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %8) #3
  %27 = load i1, i1* %7, align 1
  br i1 %27, label %42, label %41

28:                                               ; preds = %3
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %9, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %10, align 4
  br label %43

32:                                               ; preds = %15
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  store i8* %34, i8** %9, align 8
  %35 = extractvalue { i8*, i32 } %33, 1
  store i32 %35, i32* %10, align 4
  br label %40

36:                                               ; preds = %25, %23, %21, %19, %17
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %9, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %10, align 4
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %11) #3
  br label %40

40:                                               ; preds = %36, %32
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %8) #3
  br label %43

41:                                               ; preds = %26
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %0) #3
  br label %42

42:                                               ; preds = %41, %26
  ret void

43:                                               ; preds = %40, %28
  call void @_ZN10ap_privateILi68ELb1ELb0EED2Ev(%class.ap_private.18* %0) #3
  br label %44

44:                                               ; preds = %43
  %45 = load i8*, i8** %9, align 8
  %46 = load i32, i32* %10, align 4
  %47 = insertvalue { i8*, i32 } undef, i8* %45, 0
  %48 = insertvalue { i8*, i32 } %47, i32 %46, 1
  resume { i8*, i32 } %48
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %5, %class.ap_private.18* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %5)
  ret %class.ap_private.21* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi67EEC2ILi67ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int.22*, %struct.ap_int_base.19* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int.22*, align 8
  %4 = alloca %struct.ap_int_base.19*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int.22* %0, %struct.ap_int.22** %3, align 8
  store %struct.ap_int_base.19* %1, %struct.ap_int_base.19** %4, align 8
  %7 = load %struct.ap_int.22*, %struct.ap_int.22** %3, align 8
  %8 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  call void @_ZN11ap_int_baseILi67ELb1EEC2Ev(%struct.ap_int_base.19* %8)
  %9 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %4, align 8
  %10 = bitcast %struct.ap_int_base.19* %9 to %struct.ssdm_int_sim.20*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  %13 = bitcast %struct.ap_int_base.19* %12 to %struct.ssdm_int_sim.20*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %13, i32 0, i32 0
  %15 = invoke dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSERKS0_(%class.ap_private.21* %14, %class.ap_private.21* dereferenceable(16) %11)
          to label %16 unwind label %17

16:                                               ; preds = %2
  ret void

17:                                               ; preds = %2
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %5, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %6, align 4
  %21 = bitcast %struct.ap_int.22* %7 to %struct.ap_int_base.19*
  call void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19* %21) #3
  br label %22

22:                                               ; preds = %17
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %6, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi67ELb1EED2Ev(%struct.ap_int_base.19*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.19*, align 8
  store %struct.ap_int_base.19* %0, %struct.ap_int_base.19** %2, align 8
  %3 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %2, align 8
  %4 = bitcast %struct.ap_int_base.19* %3 to %struct.ssdm_int_sim.20*
  call void @_ZN12ssdm_int_simILi67ELb1EED2Ev(%struct.ssdm_int_sim.20* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi67ELb1EEC2Ev(%struct.ssdm_int_sim.20*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.20*, align 8
  store %struct.ssdm_int_sim.20* %0, %struct.ssdm_int_sim.20** %2, align 8
  %3 = load %struct.ssdm_int_sim.20*, %struct.ssdm_int_sim.20** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi67ELb1ELb0EEC2Ev(%class.ap_private.21* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi66ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.25* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.25* %1, %class.ap_private.25** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %5, %class.ap_private.25* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %5)
  ret %class.ap_private.21* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EEC2Ev(%class.ap_private.21*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE10set_canaryEv(%class.ap_private.21* %3)
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %3)
  call void @_ZN10ap_privateILi67ELb1ELb0EE12check_canaryEv(%class.ap_private.21* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE10set_canaryEv(%class.ap_private.21*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 61
  %8 = ashr i64 %7, 61
  %9 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %3, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 1
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.25* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.25* %1, %class.ap_private.25** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %5, %class.ap_private.25* dereferenceable(16) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.25* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.25*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.25* %1, %class.ap_private.25** %4, align 8
  %8 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %9 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  %10 = call zeroext i1 @_ZNK10ap_privateILi66ELb1ELb0EE10isNegativeEv(%class.ap_private.25* %9)
  br i1 %10, label %13, label %11

11:                                               ; preds = %2
  %12 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %8, %class.ap_private.25* dereferenceable(16) %12)
  br label %33

13:                                               ; preds = %2
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %25, %13
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %28

17:                                               ; preds = %14
  %18 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  %19 = load i32, i32* %6, align 4
  %20 = call i64 @_ZNK10ap_privateILi66ELb1ELb0EE8get_pValEi(%class.ap_private.25* %18, i32 %19)
  %21 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %8, i32 0, i32 0
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 %23
  store i64 %20, i64* %24, align 8
  br label %25

25:                                               ; preds = %17
  %26 = load i32, i32* %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4
  br label %14

28:                                               ; preds = %14
  %29 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %8, i32 0, i32 0
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %29, i64 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = or i64 %31, -4
  store i64 %32, i64* %30, align 8
  br label %33

33:                                               ; preds = %28, %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi66ELb1ELb0EE10isNegativeEv(%class.ap_private.25*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.25*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %2, align 8
  %3 = load %class.ap_private.25*, %class.ap_private.25** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 2
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi66ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.25* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.25*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.25* %1, %class.ap_private.25** %4, align 8
  %7 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load %class.ap_private.25*, %class.ap_private.25** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i64 @_ZNK10ap_privateILi66ELb1ELb0EE8get_pValEi(%class.ap_private.25* %12, i32 %13)
  %15 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 %17
  store i64 %14, i64* %18, align 8
  br label %19

19:                                               ; preds = %11
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %8

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %24, 2
  br i1 %25, label %26, label %34

26:                                               ; preds = %23
  %27 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 %29
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %26
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %23

34:                                               ; preds = %23
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi66ELb1ELb0EE8get_pValEi(%class.ap_private.25*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EEC2Ev(%class.ap_private.18*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE10set_canaryEv(%class.ap_private.18* %3)
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %3)
  call void @_ZN10ap_privateILi68ELb1ELb0EE12check_canaryEv(%class.ap_private.18* %3)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EEC2ILi67ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.18*, %class.ap_private.21* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE10set_canaryEv(%class.ap_private.18* %5)
  %6 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %7 = call dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSILi67ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %5, %class.ap_private.21* dereferenceable(16) %6)
  call void @_ZN10ap_privateILi68ELb1ELb0EE12check_canaryEv(%class.ap_private.18* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define internal zeroext i1 @_ZN14ap_private_opsL3addEPmPKmS2_jjjbb(i64*, i64*, i64*, i32, i32, i32, i1 zeroext, i1 zeroext) #4 {
  %9 = alloca i64*, align 8
  %10 = alloca i64*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8, align 1
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  store i64* %0, i64** %9, align 8
  store i64* %1, i64** %10, align 8
  store i64* %2, i64** %11, align 8
  store i32 %3, i32* %12, align 4
  store i32 %4, i32* %13, align 4
  store i32 %5, i32* %14, align 4
  %25 = zext i1 %6 to i8
  store i8 %25, i8* %15, align 1
  %26 = zext i1 %7 to i8
  store i8 %26, i8* %16, align 1
  store i8 0, i8* %17, align 1
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %14, align 4
  %29 = call i32 @_ZN8AESL_std3minIjEET_S1_S1_(i32 %27, i32 %28)
  store i32 %29, i32* %18, align 4
  store i32 0, i32* %19, align 4
  br label %30

30:                                               ; preds = %94, %8
  %31 = load i32, i32* %19, align 4
  %32 = load i32, i32* %18, align 4
  %33 = icmp ult i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, i32* %19, align 4
  %36 = load i32, i32* %12, align 4
  %37 = icmp ult i32 %35, %36
  br label %38

38:                                               ; preds = %34, %30
  %39 = phi i1 [ false, %30 ], [ %37, %34 ]
  br i1 %39, label %40, label %97

40:                                               ; preds = %38
  %41 = load i64*, i64** %10, align 8
  %42 = load i32, i32* %19, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i64, i64* %41, i64 %43
  %45 = load i64, i64* %44, align 8
  %46 = load i64*, i64** %11, align 8
  %47 = load i32, i32* %19, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i64, i64* %46, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = call i64 @_ZN8AESL_std3minImEET_S1_S1_(i64 %45, i64 %50)
  store i64 %51, i64* %20, align 8
  %52 = load i64*, i64** %10, align 8
  %53 = load i32, i32* %19, align 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i64, i64* %52, i64 %54
  %56 = load i64, i64* %55, align 8
  %57 = load i64*, i64** %11, align 8
  %58 = load i32, i32* %19, align 4
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i64, i64* %57, i64 %59
  %61 = load i64, i64* %60, align 8
  %62 = add i64 %56, %61
  %63 = load i8, i8* %17, align 1
  %64 = trunc i8 %63 to i1
  %65 = zext i1 %64 to i64
  %66 = add i64 %62, %65
  %67 = load i64*, i64** %9, align 8
  %68 = load i32, i32* %19, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i64, i64* %67, i64 %69
  store i64 %66, i64* %70, align 8
  %71 = load i64*, i64** %9, align 8
  %72 = load i32, i32* %19, align 4
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i64, i64* %71, i64 %73
  %75 = load i64, i64* %74, align 8
  %76 = load i64, i64* %20, align 8
  %77 = icmp ult i64 %75, %76
  br i1 %77, label %91, label %78

78:                                               ; preds = %40
  %79 = load i8, i8* %17, align 1
  %80 = trunc i8 %79 to i1
  br i1 %80, label %81, label %89

81:                                               ; preds = %78
  %82 = load i64*, i64** %9, align 8
  %83 = load i32, i32* %19, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i64, i64* %82, i64 %84
  %86 = load i64, i64* %85, align 8
  %87 = load i64, i64* %20, align 8
  %88 = icmp eq i64 %86, %87
  br label %89

89:                                               ; preds = %81, %78
  %90 = phi i1 [ false, %78 ], [ %88, %81 ]
  br label %91

91:                                               ; preds = %89, %40
  %92 = phi i1 [ true, %40 ], [ %90, %89 ]
  %93 = zext i1 %92 to i8
  store i8 %93, i8* %17, align 1
  br label %94

94:                                               ; preds = %91
  %95 = load i32, i32* %19, align 4
  %96 = add i32 %95, 1
  store i32 %96, i32* %19, align 4
  br label %30

97:                                               ; preds = %38
  %98 = load i32, i32* %13, align 4
  %99 = load i32, i32* %14, align 4
  %100 = icmp ugt i32 %98, %99
  br i1 %100, label %101, label %178

101:                                              ; preds = %97
  %102 = load i8, i8* %16, align 1
  %103 = trunc i8 %102 to i1
  br i1 %103, label %104, label %112

104:                                              ; preds = %101
  %105 = load i64*, i64** %11, align 8
  %106 = load i32, i32* %14, align 4
  %107 = sub i32 %106, 1
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i64, i64* %105, i64 %108
  %110 = load i64, i64* %109, align 8
  %111 = icmp slt i64 %110, 0
  br label %112

112:                                              ; preds = %104, %101
  %113 = phi i1 [ false, %101 ], [ %111, %104 ]
  %114 = zext i1 %113 to i64
  %115 = select i1 %113, i32 -1, i32 0
  %116 = sext i32 %115 to i64
  store i64 %116, i64* %21, align 8
  %117 = load i32, i32* %14, align 4
  store i32 %117, i32* %19, align 4
  br label %118

118:                                              ; preds = %174, %112
  %119 = load i32, i32* %19, align 4
  %120 = load i32, i32* %13, align 4
  %121 = icmp ult i32 %119, %120
  br i1 %121, label %122, label %126

122:                                              ; preds = %118
  %123 = load i32, i32* %19, align 4
  %124 = load i32, i32* %12, align 4
  %125 = icmp ult i32 %123, %124
  br label %126

126:                                              ; preds = %122, %118
  %127 = phi i1 [ false, %118 ], [ %125, %122 ]
  br i1 %127, label %128, label %177

128:                                              ; preds = %126
  %129 = load i64*, i64** %10, align 8
  %130 = load i32, i32* %19, align 4
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds i64, i64* %129, i64 %131
  %133 = load i64, i64* %132, align 8
  %134 = load i64, i64* %21, align 8
  %135 = call i64 @_ZN8AESL_std3minImEET_S1_S1_(i64 %133, i64 %134)
  store i64 %135, i64* %22, align 8
  %136 = load i64*, i64** %10, align 8
  %137 = load i32, i32* %19, align 4
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i64, i64* %136, i64 %138
  %140 = load i64, i64* %139, align 8
  %141 = load i64, i64* %21, align 8
  %142 = add i64 %140, %141
  %143 = load i8, i8* %17, align 1
  %144 = trunc i8 %143 to i1
  %145 = zext i1 %144 to i64
  %146 = add i64 %142, %145
  %147 = load i64*, i64** %9, align 8
  %148 = load i32, i32* %19, align 4
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i64, i64* %147, i64 %149
  store i64 %146, i64* %150, align 8
  %151 = load i64*, i64** %9, align 8
  %152 = load i32, i32* %19, align 4
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i64, i64* %151, i64 %153
  %155 = load i64, i64* %154, align 8
  %156 = load i64, i64* %22, align 8
  %157 = icmp ult i64 %155, %156
  br i1 %157, label %171, label %158

158:                                              ; preds = %128
  %159 = load i8, i8* %17, align 1
  %160 = trunc i8 %159 to i1
  br i1 %160, label %161, label %169

161:                                              ; preds = %158
  %162 = load i64*, i64** %9, align 8
  %163 = load i32, i32* %19, align 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i64, i64* %162, i64 %164
  %166 = load i64, i64* %165, align 8
  %167 = load i64, i64* %22, align 8
  %168 = icmp eq i64 %166, %167
  br label %169

169:                                              ; preds = %161, %158
  %170 = phi i1 [ false, %158 ], [ %168, %161 ]
  br label %171

171:                                              ; preds = %169, %128
  %172 = phi i1 [ true, %128 ], [ %170, %169 ]
  %173 = zext i1 %172 to i8
  store i8 %173, i8* %17, align 1
  br label %174

174:                                              ; preds = %171
  %175 = load i32, i32* %19, align 4
  %176 = add i32 %175, 1
  store i32 %176, i32* %19, align 4
  br label %118

177:                                              ; preds = %126
  br label %260

178:                                              ; preds = %97
  %179 = load i32, i32* %14, align 4
  %180 = load i32, i32* %13, align 4
  %181 = icmp ugt i32 %179, %180
  br i1 %181, label %182, label %259

182:                                              ; preds = %178
  %183 = load i8, i8* %15, align 1
  %184 = trunc i8 %183 to i1
  br i1 %184, label %185, label %193

185:                                              ; preds = %182
  %186 = load i64*, i64** %10, align 8
  %187 = load i32, i32* %13, align 4
  %188 = sub i32 %187, 1
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds i64, i64* %186, i64 %189
  %191 = load i64, i64* %190, align 8
  %192 = icmp slt i64 %191, 0
  br label %193

193:                                              ; preds = %185, %182
  %194 = phi i1 [ false, %182 ], [ %192, %185 ]
  %195 = zext i1 %194 to i64
  %196 = select i1 %194, i32 -1, i32 0
  %197 = sext i32 %196 to i64
  store i64 %197, i64* %23, align 8
  %198 = load i32, i32* %13, align 4
  store i32 %198, i32* %19, align 4
  br label %199

199:                                              ; preds = %255, %193
  %200 = load i32, i32* %19, align 4
  %201 = load i32, i32* %14, align 4
  %202 = icmp ult i32 %200, %201
  br i1 %202, label %203, label %207

203:                                              ; preds = %199
  %204 = load i32, i32* %19, align 4
  %205 = load i32, i32* %12, align 4
  %206 = icmp ult i32 %204, %205
  br label %207

207:                                              ; preds = %203, %199
  %208 = phi i1 [ false, %199 ], [ %206, %203 ]
  br i1 %208, label %209, label %258

209:                                              ; preds = %207
  %210 = load i64, i64* %23, align 8
  %211 = load i64*, i64** %11, align 8
  %212 = load i32, i32* %19, align 4
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds i64, i64* %211, i64 %213
  %215 = load i64, i64* %214, align 8
  %216 = call i64 @_ZN8AESL_std3minImEET_S1_S1_(i64 %210, i64 %215)
  store i64 %216, i64* %24, align 8
  %217 = load i64, i64* %23, align 8
  %218 = load i64*, i64** %11, align 8
  %219 = load i32, i32* %19, align 4
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds i64, i64* %218, i64 %220
  %222 = load i64, i64* %221, align 8
  %223 = add i64 %217, %222
  %224 = load i8, i8* %17, align 1
  %225 = trunc i8 %224 to i1
  %226 = zext i1 %225 to i64
  %227 = add i64 %223, %226
  %228 = load i64*, i64** %9, align 8
  %229 = load i32, i32* %19, align 4
  %230 = zext i32 %229 to i64
  %231 = getelementptr inbounds i64, i64* %228, i64 %230
  store i64 %227, i64* %231, align 8
  %232 = load i64*, i64** %9, align 8
  %233 = load i32, i32* %19, align 4
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i64, i64* %232, i64 %234
  %236 = load i64, i64* %235, align 8
  %237 = load i64, i64* %24, align 8
  %238 = icmp ult i64 %236, %237
  br i1 %238, label %252, label %239

239:                                              ; preds = %209
  %240 = load i8, i8* %17, align 1
  %241 = trunc i8 %240 to i1
  br i1 %241, label %242, label %250

242:                                              ; preds = %239
  %243 = load i64*, i64** %9, align 8
  %244 = load i32, i32* %19, align 4
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds i64, i64* %243, i64 %245
  %247 = load i64, i64* %246, align 8
  %248 = load i64, i64* %24, align 8
  %249 = icmp eq i64 %247, %248
  br label %250

250:                                              ; preds = %242, %239
  %251 = phi i1 [ false, %239 ], [ %249, %242 ]
  br label %252

252:                                              ; preds = %250, %209
  %253 = phi i1 [ true, %209 ], [ %251, %250 ]
  %254 = zext i1 %253 to i8
  store i8 %254, i8* %17, align 1
  br label %255

255:                                              ; preds = %252
  %256 = load i32, i32* %19, align 4
  %257 = add i32 %256, 1
  store i32 %257, i32* %19, align 4
  br label %199

258:                                              ; preds = %207
  br label %259

259:                                              ; preds = %258, %178
  br label %260

260:                                              ; preds = %259, %177
  %261 = load i8, i8* %17, align 1
  %262 = trunc i8 %261 to i1
  ret i1 %262
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZN10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 60
  %8 = ashr i64 %7, 60
  %9 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 1
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE10set_canaryEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSILi67ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %6 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %5, %class.ap_private.21* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %5)
  ret %class.ap_private.18* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %6 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %5, %class.ap_private.21* dereferenceable(16) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE6cpSextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %8 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %9 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %10 = call zeroext i1 @_ZNK10ap_privateILi67ELb1ELb0EE10isNegativeEv(%class.ap_private.21* %9)
  br i1 %10, label %13, label %11

11:                                               ; preds = %2
  %12 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE6cpZextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %8, %class.ap_private.21* dereferenceable(16) %12)
  br label %33

13:                                               ; preds = %2
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %25, %13
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %28

17:                                               ; preds = %14
  %18 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %19 = load i32, i32* %6, align 4
  %20 = call i64 @_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEi(%class.ap_private.21* %18, i32 %19)
  %21 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %8, i32 0, i32 0
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 %23
  store i64 %20, i64* %24, align 8
  br label %25

25:                                               ; preds = %17
  %26 = load i32, i32* %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4
  br label %14

28:                                               ; preds = %14
  %29 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %8, i32 0, i32 0
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %29, i64 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = or i64 %31, -8
  store i64 %32, i64* %30, align 8
  br label %33

33:                                               ; preds = %28, %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi67ELb1ELb0EE10isNegativeEv(%class.ap_private.21*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 4
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE6cpZextILi67ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %7 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i64 @_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEi(%class.ap_private.21* %12, i32 %13)
  %15 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %7, i32 0, i32 0
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 %17
  store i64 %14, i64* %18, align 8
  br label %19

19:                                               ; preds = %11
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %8

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %24, 2
  br i1 %25, label %26, label %34

26:                                               ; preds = %23
  %27 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %7, i32 0, i32 0
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 %29
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %26
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %23

34:                                               ; preds = %23
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEi(%class.ap_private.21*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZN8AESL_std3minIjEET_S1_S1_(i32, i32) #5 comdat {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = icmp uge i32 %5, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i32, i32* %4, align 4
  br label %12

10:                                               ; preds = %2
  %11 = load i32, i32* %3, align 4
  br label %12

12:                                               ; preds = %10, %8
  %13 = phi i32 [ %9, %8 ], [ %11, %10 ]
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZN8AESL_std3minImEET_S1_S1_(i64, i64) #5 comdat {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = icmp uge i64 %5, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i64, i64* %4, align 8
  br label %12

10:                                               ; preds = %2
  %11 = load i64, i64* %3, align 8
  br label %12

12:                                               ; preds = %10, %8
  %13 = phi i64 [ %9, %8 ], [ %11, %10 ]
  ret i64 %13
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  %5 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %6 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %21

10:                                               ; preds = %7
  %11 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = call i64 @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEi(%class.ap_private.18* %11, i32 %12)
  %14 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %6, i32 0, i32 0
  %15 = load i32, i32* %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 %16
  store i64 %13, i64* %17, align 8
  br label %18

18:                                               ; preds = %10
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %5, align 4
  br label %7

21:                                               ; preds = %7
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEi(%class.ap_private.18*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSERKS0_(%class.ap_private.21*, %class.ap_private.21* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.21* %1, %class.ap_private.21** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %7 = icmp ne %class.ap_private.21* %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %5, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 0
  %11 = bitcast i64* %10 to i8*
  %12 = load %class.ap_private.21*, %class.ap_private.21** %4, align 8
  %13 = call i64* @_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEv(%class.ap_private.21* %12)
  %14 = bitcast i64* %13 to i8*
  %15 = call i8* @memcpy(i8* %11, i8* %14, i64 16)
  br label %16

16:                                               ; preds = %8, %2
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %5)
  ret %class.ap_private.21* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZNK10ap_privateILi67ELb1ELb0EE8get_pValEv(%class.ap_private.21*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.21*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %2, align 8
  %3 = load %class.ap_private.21*, %class.ap_private.21** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSEi(%class.ap_private.21*, i32) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ap_private.38, align 4
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZN10ap_privateILi32ELb1ELb1EEC2Ei(%class.ap_private.38* %5, i32 %9)
  %10 = invoke dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %8, %class.ap_private.38* dereferenceable(4) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38* %5) #3
  ret %class.ap_private.21* %8

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN10ap_privateILi32ELb1ELb1EED2Ev(%class.ap_private.38* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.21* @_ZN10ap_privateILi67ELb1ELb0EEaSILi32ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %5, %class.ap_private.38* dereferenceable(4) %6)
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %5)
  ret %class.ap_private.21* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE13cpSextOrTruncILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %5 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %6 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %5, %class.ap_private.38* dereferenceable(4) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE6cpSextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %7 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  %8 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %9 = call zeroext i1 @_ZNK10ap_privateILi32ELb1ELb1EE10isNegativeEv(%class.ap_private.38* %8)
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  call void @_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21* %7, %class.ap_private.38* dereferenceable(4) %11)
  br label %52

12:                                               ; preds = %2
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %13

13:                                               ; preds = %25, %12
  %14 = load i32, i32* %6, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %28

16:                                               ; preds = %13
  %17 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %18 = load i32, i32* %6, align 4
  %19 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi(%class.ap_private.38* %17, i32 %18)
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 %23
  store i64 %20, i64* %24, align 8
  br label %25

25:                                               ; preds = %16
  %26 = load i32, i32* %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4
  br label %13

28:                                               ; preds = %13
  %29 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %30 = load i32, i32* %6, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2 x i64], [2 x i64]* %29, i64 0, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = or i64 %34, -4294967296
  store i64 %35, i64* %33, align 8
  br label %36

36:                                               ; preds = %44, %28
  %37 = load i32, i32* %6, align 4
  %38 = icmp slt i32 %37, 1
  br i1 %38, label %39, label %47

39:                                               ; preds = %36
  %40 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %41 = load i32, i32* %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2 x i64], [2 x i64]* %40, i64 0, i64 %42
  store i64 -1, i64* %43, align 8
  br label %44

44:                                               ; preds = %39
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %36

47:                                               ; preds = %36
  %48 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %49 = load i32, i32* %6, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [2 x i64], [2 x i64]* %48, i64 0, i64 %50
  store i64 -1, i64* %51, align 8
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %7)
  br label %52

52:                                               ; preds = %47, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi67ELb1ELb0EE6cpZextILi32ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.21*, %class.ap_private.38* dereferenceable(4)) #5 comdat align 2 {
  %3 = alloca %class.ap_private.21*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.21* %0, %class.ap_private.21** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %7 = load %class.ap_private.21*, %class.ap_private.21** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %20, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE8get_pValEi(%class.ap_private.38* %12, i32 %13)
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 %18
  store i64 %15, i64* %19, align 8
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %8

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %32, %23
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 2
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = getelementptr inbounds %class.ap_private.21, %class.ap_private.21* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %30
  store i64 0, i64* %31, align 8
  br label %32

32:                                               ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %24

35:                                               ; preds = %24
  call void @_ZNV10ap_privateILi67ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.21* %7)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi68ELb1EEC2ILi67ELb1EEERKS_IXT_EXT0_EE(%struct.ap_int_base.16*, %struct.ap_int_base.19* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.16*, align 8
  %4 = alloca %struct.ap_int_base.19*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.16* %0, %struct.ap_int_base.16** %3, align 8
  store %struct.ap_int_base.19* %1, %struct.ap_int_base.19** %4, align 8
  %7 = load %struct.ap_int_base.16*, %struct.ap_int_base.16** %3, align 8
  %8 = bitcast %struct.ap_int_base.16* %7 to %struct.ssdm_int_sim.17*
  call void @_ZN12ssdm_int_simILi68ELb1EEC2Ev(%struct.ssdm_int_sim.17* %8)
  %9 = load %struct.ap_int_base.19*, %struct.ap_int_base.19** %4, align 8
  %10 = bitcast %struct.ap_int_base.19* %9 to %struct.ssdm_int_sim.20*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.20, %struct.ssdm_int_sim.20* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int_base.16* %7 to %struct.ssdm_int_sim.17*
  %13 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %12, i32 0, i32 0
  %14 = invoke dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSILi67ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %13, %class.ap_private.21* dereferenceable(16) %11)
          to label %15 unwind label %16

15:                                               ; preds = %2
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %5, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %6, align 4
  %20 = bitcast %struct.ap_int_base.16* %7 to %struct.ssdm_int_sim.17*
  call void @_ZN12ssdm_int_simILi68ELb1EED2Ev(%struct.ssdm_int_sim.17* %20) #3
  br label %21

21:                                               ; preds = %16
  %22 = load i8*, i8** %5, align 8
  %23 = load i32, i32* %6, align 4
  %24 = insertvalue { i8*, i32 } undef, i8* %22, 0
  %25 = insertvalue { i8*, i32 } %24, i32 %23, 1
  resume { i8*, i32 } %25
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi68ELb1EEC2Ev(%struct.ap_int_base.16*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.16*, align 8
  store %struct.ap_int_base.16* %0, %struct.ap_int_base.16** %2, align 8
  %3 = load %struct.ap_int_base.16*, %struct.ap_int_base.16** %2, align 8
  %4 = bitcast %struct.ap_int_base.16* %3 to %struct.ssdm_int_sim.17*
  call void @_ZN12ssdm_int_simILi68ELb1EEC2Ev(%struct.ssdm_int_sim.17* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNK10ap_privateILi68ELb1ELb0EEplILi68ELb1EEENS0_5RTypeIXT_EXT0_EE4plusERKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* noalias sret, %class.ap_private.18*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca %class.ap_private.18*, align 8
  %6 = alloca %class.ap_private.18*, align 8
  %7 = alloca i1, align 1
  %8 = alloca %class.ap_private.40, align 8
  %9 = alloca i8*
  %10 = alloca i32
  %11 = alloca %class.ap_private.40, align 8
  %12 = alloca i32, align 4
  %13 = bitcast %class.ap_private.40* %0 to i8*
  store i8* %13, i8** %4, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %5, align 8
  store %class.ap_private.18* %2, %class.ap_private.18** %6, align 8
  %14 = load %class.ap_private.18*, %class.ap_private.18** %5, align 8
  store i1 false, i1* %7, align 1
  call void @_ZN10ap_privateILi69ELb1ELb0EEC2Ev(%class.ap_private.40* %0)
  invoke void @_ZN10ap_privateILi69ELb1ELb0EEC2ILi68ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.40* %8, %class.ap_private.18* dereferenceable(16) %14)
          to label %15 unwind label %28

15:                                               ; preds = %3
  %16 = load %class.ap_private.18*, %class.ap_private.18** %6, align 8
  invoke void @_ZN10ap_privateILi69ELb1ELb0EEC2ILi68ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.40* %11, %class.ap_private.18* dereferenceable(16) %16)
          to label %17 unwind label %32

17:                                               ; preds = %15
  store i32 2, i32* %12, align 4
  %18 = invoke i64* @_ZN10ap_privateILi69ELb1ELb0EE8get_pValEv(%class.ap_private.40* %0)
          to label %19 unwind label %36

19:                                               ; preds = %17
  %20 = invoke i64* @_ZN10ap_privateILi69ELb1ELb0EE8get_pValEv(%class.ap_private.40* %8)
          to label %21 unwind label %36

21:                                               ; preds = %19
  %22 = invoke i64* @_ZN10ap_privateILi69ELb1ELb0EE8get_pValEv(%class.ap_private.40* %11)
          to label %23 unwind label %36

23:                                               ; preds = %21
  %24 = invoke zeroext i1 @_ZN14ap_private_opsL3addEPmPKmS2_jjjbb(i64* %18, i64* %20, i64* %22, i32 2, i32 2, i32 2, i1 zeroext true, i1 zeroext true)
          to label %25 unwind label %36

25:                                               ; preds = %23
  invoke void @_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.40* %0)
          to label %26 unwind label %36

26:                                               ; preds = %25
  store i1 true, i1* %7, align 1
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %11) #3
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %8) #3
  %27 = load i1, i1* %7, align 1
  br i1 %27, label %42, label %41

28:                                               ; preds = %3
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %9, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %10, align 4
  br label %43

32:                                               ; preds = %15
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  store i8* %34, i8** %9, align 8
  %35 = extractvalue { i8*, i32 } %33, 1
  store i32 %35, i32* %10, align 4
  br label %40

36:                                               ; preds = %25, %23, %21, %19, %17
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %9, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %10, align 4
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %11) #3
  br label %40

40:                                               ; preds = %36, %32
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %8) #3
  br label %43

41:                                               ; preds = %26
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %0) #3
  br label %42

42:                                               ; preds = %41, %26
  ret void

43:                                               ; preds = %40, %28
  call void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40* %0) #3
  br label %44

44:                                               ; preds = %43
  %45 = load i8*, i8** %9, align 8
  %46 = load i32, i32* %10, align 4
  %47 = insertvalue { i8*, i32 } undef, i8* %45, 0
  %48 = insertvalue { i8*, i32 } %47, i32 %46, 1
  resume { i8*, i32 } %48
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSILi69ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.40* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.40* %1, %class.ap_private.40** %4, align 8
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %6 = load %class.ap_private.40*, %class.ap_private.40** %4, align 8
  call void @_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi69ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18* %5, %class.ap_private.40* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %5)
  ret %class.ap_private.18* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EED2Ev(%class.ap_private.40*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  invoke void @_ZN10ap_privateILi69ELb1ELb0EE12check_canaryEv(%class.ap_private.40* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN6ap_intILi68EEC2ILi68ELb1EEERK11ap_int_baseIXT_EXT0_EE(%struct.ap_int*, %struct.ap_int_base.16* dereferenceable(16)) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int*, align 8
  %4 = alloca %struct.ap_int_base.16*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int* %0, %struct.ap_int** %3, align 8
  store %struct.ap_int_base.16* %1, %struct.ap_int_base.16** %4, align 8
  %7 = load %struct.ap_int*, %struct.ap_int** %3, align 8
  %8 = bitcast %struct.ap_int* %7 to %struct.ap_int_base.16*
  call void @_ZN11ap_int_baseILi68ELb1EEC2Ev(%struct.ap_int_base.16* %8)
  %9 = load %struct.ap_int_base.16*, %struct.ap_int_base.16** %4, align 8
  %10 = bitcast %struct.ap_int_base.16* %9 to %struct.ssdm_int_sim.17*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %10, i32 0, i32 0
  %12 = bitcast %struct.ap_int* %7 to %struct.ap_int_base.16*
  %13 = bitcast %struct.ap_int_base.16* %12 to %struct.ssdm_int_sim.17*
  %14 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %13, i32 0, i32 0
  %15 = invoke dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSERKS0_(%class.ap_private.18* %14, %class.ap_private.18* dereferenceable(16) %11)
          to label %16 unwind label %17

16:                                               ; preds = %2
  ret void

17:                                               ; preds = %2
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %5, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %6, align 4
  %21 = bitcast %struct.ap_int* %7 to %struct.ap_int_base.16*
  call void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16* %21) #3
  br label %22

22:                                               ; preds = %17
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %6, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi68ELb1EED2Ev(%struct.ap_int_base.16*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.16*, align 8
  store %struct.ap_int_base.16* %0, %struct.ap_int_base.16** %2, align 8
  %3 = load %struct.ap_int_base.16*, %struct.ap_int_base.16** %2, align 8
  %4 = bitcast %struct.ap_int_base.16* %3 to %struct.ssdm_int_sim.17*
  call void @_ZN12ssdm_int_simILi68ELb1EED2Ev(%struct.ssdm_int_sim.17* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi68ELb1EEC2Ev(%struct.ssdm_int_sim.17*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.17*, align 8
  store %struct.ssdm_int_sim.17* %0, %struct.ssdm_int_sim.17** %2, align 8
  %3 = load %struct.ssdm_int_sim.17*, %struct.ssdm_int_sim.17** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.17, %struct.ssdm_int_sim.17* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi68ELb1ELb0EEC2Ev(%class.ap_private.18* %4)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EEC2Ev(%class.ap_private.40*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  call void @_ZN10ap_privateILi69ELb1ELb0EE10set_canaryEv(%class.ap_private.40* %3)
  call void @_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.40* %3)
  call void @_ZN10ap_privateILi69ELb1ELb0EE12check_canaryEv(%class.ap_private.40* %3)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EEC2ILi68ELb1EEERKS_IXT_EXT0_ELb0EE(%class.ap_private.40*, %class.ap_private.18* dereferenceable(16)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %5 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  call void @_ZN10ap_privateILi69ELb1ELb0EE10set_canaryEv(%class.ap_private.40* %5)
  %6 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %7 = call dereferenceable(16) %class.ap_private.40* @_ZN10ap_privateILi69ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* %5, %class.ap_private.18* dereferenceable(16) %6)
  call void @_ZN10ap_privateILi69ELb1ELb0EE12check_canaryEv(%class.ap_private.40* %5)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZN10ap_privateILi69ELb1ELb0EE8get_pValEv(%class.ap_private.40*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.40*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load volatile i64, i64* %5, align 8
  %7 = shl i64 %6, 59
  %8 = ashr i64 %7, 59
  %9 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %3, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 1
  store volatile i64 %8, i64* %10, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EE10set_canaryEv(%class.ap_private.40*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EE12check_canaryEv(%class.ap_private.40*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.40*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %2, align 8
  %3 = load %class.ap_private.40*, %class.ap_private.40** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.40* @_ZN10ap_privateILi69ELb1ELb0EEaSILi68ELb1EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %5 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  %6 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  call void @_ZN10ap_privateILi69ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* %5, %class.ap_private.18* dereferenceable(16) %6)
  call void @_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.40* %5)
  ret %class.ap_private.40* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EE13cpSextOrTruncILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %5 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  %6 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  call void @_ZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* %5, %class.ap_private.18* dereferenceable(16) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EE6cpSextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %8 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  %9 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %10 = call zeroext i1 @_ZNK10ap_privateILi68ELb1ELb0EE10isNegativeEv(%class.ap_private.18* %9)
  br i1 %10, label %13, label %11

11:                                               ; preds = %2
  %12 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  call void @_ZN10ap_privateILi69ELb1ELb0EE6cpZextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40* %8, %class.ap_private.18* dereferenceable(16) %12)
  br label %33

13:                                               ; preds = %2
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %25, %13
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %28

17:                                               ; preds = %14
  %18 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %19 = load i32, i32* %6, align 4
  %20 = call i64 @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEi(%class.ap_private.18* %18, i32 %19)
  %21 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %8, i32 0, i32 0
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %21, i64 0, i64 %23
  store i64 %20, i64* %24, align 8
  br label %25

25:                                               ; preds = %17
  %26 = load i32, i32* %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4
  br label %14

28:                                               ; preds = %14
  %29 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %8, i32 0, i32 0
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %29, i64 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = or i64 %31, -16
  store i64 %32, i64* %30, align 8
  br label %33

33:                                               ; preds = %28, %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi68ELb1ELb0EE10isNegativeEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 8
  %8 = icmp ne i64 %7, 0
  ret i1 %8
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi69ELb1ELb0EE6cpZextILi68ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.40*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %7 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  store i32 2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i64 @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEi(%class.ap_private.18* %12, i32 %13)
  %15 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %7, i32 0, i32 0
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i64], [2 x i64]* %15, i64 0, i64 %17
  store i64 %14, i64* %18, align 8
  br label %19

19:                                               ; preds = %11
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %6, align 4
  br label %8

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %24, 2
  br i1 %25, label %26, label %34

26:                                               ; preds = %23
  %27 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %7, i32 0, i32 0
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 %29
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %26
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %23

34:                                               ; preds = %23
  call void @_ZNV10ap_privateILi69ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.40* %7)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi68ELb1ELb0EE13cpSextOrTruncILi69ELb1EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.18*, %class.ap_private.40* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.40*, align 8
  %5 = alloca i32, align 4
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.40* %1, %class.ap_private.40** %4, align 8
  %6 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %21

10:                                               ; preds = %7
  %11 = load %class.ap_private.40*, %class.ap_private.40** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = call i64 @_ZNK10ap_privateILi69ELb1ELb0EE8get_pValEi(%class.ap_private.40* %11, i32 %12)
  %14 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %6, i32 0, i32 0
  %15 = load i32, i32* %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 %16
  store i64 %13, i64* %17, align 8
  br label %18

18:                                               ; preds = %10
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %5, align 4
  br label %7

21:                                               ; preds = %7
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi69ELb1ELb0EE8get_pValEi(%class.ap_private.40*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.40*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.40* %0, %class.ap_private.40** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.40*, %class.ap_private.40** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.40, %class.ap_private.40* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i64 0, i64 %8
  %10 = load i64, i64* %9, align 8
  ret i64 %10
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.18* @_ZN10ap_privateILi68ELb1ELb0EEaSERKS0_(%class.ap_private.18*, %class.ap_private.18* dereferenceable(16)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.18*, align 8
  %4 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %3, align 8
  store %class.ap_private.18* %1, %class.ap_private.18** %4, align 8
  %5 = load %class.ap_private.18*, %class.ap_private.18** %3, align 8
  %6 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %7 = icmp ne %class.ap_private.18* %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %5, i32 0, i32 0
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %9, i64 0, i64 0
  %11 = bitcast i64* %10 to i8*
  %12 = load %class.ap_private.18*, %class.ap_private.18** %4, align 8
  %13 = call i64* @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18* %12)
  %14 = bitcast i64* %13 to i8*
  %15 = call i8* @memcpy(i8* %11, i8* %14, i64 16)
  br label %16

16:                                               ; preds = %8, %2
  call void @_ZNV10ap_privateILi68ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.18* %5)
  ret %class.ap_private.18* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64* @_ZNK10ap_privateILi68ELb1ELb0EE8get_pValEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  ret i64* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi68ELb1ELb0EEcvlEv(%class.ap_private.18*) #4 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = call i64 @_ZNK10ap_privateILi68ELb1ELb0EE7get_VALEv(%class.ap_private.18* %3)
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi68ELb1ELb0EE7get_VALEv(%class.ap_private.18*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.18*, align 8
  store %class.ap_private.18* %0, %class.ap_private.18** %2, align 8
  %3 = load %class.ap_private.18*, %class.ap_private.18** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.18, %class.ap_private.18* %3, i32 0, i32 0
  %5 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i64 0, i64 0
  %6 = load i64, i64* %5, align 8
  ret i64 %6
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSEj(%class.ap_private.25*, i32) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ap_private.41, align 4
  %6 = alloca i8*
  %7 = alloca i32
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %9 = load i32, i32* %4, align 4
  call void @_ZN10ap_privateILi32ELb0ELb1EEC2Ej(%class.ap_private.41* %5, i32 %9)
  %10 = invoke dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi32ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %8, %class.ap_private.41* dereferenceable(4) %5)
          to label %11 unwind label %12

11:                                               ; preds = %2
  call void @_ZN10ap_privateILi32ELb0ELb1EED2Ev(%class.ap_private.41* %5) #3
  ret %class.ap_private.25* %8

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %6, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %7, align 4
  call void @_ZN10ap_privateILi32ELb0ELb1EED2Ev(%class.ap_private.41* %5) #3
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %6, align 8
  %18 = load i32, i32* %7, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb0ELb1EEC2Ej(%class.ap_private.41*, i32) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.41*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.41* %0, %class.ap_private.41** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.41*, %class.ap_private.41** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.41, %class.ap_private.41* %5, i32 0, i32 0
  %7 = load i32, i32* %4, align 4
  store i32 %7, i32* %6, align 4
  call void @_ZN10ap_privateILi32ELb0ELb1EE10set_canaryEv(%class.ap_private.41* %5)
  call void @_ZNV10ap_privateILi32ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.41* %5)
  call void @_ZN10ap_privateILi32ELb0ELb1EE12check_canaryEv(%class.ap_private.41* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %class.ap_private.25* @_ZN10ap_privateILi66ELb1ELb0EEaSILi32ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.41* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.41* %1, %class.ap_private.41** %4, align 8
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = load %class.ap_private.41*, %class.ap_private.41** %4, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %5, %class.ap_private.41* dereferenceable(4) %6)
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %5)
  ret %class.ap_private.25* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb0ELb1EED2Ev(%class.ap_private.41*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.41* %0, %class.ap_private.41** %2, align 8
  %3 = load %class.ap_private.41*, %class.ap_private.41** %2, align 8
  invoke void @_ZN10ap_privateILi32ELb0ELb1EE12check_canaryEv(%class.ap_private.41* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb0ELb1EE10set_canaryEv(%class.ap_private.41*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.41* %0, %class.ap_private.41** %2, align 8
  %3 = load %class.ap_private.41*, %class.ap_private.41** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi32ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.41*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.41* %0, %class.ap_private.41** %2, align 8
  %3 = load %class.ap_private.41*, %class.ap_private.41** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.41, %class.ap_private.41* %3, i32 0, i32 0
  %5 = load volatile i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = shl i64 %6, 32
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = getelementptr inbounds %class.ap_private.41, %class.ap_private.41* %3, i32 0, i32 0
  store volatile i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb0ELb1EE12check_canaryEv(%class.ap_private.41*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.41* %0, %class.ap_private.41** %2, align 8
  %3 = load %class.ap_private.41*, %class.ap_private.41** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE13cpZextOrTruncILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.41* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.41*, align 8
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.41* %1, %class.ap_private.41** %4, align 8
  %5 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  %6 = load %class.ap_private.41*, %class.ap_private.41** %4, align 8
  call void @_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25* %5, %class.ap_private.41* dereferenceable(4) %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi66ELb1ELb0EE6cpZextILi32ELb0EEEvRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.25*, %class.ap_private.41* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.25*, align 8
  %4 = alloca %class.ap_private.41*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %class.ap_private.25* %0, %class.ap_private.25** %3, align 8
  store %class.ap_private.41* %1, %class.ap_private.41** %4, align 8
  %7 = load %class.ap_private.25*, %class.ap_private.25** %3, align 8
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %20, %2
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = load %class.ap_private.41*, %class.ap_private.41** %4, align 8
  %13 = load i32, i32* %6, align 4
  %14 = call i32 @_ZNK10ap_privateILi32ELb0ELb1EE8get_pValEi(%class.ap_private.41* %12, i32 %13)
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %7, i32 0, i32 0
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x i64], [2 x i64]* %16, i64 0, i64 %18
  store i64 %15, i64* %19, align 8
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %8

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %32, %23
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 2
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = getelementptr inbounds %class.ap_private.25, %class.ap_private.25* %7, i32 0, i32 0
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 %30
  store i64 0, i64* %31, align 8
  br label %32

32:                                               ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %24

35:                                               ; preds = %24
  call void @_ZNV10ap_privateILi66ELb1ELb0EE15clearUnusedBitsEv(%class.ap_private.25* %7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi32ELb0ELb1EE8get_pValEi(%class.ap_private.41*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.41*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.41* %0, %class.ap_private.41** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.41*, %class.ap_private.41** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.41, %class.ap_private.41* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  ret i32 %7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi32ELb1EEC2Ev(%struct.ap_int_base.36*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ap_int_base.36*, align 8
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %2, align 8
  %3 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %2, align 8
  %4 = bitcast %struct.ap_int_base.36* %3 to %struct.ssdm_int_sim.37*
  call void @_ZN12ssdm_int_simILi32ELb1EEC2Ev(%struct.ssdm_int_sim.37* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(4) %class.ap_private.38* @_ZN10ap_privateILi32ELb1ELb1EEaSEi(%class.ap_private.38*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.38*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.38* %0, %class.ap_private.38** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.38*, %class.ap_private.38** %3, align 8
  call void @_ZN10ap_privateILi32ELb1ELb1EE10set_canaryEv(%class.ap_private.38* %5)
  %6 = load i32, i32* %4, align 4
  %7 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %5, i32 0, i32 0
  store i32 %6, i32* %7, align 4
  call void @_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.38* %5)
  call void @_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv(%class.ap_private.38* %5)
  ret %class.ap_private.38* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi32ELb1EEC2Ev(%struct.ssdm_int_sim.37*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.37*, align 8
  store %struct.ssdm_int_sim.37* %0, %struct.ssdm_int_sim.37** %2, align 8
  %3 = load %struct.ssdm_int_sim.37*, %struct.ssdm_int_sim.37** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi32ELb1ELb1EEC2Ev(%class.ap_private.38* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi32ELb1ELb1EEC2Ev(%class.ap_private.38*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  call void @_ZN10ap_privateILi32ELb1ELb1EE10set_canaryEv(%class.ap_private.38* %3)
  call void @_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.38* %3)
  call void @_ZN10ap_privateILi32ELb1ELb1EE12check_canaryEv(%class.ap_private.38* %3)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK11ap_int_baseILi32ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EE(%struct.ap_int_base.36*, %struct.ap_int_base.36* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %struct.ap_int_base.36*, align 8
  %4 = alloca %struct.ap_int_base.36*, align 8
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %3, align 8
  store %struct.ap_int_base.36* %1, %struct.ap_int_base.36** %4, align 8
  %5 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %3, align 8
  %6 = bitcast %struct.ap_int_base.36* %5 to %struct.ssdm_int_sim.37*
  %7 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %6, i32 0, i32 0
  %8 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %4, align 8
  %9 = bitcast %struct.ap_int_base.36* %8 to %struct.ssdm_int_sim.37*
  %10 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %9, i32 0, i32 0
  %11 = call zeroext i1 @_ZNK10ap_privateILi32ELb1ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.38* %7, %class.ap_private.38* dereferenceable(4) %10)
  ret i1 %11
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi32ELb1EEC2Ei(%struct.ap_int_base.36*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.36*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %3, align 8
  %8 = bitcast %struct.ap_int_base.36* %7 to %struct.ssdm_int_sim.37*
  call void @_ZN12ssdm_int_simILi32ELb1EEC2Ev(%struct.ssdm_int_sim.37* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int_base.36* %7 to %struct.ssdm_int_sim.37*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %10, i32 0, i32 0
  %12 = invoke dereferenceable(4) %class.ap_private.38* @_ZN10ap_privateILi32ELb1ELb1EEaSEi(%class.ap_private.38* %11, i32 %9)
          to label %13 unwind label %14

13:                                               ; preds = %2
  ret void

14:                                               ; preds = %2
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %5, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %6, align 4
  %18 = bitcast %struct.ap_int_base.36* %7 to %struct.ssdm_int_sim.37*
  call void @_ZN12ssdm_int_simILi32ELb1EED2Ev(%struct.ssdm_int_sim.37* %18) #3
  br label %19

19:                                               ; preds = %14
  %20 = load i8*, i8** %5, align 8
  %21 = load i32, i32* %6, align 4
  %22 = insertvalue { i8*, i32 } undef, i8* %20, 0
  %23 = insertvalue { i8*, i32 } %22, i32 %21, 1
  resume { i8*, i32 } %23
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi32ELb1EED2Ev(%struct.ap_int_base.36*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.36*, align 8
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %2, align 8
  %3 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %2, align 8
  %4 = bitcast %struct.ap_int_base.36* %3 to %struct.ssdm_int_sim.37*
  call void @_ZN12ssdm_int_simILi32ELb1EED2Ev(%struct.ssdm_int_sim.37* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi32ELb1ELb1EEltILi32ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.38*, %class.ap_private.38* dereferenceable(4)) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.ap_private.38*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  %5 = alloca %class.ap_private.42, align 8
  %6 = alloca %class.ap_private.42, align 8
  %7 = alloca i8*
  %8 = alloca i32
  store %class.ap_private.38* %0, %class.ap_private.38** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %9 = load %class.ap_private.38*, %class.ap_private.38** %3, align 8
  call void @_ZN10ap_privateILi33ELb1ELb1EEC2ILi32ELb1ELb1EEERKS_IXT_EXT0_EXT1_EE(%class.ap_private.42* %5, %class.ap_private.38* dereferenceable(4) %9)
  %10 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  invoke void @_ZN10ap_privateILi33ELb1ELb1EEC2ILi32ELb1ELb1EEERKS_IXT_EXT0_EXT1_EE(%class.ap_private.42* %6, %class.ap_private.38* dereferenceable(4) %10)
          to label %11 unwind label %14

11:                                               ; preds = %2
  %12 = invoke zeroext i1 @_ZNK10ap_privateILi33ELb1ELb1EE3sltILi33ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.42* %5, %class.ap_private.42* dereferenceable(8) %6)
          to label %13 unwind label %18

13:                                               ; preds = %11
  call void @_ZN10ap_privateILi33ELb1ELb1EED2Ev(%class.ap_private.42* %6) #3
  call void @_ZN10ap_privateILi33ELb1ELb1EED2Ev(%class.ap_private.42* %5) #3
  ret i1 %12

14:                                               ; preds = %2
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %7, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %8, align 4
  br label %22

18:                                               ; preds = %11
  %19 = landingpad { i8*, i32 }
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %7, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %8, align 4
  call void @_ZN10ap_privateILi33ELb1ELb1EED2Ev(%class.ap_private.42* %6) #3
  br label %22

22:                                               ; preds = %18, %14
  call void @_ZN10ap_privateILi33ELb1ELb1EED2Ev(%class.ap_private.42* %5) #3
  br label %23

23:                                               ; preds = %22
  %24 = load i8*, i8** %7, align 8
  %25 = load i32, i32* %8, align 4
  %26 = insertvalue { i8*, i32 } undef, i8* %24, 0
  %27 = insertvalue { i8*, i32 } %26, i32 %25, 1
  resume { i8*, i32 } %27
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi33ELb1ELb1EEC2ILi32ELb1ELb1EEERKS_IXT_EXT0_EXT1_EE(%class.ap_private.42*, %class.ap_private.38* dereferenceable(4)) unnamed_addr #4 comdat align 2 {
  %3 = alloca %class.ap_private.42*, align 8
  %4 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %3, align 8
  store %class.ap_private.38* %1, %class.ap_private.38** %4, align 8
  %5 = load %class.ap_private.42*, %class.ap_private.42** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.42, %class.ap_private.42* %5, i32 0, i32 0
  %7 = load %class.ap_private.38*, %class.ap_private.38** %4, align 8
  %8 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE7get_VALEv(%class.ap_private.38* %7)
  %9 = sext i32 %8 to i64
  store i64 %9, i64* %6, align 8
  call void @_ZN10ap_privateILi33ELb1ELb1EE10set_canaryEv(%class.ap_private.42* %5)
  call void @_ZNV10ap_privateILi33ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.42* %5)
  call void @_ZN10ap_privateILi33ELb1ELb1EE12check_canaryEv(%class.ap_private.42* %5)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNK10ap_privateILi33ELb1ELb1EE3sltILi33ELb1EEEbRKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.42*, %class.ap_private.42* dereferenceable(8)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.42*, align 8
  %4 = alloca %class.ap_private.42*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %3, align 8
  store %class.ap_private.42* %1, %class.ap_private.42** %4, align 8
  %7 = load %class.ap_private.42*, %class.ap_private.42** %3, align 8
  %8 = getelementptr inbounds %class.ap_private.42, %class.ap_private.42* %7, i32 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = shl i64 %9, 31
  %11 = ashr i64 %10, 31
  store i64 %11, i64* %5, align 8
  %12 = load %class.ap_private.42*, %class.ap_private.42** %4, align 8
  %13 = call i64 @_ZNK10ap_privateILi33ELb1ELb1EE7get_VALEv(%class.ap_private.42* %12)
  %14 = shl i64 %13, 31
  %15 = ashr i64 %14, 31
  store i64 %15, i64* %6, align 8
  %16 = load i64, i64* %5, align 8
  %17 = load i64, i64* %6, align 8
  %18 = icmp slt i64 %16, %17
  ret i1 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi33ELb1ELb1EED2Ev(%class.ap_private.42*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.42*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %2, align 8
  %3 = load %class.ap_private.42*, %class.ap_private.42** %2, align 8
  invoke void @_ZN10ap_privateILi33ELb1ELb1EE12check_canaryEv(%class.ap_private.42* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi32ELb1ELb1EE7get_VALEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi33ELb1ELb1EE10set_canaryEv(%class.ap_private.42*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.42*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %2, align 8
  %3 = load %class.ap_private.42*, %class.ap_private.42** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi33ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.42*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.42*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %2, align 8
  %3 = load %class.ap_private.42*, %class.ap_private.42** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.42, %class.ap_private.42* %3, i32 0, i32 0
  %5 = load volatile i64, i64* %4, align 8
  %6 = shl i64 %5, 31
  %7 = ashr i64 %6, 31
  %8 = getelementptr inbounds %class.ap_private.42, %class.ap_private.42* %3, i32 0, i32 0
  store volatile i64 %7, i64* %8, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi33ELb1ELb1EE12check_canaryEv(%class.ap_private.42*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.42*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %2, align 8
  %3 = load %class.ap_private.42*, %class.ap_private.42** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK10ap_privateILi33ELb1ELb1EE7get_VALEv(%class.ap_private.42*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.42*, align 8
  store %class.ap_private.42* %0, %class.ap_private.42** %2, align 8
  %3 = load %class.ap_private.42*, %class.ap_private.42** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.42, %class.ap_private.42* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  ret i64 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(4) %struct.ap_int_base.36* @_ZN11ap_int_baseILi32ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EE(%struct.ap_int_base.36*, %struct.ap_int_base.43* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %struct.ap_int_base.36*, align 8
  %4 = alloca %struct.ap_int_base.43*, align 8
  store %struct.ap_int_base.36* %0, %struct.ap_int_base.36** %3, align 8
  store %struct.ap_int_base.43* %1, %struct.ap_int_base.43** %4, align 8
  %5 = load %struct.ap_int_base.36*, %struct.ap_int_base.36** %3, align 8
  %6 = load %struct.ap_int_base.43*, %struct.ap_int_base.43** %4, align 8
  %7 = bitcast %struct.ap_int_base.43* %6 to %struct.ssdm_int_sim.44*
  %8 = getelementptr inbounds %struct.ssdm_int_sim.44, %struct.ssdm_int_sim.44* %7, i32 0, i32 0
  %9 = bitcast %struct.ap_int_base.36* %5 to %struct.ssdm_int_sim.37*
  %10 = getelementptr inbounds %struct.ssdm_int_sim.37, %struct.ssdm_int_sim.37* %9, i32 0, i32 0
  %11 = call dereferenceable(4) %class.ap_private.38* @_ZN10ap_privateILi32ELb1ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.38* %10, %class.ap_private.45* dereferenceable(1) %8)
  ret %struct.ap_int_base.36* %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi1ELb0EEC2Ei(%struct.ap_int_base.43*, i32) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %struct.ap_int_base.43*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*
  %6 = alloca i32
  store %struct.ap_int_base.43* %0, %struct.ap_int_base.43** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.ap_int_base.43*, %struct.ap_int_base.43** %3, align 8
  %8 = bitcast %struct.ap_int_base.43* %7 to %struct.ssdm_int_sim.44*
  call void @_ZN12ssdm_int_simILi1ELb0EEC2Ev(%struct.ssdm_int_sim.44* %8)
  %9 = load i32, i32* %4, align 4
  %10 = bitcast %struct.ap_int_base.43* %7 to %struct.ssdm_int_sim.44*
  %11 = getelementptr inbounds %struct.ssdm_int_sim.44, %struct.ssdm_int_sim.44* %10, i32 0, i32 0
  %12 = invoke dereferenceable(1) %class.ap_private.45* @_ZN10ap_privateILi1ELb0ELb1EEaSEi(%class.ap_private.45* %11, i32 %9)
          to label %13 unwind label %14

13:                                               ; preds = %2
  ret void

14:                                               ; preds = %2
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %5, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %6, align 4
  %18 = bitcast %struct.ap_int_base.43* %7 to %struct.ssdm_int_sim.44*
  call void @_ZN12ssdm_int_simILi1ELb0EED2Ev(%struct.ssdm_int_sim.44* %18) #3
  br label %19

19:                                               ; preds = %14
  %20 = load i8*, i8** %5, align 8
  %21 = load i32, i32* %6, align 4
  %22 = insertvalue { i8*, i32 } undef, i8* %20, 0
  %23 = insertvalue { i8*, i32 } %22, i32 %21, 1
  resume { i8*, i32 } %23
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN11ap_int_baseILi1ELb0EED2Ev(%struct.ap_int_base.43*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ap_int_base.43*, align 8
  store %struct.ap_int_base.43* %0, %struct.ap_int_base.43** %2, align 8
  %3 = load %struct.ap_int_base.43*, %struct.ap_int_base.43** %2, align 8
  %4 = bitcast %struct.ap_int_base.43* %3 to %struct.ssdm_int_sim.44*
  call void @_ZN12ssdm_int_simILi1ELb0EED2Ev(%struct.ssdm_int_sim.44* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(4) %class.ap_private.38* @_ZN10ap_privateILi32ELb1ELb1EEpLILi1ELb0EEERS0_RKS_IXT_EXT0_EXleT_Li64EEE(%class.ap_private.38*, %class.ap_private.45* dereferenceable(1)) #4 comdat align 2 {
  %3 = alloca %class.ap_private.38*, align 8
  %4 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %3, align 8
  store %class.ap_private.45* %1, %class.ap_private.45** %4, align 8
  %5 = load %class.ap_private.38*, %class.ap_private.38** %3, align 8
  %6 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  %8 = sext i32 %7 to i64
  %9 = load %class.ap_private.45*, %class.ap_private.45** %4, align 8
  %10 = call zeroext i8 @_ZNK10ap_privateILi1ELb0ELb1EE7get_VALEv(%class.ap_private.45* %9)
  %11 = zext i8 %10 to i64
  %12 = add i64 %8, %11
  %13 = trunc i64 %12 to i32
  %14 = getelementptr inbounds %class.ap_private.38, %class.ap_private.38* %5, i32 0, i32 0
  store i32 %13, i32* %14, align 4
  call void @_ZNV10ap_privateILi32ELb1ELb1EE15clearUnusedBitsEv(%class.ap_private.38* %5)
  ret %class.ap_private.38* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i8 @_ZNK10ap_privateILi1ELb0ELb1EE7get_VALEv(%class.ap_private.45*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.45, %class.ap_private.45* %3, i32 0, i32 0
  %5 = load i8, i8* %4, align 1
  ret i8 %5
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi1ELb0EEC2Ev(%struct.ssdm_int_sim.44*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.44*, align 8
  store %struct.ssdm_int_sim.44* %0, %struct.ssdm_int_sim.44** %2, align 8
  %3 = load %struct.ssdm_int_sim.44*, %struct.ssdm_int_sim.44** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.44, %struct.ssdm_int_sim.44* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi1ELb0ELb1EEC2Ev(%class.ap_private.45* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %class.ap_private.45* @_ZN10ap_privateILi1ELb0ELb1EEaSEi(%class.ap_private.45*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private.45*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private.45* %0, %class.ap_private.45** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private.45*, %class.ap_private.45** %3, align 8
  call void @_ZN10ap_privateILi1ELb0ELb1EE10set_canaryEv(%class.ap_private.45* %5)
  %6 = load i32, i32* %4, align 4
  %7 = trunc i32 %6 to i8
  %8 = getelementptr inbounds %class.ap_private.45, %class.ap_private.45* %5, i32 0, i32 0
  store i8 %7, i8* %8, align 1
  call void @_ZNV10ap_privateILi1ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.45* %5)
  call void @_ZN10ap_privateILi1ELb0ELb1EE12check_canaryEv(%class.ap_private.45* %5)
  ret %class.ap_private.45* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN12ssdm_int_simILi1ELb0EED2Ev(%struct.ssdm_int_sim.44*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %struct.ssdm_int_sim.44*, align 8
  store %struct.ssdm_int_sim.44* %0, %struct.ssdm_int_sim.44** %2, align 8
  %3 = load %struct.ssdm_int_sim.44*, %struct.ssdm_int_sim.44** %2, align 8
  %4 = getelementptr inbounds %struct.ssdm_int_sim.44, %struct.ssdm_int_sim.44* %3, i32 0, i32 0
  call void @_ZN10ap_privateILi1ELb0ELb1EED2Ev(%class.ap_private.45* %4) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi1ELb0ELb1EEC2Ev(%class.ap_private.45*) unnamed_addr #4 comdat align 2 {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  call void @_ZN10ap_privateILi1ELb0ELb1EE10set_canaryEv(%class.ap_private.45* %3)
  call void @_ZNV10ap_privateILi1ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.45* %3)
  call void @_ZN10ap_privateILi1ELb0ELb1EE12check_canaryEv(%class.ap_private.45* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi1ELb0ELb1EE10set_canaryEv(%class.ap_private.45*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNV10ap_privateILi1ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private.45*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  %4 = getelementptr inbounds %class.ap_private.45, %class.ap_private.45* %3, i32 0, i32 0
  %5 = load volatile i8, i8* %4, align 1
  %6 = zext i8 %5 to i64
  %7 = shl i64 %6, 63
  %8 = lshr i64 %7, 63
  %9 = trunc i64 %8 to i8
  %10 = getelementptr inbounds %class.ap_private.45, %class.ap_private.45* %3, i32 0, i32 0
  store volatile i8 %9, i8* %10, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi1ELb0ELb1EE12check_canaryEv(%class.ap_private.45*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN10ap_privateILi1ELb0ELb1EED2Ev(%class.ap_private.45*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.ap_private.45*, align 8
  store %class.ap_private.45* %0, %class.ap_private.45** %2, align 8
  %3 = load %class.ap_private.45*, %class.ap_private.45** %2, align 8
  invoke void @_ZN10ap_privateILi1ELb0ELb1EE12check_canaryEv(%class.ap_private.45* %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_ZNK10ap_privateILi32ELb1ELb1EEcviEv(%class.ap_private.38*) #5 comdat align 2 {
  %2 = alloca %class.ap_private.38*, align 8
  store %class.ap_private.38* %0, %class.ap_private.38** %2, align 8
  %3 = load %class.ap_private.38*, %class.ap_private.38** %2, align 8
  %4 = call i32 @_ZNK10ap_privateILi32ELb1ELb1EE7get_VALEv(%class.ap_private.38* %3)
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %class.ap_private* @_ZN10ap_privateILi8ELb0ELb1EEaSEi(%class.ap_private*, i32) #5 comdat align 2 {
  %3 = alloca %class.ap_private*, align 8
  %4 = alloca i32, align 4
  store %class.ap_private* %0, %class.ap_private** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.ap_private*, %class.ap_private** %3, align 8
  call void @_ZN10ap_privateILi8ELb0ELb1EE10set_canaryEv(%class.ap_private* %5)
  %6 = load i32, i32* %4, align 4
  %7 = trunc i32 %6 to i8
  %8 = getelementptr inbounds %class.ap_private, %class.ap_private* %5, i32 0, i32 0
  store i8 %7, i8* %8, align 1
  call void @_ZNV10ap_privateILi8ELb0ELb1EE15clearUnusedBitsEv(%class.ap_private* %5)
  call void @_ZN10ap_privateILi8ELb0ELb1EE12check_canaryEv(%class.ap_private* %5)
  ret %class.ap_private* %5
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_store_v1.cc() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #11 !dbg !19 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !30, metadata !DIExpression()), !dbg !31
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %7, metadata !34, metadata !DIExpression()), !dbg !37
  %9 = load i8*, i8** %4, align 8, !dbg !38
  store i8* %9, i8** %7, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %8, metadata !39, metadata !DIExpression()), !dbg !42
  %10 = load i8*, i8** %5, align 8, !dbg !43
  store i8* %10, i8** %8, align 8, !dbg !42
  br label %11, !dbg !44

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !45
  %13 = add i64 %12, -1, !dbg !45
  store i64 %13, i64* %6, align 8, !dbg !45
  %14 = icmp ugt i64 %12, 0, !dbg !46
  br i1 %14, label %15, label %21, !dbg !44

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !47
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !47
  store i8* %17, i8** %8, align 8, !dbg !47
  %18 = load i8, i8* %16, align 1, !dbg !48
  %19 = load i8*, i8** %7, align 8, !dbg !49
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !49
  store i8* %20, i8** %7, align 8, !dbg !49
  store i8 %18, i8* %19, align 1, !dbg !50
  br label %11, !dbg !44, !llvm.loop !51

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !52
  ret i8* %22, !dbg !53
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #10

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memset(i8*, i32, i64) #11 !dbg !54 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !61, metadata !DIExpression()), !dbg !62
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %7, metadata !65, metadata !DIExpression()), !dbg !66
  %8 = load i8*, i8** %4, align 8, !dbg !67
  store i8* %8, i8** %7, align 8, !dbg !66
  br label %9, !dbg !68

9:                                                ; preds = %13, %3
  %10 = load i64, i64* %6, align 8, !dbg !69
  %11 = add i64 %10, -1, !dbg !69
  store i64 %11, i64* %6, align 8, !dbg !69
  %12 = icmp ugt i64 %10, 0, !dbg !70
  br i1 %12, label %13, label %18, !dbg !68

13:                                               ; preds = %9
  %14 = load i32, i32* %5, align 4, !dbg !71
  %15 = trunc i32 %14 to i8, !dbg !71
  %16 = load i8*, i8** %7, align 8, !dbg !72
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !72
  store i8* %17, i8** %7, align 8, !dbg !72
  store i8 %15, i8* %16, align 1, !dbg !73
  br label %9, !dbg !68, !llvm.loop !74

18:                                               ; preds = %9
  %19 = load i8*, i8** %4, align 8, !dbg !75
  ret i8* %19, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_overshift_check(i64, i64) #11 !dbg !77 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !82, metadata !DIExpression()), !dbg !83
  store i64 %1, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !84, metadata !DIExpression()), !dbg !85
  %5 = load i64, i64* %4, align 8, !dbg !86
  %6 = load i64, i64* %3, align 8, !dbg !88
  %7 = icmp uge i64 %5, %6, !dbg !89
  br i1 %7, label %8, label %9, !dbg !90

8:                                                ; preds = %2
  call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.18, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.19, i64 0, i64 0)) #14, !dbg !91
  unreachable, !dbg !91

9:                                                ; preds = %2
  ret void, !dbg !93
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #12

define internal void @klee.ctor_stub() {
entry:
  call void @_GLOBAL__sub_I_store_v1.cc()
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { argmemonly nounwind }
attributes #9 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readnone speculatable }
attributes #11 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn nounwind }
attributes #14 = { noreturn }

!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11, !11, !11, !11, !11}
!llvm.dbg.cu = !{!2, !12, !14, !16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__dso_handle", scope: !2, file: !6, line: 1, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C89, file: !3, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/dso_handle.c", directory: "/tmp/klee_build90stp_z3/runtime/Intrinsic")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "klee_src/runtime/Intrinsic/dso_handle.c", directory: "/tmp")
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!13 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!14 = distinct !DICompileUnit(language: DW_LANG_C99, file: !15, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!15 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memset.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!16 = distinct !DICompileUnit(language: DW_LANG_C89, file: !17, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!17 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp/klee_build90stp_z3/runtime/Intrinsic")
!18 = !{!"True"}
!19 = distinct !DISubprogram(name: "memcpy", scope: !20, file: !20, line: 12, type: !21, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !4)
!20 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!21 = !DISubroutineType(types: !22)
!22 = !{!7, !7, !23, !25}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocalVariable(name: "destaddr", arg: 1, scope: !19, file: !20, line: 12, type: !7)
!29 = !DILocation(line: 12, column: 20, scope: !19)
!30 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !19, file: !20, line: 12, type: !23)
!31 = !DILocation(line: 12, column: 42, scope: !19)
!32 = !DILocalVariable(name: "len", arg: 3, scope: !19, file: !20, line: 12, type: !25)
!33 = !DILocation(line: 12, column: 58, scope: !19)
!34 = !DILocalVariable(name: "dest", scope: !19, file: !20, line: 13, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !DILocation(line: 13, column: 9, scope: !19)
!38 = !DILocation(line: 13, column: 16, scope: !19)
!39 = !DILocalVariable(name: "src", scope: !19, file: !20, line: 14, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!42 = !DILocation(line: 14, column: 15, scope: !19)
!43 = !DILocation(line: 14, column: 21, scope: !19)
!44 = !DILocation(line: 16, column: 3, scope: !19)
!45 = !DILocation(line: 16, column: 13, scope: !19)
!46 = !DILocation(line: 16, column: 16, scope: !19)
!47 = !DILocation(line: 17, column: 19, scope: !19)
!48 = !DILocation(line: 17, column: 15, scope: !19)
!49 = !DILocation(line: 17, column: 10, scope: !19)
!50 = !DILocation(line: 17, column: 13, scope: !19)
!51 = distinct !{!51, !44, !47}
!52 = !DILocation(line: 18, column: 10, scope: !19)
!53 = !DILocation(line: 18, column: 3, scope: !19)
!54 = distinct !DISubprogram(name: "memset", scope: !55, file: !55, line: 12, type: !56, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !14, retainedNodes: !4)
!55 = !DIFile(filename: "klee_src/runtime/Freestanding/memset.c", directory: "/tmp")
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58, !25}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DILocalVariable(name: "dst", arg: 1, scope: !54, file: !55, line: 12, type: !7)
!60 = !DILocation(line: 12, column: 20, scope: !54)
!61 = !DILocalVariable(name: "s", arg: 2, scope: !54, file: !55, line: 12, type: !58)
!62 = !DILocation(line: 12, column: 29, scope: !54)
!63 = !DILocalVariable(name: "count", arg: 3, scope: !54, file: !55, line: 12, type: !25)
!64 = !DILocation(line: 12, column: 39, scope: !54)
!65 = !DILocalVariable(name: "a", scope: !54, file: !55, line: 13, type: !35)
!66 = !DILocation(line: 13, column: 9, scope: !54)
!67 = !DILocation(line: 13, column: 13, scope: !54)
!68 = !DILocation(line: 14, column: 3, scope: !54)
!69 = !DILocation(line: 14, column: 15, scope: !54)
!70 = !DILocation(line: 14, column: 18, scope: !54)
!71 = !DILocation(line: 15, column: 12, scope: !54)
!72 = !DILocation(line: 15, column: 7, scope: !54)
!73 = !DILocation(line: 15, column: 10, scope: !54)
!74 = distinct !{!74, !68, !71}
!75 = !DILocation(line: 16, column: 10, scope: !54)
!76 = !DILocation(line: 16, column: 3, scope: !54)
!77 = distinct !DISubprogram(name: "klee_overshift_check", scope: !78, file: !78, line: 20, type: !79, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !4)
!78 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_overshift_check.c", directory: "/tmp")
!79 = !DISubroutineType(types: !80)
!80 = !{null, !81, !81}
!81 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!82 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !77, file: !78, line: 20, type: !81)
!83 = !DILocation(line: 20, column: 46, scope: !77)
!84 = !DILocalVariable(name: "shift", arg: 2, scope: !77, file: !78, line: 20, type: !81)
!85 = !DILocation(line: 20, column: 75, scope: !77)
!86 = !DILocation(line: 21, column: 7, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !78, line: 21, column: 7)
!88 = !DILocation(line: 21, column: 16, scope: !87)
!89 = !DILocation(line: 21, column: 13, scope: !87)
!90 = !DILocation(line: 21, column: 7, scope: !77)
!91 = !DILocation(line: 27, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !78, line: 21, column: 26)
!93 = !DILocation(line: 29, column: 1, scope: !77)
