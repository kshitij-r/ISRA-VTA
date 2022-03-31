; ModuleID = 'gemm.bc'
source_filename = "gemm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@result = dso_local global [10 x i32] zeroinitializer, align 16, !dbg !0
@arr_ref = dso_local global i32* null, align 8, !dbg !8
@arr_val = dso_local global i32* null, align 8, !dbg !12
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !14
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !19
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !21
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !23
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !25
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"acc_mem_gemm[i] == acc_mem_ref[i]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"gemm.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !134 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !140, metadata !DIExpression()), !dbg !141
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i32* %j, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !151
  %cmp = icmp slt i32 %0, 3, !dbg !153
  br i1 %cmp, label %for.body, label %for.end12, !dbg !154

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !155
  br label %for.cond1, !dbg !157

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !158
  %cmp2 = icmp slt i32 %1, 3, !dbg !160
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !161

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !162
  %3 = load i32, i32* %j, align 4, !dbg !163
  %idxprom = sext i32 %3 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !162
  %4 = load i32, i32* %i, align 4, !dbg !164
  %idxprom4 = sext i32 %4 to i64, !dbg !162
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !162
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !162
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !165
  %7 = load i32, i32* %i, align 4, !dbg !166
  %idxprom6 = sext i32 %7 to i64, !dbg !165
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !165
  %8 = load i32, i32* %j, align 4, !dbg !167
  %idxprom8 = sext i32 %8 to i64, !dbg !165
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !165
  store i32 %5, i32* %arrayidx9, align 4, !dbg !168
  %9 = load i32, i32* %j, align 4, !dbg !169
  %inc = add nsw i32 %9, 1, !dbg !169
  store i32 %inc, i32* %j, align 4, !dbg !169
  br label %for.cond1, !dbg !170, !llvm.loop !171

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !173
  %inc11 = add nsw i32 %10, 1, !dbg !173
  store i32 %inc11, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !177
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPjS_(i32* %mat1, i32* %mat2) #0 !dbg !178 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res_index = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !181, metadata !DIExpression()), !dbg !182
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %res_index, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 0, i32* %res_index, align 4, !dbg !186
  call void @llvm.dbg.declare(metadata i32* %res, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 0, i32* %res, align 4, !dbg !188
  call void @llvm.dbg.declare(metadata i32* %i, metadata !189, metadata !DIExpression()), !dbg !191
  store i32 0, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !193
  %cmp = icmp slt i32 %0, 3, !dbg !195
  br i1 %cmp, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !197
  %2 = load i32, i32* %i, align 4, !dbg !199
  %idxprom = sext i32 %2 to i64, !dbg !197
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !197
  %3 = load i32, i32* %arrayidx, align 4, !dbg !197
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !200
  %5 = load i32, i32* %i, align 4, !dbg !201
  %idxprom1 = sext i32 %5 to i64, !dbg !200
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !200
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !200
  %mul = mul i32 %3, %6, !dbg !202
  %7 = load i32, i32* %res, align 4, !dbg !203
  %add = add i32 %7, %mul, !dbg !203
  store i32 %add, i32* %res, align 4, !dbg !203
  %8 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %8, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !208
  %10 = load i32, i32* %res_index, align 4, !dbg !209
  %idxprom3 = sext i32 %10 to i64, !dbg !210
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @result, i64 0, i64 %idxprom3, !dbg !210
  store i32 %9, i32* %arrayidx4, align 4, !dbg !211
  %11 = load i32, i32* %res_index, align 4, !dbg !212
  %inc5 = add nsw i32 %11, 1, !dbg !212
  store i32 %inc5, i32* %res_index, align 4, !dbg !212
  ret i32* getelementptr inbounds ([10 x i32], [10 x i32]* @result, i64 0, i64 0), !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* %mat1, [3 x i32]* %mat2, [3 x i32]* %res) #0 !dbg !214 {
entry:
  %mat1.addr = alloca [3 x i32]*, align 8
  %mat2.addr = alloca [3 x i32]*, align 8
  %res.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i23 = alloca i32, align 4
  %j27 = alloca i32, align 4
  store [3 x i32]* %mat1, [3 x i32]** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat1.addr, metadata !217, metadata !DIExpression()), !dbg !218
  store [3 x i32]* %mat2, [3 x i32]** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat2.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store [3 x i32]* %res, [3 x i32]** %res.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %res.addr, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32* %i, metadata !223, metadata !DIExpression()), !dbg !225
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !227
  %cmp = icmp slt i32 %0, 3, !dbg !229
  br i1 %cmp, label %for.body, label %for.end22, !dbg !230

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !231, metadata !DIExpression()), !dbg !234
  store i32 0, i32* %j, align 4, !dbg !234
  br label %for.cond1, !dbg !235

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !236
  %cmp2 = icmp slt i32 %1, 3, !dbg !238
  br i1 %cmp2, label %for.body3, label %for.inc20, !dbg !239

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !240, metadata !DIExpression()), !dbg !243
  store i32 0, i32* %k, align 4, !dbg !243
  br label %for.cond4, !dbg !244

for.cond4:                                        ; preds = %for.body6, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !245
  %cmp5 = icmp slt i32 %2, 3, !dbg !247
  br i1 %cmp5, label %for.body6, label %for.inc17, !dbg !248

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !249
  %idxprom = sext i32 %3 to i64, !dbg !251
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 %idxprom, !dbg !251
  %4 = load i32, i32* %k, align 4, !dbg !252
  %idxprom7 = sext i32 %4 to i64, !dbg !251
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !251
  %5 = load i32, i32* %arrayidx8, align 4, !dbg !251
  %6 = load i32, i32* %k, align 4, !dbg !253
  %idxprom9 = sext i32 %6 to i64, !dbg !254
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 %idxprom9, !dbg !254
  %7 = load i32, i32* %j, align 4, !dbg !255
  %idxprom11 = sext i32 %7 to i64, !dbg !254
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 %idxprom11, !dbg !254
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !254
  %mul = mul i32 %5, %8, !dbg !256
  %9 = load i32, i32* %i, align 4, !dbg !257
  %idxprom13 = sext i32 %9 to i64, !dbg !258
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom13, !dbg !258
  %10 = load i32, i32* %j, align 4, !dbg !259
  %idxprom15 = sext i32 %10 to i64, !dbg !258
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 %idxprom15, !dbg !258
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !260
  %add = add i32 %11, %mul, !dbg !260
  store i32 %add, i32* %arrayidx16, align 4, !dbg !260
  %12 = load i32, i32* %k, align 4, !dbg !261
  %inc = add nsw i32 %12, 1, !dbg !261
  store i32 %inc, i32* %k, align 4, !dbg !261
  br label %for.cond4, !dbg !262, !llvm.loop !263

for.inc17:                                        ; preds = %for.cond4
  %13 = load i32, i32* %j, align 4, !dbg !265
  %inc18 = add nsw i32 %13, 1, !dbg !265
  store i32 %inc18, i32* %j, align 4, !dbg !265
  br label %for.cond1, !dbg !266, !llvm.loop !267

for.inc20:                                        ; preds = %for.cond1
  %14 = load i32, i32* %i, align 4, !dbg !269
  %inc21 = add nsw i32 %14, 1, !dbg !269
  store i32 %inc21, i32* %i, align 4, !dbg !269
  br label %for.cond, !dbg !270, !llvm.loop !271

for.end22:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !273, metadata !DIExpression()), !dbg !275
  store i32 0, i32* %i23, align 4, !dbg !275
  br label %for.cond24, !dbg !276

for.cond24:                                       ; preds = %for.inc42, %for.end22
  %15 = load i32, i32* %i23, align 4, !dbg !277
  %cmp25 = icmp slt i32 %15, 3, !dbg !279
  br i1 %cmp25, label %for.body26, label %for.end44, !dbg !280

for.body26:                                       ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i32* %j27, metadata !281, metadata !DIExpression()), !dbg !284
  store i32 0, i32* %j27, align 4, !dbg !284
  br label %for.cond28, !dbg !285

for.cond28:                                       ; preds = %for.body30, %for.body26
  %16 = load i32, i32* %j27, align 4, !dbg !286
  %cmp29 = icmp slt i32 %16, 3, !dbg !288
  %17 = load i32, i32* %i23, align 4, !dbg !289
  br i1 %cmp29, label %for.body30, label %for.inc42, !dbg !290

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %17 to i64, !dbg !291
  %arrayidx32 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom31, !dbg !291
  %18 = load i32, i32* %j27, align 4, !dbg !293
  %idxprom33 = sext i32 %18 to i64, !dbg !291
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !291
  %19 = load i32, i32* %arrayidx34, align 4, !dbg !291
  %20 = load i32, i32* %i23, align 4, !dbg !294
  %mul35 = mul nsw i32 %20, 3, !dbg !295
  %21 = load i32, i32* %j27, align 4, !dbg !296
  %add36 = add nsw i32 %mul35, %21, !dbg !297
  %idxprom37 = sext i32 %add36 to i64, !dbg !298
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 %idxprom37, !dbg !298
  store i32 %19, i32* %arrayidx38, align 4, !dbg !299
  %22 = load i32, i32* %j27, align 4, !dbg !300
  %inc40 = add nsw i32 %22, 1, !dbg !300
  store i32 %inc40, i32* %j27, align 4, !dbg !300
  br label %for.cond28, !dbg !301, !llvm.loop !302

for.inc42:                                        ; preds = %for.cond28
  %inc43 = add nsw i32 %17, 1, !dbg !304
  store i32 %inc43, i32* %i23, align 4, !dbg !304
  br label %for.cond24, !dbg !305, !llvm.loop !306

for.end44:                                        ; preds = %for.cond24
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 0), !dbg !308
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !309 {
entry:
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %arr_ref = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !324, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !326, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i32* %i, metadata !330, metadata !DIExpression()), !dbg !332
  store i32 0, i32* %i, align 4, !dbg !332
  br label %for.cond, !dbg !333

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !334
  %cmp = icmp slt i32 %0, 3, !dbg !336
  br i1 %cmp, label %for.body, label %for.end, !dbg !337

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !338
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !340
  %1 = load i32*, i32** %inp_mem, align 8, !dbg !340
  %2 = load i32, i32* %i, align 4, !dbg !341
  %idx.ext = sext i32 %2 to i64, !dbg !342
  %add.ptr = getelementptr inbounds i32, i32* %1, i64 %idx.ext, !dbg !342
  %3 = load i32, i32* %add.ptr, align 4, !dbg !343
  %4 = load i32, i32* %i, align 4, !dbg !344
  %idxprom = sext i32 %4 to i64, !dbg !345
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !345
  store i32 %3, i32* %arrayidx, align 4, !dbg !346
  %5 = load i32, i32* %i, align 4, !dbg !347
  %inc = add nsw i32 %5, 1, !dbg !347
  store i32 %inc, i32* %i, align 4, !dbg !347
  br label %for.cond, !dbg !348, !llvm.loop !349

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !351, metadata !DIExpression()), !dbg !353
  store i32 0, i32* %i1, align 4, !dbg !353
  br label %for.cond2, !dbg !354

for.cond2:                                        ; preds = %for.body4, %for.end
  %6 = load i32, i32* %i1, align 4, !dbg !355
  %cmp3 = icmp slt i32 %6, 3, !dbg !357
  br i1 %cmp3, label %for.body4, label %for.end12, !dbg !358

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !359
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS5, i32 0, i32 1, !dbg !361
  %7 = load i32*, i32** %wgt_mem, align 8, !dbg !361
  %8 = load i32, i32* %i1, align 4, !dbg !362
  %idx.ext6 = sext i32 %8 to i64, !dbg !363
  %add.ptr7 = getelementptr inbounds i32, i32* %7, i64 %idx.ext6, !dbg !363
  %9 = load i32, i32* %add.ptr7, align 4, !dbg !364
  %10 = load i32, i32* %i1, align 4, !dbg !365
  %idxprom8 = sext i32 %10 to i64, !dbg !366
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom8, !dbg !366
  store i32 %9, i32* %arrayidx9, align 4, !dbg !367
  %11 = load i32, i32* %i1, align 4, !dbg !368
  %inc11 = add nsw i32 %11, 1, !dbg !368
  store i32 %inc11, i32* %i1, align 4, !dbg !368
  br label %for.cond2, !dbg !369, !llvm.loop !370

for.end12:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !372, metadata !DIExpression()), !dbg !373
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !374
  %arraydecay13 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !375
  %call = call i32* @_Z14matrixMultiplyPjS_(i32* %arraydecay, i32* %arraydecay13), !dbg !376
  store i32* %call, i32** %arr_ref, align 8, !dbg !373
  %12 = load i32*, i32** %arr_ref, align 8, !dbg !377
  ret i32* %12, !dbg !378
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !379 {
entry:
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %arr_val = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !393, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !395, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !397, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.declare(metadata i32* %i, metadata !399, metadata !DIExpression()), !dbg !401
  store i32 0, i32* %i, align 4, !dbg !401
  br label %for.cond, !dbg !402

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !403
  %cmp = icmp slt i32 %0, 3, !dbg !405
  br i1 %cmp, label %for.body, label %for.end, !dbg !406

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !407
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !409
  %1 = load i32, i32* %inp_mem, align 4, !dbg !409
  %2 = load i32, i32* %i, align 4, !dbg !410
  %add = add i32 %1, %2, !dbg !411
  %3 = load i32, i32* %i, align 4, !dbg !412
  %idxprom = sext i32 %3 to i64, !dbg !413
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !413
  store i32 %add, i32* %arrayidx, align 4, !dbg !414
  %4 = load i32, i32* %i, align 4, !dbg !415
  %inc = add nsw i32 %4, 1, !dbg !415
  store i32 %inc, i32* %i, align 4, !dbg !415
  br label %for.cond, !dbg !416, !llvm.loop !417

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !419, metadata !DIExpression()), !dbg !421
  store i32 0, i32* %i1, align 4, !dbg !421
  br label %for.cond2, !dbg !422

for.cond2:                                        ; preds = %for.body4, %for.end
  %5 = load i32, i32* %i1, align 4, !dbg !423
  %cmp3 = icmp slt i32 %5, 3, !dbg !425
  br i1 %cmp3, label %for.body4, label %for.end10, !dbg !426

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !427
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS5, i32 0, i32 1, !dbg !429
  %6 = load i32, i32* %wgt_mem, align 4, !dbg !429
  %7 = load i32, i32* %i1, align 4, !dbg !430
  %idxprom6 = sext i32 %7 to i64, !dbg !431
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom6, !dbg !431
  store i32 %6, i32* %arrayidx7, align 4, !dbg !432
  %8 = load i32, i32* %i1, align 4, !dbg !433
  %inc9 = add nsw i32 %8, 1, !dbg !433
  store i32 %inc9, i32* %i1, align 4, !dbg !433
  br label %for.cond2, !dbg !434, !llvm.loop !435

for.end10:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !437, metadata !DIExpression()), !dbg !438
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !439
  %arraydecay11 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !440
  %call = call i32* @_Z14matrixMultiplyPjS_(i32* %arraydecay, i32* %arraydecay11), !dbg !441
  store i32* %call, i32** %arr_val, align 8, !dbg !438
  %9 = load i32*, i32** %arr_val, align 8, !dbg !442
  ret i32* %9, !dbg !443
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !444 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %inp_mem_row0 = alloca [3 x i32], align 4
  %inp_mem_row1 = alloca [3 x i32], align 4
  %inp_mem_row2 = alloca [3 x i32], align 4
  %wgt_mem_row0 = alloca [3 x i32], align 4
  %wgt_mem_row1 = alloca [3 x i32], align 4
  %wgt_mem_row2 = alloca [3 x i32], align 4
  %acc_mem_row0 = alloca [3 x i32], align 4
  %acc_mem_row1 = alloca [3 x i32], align 4
  %acc_mem_row2 = alloca [3 x i32], align 4
  %acc_mem_ref = alloca i32*, align 8
  %acc_mem_val = alloca i32*, align 8
  %acc_mem_gemm = alloca i32*, align 8
  %opcode = alloca i32, align 4
  %op_type = alloca i32, align 4
  %acc_stage2 = alloca [9 x i32], align 16
  %acc_stage1 = alloca [9 x i32], align 16
  %acc_stage3 = alloca [9 x i32], align 16
  %gemm_uop = alloca [9 x %struct.GEMM_STRUCT_REF], align 16
  %gemm = alloca [9 x %struct.GEMM_STRUCT_VAL], align 16
  %microop = alloca [9 x %struct.INSTR], align 16
  %microop_val = alloca [9 x %struct.INSTR_VAL], align 16
  %i = alloca i32, align 4
  %i240 = alloca i32, align 4
  %agg.tmp = alloca %struct.INSTR, align 8
  %i250 = alloca i32, align 4
  %agg.tmp254 = alloca %struct.INSTR_VAL, align 8
  %i261 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !448, metadata !DIExpression()), !dbg !449
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !450, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !452, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !454, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !456, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !458, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !460, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !470, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !472, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !474, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !484, metadata !DIExpression()), !dbg !485
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !486
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !487
  %0 = bitcast i32* %arraydecay to i8*, !dbg !487
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !487
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !488
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !488
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !488
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !489
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !489
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !489
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !490
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !490
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !490
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !491
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !491
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !491
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !492
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !492
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !492
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !493
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !493
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !493
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !494
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !494
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !494
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !495
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !495
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !495
  %18 = bitcast i32* %op_type to i8*, !dbg !496
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !497
  %19 = bitcast i32* %opcode to i8*, !dbg !498
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !499
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !500, metadata !DIExpression()), !dbg !502
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !503
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !504
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !505
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !504
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !504
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !506
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !504
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !504
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !507
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !504
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !503
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !508
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !509
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !508
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !508
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !510
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !508
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !508
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !511
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !508
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !503
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !512
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !513
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !512
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !512
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !514
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !512
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !512
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !515
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !512
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !503
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !516
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !517
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !516
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !516
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !518
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !516
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !516
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !519
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !516
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !503
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !520
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !521
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !520
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !520
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !522
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !520
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !520
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !523
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !520
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !503
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !524
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !525
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !524
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !524
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !526
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !524
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !524
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !527
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !524
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !503
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !528
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !529
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !528
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !528
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !530
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !528
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !528
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !531
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !528
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !503
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !532
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !533
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !532
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !532
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !534
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !532
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !532
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !535
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !532
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !503
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !536
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !537
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !536
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !536
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !538
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !536
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !536
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !539
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !536
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !540, metadata !DIExpression()), !dbg !542
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !543
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !544
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !545
  %20 = load i32, i32* %arrayidx68, align 4, !dbg !545
  store i32 %20, i32* %inp_mem67, align 4, !dbg !544
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !544
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !546
  %21 = load i32, i32* %arrayidx70, align 4, !dbg !546
  store i32 %21, i32* %wgt_mem69, align 4, !dbg !544
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !544
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !547
  %22 = load i32, i32* %arrayidx72, align 4, !dbg !547
  store i32 %22, i32* %acc_mem71, align 4, !dbg !544
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !543
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !548
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !549
  %23 = load i32, i32* %arrayidx75, align 4, !dbg !549
  store i32 %23, i32* %inp_mem74, align 4, !dbg !548
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !548
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !550
  %24 = load i32, i32* %arrayidx77, align 4, !dbg !550
  store i32 %24, i32* %wgt_mem76, align 4, !dbg !548
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !548
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !551
  %25 = load i32, i32* %arrayidx79, align 4, !dbg !551
  store i32 %25, i32* %acc_mem78, align 4, !dbg !548
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !543
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !552
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !553
  %26 = load i32, i32* %arrayidx82, align 4, !dbg !553
  store i32 %26, i32* %inp_mem81, align 4, !dbg !552
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !552
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !554
  %27 = load i32, i32* %arrayidx84, align 4, !dbg !554
  store i32 %27, i32* %wgt_mem83, align 4, !dbg !552
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !552
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !555
  %28 = load i32, i32* %arrayidx86, align 4, !dbg !555
  store i32 %28, i32* %acc_mem85, align 4, !dbg !552
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !543
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !556
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !557
  %29 = load i32, i32* %arrayidx89, align 4, !dbg !557
  store i32 %29, i32* %inp_mem88, align 4, !dbg !556
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !556
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !558
  %30 = load i32, i32* %arrayidx91, align 4, !dbg !558
  store i32 %30, i32* %wgt_mem90, align 4, !dbg !556
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !556
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !559
  %31 = load i32, i32* %arrayidx93, align 4, !dbg !559
  store i32 %31, i32* %acc_mem92, align 4, !dbg !556
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !543
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !560
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !561
  %32 = load i32, i32* %arrayidx96, align 4, !dbg !561
  store i32 %32, i32* %inp_mem95, align 4, !dbg !560
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !560
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !562
  %33 = load i32, i32* %arrayidx98, align 4, !dbg !562
  store i32 %33, i32* %wgt_mem97, align 4, !dbg !560
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !560
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !563
  %34 = load i32, i32* %arrayidx100, align 4, !dbg !563
  store i32 %34, i32* %acc_mem99, align 4, !dbg !560
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !543
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !564
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !565
  %35 = load i32, i32* %arrayidx103, align 4, !dbg !565
  store i32 %35, i32* %inp_mem102, align 4, !dbg !564
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !564
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !566
  %36 = load i32, i32* %arrayidx105, align 4, !dbg !566
  store i32 %36, i32* %wgt_mem104, align 4, !dbg !564
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !564
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !567
  %37 = load i32, i32* %arrayidx107, align 4, !dbg !567
  store i32 %37, i32* %acc_mem106, align 4, !dbg !564
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !543
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !568
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !569
  %38 = load i32, i32* %arrayidx110, align 4, !dbg !569
  store i32 %38, i32* %inp_mem109, align 4, !dbg !568
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !568
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !570
  %39 = load i32, i32* %arrayidx112, align 4, !dbg !570
  store i32 %39, i32* %wgt_mem111, align 4, !dbg !568
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !568
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !571
  %40 = load i32, i32* %arrayidx114, align 4, !dbg !571
  store i32 %40, i32* %acc_mem113, align 4, !dbg !568
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !543
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !572
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !573
  %41 = load i32, i32* %arrayidx117, align 4, !dbg !573
  store i32 %41, i32* %inp_mem116, align 4, !dbg !572
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !572
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !574
  %42 = load i32, i32* %arrayidx119, align 4, !dbg !574
  store i32 %42, i32* %wgt_mem118, align 4, !dbg !572
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !572
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !575
  %43 = load i32, i32* %arrayidx121, align 4, !dbg !575
  store i32 %43, i32* %acc_mem120, align 4, !dbg !572
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !543
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !576
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !577
  %44 = load i32, i32* %arrayidx124, align 4, !dbg !577
  store i32 %44, i32* %inp_mem123, align 4, !dbg !576
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !576
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !578
  %45 = load i32, i32* %arrayidx126, align 4, !dbg !578
  store i32 %45, i32* %wgt_mem125, align 4, !dbg !576
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !576
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !579
  %46 = load i32, i32* %arrayidx128, align 4, !dbg !579
  store i32 %46, i32* %acc_mem127, align 4, !dbg !576
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !580, metadata !DIExpression()), !dbg !582
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !583
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !584
  store i32 0, i32* %ID, align 8, !dbg !584
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !584
  store i32 2, i32* %OPCODE, align 4, !dbg !584
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !584
  store i32 0, i32* %OPTYPE, align 8, !dbg !584
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !584
  %arrayidx130 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !585
  %47 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !585
  %48 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx130 to i8*, !dbg !585
  %49 = call i8* @memcpy(i8* %47, i8* %48, i64 24), !dbg !585
  %arrayinit.element131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !583
  %ID132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 0, !dbg !586
  store i32 1, i32* %ID132, align 8, !dbg !586
  %OPCODE133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 1, !dbg !586
  store i32 2, i32* %OPCODE133, align 4, !dbg !586
  %OPTYPE134 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 2, !dbg !586
  store i32 0, i32* %OPTYPE134, align 8, !dbg !586
  %OPERANDS135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 3, !dbg !586
  %arrayidx136 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !587
  %50 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS135 to i8*, !dbg !587
  %51 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx136 to i8*, !dbg !587
  %52 = call i8* @memcpy(i8* %50, i8* %51, i64 24), !dbg !587
  %arrayinit.element137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i64 1, !dbg !583
  %ID138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 0, !dbg !588
  store i32 2, i32* %ID138, align 8, !dbg !588
  %OPCODE139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 1, !dbg !588
  store i32 2, i32* %OPCODE139, align 4, !dbg !588
  %OPTYPE140 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 2, !dbg !588
  store i32 0, i32* %OPTYPE140, align 8, !dbg !588
  %OPERANDS141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 3, !dbg !588
  %arrayidx142 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !589
  %53 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS141 to i8*, !dbg !589
  %54 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx142 to i8*, !dbg !589
  %55 = call i8* @memcpy(i8* %53, i8* %54, i64 24), !dbg !589
  %arrayinit.element143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i64 1, !dbg !583
  %ID144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 0, !dbg !590
  store i32 3, i32* %ID144, align 8, !dbg !590
  %OPCODE145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 1, !dbg !590
  store i32 2, i32* %OPCODE145, align 4, !dbg !590
  %OPTYPE146 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 2, !dbg !590
  store i32 0, i32* %OPTYPE146, align 8, !dbg !590
  %OPERANDS147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 3, !dbg !590
  %arrayidx148 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !591
  %56 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS147 to i8*, !dbg !591
  %57 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx148 to i8*, !dbg !591
  %58 = call i8* @memcpy(i8* %56, i8* %57, i64 24), !dbg !591
  %arrayinit.element149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i64 1, !dbg !583
  %ID150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 0, !dbg !592
  store i32 4, i32* %ID150, align 8, !dbg !592
  %OPCODE151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 1, !dbg !592
  store i32 2, i32* %OPCODE151, align 4, !dbg !592
  %OPTYPE152 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 2, !dbg !592
  store i32 0, i32* %OPTYPE152, align 8, !dbg !592
  %OPERANDS153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 3, !dbg !592
  %arrayidx154 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !593
  %59 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS153 to i8*, !dbg !593
  %60 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx154 to i8*, !dbg !593
  %61 = call i8* @memcpy(i8* %59, i8* %60, i64 24), !dbg !593
  %arrayinit.element155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i64 1, !dbg !583
  %ID156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 0, !dbg !594
  store i32 5, i32* %ID156, align 8, !dbg !594
  %OPCODE157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 1, !dbg !594
  store i32 2, i32* %OPCODE157, align 4, !dbg !594
  %OPTYPE158 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 2, !dbg !594
  store i32 0, i32* %OPTYPE158, align 8, !dbg !594
  %OPERANDS159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 3, !dbg !594
  %arrayidx160 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !595
  %62 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS159 to i8*, !dbg !595
  %63 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx160 to i8*, !dbg !595
  %64 = call i8* @memcpy(i8* %62, i8* %63, i64 24), !dbg !595
  %arrayinit.element161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i64 1, !dbg !583
  %ID162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 0, !dbg !596
  store i32 6, i32* %ID162, align 8, !dbg !596
  %OPCODE163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 1, !dbg !596
  store i32 2, i32* %OPCODE163, align 4, !dbg !596
  %OPTYPE164 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 2, !dbg !596
  store i32 0, i32* %OPTYPE164, align 8, !dbg !596
  %OPERANDS165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 3, !dbg !596
  %arrayidx166 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !597
  %65 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS165 to i8*, !dbg !597
  %66 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx166 to i8*, !dbg !597
  %67 = call i8* @memcpy(i8* %65, i8* %66, i64 24), !dbg !597
  %arrayinit.element167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i64 1, !dbg !583
  %ID168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 0, !dbg !598
  store i32 7, i32* %ID168, align 8, !dbg !598
  %OPCODE169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 1, !dbg !598
  store i32 2, i32* %OPCODE169, align 4, !dbg !598
  %OPTYPE170 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 2, !dbg !598
  store i32 0, i32* %OPTYPE170, align 8, !dbg !598
  %OPERANDS171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 3, !dbg !598
  %arrayidx172 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !599
  %68 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS171 to i8*, !dbg !599
  %69 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx172 to i8*, !dbg !599
  %70 = call i8* @memcpy(i8* %68, i8* %69, i64 24), !dbg !599
  %arrayinit.element173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i64 1, !dbg !583
  %ID174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 0, !dbg !600
  store i32 8, i32* %ID174, align 8, !dbg !600
  %OPCODE175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 1, !dbg !600
  store i32 2, i32* %OPCODE175, align 4, !dbg !600
  %OPTYPE176 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 2, !dbg !600
  store i32 0, i32* %OPTYPE176, align 8, !dbg !600
  %OPERANDS177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 3, !dbg !600
  %arrayidx178 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !601
  %71 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS177 to i8*, !dbg !601
  %72 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx178 to i8*, !dbg !601
  %73 = call i8* @memcpy(i8* %71, i8* %72, i64 24), !dbg !601
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !602, metadata !DIExpression()), !dbg !604
  %arrayinit.begin179 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !605
  %ID180 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 0, !dbg !606
  store i32 0, i32* %ID180, align 8, !dbg !606
  %OPCODE181 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 1, !dbg !606
  store i32 2, i32* %OPCODE181, align 4, !dbg !606
  %OPTYPE182 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 2, !dbg !606
  store i32 0, i32* %OPTYPE182, align 8, !dbg !606
  %OPERANDS183 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 3, !dbg !606
  %arrayidx184 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !607
  %74 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS183 to i8*, !dbg !607
  %75 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx184 to i8*, !dbg !607
  %76 = call i8* @memcpy(i8* %74, i8* %75, i64 12), !dbg !607
  %arrayinit.element185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i64 1, !dbg !605
  %ID186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 0, !dbg !608
  store i32 1, i32* %ID186, align 8, !dbg !608
  %OPCODE187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 1, !dbg !608
  store i32 2, i32* %OPCODE187, align 4, !dbg !608
  %OPTYPE188 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 2, !dbg !608
  store i32 0, i32* %OPTYPE188, align 8, !dbg !608
  %OPERANDS189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 3, !dbg !608
  %arrayidx190 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !609
  %77 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS189 to i8*, !dbg !609
  %78 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx190 to i8*, !dbg !609
  %79 = call i8* @memcpy(i8* %77, i8* %78, i64 12), !dbg !609
  %arrayinit.element191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i64 1, !dbg !605
  %ID192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 0, !dbg !610
  store i32 2, i32* %ID192, align 8, !dbg !610
  %OPCODE193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 1, !dbg !610
  store i32 2, i32* %OPCODE193, align 4, !dbg !610
  %OPTYPE194 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 2, !dbg !610
  store i32 0, i32* %OPTYPE194, align 8, !dbg !610
  %OPERANDS195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 3, !dbg !610
  %arrayidx196 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !611
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS195 to i8*, !dbg !611
  %81 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx196 to i8*, !dbg !611
  %82 = call i8* @memcpy(i8* %80, i8* %81, i64 12), !dbg !611
  %arrayinit.element197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i64 1, !dbg !605
  %ID198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 0, !dbg !612
  store i32 3, i32* %ID198, align 8, !dbg !612
  %OPCODE199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 1, !dbg !612
  store i32 2, i32* %OPCODE199, align 4, !dbg !612
  %OPTYPE200 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 2, !dbg !612
  store i32 0, i32* %OPTYPE200, align 8, !dbg !612
  %OPERANDS201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 3, !dbg !612
  %arrayidx202 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !613
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS201 to i8*, !dbg !613
  %84 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx202 to i8*, !dbg !613
  %85 = call i8* @memcpy(i8* %83, i8* %84, i64 12), !dbg !613
  %arrayinit.element203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i64 1, !dbg !605
  %ID204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 0, !dbg !614
  store i32 4, i32* %ID204, align 8, !dbg !614
  %OPCODE205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 1, !dbg !614
  store i32 2, i32* %OPCODE205, align 4, !dbg !614
  %OPTYPE206 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 2, !dbg !614
  store i32 0, i32* %OPTYPE206, align 8, !dbg !614
  %OPERANDS207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 3, !dbg !614
  %arrayidx208 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !615
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS207 to i8*, !dbg !615
  %87 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx208 to i8*, !dbg !615
  %88 = call i8* @memcpy(i8* %86, i8* %87, i64 12), !dbg !615
  %arrayinit.element209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i64 1, !dbg !605
  %ID210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 0, !dbg !616
  store i32 5, i32* %ID210, align 8, !dbg !616
  %OPCODE211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 1, !dbg !616
  store i32 2, i32* %OPCODE211, align 4, !dbg !616
  %OPTYPE212 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 2, !dbg !616
  store i32 0, i32* %OPTYPE212, align 8, !dbg !616
  %OPERANDS213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 3, !dbg !616
  %arrayidx214 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !617
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS213 to i8*, !dbg !617
  %90 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx214 to i8*, !dbg !617
  %91 = call i8* @memcpy(i8* %89, i8* %90, i64 12), !dbg !617
  %arrayinit.element215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i64 1, !dbg !605
  %ID216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 0, !dbg !618
  store i32 6, i32* %ID216, align 8, !dbg !618
  %OPCODE217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 1, !dbg !618
  store i32 2, i32* %OPCODE217, align 4, !dbg !618
  %OPTYPE218 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 2, !dbg !618
  store i32 0, i32* %OPTYPE218, align 8, !dbg !618
  %OPERANDS219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 3, !dbg !618
  %arrayidx220 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !619
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS219 to i8*, !dbg !619
  %93 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx220 to i8*, !dbg !619
  %94 = call i8* @memcpy(i8* %92, i8* %93, i64 12), !dbg !619
  %arrayinit.element221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i64 1, !dbg !605
  %ID222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 0, !dbg !620
  store i32 7, i32* %ID222, align 8, !dbg !620
  %OPCODE223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 1, !dbg !620
  store i32 2, i32* %OPCODE223, align 4, !dbg !620
  %OPTYPE224 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 2, !dbg !620
  store i32 0, i32* %OPTYPE224, align 8, !dbg !620
  %OPERANDS225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 3, !dbg !620
  %arrayidx226 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !621
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS225 to i8*, !dbg !621
  %96 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx226 to i8*, !dbg !621
  %97 = call i8* @memcpy(i8* %95, i8* %96, i64 12), !dbg !621
  %arrayinit.element227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i64 1, !dbg !605
  %ID228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 0, !dbg !622
  store i32 8, i32* %ID228, align 8, !dbg !622
  %OPCODE229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 1, !dbg !622
  store i32 2, i32* %OPCODE229, align 4, !dbg !622
  %OPTYPE230 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 2, !dbg !622
  store i32 0, i32* %OPTYPE230, align 8, !dbg !622
  %OPERANDS231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 3, !dbg !622
  %arrayidx232 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !623
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS231 to i8*, !dbg !623
  %99 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx232 to i8*, !dbg !623
  %100 = call i8* @memcpy(i8* %98, i8* %99, i64 12), !dbg !623
  %call = call i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 0)), !dbg !624
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !625
  call void @llvm.dbg.declare(metadata i32* %i, metadata !626, metadata !DIExpression()), !dbg !628
  store i32 0, i32* %i, align 4, !dbg !628
  br label %for.cond, !dbg !629

for.cond:                                         ; preds = %for.body, %entry
  %101 = load i32, i32* %i, align 4, !dbg !630
  %cmp = icmp slt i32 %101, 9, !dbg !632
  br i1 %cmp, label %for.body, label %for.end, !dbg !633

for.body:                                         ; preds = %for.cond
  %102 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !634
  %103 = load i32, i32* %i, align 4, !dbg !636
  %idxprom = sext i32 %103 to i64, !dbg !634
  %arrayidx233 = getelementptr inbounds i32, i32* %102, i64 %idxprom, !dbg !634
  %104 = load i32, i32* %arrayidx233, align 4, !dbg !634
  %105 = load i32, i32* %i, align 4, !dbg !637
  %idxprom234 = sext i32 %105 to i64, !dbg !638
  %arrayidx235 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom234, !dbg !638
  store i32 %104, i32* %arrayidx235, align 4, !dbg !639
  %106 = load i32, i32* %i, align 4, !dbg !640
  %inc = add nsw i32 %106, 1, !dbg !640
  store i32 %inc, i32* %i, align 4, !dbg !640
  br label %for.cond, !dbg !641, !llvm.loop !642

for.end:                                          ; preds = %for.cond
  %107 = load i32, i32* %opcode, align 4, !dbg !644
  %cmp236 = icmp eq i32 %107, 2, !dbg !646
  %108 = load i32, i32* %op_type, align 4, !dbg !647
  %cmp237 = icmp uge i32 %108, 0, !dbg !648
  %or.cond = and i1 %cmp236, %cmp237, !dbg !649
  %109 = load i32, i32* %op_type, align 4, !dbg !650
  %cmp239 = icmp ule i32 %109, 3, !dbg !651
  %or.cond1 = and i1 %or.cond, %cmp239, !dbg !649
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !649

if.then:                                          ; preds = %for.end
  call void @llvm.dbg.declare(metadata i32* %i240, metadata !652, metadata !DIExpression()), !dbg !655
  store i32 0, i32* %i240, align 4, !dbg !655
  br label %for.cond241, !dbg !656

for.cond241:                                      ; preds = %for.body243, %if.then
  %110 = load i32, i32* %i240, align 4, !dbg !657
  %cmp242 = icmp slt i32 %110, 9, !dbg !659
  br i1 %cmp242, label %for.body243, label %for.end249, !dbg !660

for.body243:                                      ; preds = %for.cond241
  %111 = load i32, i32* %i240, align 4, !dbg !661
  %idxprom244 = sext i32 %111 to i64, !dbg !663
  %arrayidx245 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom244, !dbg !663
  %112 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !663
  %113 = bitcast %struct.INSTR* %arrayidx245 to i8*, !dbg !663
  %114 = call i8* @memcpy(i8* %112, i8* %113, i64 40), !dbg !663
  %call246 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !664
  store i32* %call246, i32** %acc_mem_ref, align 8, !dbg !665
  %115 = load i32, i32* %i240, align 4, !dbg !666
  %inc248 = add nsw i32 %115, 1, !dbg !666
  store i32 %inc248, i32* %i240, align 4, !dbg !666
  br label %for.cond241, !dbg !667, !llvm.loop !668

for.end249:                                       ; preds = %for.cond241
  call void @llvm.dbg.declare(metadata i32* %i250, metadata !670, metadata !DIExpression()), !dbg !672
  store i32 0, i32* %i250, align 4, !dbg !672
  br label %for.cond251, !dbg !673

for.cond251:                                      ; preds = %for.body253, %for.end249
  %116 = load i32, i32* %i250, align 4, !dbg !674
  %cmp252 = icmp slt i32 %116, 9, !dbg !676
  br i1 %cmp252, label %for.body253, label %for.end260, !dbg !677

for.body253:                                      ; preds = %for.cond251
  %117 = load i32, i32* %i250, align 4, !dbg !678
  %idxprom255 = sext i32 %117 to i64, !dbg !680
  %arrayidx256 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom255, !dbg !680
  %118 = bitcast %struct.INSTR_VAL* %agg.tmp254 to i8*, !dbg !680
  %119 = bitcast %struct.INSTR_VAL* %arrayidx256 to i8*, !dbg !680
  %120 = call i8* @memcpy(i8* %118, i8* %119, i64 24), !dbg !680
  %call257 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp254), !dbg !681
  store i32* %call257, i32** %acc_mem_val, align 8, !dbg !682
  %121 = load i32, i32* %i250, align 4, !dbg !683
  %inc259 = add nsw i32 %121, 1, !dbg !683
  store i32 %inc259, i32* %i250, align 4, !dbg !683
  br label %for.cond251, !dbg !684, !llvm.loop !685

for.end260:                                       ; preds = %for.cond251
  call void @llvm.dbg.declare(metadata i32* %i261, metadata !687, metadata !DIExpression()), !dbg !689
  store i32 0, i32* %i261, align 4, !dbg !689
  br label %for.cond262, !dbg !690

for.cond262:                                      ; preds = %for.inc270, %for.end260
  %122 = load i32, i32* %i261, align 4, !dbg !691
  %cmp263 = icmp slt i32 %122, 9, !dbg !693
  br i1 %cmp263, label %for.body264, label %if.end, !dbg !694

for.body264:                                      ; preds = %for.cond262
  %123 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !695
  %124 = load i32, i32* %i261, align 4, !dbg !695
  %idxprom265 = sext i32 %124 to i64, !dbg !695
  %arrayidx266 = getelementptr inbounds i32, i32* %123, i64 %idxprom265, !dbg !695
  %125 = load i32, i32* %arrayidx266, align 4, !dbg !695
  %126 = load i32*, i32** %acc_mem_ref, align 8, !dbg !695
  %127 = load i32, i32* %i261, align 4, !dbg !695
  %idxprom267 = sext i32 %127 to i64, !dbg !695
  %arrayidx268 = getelementptr inbounds i32, i32* %126, i64 %idxprom267, !dbg !695
  %128 = load i32, i32* %arrayidx268, align 4, !dbg !695
  %cmp269 = icmp eq i32 %125, %128, !dbg !695
  br i1 %cmp269, label %for.inc270, label %cond.false, !dbg !695

cond.false:                                       ; preds = %for.body264
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 153, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !695
  unreachable, !dbg !695

for.inc270:                                       ; preds = %for.body264
  %129 = load i32, i32* %i261, align 4, !dbg !697
  %inc271 = add nsw i32 %129, 1, !dbg !697
  store i32 %inc271, i32* %i261, align 4, !dbg !697
  br label %for.cond262, !dbg !698, !llvm.loop !699

if.end:                                           ; preds = %for.cond262, %for.end
  ret i32 0, !dbg !701
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !702 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !708, metadata !DIExpression()), !dbg !709
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !710, metadata !DIExpression()), !dbg !711
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !712, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.declare(metadata i8** %7, metadata !714, metadata !DIExpression()), !dbg !715
  %9 = load i8*, i8** %4, align 8, !dbg !716
  store i8* %9, i8** %7, align 8, !dbg !715
  call void @llvm.dbg.declare(metadata i8** %8, metadata !717, metadata !DIExpression()), !dbg !718
  %10 = load i8*, i8** %5, align 8, !dbg !719
  store i8* %10, i8** %8, align 8, !dbg !718
  br label %11, !dbg !720

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !721
  %13 = add i64 %12, -1, !dbg !721
  store i64 %13, i64* %6, align 8, !dbg !721
  %14 = icmp ugt i64 %12, 0, !dbg !722
  br i1 %14, label %15, label %21, !dbg !720

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !723
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !723
  store i8* %17, i8** %8, align 8, !dbg !723
  %18 = load i8, i8* %16, align 1, !dbg !724
  %19 = load i8*, i8** %7, align 8, !dbg !725
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !725
  store i8* %20, i8** %7, align 8, !dbg !725
  store i8 %18, i8* %19, align 1, !dbg !726
  br label %11, !dbg !720, !llvm.loop !727

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !728
  ret i8* %22, !dbg !729
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !127}
!llvm.module.flags = !{!129, !130, !131}
!llvm.ident = !{!132, !133}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 10, type: !124, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !30, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !12, !14, !19, !21, !23, !25}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "arr_ref", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "arr_val", scope: !2, file: !3, line: 12, type: !10, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 13, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !17)
!17 = !{!18, !18}
!18 = !DISubrange(count: 3)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 14, type: !16, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 15, type: !16, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 16, type: !16, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 17, type: !27, isLocal: false, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 9)
!30 = !{!31, !45, !49, !55, !59, !63, !73, !77, !79, !81, !85, !89, !93, !97, !101, !103, !105, !107, !111, !115, !119, !121, !123}
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !33, file: !44, line: 75)
!32 = !DINamespace(name: "std", scope: null)
!33 = !DISubprogram(name: "memchr", scope: !34, file: !34, line: 90, type: !35, flags: DIFlagPrototyped, spFlags: 0)
!34 = !DIFile(filename: "/usr/include/string.h", directory: "")
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !38, !40, !41}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !46, file: !44, line: 76)
!46 = !DISubprogram(name: "memcmp", scope: !34, file: !34, line: 63, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DISubroutineType(types: !48)
!48 = !{!40, !38, !38, !41}
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !50, file: !44, line: 77)
!50 = !DISubprogram(name: "memcpy", scope: !34, file: !34, line: 42, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DISubroutineType(types: !52)
!52 = !{!37, !53, !54, !41}
!53 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !37)
!54 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !38)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !56, file: !44, line: 78)
!56 = !DISubprogram(name: "memmove", scope: !34, file: !34, line: 46, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DISubroutineType(types: !58)
!58 = !{!37, !37, !38, !41}
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !60, file: !44, line: 79)
!60 = !DISubprogram(name: "memset", scope: !34, file: !34, line: 60, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!37, !37, !40, !41}
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !64, file: !44, line: 80)
!64 = !DISubprogram(name: "strcat", scope: !34, file: !34, line: 129, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !69, !70}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !67)
!70 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !68)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !74, file: !44, line: 81)
!74 = !DISubprogram(name: "strcmp", scope: !34, file: !34, line: 136, type: !75, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DISubroutineType(types: !76)
!76 = !{!40, !71, !71}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !78, file: !44, line: 82)
!78 = !DISubprogram(name: "strcoll", scope: !34, file: !34, line: 143, type: !75, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !80, file: !44, line: 83)
!80 = !DISubprogram(name: "strcpy", scope: !34, file: !34, line: 121, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !82, file: !44, line: 84)
!82 = !DISubprogram(name: "strcspn", scope: !34, file: !34, line: 272, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DISubroutineType(types: !84)
!84 = !{!41, !71, !71}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !86, file: !44, line: 85)
!86 = !DISubprogram(name: "strerror", scope: !34, file: !34, line: 396, type: !87, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DISubroutineType(types: !88)
!88 = !{!67, !40}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !90, file: !44, line: 86)
!90 = !DISubprogram(name: "strlen", scope: !34, file: !34, line: 384, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!91 = !DISubroutineType(types: !92)
!92 = !{!41, !71}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !94, file: !44, line: 87)
!94 = !DISubprogram(name: "strncat", scope: !34, file: !34, line: 132, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!67, !69, !70, !41}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !98, file: !44, line: 88)
!98 = !DISubprogram(name: "strncmp", scope: !34, file: !34, line: 139, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DISubroutineType(types: !100)
!100 = !{!40, !71, !71, !41}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !102, file: !44, line: 89)
!102 = !DISubprogram(name: "strncpy", scope: !34, file: !34, line: 124, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !104, file: !44, line: 90)
!104 = !DISubprogram(name: "strspn", scope: !34, file: !34, line: 276, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !106, file: !44, line: 91)
!106 = !DISubprogram(name: "strtok", scope: !34, file: !34, line: 335, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !108, file: !44, line: 92)
!108 = !DISubprogram(name: "strxfrm", scope: !34, file: !34, line: 146, type: !109, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DISubroutineType(types: !110)
!110 = !{!41, !69, !70, !41}
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !112, file: !44, line: 93)
!112 = !DISubprogram(name: "strchr", scope: !34, file: !34, line: 225, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DISubroutineType(types: !114)
!114 = !{!67, !71, !40}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !116, file: !44, line: 94)
!116 = !DISubprogram(name: "strpbrk", scope: !34, file: !34, line: 302, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DISubroutineType(types: !118)
!118 = !{!67, !71, !71}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !120, file: !44, line: 95)
!120 = !DISubprogram(name: "strrchr", scope: !34, file: !34, line: 252, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !122, file: !44, line: 96)
!122 = !DISubprogram(name: "strstr", scope: !34, file: !34, line: 329, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !32, file: !3, line: 6)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 10)
!127 = distinct !DICompileUnit(language: DW_LANG_C99, file: !128, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!128 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!129 = !{i32 2, !"Dwarf Version", i32 4}
!130 = !{i32 2, !"Debug Info Version", i32 3}
!131 = !{i32 1, !"wchar_size", i32 4}
!132 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!133 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!134 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 19, type: !135, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !137, !137}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !139)
!139 = !{!18}
!140 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !134, file: !3, line: 19, type: !137)
!141 = !DILocation(line: 19, column: 29, scope: !134)
!142 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !134, file: !3, line: 19, type: !137)
!143 = !DILocation(line: 19, column: 58, scope: !134)
!144 = !DILocalVariable(name: "i", scope: !134, file: !3, line: 21, type: !40)
!145 = !DILocation(line: 21, column: 9, scope: !134)
!146 = !DILocalVariable(name: "j", scope: !134, file: !3, line: 21, type: !40)
!147 = !DILocation(line: 21, column: 12, scope: !134)
!148 = !DILocation(line: 22, column: 12, scope: !149)
!149 = distinct !DILexicalBlock(scope: !134, file: !3, line: 22, column: 5)
!150 = !DILocation(line: 22, column: 10, scope: !149)
!151 = !DILocation(line: 22, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 22, column: 5)
!153 = !DILocation(line: 22, column: 19, scope: !152)
!154 = !DILocation(line: 22, column: 5, scope: !149)
!155 = !DILocation(line: 23, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 23, column: 9)
!157 = !DILocation(line: 23, column: 14, scope: !156)
!158 = !DILocation(line: 23, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 23, column: 9)
!160 = !DILocation(line: 23, column: 23, scope: !159)
!161 = !DILocation(line: 23, column: 9, scope: !156)
!162 = !DILocation(line: 24, column: 35, scope: !159)
!163 = !DILocation(line: 24, column: 43, scope: !159)
!164 = !DILocation(line: 24, column: 46, scope: !159)
!165 = !DILocation(line: 24, column: 13, scope: !159)
!166 = !DILocation(line: 24, column: 27, scope: !159)
!167 = !DILocation(line: 24, column: 30, scope: !159)
!168 = !DILocation(line: 24, column: 33, scope: !159)
!169 = !DILocation(line: 23, column: 31, scope: !159)
!170 = !DILocation(line: 23, column: 9, scope: !159)
!171 = distinct !{!171, !161, !172}
!172 = !DILocation(line: 24, column: 47, scope: !156)
!173 = !DILocation(line: 22, column: 27, scope: !152)
!174 = !DILocation(line: 22, column: 5, scope: !152)
!175 = distinct !{!175, !154, !176}
!176 = !DILocation(line: 24, column: 47, scope: !149)
!177 = !DILocation(line: 25, column: 1, scope: !134)
!178 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPjS_", scope: !3, file: !3, line: 27, type: !179, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DISubroutineType(types: !180)
!180 = !{!10, !10, !10}
!181 = !DILocalVariable(name: "mat1", arg: 1, scope: !178, file: !3, line: 27, type: !10)
!182 = !DILocation(line: 27, column: 43, scope: !178)
!183 = !DILocalVariable(name: "mat2", arg: 2, scope: !178, file: !3, line: 27, type: !10)
!184 = !DILocation(line: 27, column: 64, scope: !178)
!185 = !DILocalVariable(name: "res_index", scope: !178, file: !3, line: 29, type: !40)
!186 = !DILocation(line: 29, column: 9, scope: !178)
!187 = !DILocalVariable(name: "res", scope: !178, file: !3, line: 30, type: !11)
!188 = !DILocation(line: 30, column: 18, scope: !178)
!189 = !DILocalVariable(name: "i", scope: !190, file: !3, line: 31, type: !40)
!190 = distinct !DILexicalBlock(scope: !178, file: !3, line: 31, column: 5)
!191 = !DILocation(line: 31, column: 13, scope: !190)
!192 = !DILocation(line: 31, column: 9, scope: !190)
!193 = !DILocation(line: 31, column: 20, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !3, line: 31, column: 5)
!195 = !DILocation(line: 31, column: 22, scope: !194)
!196 = !DILocation(line: 31, column: 5, scope: !190)
!197 = !DILocation(line: 33, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !3, line: 32, column: 5)
!199 = !DILocation(line: 33, column: 21, scope: !198)
!200 = !DILocation(line: 33, column: 26, scope: !198)
!201 = !DILocation(line: 33, column: 31, scope: !198)
!202 = !DILocation(line: 33, column: 24, scope: !198)
!203 = !DILocation(line: 33, column: 13, scope: !198)
!204 = !DILocation(line: 31, column: 28, scope: !194)
!205 = !DILocation(line: 31, column: 5, scope: !194)
!206 = distinct !{!206, !196, !207}
!207 = !DILocation(line: 34, column: 5, scope: !190)
!208 = !DILocation(line: 35, column: 25, scope: !178)
!209 = !DILocation(line: 35, column: 12, scope: !178)
!210 = !DILocation(line: 35, column: 5, scope: !178)
!211 = !DILocation(line: 35, column: 23, scope: !178)
!212 = !DILocation(line: 36, column: 14, scope: !178)
!213 = !DILocation(line: 37, column: 5, scope: !178)
!214 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 40, type: !215, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!215 = !DISubroutineType(types: !216)
!216 = !{!10, !137, !137, !137}
!217 = !DILocalVariable(name: "mat1", arg: 1, scope: !214, file: !3, line: 40, type: !137)
!218 = !DILocation(line: 40, column: 35, scope: !214)
!219 = !DILocalVariable(name: "mat2", arg: 2, scope: !214, file: !3, line: 40, type: !137)
!220 = !DILocation(line: 40, column: 61, scope: !214)
!221 = !DILocalVariable(name: "res", arg: 3, scope: !214, file: !3, line: 40, type: !137)
!222 = !DILocation(line: 40, column: 87, scope: !214)
!223 = !DILocalVariable(name: "i", scope: !224, file: !3, line: 41, type: !40)
!224 = distinct !DILexicalBlock(scope: !214, file: !3, line: 41, column: 5)
!225 = !DILocation(line: 41, column: 14, scope: !224)
!226 = !DILocation(line: 41, column: 10, scope: !224)
!227 = !DILocation(line: 41, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 41, column: 5)
!229 = !DILocation(line: 41, column: 23, scope: !228)
!230 = !DILocation(line: 41, column: 5, scope: !224)
!231 = !DILocalVariable(name: "j", scope: !232, file: !3, line: 42, type: !40)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 42, column: 9)
!233 = distinct !DILexicalBlock(scope: !228, file: !3, line: 41, column: 35)
!234 = !DILocation(line: 42, column: 18, scope: !232)
!235 = !DILocation(line: 42, column: 14, scope: !232)
!236 = !DILocation(line: 42, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !3, line: 42, column: 9)
!238 = !DILocation(line: 42, column: 27, scope: !237)
!239 = !DILocation(line: 42, column: 9, scope: !232)
!240 = !DILocalVariable(name: "k", scope: !241, file: !3, line: 43, type: !40)
!241 = distinct !DILexicalBlock(scope: !242, file: !3, line: 43, column: 13)
!242 = distinct !DILexicalBlock(scope: !237, file: !3, line: 42, column: 39)
!243 = !DILocation(line: 43, column: 22, scope: !241)
!244 = !DILocation(line: 43, column: 18, scope: !241)
!245 = !DILocation(line: 43, column: 29, scope: !246)
!246 = distinct !DILexicalBlock(scope: !241, file: !3, line: 43, column: 13)
!247 = !DILocation(line: 43, column: 31, scope: !246)
!248 = !DILocation(line: 43, column: 13, scope: !241)
!249 = !DILocation(line: 44, column: 42, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !3, line: 43, column: 43)
!251 = !DILocation(line: 44, column: 34, scope: !250)
!252 = !DILocation(line: 44, column: 45, scope: !250)
!253 = !DILocation(line: 44, column: 58, scope: !250)
!254 = !DILocation(line: 44, column: 50, scope: !250)
!255 = !DILocation(line: 44, column: 61, scope: !250)
!256 = !DILocation(line: 44, column: 48, scope: !250)
!257 = !DILocation(line: 44, column: 25, scope: !250)
!258 = !DILocation(line: 44, column: 17, scope: !250)
!259 = !DILocation(line: 44, column: 28, scope: !250)
!260 = !DILocation(line: 44, column: 31, scope: !250)
!261 = !DILocation(line: 43, column: 39, scope: !246)
!262 = !DILocation(line: 43, column: 13, scope: !246)
!263 = distinct !{!263, !248, !264}
!264 = !DILocation(line: 45, column: 13, scope: !241)
!265 = !DILocation(line: 42, column: 35, scope: !237)
!266 = !DILocation(line: 42, column: 9, scope: !237)
!267 = distinct !{!267, !239, !268}
!268 = !DILocation(line: 46, column: 9, scope: !232)
!269 = !DILocation(line: 41, column: 31, scope: !228)
!270 = !DILocation(line: 41, column: 5, scope: !228)
!271 = distinct !{!271, !230, !272}
!272 = !DILocation(line: 47, column: 5, scope: !224)
!273 = !DILocalVariable(name: "i", scope: !274, file: !3, line: 48, type: !40)
!274 = distinct !DILexicalBlock(scope: !214, file: !3, line: 48, column: 5)
!275 = !DILocation(line: 48, column: 13, scope: !274)
!276 = !DILocation(line: 48, column: 9, scope: !274)
!277 = !DILocation(line: 48, column: 18, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !3, line: 48, column: 5)
!279 = !DILocation(line: 48, column: 19, scope: !278)
!280 = !DILocation(line: 48, column: 5, scope: !274)
!281 = !DILocalVariable(name: "j", scope: !282, file: !3, line: 49, type: !40)
!282 = distinct !DILexicalBlock(scope: !283, file: !3, line: 49, column: 9)
!283 = distinct !DILexicalBlock(scope: !278, file: !3, line: 48, column: 28)
!284 = !DILocation(line: 49, column: 17, scope: !282)
!285 = !DILocation(line: 49, column: 13, scope: !282)
!286 = !DILocation(line: 49, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !3, line: 49, column: 9)
!288 = !DILocation(line: 49, column: 22, scope: !287)
!289 = !DILocation(line: 0, scope: !278)
!290 = !DILocation(line: 49, column: 9, scope: !282)
!291 = !DILocation(line: 50, column: 37, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !3, line: 49, column: 31)
!293 = !DILocation(line: 50, column: 48, scope: !292)
!294 = !DILocation(line: 50, column: 26, scope: !292)
!295 = !DILocation(line: 50, column: 27, scope: !292)
!296 = !DILocation(line: 50, column: 32, scope: !292)
!297 = !DILocation(line: 50, column: 31, scope: !292)
!298 = !DILocation(line: 50, column: 13, scope: !292)
!299 = !DILocation(line: 50, column: 35, scope: !292)
!300 = !DILocation(line: 49, column: 28, scope: !287)
!301 = !DILocation(line: 49, column: 9, scope: !287)
!302 = distinct !{!302, !290, !303}
!303 = !DILocation(line: 51, column: 9, scope: !282)
!304 = !DILocation(line: 48, column: 25, scope: !278)
!305 = !DILocation(line: 48, column: 5, scope: !278)
!306 = distinct !{!306, !280, !307}
!307 = !DILocation(line: 52, column: 5, scope: !274)
!308 = !DILocation(line: 53, column: 5, scope: !214)
!309 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 56, type: !310, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!310 = !DISubroutineType(types: !311)
!311 = !{!10, !312}
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !313, line: 17, size: 320, flags: DIFlagTypePassByValue, elements: !314, identifier: "_ZTS5INSTR")
!313 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!314 = !{!315, !316, !317, !318}
!315 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !312, file: !313, line: 18, baseType: !11, size: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !312, file: !313, line: 19, baseType: !11, size: 32, offset: 32)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !312, file: !313, line: 20, baseType: !11, size: 32, offset: 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !312, file: !313, line: 21, baseType: !319, size: 192, offset: 128)
!319 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !313, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !320, identifier: "_ZTS15GEMM_STRUCT_REF")
!320 = !{!321, !322, !323}
!321 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !319, file: !313, line: 6, baseType: !10, size: 64)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !319, file: !313, line: 7, baseType: !10, size: 64, offset: 64)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !319, file: !313, line: 8, baseType: !10, size: 64, offset: 128)
!324 = !DILocalVariable(name: "instr", arg: 1, scope: !309, file: !3, line: 56, type: !312)
!325 = !DILocation(line: 56, column: 35, scope: !309)
!326 = !DILocalVariable(name: "inp", scope: !309, file: !3, line: 58, type: !138)
!327 = !DILocation(line: 58, column: 18, scope: !309)
!328 = !DILocalVariable(name: "wgt", scope: !309, file: !3, line: 58, type: !138)
!329 = !DILocation(line: 58, column: 26, scope: !309)
!330 = !DILocalVariable(name: "i", scope: !331, file: !3, line: 59, type: !40)
!331 = distinct !DILexicalBlock(scope: !309, file: !3, line: 59, column: 5)
!332 = !DILocation(line: 59, column: 14, scope: !331)
!333 = !DILocation(line: 59, column: 10, scope: !331)
!334 = !DILocation(line: 59, column: 18, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !3, line: 59, column: 5)
!336 = !DILocation(line: 59, column: 19, scope: !335)
!337 = !DILocation(line: 59, column: 5, scope: !331)
!338 = !DILocation(line: 60, column: 26, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !3, line: 59, column: 26)
!340 = !DILocation(line: 60, column: 35, scope: !339)
!341 = !DILocation(line: 60, column: 43, scope: !339)
!342 = !DILocation(line: 60, column: 42, scope: !339)
!343 = !DILocation(line: 60, column: 18, scope: !339)
!344 = !DILocation(line: 60, column: 13, scope: !339)
!345 = !DILocation(line: 60, column: 9, scope: !339)
!346 = !DILocation(line: 60, column: 16, scope: !339)
!347 = !DILocation(line: 59, column: 23, scope: !335)
!348 = !DILocation(line: 59, column: 5, scope: !335)
!349 = distinct !{!349, !337, !350}
!350 = !DILocation(line: 61, column: 5, scope: !331)
!351 = !DILocalVariable(name: "i", scope: !352, file: !3, line: 62, type: !40)
!352 = distinct !DILexicalBlock(scope: !309, file: !3, line: 62, column: 5)
!353 = !DILocation(line: 62, column: 14, scope: !352)
!354 = !DILocation(line: 62, column: 10, scope: !352)
!355 = !DILocation(line: 62, column: 18, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !3, line: 62, column: 5)
!357 = !DILocation(line: 62, column: 19, scope: !356)
!358 = !DILocation(line: 62, column: 5, scope: !352)
!359 = !DILocation(line: 63, column: 26, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !3, line: 62, column: 26)
!361 = !DILocation(line: 63, column: 35, scope: !360)
!362 = !DILocation(line: 63, column: 43, scope: !360)
!363 = !DILocation(line: 63, column: 42, scope: !360)
!364 = !DILocation(line: 63, column: 18, scope: !360)
!365 = !DILocation(line: 63, column: 13, scope: !360)
!366 = !DILocation(line: 63, column: 9, scope: !360)
!367 = !DILocation(line: 63, column: 16, scope: !360)
!368 = !DILocation(line: 62, column: 23, scope: !356)
!369 = !DILocation(line: 62, column: 5, scope: !356)
!370 = distinct !{!370, !358, !371}
!371 = !DILocation(line: 64, column: 5, scope: !352)
!372 = !DILocalVariable(name: "arr_ref", scope: !309, file: !3, line: 65, type: !10)
!373 = !DILocation(line: 65, column: 20, scope: !309)
!374 = !DILocation(line: 65, column: 45, scope: !309)
!375 = !DILocation(line: 65, column: 49, scope: !309)
!376 = !DILocation(line: 65, column: 30, scope: !309)
!377 = !DILocation(line: 66, column: 12, scope: !309)
!378 = !DILocation(line: 66, column: 5, scope: !309)
!379 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 69, type: !380, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!380 = !DISubroutineType(types: !381)
!381 = !{!10, !382}
!382 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !313, line: 24, size: 192, flags: DIFlagTypePassByValue, elements: !383, identifier: "_ZTS9INSTR_VAL")
!383 = !{!384, !385, !386, !387}
!384 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !382, file: !313, line: 25, baseType: !11, size: 32)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !382, file: !313, line: 26, baseType: !11, size: 32, offset: 32)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !382, file: !313, line: 27, baseType: !11, size: 32, offset: 64)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !382, file: !313, line: 28, baseType: !388, size: 96, offset: 96)
!388 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !313, line: 11, size: 96, flags: DIFlagTypePassByValue, elements: !389, identifier: "_ZTS15GEMM_STRUCT_VAL")
!389 = !{!390, !391, !392}
!390 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !388, file: !313, line: 12, baseType: !11, size: 32)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !388, file: !313, line: 13, baseType: !11, size: 32, offset: 32)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !388, file: !313, line: 14, baseType: !11, size: 32, offset: 64)
!393 = !DILocalVariable(name: "instr", arg: 1, scope: !379, file: !3, line: 69, type: !382)
!394 = !DILocation(line: 69, column: 43, scope: !379)
!395 = !DILocalVariable(name: "inp", scope: !379, file: !3, line: 71, type: !138)
!396 = !DILocation(line: 71, column: 18, scope: !379)
!397 = !DILocalVariable(name: "wgt", scope: !379, file: !3, line: 71, type: !138)
!398 = !DILocation(line: 71, column: 26, scope: !379)
!399 = !DILocalVariable(name: "i", scope: !400, file: !3, line: 72, type: !40)
!400 = distinct !DILexicalBlock(scope: !379, file: !3, line: 72, column: 5)
!401 = !DILocation(line: 72, column: 14, scope: !400)
!402 = !DILocation(line: 72, column: 10, scope: !400)
!403 = !DILocation(line: 72, column: 18, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !3, line: 72, column: 5)
!405 = !DILocation(line: 72, column: 19, scope: !404)
!406 = !DILocation(line: 72, column: 5, scope: !400)
!407 = !DILocation(line: 73, column: 24, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !3, line: 72, column: 26)
!409 = !DILocation(line: 73, column: 33, scope: !408)
!410 = !DILocation(line: 73, column: 41, scope: !408)
!411 = !DILocation(line: 73, column: 40, scope: !408)
!412 = !DILocation(line: 73, column: 13, scope: !408)
!413 = !DILocation(line: 73, column: 9, scope: !408)
!414 = !DILocation(line: 73, column: 16, scope: !408)
!415 = !DILocation(line: 72, column: 23, scope: !404)
!416 = !DILocation(line: 72, column: 5, scope: !404)
!417 = distinct !{!417, !406, !418}
!418 = !DILocation(line: 74, column: 5, scope: !400)
!419 = !DILocalVariable(name: "i", scope: !420, file: !3, line: 75, type: !40)
!420 = distinct !DILexicalBlock(scope: !379, file: !3, line: 75, column: 5)
!421 = !DILocation(line: 75, column: 14, scope: !420)
!422 = !DILocation(line: 75, column: 10, scope: !420)
!423 = !DILocation(line: 75, column: 18, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !3, line: 75, column: 5)
!425 = !DILocation(line: 75, column: 19, scope: !424)
!426 = !DILocation(line: 75, column: 5, scope: !420)
!427 = !DILocation(line: 76, column: 24, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !3, line: 75, column: 26)
!429 = !DILocation(line: 76, column: 33, scope: !428)
!430 = !DILocation(line: 76, column: 13, scope: !428)
!431 = !DILocation(line: 76, column: 9, scope: !428)
!432 = !DILocation(line: 76, column: 16, scope: !428)
!433 = !DILocation(line: 75, column: 23, scope: !424)
!434 = !DILocation(line: 75, column: 5, scope: !424)
!435 = distinct !{!435, !426, !436}
!436 = !DILocation(line: 77, column: 5, scope: !420)
!437 = !DILocalVariable(name: "arr_val", scope: !379, file: !3, line: 78, type: !10)
!438 = !DILocation(line: 78, column: 20, scope: !379)
!439 = !DILocation(line: 78, column: 45, scope: !379)
!440 = !DILocation(line: 78, column: 49, scope: !379)
!441 = !DILocation(line: 78, column: 30, scope: !379)
!442 = !DILocation(line: 79, column: 12, scope: !379)
!443 = !DILocation(line: 79, column: 5, scope: !379)
!444 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 86, type: !445, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!445 = !DISubroutineType(types: !446)
!446 = !{!40, !40, !447}
!447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!448 = !DILocalVariable(name: "argc", arg: 1, scope: !444, file: !3, line: 86, type: !40)
!449 = !DILocation(line: 86, column: 14, scope: !444)
!450 = !DILocalVariable(name: "argv", arg: 2, scope: !444, file: !3, line: 86, type: !447)
!451 = !DILocation(line: 86, column: 32, scope: !444)
!452 = !DILocalVariable(name: "inp_mem_row0", scope: !444, file: !3, line: 88, type: !138)
!453 = !DILocation(line: 88, column: 18, scope: !444)
!454 = !DILocalVariable(name: "inp_mem_row1", scope: !444, file: !3, line: 88, type: !138)
!455 = !DILocation(line: 88, column: 37, scope: !444)
!456 = !DILocalVariable(name: "inp_mem_row2", scope: !444, file: !3, line: 88, type: !138)
!457 = !DILocation(line: 88, column: 56, scope: !444)
!458 = !DILocalVariable(name: "wgt_mem_row0", scope: !444, file: !3, line: 89, type: !138)
!459 = !DILocation(line: 89, column: 18, scope: !444)
!460 = !DILocalVariable(name: "wgt_mem_row1", scope: !444, file: !3, line: 89, type: !138)
!461 = !DILocation(line: 89, column: 37, scope: !444)
!462 = !DILocalVariable(name: "wgt_mem_row2", scope: !444, file: !3, line: 89, type: !138)
!463 = !DILocation(line: 89, column: 56, scope: !444)
!464 = !DILocalVariable(name: "acc_mem_row0", scope: !444, file: !3, line: 90, type: !138)
!465 = !DILocation(line: 90, column: 18, scope: !444)
!466 = !DILocalVariable(name: "acc_mem_row1", scope: !444, file: !3, line: 90, type: !138)
!467 = !DILocation(line: 90, column: 37, scope: !444)
!468 = !DILocalVariable(name: "acc_mem_row2", scope: !444, file: !3, line: 90, type: !138)
!469 = !DILocation(line: 90, column: 56, scope: !444)
!470 = !DILocalVariable(name: "acc_mem_ref", scope: !444, file: !3, line: 91, type: !10)
!471 = !DILocation(line: 91, column: 20, scope: !444)
!472 = !DILocalVariable(name: "acc_mem_val", scope: !444, file: !3, line: 92, type: !10)
!473 = !DILocation(line: 92, column: 20, scope: !444)
!474 = !DILocalVariable(name: "acc_mem_gemm", scope: !444, file: !3, line: 93, type: !10)
!475 = !DILocation(line: 93, column: 20, scope: !444)
!476 = !DILocalVariable(name: "opcode", scope: !444, file: !3, line: 94, type: !11)
!477 = !DILocation(line: 94, column: 18, scope: !444)
!478 = !DILocalVariable(name: "op_type", scope: !444, file: !3, line: 94, type: !11)
!479 = !DILocation(line: 94, column: 25, scope: !444)
!480 = !DILocalVariable(name: "acc_stage2", scope: !444, file: !3, line: 95, type: !27)
!481 = !DILocation(line: 95, column: 18, scope: !444)
!482 = !DILocalVariable(name: "acc_stage1", scope: !444, file: !3, line: 96, type: !27)
!483 = !DILocation(line: 96, column: 18, scope: !444)
!484 = !DILocalVariable(name: "acc_stage3", scope: !444, file: !3, line: 97, type: !27)
!485 = !DILocation(line: 97, column: 18, scope: !444)
!486 = !DILocation(line: 98, column: 5, scope: !444)
!487 = !DILocation(line: 100, column: 5, scope: !444)
!488 = !DILocation(line: 101, column: 5, scope: !444)
!489 = !DILocation(line: 102, column: 5, scope: !444)
!490 = !DILocation(line: 103, column: 5, scope: !444)
!491 = !DILocation(line: 104, column: 5, scope: !444)
!492 = !DILocation(line: 105, column: 5, scope: !444)
!493 = !DILocation(line: 106, column: 5, scope: !444)
!494 = !DILocation(line: 107, column: 5, scope: !444)
!495 = !DILocation(line: 108, column: 5, scope: !444)
!496 = !DILocation(line: 109, column: 24, scope: !444)
!497 = !DILocation(line: 109, column: 5, scope: !444)
!498 = !DILocation(line: 110, column: 24, scope: !444)
!499 = !DILocation(line: 110, column: 5, scope: !444)
!500 = !DILocalVariable(name: "gemm_uop", scope: !444, file: !3, line: 117, type: !501)
!501 = !DICompositeType(tag: DW_TAG_array_type, baseType: !319, size: 1728, elements: !28)
!502 = !DILocation(line: 117, column: 21, scope: !444)
!503 = !DILocation(line: 117, column: 35, scope: !444)
!504 = !DILocation(line: 117, column: 36, scope: !444)
!505 = !DILocation(line: 117, column: 38, scope: !444)
!506 = !DILocation(line: 117, column: 55, scope: !444)
!507 = !DILocation(line: 117, column: 72, scope: !444)
!508 = !DILocation(line: 117, column: 89, scope: !444)
!509 = !DILocation(line: 117, column: 91, scope: !444)
!510 = !DILocation(line: 117, column: 108, scope: !444)
!511 = !DILocation(line: 117, column: 125, scope: !444)
!512 = !DILocation(line: 118, column: 36, scope: !444)
!513 = !DILocation(line: 118, column: 38, scope: !444)
!514 = !DILocation(line: 118, column: 55, scope: !444)
!515 = !DILocation(line: 118, column: 72, scope: !444)
!516 = !DILocation(line: 118, column: 89, scope: !444)
!517 = !DILocation(line: 118, column: 91, scope: !444)
!518 = !DILocation(line: 118, column: 108, scope: !444)
!519 = !DILocation(line: 118, column: 125, scope: !444)
!520 = !DILocation(line: 119, column: 36, scope: !444)
!521 = !DILocation(line: 119, column: 38, scope: !444)
!522 = !DILocation(line: 119, column: 55, scope: !444)
!523 = !DILocation(line: 119, column: 72, scope: !444)
!524 = !DILocation(line: 119, column: 89, scope: !444)
!525 = !DILocation(line: 119, column: 91, scope: !444)
!526 = !DILocation(line: 119, column: 108, scope: !444)
!527 = !DILocation(line: 119, column: 125, scope: !444)
!528 = !DILocation(line: 120, column: 36, scope: !444)
!529 = !DILocation(line: 120, column: 38, scope: !444)
!530 = !DILocation(line: 120, column: 55, scope: !444)
!531 = !DILocation(line: 120, column: 72, scope: !444)
!532 = !DILocation(line: 120, column: 89, scope: !444)
!533 = !DILocation(line: 120, column: 91, scope: !444)
!534 = !DILocation(line: 120, column: 108, scope: !444)
!535 = !DILocation(line: 120, column: 125, scope: !444)
!536 = !DILocation(line: 121, column: 36, scope: !444)
!537 = !DILocation(line: 121, column: 38, scope: !444)
!538 = !DILocation(line: 121, column: 55, scope: !444)
!539 = !DILocation(line: 121, column: 72, scope: !444)
!540 = !DILocalVariable(name: "gemm", scope: !444, file: !3, line: 124, type: !541)
!541 = !DICompositeType(tag: DW_TAG_array_type, baseType: !388, size: 864, elements: !28)
!542 = !DILocation(line: 124, column: 21, scope: !444)
!543 = !DILocation(line: 124, column: 31, scope: !444)
!544 = !DILocation(line: 124, column: 32, scope: !444)
!545 = !DILocation(line: 124, column: 33, scope: !444)
!546 = !DILocation(line: 124, column: 49, scope: !444)
!547 = !DILocation(line: 124, column: 65, scope: !444)
!548 = !DILocation(line: 124, column: 82, scope: !444)
!549 = !DILocation(line: 124, column: 83, scope: !444)
!550 = !DILocation(line: 124, column: 99, scope: !444)
!551 = !DILocation(line: 124, column: 115, scope: !444)
!552 = !DILocation(line: 125, column: 32, scope: !444)
!553 = !DILocation(line: 125, column: 33, scope: !444)
!554 = !DILocation(line: 125, column: 49, scope: !444)
!555 = !DILocation(line: 125, column: 65, scope: !444)
!556 = !DILocation(line: 125, column: 82, scope: !444)
!557 = !DILocation(line: 125, column: 83, scope: !444)
!558 = !DILocation(line: 125, column: 99, scope: !444)
!559 = !DILocation(line: 125, column: 115, scope: !444)
!560 = !DILocation(line: 126, column: 32, scope: !444)
!561 = !DILocation(line: 126, column: 33, scope: !444)
!562 = !DILocation(line: 126, column: 49, scope: !444)
!563 = !DILocation(line: 126, column: 65, scope: !444)
!564 = !DILocation(line: 126, column: 82, scope: !444)
!565 = !DILocation(line: 126, column: 83, scope: !444)
!566 = !DILocation(line: 126, column: 99, scope: !444)
!567 = !DILocation(line: 126, column: 115, scope: !444)
!568 = !DILocation(line: 127, column: 32, scope: !444)
!569 = !DILocation(line: 127, column: 33, scope: !444)
!570 = !DILocation(line: 127, column: 49, scope: !444)
!571 = !DILocation(line: 127, column: 65, scope: !444)
!572 = !DILocation(line: 127, column: 82, scope: !444)
!573 = !DILocation(line: 127, column: 83, scope: !444)
!574 = !DILocation(line: 127, column: 99, scope: !444)
!575 = !DILocation(line: 127, column: 115, scope: !444)
!576 = !DILocation(line: 128, column: 32, scope: !444)
!577 = !DILocation(line: 128, column: 33, scope: !444)
!578 = !DILocation(line: 128, column: 49, scope: !444)
!579 = !DILocation(line: 128, column: 65, scope: !444)
!580 = !DILocalVariable(name: "microop", scope: !444, file: !3, line: 132, type: !581)
!581 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 2880, elements: !28)
!582 = !DILocation(line: 132, column: 11, scope: !444)
!583 = !DILocation(line: 132, column: 24, scope: !444)
!584 = !DILocation(line: 132, column: 25, scope: !444)
!585 = !DILocation(line: 132, column: 32, scope: !444)
!586 = !DILocation(line: 132, column: 45, scope: !444)
!587 = !DILocation(line: 132, column: 52, scope: !444)
!588 = !DILocation(line: 132, column: 65, scope: !444)
!589 = !DILocation(line: 132, column: 72, scope: !444)
!590 = !DILocation(line: 132, column: 85, scope: !444)
!591 = !DILocation(line: 132, column: 92, scope: !444)
!592 = !DILocation(line: 133, column: 25, scope: !444)
!593 = !DILocation(line: 133, column: 32, scope: !444)
!594 = !DILocation(line: 133, column: 46, scope: !444)
!595 = !DILocation(line: 133, column: 53, scope: !444)
!596 = !DILocation(line: 133, column: 66, scope: !444)
!597 = !DILocation(line: 133, column: 73, scope: !444)
!598 = !DILocation(line: 133, column: 86, scope: !444)
!599 = !DILocation(line: 133, column: 93, scope: !444)
!600 = !DILocation(line: 133, column: 106, scope: !444)
!601 = !DILocation(line: 133, column: 113, scope: !444)
!602 = !DILocalVariable(name: "microop_val", scope: !444, file: !3, line: 135, type: !603)
!603 = !DICompositeType(tag: DW_TAG_array_type, baseType: !382, size: 1728, elements: !28)
!604 = !DILocation(line: 135, column: 15, scope: !444)
!605 = !DILocation(line: 135, column: 32, scope: !444)
!606 = !DILocation(line: 135, column: 33, scope: !444)
!607 = !DILocation(line: 135, column: 40, scope: !444)
!608 = !DILocation(line: 135, column: 49, scope: !444)
!609 = !DILocation(line: 135, column: 56, scope: !444)
!610 = !DILocation(line: 135, column: 65, scope: !444)
!611 = !DILocation(line: 135, column: 72, scope: !444)
!612 = !DILocation(line: 135, column: 81, scope: !444)
!613 = !DILocation(line: 135, column: 88, scope: !444)
!614 = !DILocation(line: 136, column: 33, scope: !444)
!615 = !DILocation(line: 136, column: 40, scope: !444)
!616 = !DILocation(line: 136, column: 50, scope: !444)
!617 = !DILocation(line: 136, column: 57, scope: !444)
!618 = !DILocation(line: 136, column: 66, scope: !444)
!619 = !DILocation(line: 136, column: 73, scope: !444)
!620 = !DILocation(line: 136, column: 82, scope: !444)
!621 = !DILocation(line: 136, column: 89, scope: !444)
!622 = !DILocation(line: 136, column: 98, scope: !444)
!623 = !DILocation(line: 136, column: 105, scope: !444)
!624 = !DILocation(line: 138, column: 20, scope: !444)
!625 = !DILocation(line: 138, column: 18, scope: !444)
!626 = !DILocalVariable(name: "i", scope: !627, file: !3, line: 139, type: !40)
!627 = distinct !DILexicalBlock(scope: !444, file: !3, line: 139, column: 5)
!628 = !DILocation(line: 139, column: 14, scope: !627)
!629 = !DILocation(line: 139, column: 10, scope: !627)
!630 = !DILocation(line: 139, column: 18, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !3, line: 139, column: 5)
!632 = !DILocation(line: 139, column: 19, scope: !631)
!633 = !DILocation(line: 139, column: 5, scope: !627)
!634 = !DILocation(line: 140, column: 23, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 139, column: 26)
!636 = !DILocation(line: 140, column: 36, scope: !635)
!637 = !DILocation(line: 140, column: 20, scope: !635)
!638 = !DILocation(line: 140, column: 9, scope: !635)
!639 = !DILocation(line: 140, column: 22, scope: !635)
!640 = !DILocation(line: 139, column: 23, scope: !631)
!641 = !DILocation(line: 139, column: 5, scope: !631)
!642 = distinct !{!642, !633, !643}
!643 = !DILocation(line: 141, column: 5, scope: !627)
!644 = !DILocation(line: 143, column: 10, scope: !645)
!645 = distinct !DILexicalBlock(scope: !444, file: !3, line: 143, column: 9)
!646 = !DILocation(line: 143, column: 17, scope: !645)
!647 = !DILocation(line: 143, column: 27, scope: !645)
!648 = !DILocation(line: 143, column: 35, scope: !645)
!649 = !DILocation(line: 143, column: 22, scope: !645)
!650 = !DILocation(line: 143, column: 45, scope: !645)
!651 = !DILocation(line: 143, column: 52, scope: !645)
!652 = !DILocalVariable(name: "i", scope: !653, file: !3, line: 144, type: !40)
!653 = distinct !DILexicalBlock(scope: !654, file: !3, line: 144, column: 9)
!654 = distinct !DILexicalBlock(scope: !645, file: !3, line: 143, column: 58)
!655 = !DILocation(line: 144, column: 18, scope: !653)
!656 = !DILocation(line: 144, column: 14, scope: !653)
!657 = !DILocation(line: 144, column: 22, scope: !658)
!658 = distinct !DILexicalBlock(scope: !653, file: !3, line: 144, column: 9)
!659 = !DILocation(line: 144, column: 23, scope: !658)
!660 = !DILocation(line: 144, column: 9, scope: !653)
!661 = !DILocation(line: 145, column: 49, scope: !662)
!662 = distinct !DILexicalBlock(scope: !658, file: !3, line: 144, column: 30)
!663 = !DILocation(line: 145, column: 41, scope: !662)
!664 = !DILocation(line: 145, column: 27, scope: !662)
!665 = !DILocation(line: 145, column: 25, scope: !662)
!666 = !DILocation(line: 144, column: 27, scope: !658)
!667 = !DILocation(line: 144, column: 9, scope: !658)
!668 = distinct !{!668, !660, !669}
!669 = !DILocation(line: 147, column: 13, scope: !653)
!670 = !DILocalVariable(name: "i", scope: !671, file: !3, line: 148, type: !40)
!671 = distinct !DILexicalBlock(scope: !654, file: !3, line: 148, column: 9)
!672 = !DILocation(line: 148, column: 18, scope: !671)
!673 = !DILocation(line: 148, column: 14, scope: !671)
!674 = !DILocation(line: 148, column: 22, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !3, line: 148, column: 9)
!676 = !DILocation(line: 148, column: 23, scope: !675)
!677 = !DILocation(line: 148, column: 9, scope: !671)
!678 = !DILocation(line: 149, column: 57, scope: !679)
!679 = distinct !DILexicalBlock(scope: !675, file: !3, line: 148, column: 30)
!680 = !DILocation(line: 149, column: 45, scope: !679)
!681 = !DILocation(line: 149, column: 27, scope: !679)
!682 = !DILocation(line: 149, column: 25, scope: !679)
!683 = !DILocation(line: 148, column: 27, scope: !675)
!684 = !DILocation(line: 148, column: 9, scope: !675)
!685 = distinct !{!685, !677, !686}
!686 = !DILocation(line: 151, column: 13, scope: !671)
!687 = !DILocalVariable(name: "i", scope: !688, file: !3, line: 152, type: !40)
!688 = distinct !DILexicalBlock(scope: !654, file: !3, line: 152, column: 9)
!689 = !DILocation(line: 152, column: 18, scope: !688)
!690 = !DILocation(line: 152, column: 14, scope: !688)
!691 = !DILocation(line: 152, column: 25, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !3, line: 152, column: 9)
!693 = !DILocation(line: 152, column: 27, scope: !692)
!694 = !DILocation(line: 152, column: 9, scope: !688)
!695 = !DILocation(line: 153, column: 10, scope: !696)
!696 = distinct !DILexicalBlock(scope: !692, file: !3, line: 152, column: 43)
!697 = !DILocation(line: 152, column: 39, scope: !692)
!698 = !DILocation(line: 152, column: 9, scope: !692)
!699 = distinct !{!699, !694, !700}
!700 = !DILocation(line: 154, column: 13, scope: !688)
!701 = !DILocation(line: 160, column: 1, scope: !444)
!702 = distinct !DISubprogram(name: "memcpy", scope: !703, file: !703, line: 12, type: !704, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !127, retainedNodes: !4)
!703 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!704 = !DISubroutineType(types: !705)
!705 = !{!37, !37, !38, !706}
!706 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !707, line: 46, baseType: !43)
!707 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!708 = !DILocalVariable(name: "destaddr", arg: 1, scope: !702, file: !703, line: 12, type: !37)
!709 = !DILocation(line: 12, column: 20, scope: !702)
!710 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !702, file: !703, line: 12, type: !38)
!711 = !DILocation(line: 12, column: 42, scope: !702)
!712 = !DILocalVariable(name: "len", arg: 3, scope: !702, file: !703, line: 12, type: !706)
!713 = !DILocation(line: 12, column: 58, scope: !702)
!714 = !DILocalVariable(name: "dest", scope: !702, file: !703, line: 13, type: !67)
!715 = !DILocation(line: 13, column: 9, scope: !702)
!716 = !DILocation(line: 13, column: 16, scope: !702)
!717 = !DILocalVariable(name: "src", scope: !702, file: !703, line: 14, type: !71)
!718 = !DILocation(line: 14, column: 15, scope: !702)
!719 = !DILocation(line: 14, column: 21, scope: !702)
!720 = !DILocation(line: 16, column: 3, scope: !702)
!721 = !DILocation(line: 16, column: 13, scope: !702)
!722 = !DILocation(line: 16, column: 16, scope: !702)
!723 = !DILocation(line: 17, column: 19, scope: !702)
!724 = !DILocation(line: 17, column: 15, scope: !702)
!725 = !DILocation(line: 17, column: 10, scope: !702)
!726 = !DILocation(line: 17, column: 13, scope: !702)
!727 = distinct !{!727, !720, !723}
!728 = !DILocation(line: 18, column: 10, scope: !702)
!729 = !DILocation(line: 18, column: 3, scope: !702)
