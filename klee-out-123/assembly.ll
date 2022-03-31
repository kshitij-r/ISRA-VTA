; ModuleID = 'gemm.bc'
source_filename = "gemm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@result = dso_local global [10 x i32] zeroinitializer, align 16, !dbg !0
@arr_val = dso_local global i32* null, align 8, !dbg !8
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !12
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !17
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !19
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !21
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !23
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"acc_mem_gemm[i] == acc_mem_ref[i]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"gemm.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !132 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !138, metadata !DIExpression()), !dbg !139
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %j, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 0, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !149
  %cmp = icmp slt i32 %0, 3, !dbg !151
  br i1 %cmp, label %for.body, label %for.end12, !dbg !152

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !153
  br label %for.cond1, !dbg !155

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !156
  %cmp2 = icmp slt i32 %1, 3, !dbg !158
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !159

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !160
  %3 = load i32, i32* %j, align 4, !dbg !161
  %idxprom = sext i32 %3 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !160
  %4 = load i32, i32* %i, align 4, !dbg !162
  %idxprom4 = sext i32 %4 to i64, !dbg !160
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !160
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !160
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !163
  %7 = load i32, i32* %i, align 4, !dbg !164
  %idxprom6 = sext i32 %7 to i64, !dbg !163
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !163
  %8 = load i32, i32* %j, align 4, !dbg !165
  %idxprom8 = sext i32 %8 to i64, !dbg !163
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !163
  store i32 %5, i32* %arrayidx9, align 4, !dbg !166
  %9 = load i32, i32* %j, align 4, !dbg !167
  %inc = add nsw i32 %9, 1, !dbg !167
  store i32 %inc, i32* %j, align 4, !dbg !167
  br label %for.cond1, !dbg !168, !llvm.loop !169

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !171
  %inc11 = add nsw i32 %10, 1, !dbg !171
  store i32 %inc11, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !175
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPKjS0_(i32* %mat1, i32* %mat2) #0 !dbg !176 {
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
  %arr_ref = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !324, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !326, metadata !DIExpression()), !dbg !327
  store i32* null, i32** %arr_ref, align 8, !dbg !327
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !330, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata i32* %i, metadata !332, metadata !DIExpression()), !dbg !334
  store i32 0, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !335

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !336
  %cmp = icmp slt i32 %0, 3, !dbg !338
  br i1 %cmp, label %for.body, label %for.end, !dbg !339

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !340
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !342
  %1 = load i32*, i32** %inp_mem, align 8, !dbg !342
  %2 = load i32, i32* %i, align 4, !dbg !343
  %idx.ext = sext i32 %2 to i64, !dbg !344
  %add.ptr = getelementptr inbounds i32, i32* %1, i64 %idx.ext, !dbg !344
  %3 = load i32, i32* %add.ptr, align 4, !dbg !345
  %4 = load i32, i32* %i, align 4, !dbg !346
  %idxprom = sext i32 %4 to i64, !dbg !347
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !347
  store i32 %3, i32* %arrayidx, align 4, !dbg !348
  %5 = load i32, i32* %i, align 4, !dbg !349
  %inc = add nsw i32 %5, 1, !dbg !349
  store i32 %inc, i32* %i, align 4, !dbg !349
  br label %for.cond, !dbg !350, !llvm.loop !351

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !353, metadata !DIExpression()), !dbg !355
  store i32 0, i32* %i1, align 4, !dbg !355
  br label %for.cond2, !dbg !356

for.cond2:                                        ; preds = %for.body4, %for.end
  %6 = load i32, i32* %i1, align 4, !dbg !357
  %cmp3 = icmp slt i32 %6, 3, !dbg !359
  br i1 %cmp3, label %for.body4, label %for.end12, !dbg !360

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !361
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS5, i32 0, i32 1, !dbg !363
  %7 = load i32*, i32** %wgt_mem, align 8, !dbg !363
  %8 = load i32, i32* %i1, align 4, !dbg !364
  %idx.ext6 = sext i32 %8 to i64, !dbg !365
  %add.ptr7 = getelementptr inbounds i32, i32* %7, i64 %idx.ext6, !dbg !365
  %9 = load i32, i32* %add.ptr7, align 4, !dbg !366
  %10 = load i32, i32* %i1, align 4, !dbg !367
  %idxprom8 = sext i32 %10 to i64, !dbg !368
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom8, !dbg !368
  store i32 %9, i32* %arrayidx9, align 4, !dbg !369
  %11 = load i32, i32* %i1, align 4, !dbg !370
  %inc11 = add nsw i32 %11, 1, !dbg !370
  store i32 %inc11, i32* %i1, align 4, !dbg !370
  br label %for.cond2, !dbg !371, !llvm.loop !372

for.end12:                                        ; preds = %for.cond2
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !374
  %arraydecay13 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !375
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay13), !dbg !376
  store i32* %call, i32** %arr_ref, align 8, !dbg !377
  %12 = load i32*, i32** %arr_ref, align 8, !dbg !378
  ret i32* %12, !dbg !379
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !380 {
entry:
  %arr_val = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !394, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !396, metadata !DIExpression()), !dbg !397
  store i32* null, i32** %arr_val, align 8, !dbg !397
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %i, metadata !402, metadata !DIExpression()), !dbg !404
  store i32 0, i32* %i, align 4, !dbg !404
  br label %for.cond, !dbg !405

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !406
  %cmp = icmp slt i32 %0, 3, !dbg !408
  br i1 %cmp, label %for.body, label %for.end, !dbg !409

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !410
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !412
  %1 = load i32, i32* %inp_mem, align 4, !dbg !412
  %2 = load i32, i32* %i, align 4, !dbg !413
  %add = add i32 %1, %2, !dbg !414
  %3 = load i32, i32* %i, align 4, !dbg !415
  %idxprom = sext i32 %3 to i64, !dbg !416
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !416
  store i32 %add, i32* %arrayidx, align 4, !dbg !417
  %4 = load i32, i32* %i, align 4, !dbg !418
  %inc = add nsw i32 %4, 1, !dbg !418
  store i32 %inc, i32* %i, align 4, !dbg !418
  br label %for.cond, !dbg !419, !llvm.loop !420

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !422, metadata !DIExpression()), !dbg !424
  store i32 0, i32* %i1, align 4, !dbg !424
  br label %for.cond2, !dbg !425

for.cond2:                                        ; preds = %for.body4, %for.end
  %5 = load i32, i32* %i1, align 4, !dbg !426
  %cmp3 = icmp slt i32 %5, 3, !dbg !428
  br i1 %cmp3, label %for.body4, label %for.end10, !dbg !429

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !430
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS5, i32 0, i32 1, !dbg !432
  %6 = load i32, i32* %wgt_mem, align 4, !dbg !432
  %7 = load i32, i32* %i1, align 4, !dbg !433
  %idxprom6 = sext i32 %7 to i64, !dbg !434
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom6, !dbg !434
  store i32 %6, i32* %arrayidx7, align 4, !dbg !435
  %8 = load i32, i32* %i1, align 4, !dbg !436
  %inc9 = add nsw i32 %8, 1, !dbg !436
  store i32 %inc9, i32* %i1, align 4, !dbg !436
  br label %for.cond2, !dbg !437, !llvm.loop !438

for.end10:                                        ; preds = %for.cond2
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !440
  %arraydecay11 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !441
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay11), !dbg !442
  store i32* %call, i32** %arr_val, align 8, !dbg !443
  %9 = load i32*, i32** %arr_val, align 8, !dbg !444
  ret i32* %9, !dbg !445
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !446 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !450, metadata !DIExpression()), !dbg !451
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !452, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !454, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !456, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !458, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !460, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !470, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !472, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !474, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !486, metadata !DIExpression()), !dbg !487
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !488
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !489
  %0 = bitcast i32* %arraydecay to i8*, !dbg !489
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !489
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !490
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !490
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !490
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !491
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !491
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !491
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !492
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !492
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !492
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !493
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !493
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !493
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !494
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !494
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !494
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !495
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !495
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !495
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !496
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !496
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !496
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !497
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !497
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !497
  %18 = bitcast i32* %op_type to i8*, !dbg !498
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !499
  %19 = bitcast i32* %opcode to i8*, !dbg !500
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !501
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !502, metadata !DIExpression()), !dbg !504
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !505
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !506
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !507
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !506
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !506
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !508
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !506
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !506
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !509
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !506
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !505
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !510
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !511
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !510
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !510
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !512
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !510
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !510
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !513
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !510
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !505
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !514
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !515
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !514
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !514
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !516
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !514
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !514
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !517
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !514
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !505
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !518
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !519
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !518
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !518
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !520
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !518
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !518
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !521
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !518
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !505
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !522
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !523
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !522
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !522
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !524
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !522
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !522
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !525
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !522
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !505
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !526
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !527
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !526
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !526
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !528
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !526
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !526
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !529
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !526
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !505
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !530
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !531
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !530
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !530
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !532
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !530
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !530
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !533
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !530
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !505
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !534
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !535
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !534
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !534
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !536
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !534
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !534
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !537
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !534
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !505
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !538
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !539
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !538
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !538
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !540
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !538
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !538
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !541
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !538
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !542, metadata !DIExpression()), !dbg !544
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !545
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !546
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !547
  %20 = load i32, i32* %arrayidx68, align 4, !dbg !547
  store i32 %20, i32* %inp_mem67, align 4, !dbg !546
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !546
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !548
  %21 = load i32, i32* %arrayidx70, align 4, !dbg !548
  store i32 %21, i32* %wgt_mem69, align 4, !dbg !546
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !546
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !549
  %22 = load i32, i32* %arrayidx72, align 4, !dbg !549
  store i32 %22, i32* %acc_mem71, align 4, !dbg !546
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !545
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !550
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !551
  %23 = load i32, i32* %arrayidx75, align 4, !dbg !551
  store i32 %23, i32* %inp_mem74, align 4, !dbg !550
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !550
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !552
  %24 = load i32, i32* %arrayidx77, align 4, !dbg !552
  store i32 %24, i32* %wgt_mem76, align 4, !dbg !550
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !550
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !553
  %25 = load i32, i32* %arrayidx79, align 4, !dbg !553
  store i32 %25, i32* %acc_mem78, align 4, !dbg !550
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !545
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !554
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !555
  %26 = load i32, i32* %arrayidx82, align 4, !dbg !555
  store i32 %26, i32* %inp_mem81, align 4, !dbg !554
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !554
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !556
  %27 = load i32, i32* %arrayidx84, align 4, !dbg !556
  store i32 %27, i32* %wgt_mem83, align 4, !dbg !554
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !554
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !557
  %28 = load i32, i32* %arrayidx86, align 4, !dbg !557
  store i32 %28, i32* %acc_mem85, align 4, !dbg !554
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !545
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !558
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !559
  %29 = load i32, i32* %arrayidx89, align 4, !dbg !559
  store i32 %29, i32* %inp_mem88, align 4, !dbg !558
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !558
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !560
  %30 = load i32, i32* %arrayidx91, align 4, !dbg !560
  store i32 %30, i32* %wgt_mem90, align 4, !dbg !558
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !558
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !561
  %31 = load i32, i32* %arrayidx93, align 4, !dbg !561
  store i32 %31, i32* %acc_mem92, align 4, !dbg !558
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !545
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !562
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !563
  %32 = load i32, i32* %arrayidx96, align 4, !dbg !563
  store i32 %32, i32* %inp_mem95, align 4, !dbg !562
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !562
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !564
  %33 = load i32, i32* %arrayidx98, align 4, !dbg !564
  store i32 %33, i32* %wgt_mem97, align 4, !dbg !562
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !562
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !565
  %34 = load i32, i32* %arrayidx100, align 4, !dbg !565
  store i32 %34, i32* %acc_mem99, align 4, !dbg !562
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !545
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !566
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !567
  %35 = load i32, i32* %arrayidx103, align 4, !dbg !567
  store i32 %35, i32* %inp_mem102, align 4, !dbg !566
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !566
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !568
  %36 = load i32, i32* %arrayidx105, align 4, !dbg !568
  store i32 %36, i32* %wgt_mem104, align 4, !dbg !566
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !566
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !569
  %37 = load i32, i32* %arrayidx107, align 4, !dbg !569
  store i32 %37, i32* %acc_mem106, align 4, !dbg !566
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !545
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !570
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !571
  %38 = load i32, i32* %arrayidx110, align 4, !dbg !571
  store i32 %38, i32* %inp_mem109, align 4, !dbg !570
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !570
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !572
  %39 = load i32, i32* %arrayidx112, align 4, !dbg !572
  store i32 %39, i32* %wgt_mem111, align 4, !dbg !570
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !570
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !573
  %40 = load i32, i32* %arrayidx114, align 4, !dbg !573
  store i32 %40, i32* %acc_mem113, align 4, !dbg !570
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !545
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !574
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !575
  %41 = load i32, i32* %arrayidx117, align 4, !dbg !575
  store i32 %41, i32* %inp_mem116, align 4, !dbg !574
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !574
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !576
  %42 = load i32, i32* %arrayidx119, align 4, !dbg !576
  store i32 %42, i32* %wgt_mem118, align 4, !dbg !574
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !574
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !577
  %43 = load i32, i32* %arrayidx121, align 4, !dbg !577
  store i32 %43, i32* %acc_mem120, align 4, !dbg !574
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !545
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !578
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !579
  %44 = load i32, i32* %arrayidx124, align 4, !dbg !579
  store i32 %44, i32* %inp_mem123, align 4, !dbg !578
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !578
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !580
  %45 = load i32, i32* %arrayidx126, align 4, !dbg !580
  store i32 %45, i32* %wgt_mem125, align 4, !dbg !578
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !578
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !581
  %46 = load i32, i32* %arrayidx128, align 4, !dbg !581
  store i32 %46, i32* %acc_mem127, align 4, !dbg !578
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !582, metadata !DIExpression()), !dbg !584
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !585
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !586
  store i32 0, i32* %ID, align 8, !dbg !586
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !586
  store i32 2, i32* %OPCODE, align 4, !dbg !586
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !586
  store i32 0, i32* %OPTYPE, align 8, !dbg !586
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !586
  %arrayidx130 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !587
  %47 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !587
  %48 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx130 to i8*, !dbg !587
  %49 = call i8* @memcpy(i8* %47, i8* %48, i64 24), !dbg !587
  %arrayinit.element131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !585
  %ID132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 0, !dbg !588
  store i32 1, i32* %ID132, align 8, !dbg !588
  %OPCODE133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 1, !dbg !588
  store i32 2, i32* %OPCODE133, align 4, !dbg !588
  %OPTYPE134 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 2, !dbg !588
  store i32 0, i32* %OPTYPE134, align 8, !dbg !588
  %OPERANDS135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 3, !dbg !588
  %arrayidx136 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !589
  %50 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS135 to i8*, !dbg !589
  %51 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx136 to i8*, !dbg !589
  %52 = call i8* @memcpy(i8* %50, i8* %51, i64 24), !dbg !589
  %arrayinit.element137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i64 1, !dbg !585
  %ID138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 0, !dbg !590
  store i32 2, i32* %ID138, align 8, !dbg !590
  %OPCODE139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 1, !dbg !590
  store i32 2, i32* %OPCODE139, align 4, !dbg !590
  %OPTYPE140 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 2, !dbg !590
  store i32 0, i32* %OPTYPE140, align 8, !dbg !590
  %OPERANDS141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 3, !dbg !590
  %arrayidx142 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !591
  %53 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS141 to i8*, !dbg !591
  %54 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx142 to i8*, !dbg !591
  %55 = call i8* @memcpy(i8* %53, i8* %54, i64 24), !dbg !591
  %arrayinit.element143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i64 1, !dbg !585
  %ID144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 0, !dbg !592
  store i32 3, i32* %ID144, align 8, !dbg !592
  %OPCODE145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 1, !dbg !592
  store i32 2, i32* %OPCODE145, align 4, !dbg !592
  %OPTYPE146 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 2, !dbg !592
  store i32 0, i32* %OPTYPE146, align 8, !dbg !592
  %OPERANDS147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 3, !dbg !592
  %arrayidx148 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !593
  %56 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS147 to i8*, !dbg !593
  %57 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx148 to i8*, !dbg !593
  %58 = call i8* @memcpy(i8* %56, i8* %57, i64 24), !dbg !593
  %arrayinit.element149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i64 1, !dbg !585
  %ID150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 0, !dbg !594
  store i32 4, i32* %ID150, align 8, !dbg !594
  %OPCODE151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 1, !dbg !594
  store i32 2, i32* %OPCODE151, align 4, !dbg !594
  %OPTYPE152 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 2, !dbg !594
  store i32 0, i32* %OPTYPE152, align 8, !dbg !594
  %OPERANDS153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 3, !dbg !594
  %arrayidx154 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !595
  %59 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS153 to i8*, !dbg !595
  %60 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx154 to i8*, !dbg !595
  %61 = call i8* @memcpy(i8* %59, i8* %60, i64 24), !dbg !595
  %arrayinit.element155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i64 1, !dbg !585
  %ID156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 0, !dbg !596
  store i32 5, i32* %ID156, align 8, !dbg !596
  %OPCODE157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 1, !dbg !596
  store i32 2, i32* %OPCODE157, align 4, !dbg !596
  %OPTYPE158 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 2, !dbg !596
  store i32 0, i32* %OPTYPE158, align 8, !dbg !596
  %OPERANDS159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 3, !dbg !596
  %arrayidx160 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !597
  %62 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS159 to i8*, !dbg !597
  %63 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx160 to i8*, !dbg !597
  %64 = call i8* @memcpy(i8* %62, i8* %63, i64 24), !dbg !597
  %arrayinit.element161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i64 1, !dbg !585
  %ID162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 0, !dbg !598
  store i32 6, i32* %ID162, align 8, !dbg !598
  %OPCODE163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 1, !dbg !598
  store i32 2, i32* %OPCODE163, align 4, !dbg !598
  %OPTYPE164 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 2, !dbg !598
  store i32 0, i32* %OPTYPE164, align 8, !dbg !598
  %OPERANDS165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 3, !dbg !598
  %arrayidx166 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !599
  %65 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS165 to i8*, !dbg !599
  %66 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx166 to i8*, !dbg !599
  %67 = call i8* @memcpy(i8* %65, i8* %66, i64 24), !dbg !599
  %arrayinit.element167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i64 1, !dbg !585
  %ID168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 0, !dbg !600
  store i32 7, i32* %ID168, align 8, !dbg !600
  %OPCODE169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 1, !dbg !600
  store i32 2, i32* %OPCODE169, align 4, !dbg !600
  %OPTYPE170 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 2, !dbg !600
  store i32 0, i32* %OPTYPE170, align 8, !dbg !600
  %OPERANDS171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 3, !dbg !600
  %arrayidx172 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !601
  %68 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS171 to i8*, !dbg !601
  %69 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx172 to i8*, !dbg !601
  %70 = call i8* @memcpy(i8* %68, i8* %69, i64 24), !dbg !601
  %arrayinit.element173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i64 1, !dbg !585
  %ID174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 0, !dbg !602
  store i32 8, i32* %ID174, align 8, !dbg !602
  %OPCODE175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 1, !dbg !602
  store i32 2, i32* %OPCODE175, align 4, !dbg !602
  %OPTYPE176 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 2, !dbg !602
  store i32 0, i32* %OPTYPE176, align 8, !dbg !602
  %OPERANDS177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 3, !dbg !602
  %arrayidx178 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !603
  %71 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS177 to i8*, !dbg !603
  %72 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx178 to i8*, !dbg !603
  %73 = call i8* @memcpy(i8* %71, i8* %72, i64 24), !dbg !603
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !604, metadata !DIExpression()), !dbg !606
  %arrayinit.begin179 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !607
  %ID180 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 0, !dbg !608
  store i32 0, i32* %ID180, align 8, !dbg !608
  %OPCODE181 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 1, !dbg !608
  store i32 2, i32* %OPCODE181, align 4, !dbg !608
  %OPTYPE182 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 2, !dbg !608
  store i32 0, i32* %OPTYPE182, align 8, !dbg !608
  %OPERANDS183 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 3, !dbg !608
  %arrayidx184 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !609
  %74 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS183 to i8*, !dbg !609
  %75 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx184 to i8*, !dbg !609
  %76 = call i8* @memcpy(i8* %74, i8* %75, i64 12), !dbg !609
  %arrayinit.element185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i64 1, !dbg !607
  %ID186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 0, !dbg !610
  store i32 1, i32* %ID186, align 8, !dbg !610
  %OPCODE187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 1, !dbg !610
  store i32 2, i32* %OPCODE187, align 4, !dbg !610
  %OPTYPE188 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 2, !dbg !610
  store i32 0, i32* %OPTYPE188, align 8, !dbg !610
  %OPERANDS189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 3, !dbg !610
  %arrayidx190 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !611
  %77 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS189 to i8*, !dbg !611
  %78 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx190 to i8*, !dbg !611
  %79 = call i8* @memcpy(i8* %77, i8* %78, i64 12), !dbg !611
  %arrayinit.element191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i64 1, !dbg !607
  %ID192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 0, !dbg !612
  store i32 2, i32* %ID192, align 8, !dbg !612
  %OPCODE193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 1, !dbg !612
  store i32 2, i32* %OPCODE193, align 4, !dbg !612
  %OPTYPE194 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 2, !dbg !612
  store i32 0, i32* %OPTYPE194, align 8, !dbg !612
  %OPERANDS195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 3, !dbg !612
  %arrayidx196 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !613
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS195 to i8*, !dbg !613
  %81 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx196 to i8*, !dbg !613
  %82 = call i8* @memcpy(i8* %80, i8* %81, i64 12), !dbg !613
  %arrayinit.element197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i64 1, !dbg !607
  %ID198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 0, !dbg !614
  store i32 3, i32* %ID198, align 8, !dbg !614
  %OPCODE199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 1, !dbg !614
  store i32 2, i32* %OPCODE199, align 4, !dbg !614
  %OPTYPE200 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 2, !dbg !614
  store i32 0, i32* %OPTYPE200, align 8, !dbg !614
  %OPERANDS201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 3, !dbg !614
  %arrayidx202 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !615
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS201 to i8*, !dbg !615
  %84 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx202 to i8*, !dbg !615
  %85 = call i8* @memcpy(i8* %83, i8* %84, i64 12), !dbg !615
  %arrayinit.element203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i64 1, !dbg !607
  %ID204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 0, !dbg !616
  store i32 4, i32* %ID204, align 8, !dbg !616
  %OPCODE205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 1, !dbg !616
  store i32 2, i32* %OPCODE205, align 4, !dbg !616
  %OPTYPE206 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 2, !dbg !616
  store i32 0, i32* %OPTYPE206, align 8, !dbg !616
  %OPERANDS207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 3, !dbg !616
  %arrayidx208 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !617
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS207 to i8*, !dbg !617
  %87 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx208 to i8*, !dbg !617
  %88 = call i8* @memcpy(i8* %86, i8* %87, i64 12), !dbg !617
  %arrayinit.element209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i64 1, !dbg !607
  %ID210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 0, !dbg !618
  store i32 5, i32* %ID210, align 8, !dbg !618
  %OPCODE211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 1, !dbg !618
  store i32 2, i32* %OPCODE211, align 4, !dbg !618
  %OPTYPE212 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 2, !dbg !618
  store i32 0, i32* %OPTYPE212, align 8, !dbg !618
  %OPERANDS213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 3, !dbg !618
  %arrayidx214 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !619
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS213 to i8*, !dbg !619
  %90 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx214 to i8*, !dbg !619
  %91 = call i8* @memcpy(i8* %89, i8* %90, i64 12), !dbg !619
  %arrayinit.element215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i64 1, !dbg !607
  %ID216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 0, !dbg !620
  store i32 6, i32* %ID216, align 8, !dbg !620
  %OPCODE217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 1, !dbg !620
  store i32 2, i32* %OPCODE217, align 4, !dbg !620
  %OPTYPE218 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 2, !dbg !620
  store i32 0, i32* %OPTYPE218, align 8, !dbg !620
  %OPERANDS219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 3, !dbg !620
  %arrayidx220 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !621
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS219 to i8*, !dbg !621
  %93 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx220 to i8*, !dbg !621
  %94 = call i8* @memcpy(i8* %92, i8* %93, i64 12), !dbg !621
  %arrayinit.element221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i64 1, !dbg !607
  %ID222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 0, !dbg !622
  store i32 7, i32* %ID222, align 8, !dbg !622
  %OPCODE223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 1, !dbg !622
  store i32 2, i32* %OPCODE223, align 4, !dbg !622
  %OPTYPE224 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 2, !dbg !622
  store i32 0, i32* %OPTYPE224, align 8, !dbg !622
  %OPERANDS225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 3, !dbg !622
  %arrayidx226 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !623
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS225 to i8*, !dbg !623
  %96 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx226 to i8*, !dbg !623
  %97 = call i8* @memcpy(i8* %95, i8* %96, i64 12), !dbg !623
  %arrayinit.element227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i64 1, !dbg !607
  %ID228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 0, !dbg !624
  store i32 8, i32* %ID228, align 8, !dbg !624
  %OPCODE229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 1, !dbg !624
  store i32 2, i32* %OPCODE229, align 4, !dbg !624
  %OPTYPE230 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 2, !dbg !624
  store i32 0, i32* %OPTYPE230, align 8, !dbg !624
  %OPERANDS231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 3, !dbg !624
  %arrayidx232 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !625
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS231 to i8*, !dbg !625
  %99 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx232 to i8*, !dbg !625
  %100 = call i8* @memcpy(i8* %98, i8* %99, i64 12), !dbg !625
  %call = call i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 0)), !dbg !626
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !627
  call void @llvm.dbg.declare(metadata i32* %i, metadata !628, metadata !DIExpression()), !dbg !630
  store i32 0, i32* %i, align 4, !dbg !630
  br label %for.cond, !dbg !631

for.cond:                                         ; preds = %for.body, %entry
  %101 = load i32, i32* %i, align 4, !dbg !632
  %cmp = icmp slt i32 %101, 9, !dbg !634
  br i1 %cmp, label %for.body, label %for.end, !dbg !635

for.body:                                         ; preds = %for.cond
  %102 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !636
  %103 = load i32, i32* %i, align 4, !dbg !638
  %idxprom = sext i32 %103 to i64, !dbg !636
  %arrayidx233 = getelementptr inbounds i32, i32* %102, i64 %idxprom, !dbg !636
  %104 = load i32, i32* %arrayidx233, align 4, !dbg !636
  %105 = load i32, i32* %i, align 4, !dbg !639
  %idxprom234 = sext i32 %105 to i64, !dbg !640
  %arrayidx235 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom234, !dbg !640
  store i32 %104, i32* %arrayidx235, align 4, !dbg !641
  %106 = load i32, i32* %i, align 4, !dbg !642
  %inc = add nsw i32 %106, 1, !dbg !642
  store i32 %inc, i32* %i, align 4, !dbg !642
  br label %for.cond, !dbg !643, !llvm.loop !644

for.end:                                          ; preds = %for.cond
  %107 = load i32, i32* %opcode, align 4, !dbg !646
  %cmp236 = icmp eq i32 %107, 2, !dbg !648
  %108 = load i32, i32* %op_type, align 4, !dbg !649
  %cmp237 = icmp uge i32 %108, 0, !dbg !650
  %or.cond = and i1 %cmp236, %cmp237, !dbg !651
  %109 = load i32, i32* %op_type, align 4, !dbg !652
  %cmp239 = icmp ule i32 %109, 3, !dbg !653
  %or.cond1 = and i1 %or.cond, %cmp239, !dbg !651
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !651

if.then:                                          ; preds = %for.end
  call void @llvm.dbg.declare(metadata i32* %i240, metadata !654, metadata !DIExpression()), !dbg !657
  store i32 0, i32* %i240, align 4, !dbg !657
  br label %for.cond241, !dbg !658

for.cond241:                                      ; preds = %for.body243, %if.then
  %110 = load i32, i32* %i240, align 4, !dbg !659
  %cmp242 = icmp slt i32 %110, 9, !dbg !661
  br i1 %cmp242, label %for.body243, label %for.end249, !dbg !662

for.body243:                                      ; preds = %for.cond241
  %111 = load i32, i32* %i240, align 4, !dbg !663
  %idxprom244 = sext i32 %111 to i64, !dbg !665
  %arrayidx245 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom244, !dbg !665
  %112 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !665
  %113 = bitcast %struct.INSTR* %arrayidx245 to i8*, !dbg !665
  %114 = call i8* @memcpy(i8* %112, i8* %113, i64 40), !dbg !665
  %call246 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !666
  store i32* %call246, i32** %acc_mem_ref, align 8, !dbg !667
  %115 = load i32, i32* %i240, align 4, !dbg !668
  %inc248 = add nsw i32 %115, 1, !dbg !668
  store i32 %inc248, i32* %i240, align 4, !dbg !668
  br label %for.cond241, !dbg !669, !llvm.loop !670

for.end249:                                       ; preds = %for.cond241
  call void @llvm.dbg.declare(metadata i32* %i250, metadata !672, metadata !DIExpression()), !dbg !674
  store i32 0, i32* %i250, align 4, !dbg !674
  br label %for.cond251, !dbg !675

for.cond251:                                      ; preds = %for.body253, %for.end249
  %116 = load i32, i32* %i250, align 4, !dbg !676
  %cmp252 = icmp slt i32 %116, 9, !dbg !678
  br i1 %cmp252, label %for.body253, label %for.end260, !dbg !679

for.body253:                                      ; preds = %for.cond251
  %117 = load i32, i32* %i250, align 4, !dbg !680
  %idxprom255 = sext i32 %117 to i64, !dbg !682
  %arrayidx256 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom255, !dbg !682
  %118 = bitcast %struct.INSTR_VAL* %agg.tmp254 to i8*, !dbg !682
  %119 = bitcast %struct.INSTR_VAL* %arrayidx256 to i8*, !dbg !682
  %120 = call i8* @memcpy(i8* %118, i8* %119, i64 24), !dbg !682
  %call257 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp254), !dbg !683
  store i32* %call257, i32** %acc_mem_val, align 8, !dbg !684
  %121 = load i32, i32* %i250, align 4, !dbg !685
  %inc259 = add nsw i32 %121, 1, !dbg !685
  store i32 %inc259, i32* %i250, align 4, !dbg !685
  br label %for.cond251, !dbg !686, !llvm.loop !687

for.end260:                                       ; preds = %for.cond251
  call void @llvm.dbg.declare(metadata i32* %i261, metadata !689, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %i261, align 4, !dbg !691
  br label %for.cond262, !dbg !692

for.cond262:                                      ; preds = %for.inc270, %for.end260
  %122 = load i32, i32* %i261, align 4, !dbg !693
  %cmp263 = icmp slt i32 %122, 9, !dbg !695
  br i1 %cmp263, label %for.body264, label %if.end, !dbg !696

for.body264:                                      ; preds = %for.cond262
  %123 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !697
  %124 = load i32, i32* %i261, align 4, !dbg !697
  %idxprom265 = sext i32 %124 to i64, !dbg !697
  %arrayidx266 = getelementptr inbounds i32, i32* %123, i64 %idxprom265, !dbg !697
  %125 = load i32, i32* %arrayidx266, align 4, !dbg !697
  %126 = load i32*, i32** %acc_mem_ref, align 8, !dbg !697
  %127 = load i32, i32* %i261, align 4, !dbg !697
  %idxprom267 = sext i32 %127 to i64, !dbg !697
  %arrayidx268 = getelementptr inbounds i32, i32* %126, i64 %idxprom267, !dbg !697
  %128 = load i32, i32* %arrayidx268, align 4, !dbg !697
  %cmp269 = icmp eq i32 %125, %128, !dbg !697
  br i1 %cmp269, label %for.inc270, label %cond.false, !dbg !697

cond.false:                                       ; preds = %for.body264
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 155, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !697
  unreachable, !dbg !697

for.inc270:                                       ; preds = %for.body264
  %129 = load i32, i32* %i261, align 4, !dbg !699
  %inc271 = add nsw i32 %129, 1, !dbg !699
  store i32 %inc271, i32* %i261, align 4, !dbg !699
  br label %for.cond262, !dbg !700, !llvm.loop !701

if.end:                                           ; preds = %for.cond262, %for.end
  ret i32 0, !dbg !703
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !704 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !710, metadata !DIExpression()), !dbg !711
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !712, metadata !DIExpression()), !dbg !713
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !714, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.declare(metadata i8** %7, metadata !716, metadata !DIExpression()), !dbg !717
  %9 = load i8*, i8** %4, align 8, !dbg !718
  store i8* %9, i8** %7, align 8, !dbg !717
  call void @llvm.dbg.declare(metadata i8** %8, metadata !719, metadata !DIExpression()), !dbg !720
  %10 = load i8*, i8** %5, align 8, !dbg !721
  store i8* %10, i8** %8, align 8, !dbg !720
  br label %11, !dbg !722

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !723
  %13 = add i64 %12, -1, !dbg !723
  store i64 %13, i64* %6, align 8, !dbg !723
  %14 = icmp ugt i64 %12, 0, !dbg !724
  br i1 %14, label %15, label %21, !dbg !722

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !725
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !725
  store i8* %17, i8** %8, align 8, !dbg !725
  %18 = load i8, i8* %16, align 1, !dbg !726
  %19 = load i8*, i8** %7, align 8, !dbg !727
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !727
  store i8* %20, i8** %7, align 8, !dbg !727
  store i8 %18, i8* %19, align 1, !dbg !728
  br label %11, !dbg !722, !llvm.loop !729

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !730
  ret i8* %22, !dbg !731
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !125}
!llvm.module.flags = !{!127, !128, !129}
!llvm.ident = !{!130, !131}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 10, type: !122, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !28, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !12, !17, !19, !21, !23}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "arr_val", scope: !2, file: !3, line: 12, type: !10, isLocal: false, isDefinition: true)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 13, type: !14, isLocal: false, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !15)
!15 = !{!16, !16}
!16 = !DISubrange(count: 3)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 14, type: !14, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 15, type: !14, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 16, type: !14, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 17, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 9)
!28 = !{!29, !43, !47, !53, !57, !61, !71, !75, !77, !79, !83, !87, !91, !95, !99, !101, !103, !105, !109, !113, !117, !119, !121}
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !31, file: !42, line: 75)
!30 = !DINamespace(name: "std", scope: null)
!31 = !DISubprogram(name: "memchr", scope: !32, file: !32, line: 90, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!32 = !DIFile(filename: "/usr/include/string.h", directory: "")
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !36, !38, !39}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !44, file: !42, line: 76)
!44 = !DISubprogram(name: "memcmp", scope: !32, file: !32, line: 63, type: !45, flags: DIFlagPrototyped, spFlags: 0)
!45 = !DISubroutineType(types: !46)
!46 = !{!38, !36, !36, !39}
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !48, file: !42, line: 77)
!48 = !DISubprogram(name: "memcpy", scope: !32, file: !32, line: 42, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!49 = !DISubroutineType(types: !50)
!50 = !{!35, !51, !52, !39}
!51 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !35)
!52 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !36)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !54, file: !42, line: 78)
!54 = !DISubprogram(name: "memmove", scope: !32, file: !32, line: 46, type: !55, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DISubroutineType(types: !56)
!56 = !{!35, !35, !36, !39}
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !58, file: !42, line: 79)
!58 = !DISubprogram(name: "memset", scope: !32, file: !32, line: 60, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!35, !35, !38, !39}
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !62, file: !42, line: 80)
!62 = !DISubprogram(name: "strcat", scope: !32, file: !32, line: 129, type: !63, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !67, !68}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !65)
!68 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !72, file: !42, line: 81)
!72 = !DISubprogram(name: "strcmp", scope: !32, file: !32, line: 136, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DISubroutineType(types: !74)
!74 = !{!38, !69, !69}
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !76, file: !42, line: 82)
!76 = !DISubprogram(name: "strcoll", scope: !32, file: !32, line: 143, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !78, file: !42, line: 83)
!78 = !DISubprogram(name: "strcpy", scope: !32, file: !32, line: 121, type: !63, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !80, file: !42, line: 84)
!80 = !DISubprogram(name: "strcspn", scope: !32, file: !32, line: 272, type: !81, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DISubroutineType(types: !82)
!82 = !{!39, !69, !69}
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !84, file: !42, line: 85)
!84 = !DISubprogram(name: "strerror", scope: !32, file: !32, line: 396, type: !85, flags: DIFlagPrototyped, spFlags: 0)
!85 = !DISubroutineType(types: !86)
!86 = !{!65, !38}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !88, file: !42, line: 86)
!88 = !DISubprogram(name: "strlen", scope: !32, file: !32, line: 384, type: !89, flags: DIFlagPrototyped, spFlags: 0)
!89 = !DISubroutineType(types: !90)
!90 = !{!39, !69}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !92, file: !42, line: 87)
!92 = !DISubprogram(name: "strncat", scope: !32, file: !32, line: 132, type: !93, flags: DIFlagPrototyped, spFlags: 0)
!93 = !DISubroutineType(types: !94)
!94 = !{!65, !67, !68, !39}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !96, file: !42, line: 88)
!96 = !DISubprogram(name: "strncmp", scope: !32, file: !32, line: 139, type: !97, flags: DIFlagPrototyped, spFlags: 0)
!97 = !DISubroutineType(types: !98)
!98 = !{!38, !69, !69, !39}
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !100, file: !42, line: 89)
!100 = !DISubprogram(name: "strncpy", scope: !32, file: !32, line: 124, type: !93, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !102, file: !42, line: 90)
!102 = !DISubprogram(name: "strspn", scope: !32, file: !32, line: 276, type: !81, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !104, file: !42, line: 91)
!104 = !DISubprogram(name: "strtok", scope: !32, file: !32, line: 335, type: !63, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !106, file: !42, line: 92)
!106 = !DISubprogram(name: "strxfrm", scope: !32, file: !32, line: 146, type: !107, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DISubroutineType(types: !108)
!108 = !{!39, !67, !68, !39}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !110, file: !42, line: 93)
!110 = !DISubprogram(name: "strchr", scope: !32, file: !32, line: 225, type: !111, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DISubroutineType(types: !112)
!112 = !{!65, !69, !38}
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !114, file: !42, line: 94)
!114 = !DISubprogram(name: "strpbrk", scope: !32, file: !32, line: 302, type: !115, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DISubroutineType(types: !116)
!116 = !{!65, !69, !69}
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !118, file: !42, line: 95)
!118 = !DISubprogram(name: "strrchr", scope: !32, file: !32, line: 252, type: !111, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !120, file: !42, line: 96)
!120 = !DISubprogram(name: "strstr", scope: !32, file: !32, line: 329, type: !115, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !30, file: !3, line: 6)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 10)
!125 = distinct !DICompileUnit(language: DW_LANG_C99, file: !126, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!126 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!127 = !{i32 2, !"Dwarf Version", i32 4}
!128 = !{i32 2, !"Debug Info Version", i32 3}
!129 = !{i32 1, !"wchar_size", i32 4}
!130 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!131 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!132 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 19, type: !133, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DISubroutineType(types: !134)
!134 = !{null, !135, !135}
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !137)
!137 = !{!16}
!138 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !132, file: !3, line: 19, type: !135)
!139 = !DILocation(line: 19, column: 29, scope: !132)
!140 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !132, file: !3, line: 19, type: !135)
!141 = !DILocation(line: 19, column: 58, scope: !132)
!142 = !DILocalVariable(name: "i", scope: !132, file: !3, line: 21, type: !38)
!143 = !DILocation(line: 21, column: 9, scope: !132)
!144 = !DILocalVariable(name: "j", scope: !132, file: !3, line: 21, type: !38)
!145 = !DILocation(line: 21, column: 12, scope: !132)
!146 = !DILocation(line: 22, column: 12, scope: !147)
!147 = distinct !DILexicalBlock(scope: !132, file: !3, line: 22, column: 5)
!148 = !DILocation(line: 22, column: 10, scope: !147)
!149 = !DILocation(line: 22, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !3, line: 22, column: 5)
!151 = !DILocation(line: 22, column: 19, scope: !150)
!152 = !DILocation(line: 22, column: 5, scope: !147)
!153 = !DILocation(line: 23, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 23, column: 9)
!155 = !DILocation(line: 23, column: 14, scope: !154)
!156 = !DILocation(line: 23, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 23, column: 9)
!158 = !DILocation(line: 23, column: 23, scope: !157)
!159 = !DILocation(line: 23, column: 9, scope: !154)
!160 = !DILocation(line: 24, column: 35, scope: !157)
!161 = !DILocation(line: 24, column: 43, scope: !157)
!162 = !DILocation(line: 24, column: 46, scope: !157)
!163 = !DILocation(line: 24, column: 13, scope: !157)
!164 = !DILocation(line: 24, column: 27, scope: !157)
!165 = !DILocation(line: 24, column: 30, scope: !157)
!166 = !DILocation(line: 24, column: 33, scope: !157)
!167 = !DILocation(line: 23, column: 31, scope: !157)
!168 = !DILocation(line: 23, column: 9, scope: !157)
!169 = distinct !{!169, !159, !170}
!170 = !DILocation(line: 24, column: 47, scope: !154)
!171 = !DILocation(line: 22, column: 27, scope: !150)
!172 = !DILocation(line: 22, column: 5, scope: !150)
!173 = distinct !{!173, !152, !174}
!174 = !DILocation(line: 24, column: 47, scope: !147)
!175 = !DILocation(line: 25, column: 1, scope: !132)
!176 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPKjS0_", scope: !3, file: !3, line: 27, type: !177, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DISubroutineType(types: !178)
!178 = !{!10, !179, !179}
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!181 = !DILocalVariable(name: "mat1", arg: 1, scope: !176, file: !3, line: 27, type: !179)
!182 = !DILocation(line: 27, column: 49, scope: !176)
!183 = !DILocalVariable(name: "mat2", arg: 2, scope: !176, file: !3, line: 27, type: !179)
!184 = !DILocation(line: 27, column: 76, scope: !176)
!185 = !DILocalVariable(name: "res_index", scope: !176, file: !3, line: 29, type: !38)
!186 = !DILocation(line: 29, column: 9, scope: !176)
!187 = !DILocalVariable(name: "res", scope: !176, file: !3, line: 30, type: !11)
!188 = !DILocation(line: 30, column: 18, scope: !176)
!189 = !DILocalVariable(name: "i", scope: !190, file: !3, line: 31, type: !38)
!190 = distinct !DILexicalBlock(scope: !176, file: !3, line: 31, column: 5)
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
!208 = !DILocation(line: 35, column: 25, scope: !176)
!209 = !DILocation(line: 35, column: 12, scope: !176)
!210 = !DILocation(line: 35, column: 5, scope: !176)
!211 = !DILocation(line: 35, column: 23, scope: !176)
!212 = !DILocation(line: 36, column: 14, scope: !176)
!213 = !DILocation(line: 37, column: 5, scope: !176)
!214 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 40, type: !215, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!215 = !DISubroutineType(types: !216)
!216 = !{!10, !135, !135, !135}
!217 = !DILocalVariable(name: "mat1", arg: 1, scope: !214, file: !3, line: 40, type: !135)
!218 = !DILocation(line: 40, column: 35, scope: !214)
!219 = !DILocalVariable(name: "mat2", arg: 2, scope: !214, file: !3, line: 40, type: !135)
!220 = !DILocation(line: 40, column: 61, scope: !214)
!221 = !DILocalVariable(name: "res", arg: 3, scope: !214, file: !3, line: 40, type: !135)
!222 = !DILocation(line: 40, column: 87, scope: !214)
!223 = !DILocalVariable(name: "i", scope: !224, file: !3, line: 41, type: !38)
!224 = distinct !DILexicalBlock(scope: !214, file: !3, line: 41, column: 5)
!225 = !DILocation(line: 41, column: 14, scope: !224)
!226 = !DILocation(line: 41, column: 10, scope: !224)
!227 = !DILocation(line: 41, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 41, column: 5)
!229 = !DILocation(line: 41, column: 23, scope: !228)
!230 = !DILocation(line: 41, column: 5, scope: !224)
!231 = !DILocalVariable(name: "j", scope: !232, file: !3, line: 42, type: !38)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 42, column: 9)
!233 = distinct !DILexicalBlock(scope: !228, file: !3, line: 41, column: 35)
!234 = !DILocation(line: 42, column: 18, scope: !232)
!235 = !DILocation(line: 42, column: 14, scope: !232)
!236 = !DILocation(line: 42, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !3, line: 42, column: 9)
!238 = !DILocation(line: 42, column: 27, scope: !237)
!239 = !DILocation(line: 42, column: 9, scope: !232)
!240 = !DILocalVariable(name: "k", scope: !241, file: !3, line: 43, type: !38)
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
!273 = !DILocalVariable(name: "i", scope: !274, file: !3, line: 48, type: !38)
!274 = distinct !DILexicalBlock(scope: !214, file: !3, line: 48, column: 5)
!275 = !DILocation(line: 48, column: 13, scope: !274)
!276 = !DILocation(line: 48, column: 9, scope: !274)
!277 = !DILocation(line: 48, column: 18, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !3, line: 48, column: 5)
!279 = !DILocation(line: 48, column: 19, scope: !278)
!280 = !DILocation(line: 48, column: 5, scope: !274)
!281 = !DILocalVariable(name: "j", scope: !282, file: !3, line: 49, type: !38)
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
!326 = !DILocalVariable(name: "arr_ref", scope: !309, file: !3, line: 58, type: !10)
!327 = !DILocation(line: 58, column: 20, scope: !309)
!328 = !DILocalVariable(name: "inp", scope: !309, file: !3, line: 59, type: !136)
!329 = !DILocation(line: 59, column: 18, scope: !309)
!330 = !DILocalVariable(name: "wgt", scope: !309, file: !3, line: 59, type: !136)
!331 = !DILocation(line: 59, column: 26, scope: !309)
!332 = !DILocalVariable(name: "i", scope: !333, file: !3, line: 60, type: !38)
!333 = distinct !DILexicalBlock(scope: !309, file: !3, line: 60, column: 5)
!334 = !DILocation(line: 60, column: 14, scope: !333)
!335 = !DILocation(line: 60, column: 10, scope: !333)
!336 = !DILocation(line: 60, column: 18, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !3, line: 60, column: 5)
!338 = !DILocation(line: 60, column: 19, scope: !337)
!339 = !DILocation(line: 60, column: 5, scope: !333)
!340 = !DILocation(line: 61, column: 26, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !3, line: 60, column: 26)
!342 = !DILocation(line: 61, column: 35, scope: !341)
!343 = !DILocation(line: 61, column: 43, scope: !341)
!344 = !DILocation(line: 61, column: 42, scope: !341)
!345 = !DILocation(line: 61, column: 18, scope: !341)
!346 = !DILocation(line: 61, column: 13, scope: !341)
!347 = !DILocation(line: 61, column: 9, scope: !341)
!348 = !DILocation(line: 61, column: 16, scope: !341)
!349 = !DILocation(line: 60, column: 23, scope: !337)
!350 = !DILocation(line: 60, column: 5, scope: !337)
!351 = distinct !{!351, !339, !352}
!352 = !DILocation(line: 62, column: 5, scope: !333)
!353 = !DILocalVariable(name: "i", scope: !354, file: !3, line: 63, type: !38)
!354 = distinct !DILexicalBlock(scope: !309, file: !3, line: 63, column: 5)
!355 = !DILocation(line: 63, column: 14, scope: !354)
!356 = !DILocation(line: 63, column: 10, scope: !354)
!357 = !DILocation(line: 63, column: 18, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !3, line: 63, column: 5)
!359 = !DILocation(line: 63, column: 19, scope: !358)
!360 = !DILocation(line: 63, column: 5, scope: !354)
!361 = !DILocation(line: 64, column: 26, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !3, line: 63, column: 26)
!363 = !DILocation(line: 64, column: 35, scope: !362)
!364 = !DILocation(line: 64, column: 43, scope: !362)
!365 = !DILocation(line: 64, column: 42, scope: !362)
!366 = !DILocation(line: 64, column: 18, scope: !362)
!367 = !DILocation(line: 64, column: 13, scope: !362)
!368 = !DILocation(line: 64, column: 9, scope: !362)
!369 = !DILocation(line: 64, column: 16, scope: !362)
!370 = !DILocation(line: 63, column: 23, scope: !358)
!371 = !DILocation(line: 63, column: 5, scope: !358)
!372 = distinct !{!372, !360, !373}
!373 = !DILocation(line: 65, column: 5, scope: !354)
!374 = !DILocation(line: 66, column: 30, scope: !309)
!375 = !DILocation(line: 66, column: 34, scope: !309)
!376 = !DILocation(line: 66, column: 15, scope: !309)
!377 = !DILocation(line: 66, column: 13, scope: !309)
!378 = !DILocation(line: 67, column: 12, scope: !309)
!379 = !DILocation(line: 67, column: 5, scope: !309)
!380 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 70, type: !381, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!381 = !DISubroutineType(types: !382)
!382 = !{!10, !383}
!383 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !313, line: 24, size: 192, flags: DIFlagTypePassByValue, elements: !384, identifier: "_ZTS9INSTR_VAL")
!384 = !{!385, !386, !387, !388}
!385 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !383, file: !313, line: 25, baseType: !11, size: 32)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !383, file: !313, line: 26, baseType: !11, size: 32, offset: 32)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !383, file: !313, line: 27, baseType: !11, size: 32, offset: 64)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !383, file: !313, line: 28, baseType: !389, size: 96, offset: 96)
!389 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !313, line: 11, size: 96, flags: DIFlagTypePassByValue, elements: !390, identifier: "_ZTS15GEMM_STRUCT_VAL")
!390 = !{!391, !392, !393}
!391 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !389, file: !313, line: 12, baseType: !11, size: 32)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !389, file: !313, line: 13, baseType: !11, size: 32, offset: 32)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !389, file: !313, line: 14, baseType: !11, size: 32, offset: 64)
!394 = !DILocalVariable(name: "instr", arg: 1, scope: !380, file: !3, line: 70, type: !383)
!395 = !DILocation(line: 70, column: 43, scope: !380)
!396 = !DILocalVariable(name: "arr_val", scope: !380, file: !3, line: 72, type: !10)
!397 = !DILocation(line: 72, column: 20, scope: !380)
!398 = !DILocalVariable(name: "inp", scope: !380, file: !3, line: 73, type: !136)
!399 = !DILocation(line: 73, column: 18, scope: !380)
!400 = !DILocalVariable(name: "wgt", scope: !380, file: !3, line: 73, type: !136)
!401 = !DILocation(line: 73, column: 26, scope: !380)
!402 = !DILocalVariable(name: "i", scope: !403, file: !3, line: 74, type: !38)
!403 = distinct !DILexicalBlock(scope: !380, file: !3, line: 74, column: 5)
!404 = !DILocation(line: 74, column: 14, scope: !403)
!405 = !DILocation(line: 74, column: 10, scope: !403)
!406 = !DILocation(line: 74, column: 18, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !3, line: 74, column: 5)
!408 = !DILocation(line: 74, column: 19, scope: !407)
!409 = !DILocation(line: 74, column: 5, scope: !403)
!410 = !DILocation(line: 75, column: 24, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !3, line: 74, column: 26)
!412 = !DILocation(line: 75, column: 33, scope: !411)
!413 = !DILocation(line: 75, column: 41, scope: !411)
!414 = !DILocation(line: 75, column: 40, scope: !411)
!415 = !DILocation(line: 75, column: 13, scope: !411)
!416 = !DILocation(line: 75, column: 9, scope: !411)
!417 = !DILocation(line: 75, column: 16, scope: !411)
!418 = !DILocation(line: 74, column: 23, scope: !407)
!419 = !DILocation(line: 74, column: 5, scope: !407)
!420 = distinct !{!420, !409, !421}
!421 = !DILocation(line: 76, column: 5, scope: !403)
!422 = !DILocalVariable(name: "i", scope: !423, file: !3, line: 77, type: !38)
!423 = distinct !DILexicalBlock(scope: !380, file: !3, line: 77, column: 5)
!424 = !DILocation(line: 77, column: 14, scope: !423)
!425 = !DILocation(line: 77, column: 10, scope: !423)
!426 = !DILocation(line: 77, column: 18, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !3, line: 77, column: 5)
!428 = !DILocation(line: 77, column: 19, scope: !427)
!429 = !DILocation(line: 77, column: 5, scope: !423)
!430 = !DILocation(line: 78, column: 24, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !3, line: 77, column: 26)
!432 = !DILocation(line: 78, column: 33, scope: !431)
!433 = !DILocation(line: 78, column: 13, scope: !431)
!434 = !DILocation(line: 78, column: 9, scope: !431)
!435 = !DILocation(line: 78, column: 16, scope: !431)
!436 = !DILocation(line: 77, column: 23, scope: !427)
!437 = !DILocation(line: 77, column: 5, scope: !427)
!438 = distinct !{!438, !429, !439}
!439 = !DILocation(line: 79, column: 5, scope: !423)
!440 = !DILocation(line: 80, column: 30, scope: !380)
!441 = !DILocation(line: 80, column: 34, scope: !380)
!442 = !DILocation(line: 80, column: 15, scope: !380)
!443 = !DILocation(line: 80, column: 13, scope: !380)
!444 = !DILocation(line: 81, column: 12, scope: !380)
!445 = !DILocation(line: 81, column: 5, scope: !380)
!446 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 88, type: !447, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!447 = !DISubroutineType(types: !448)
!448 = !{!38, !38, !449}
!449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!450 = !DILocalVariable(name: "argc", arg: 1, scope: !446, file: !3, line: 88, type: !38)
!451 = !DILocation(line: 88, column: 14, scope: !446)
!452 = !DILocalVariable(name: "argv", arg: 2, scope: !446, file: !3, line: 88, type: !449)
!453 = !DILocation(line: 88, column: 32, scope: !446)
!454 = !DILocalVariable(name: "inp_mem_row0", scope: !446, file: !3, line: 90, type: !136)
!455 = !DILocation(line: 90, column: 18, scope: !446)
!456 = !DILocalVariable(name: "inp_mem_row1", scope: !446, file: !3, line: 90, type: !136)
!457 = !DILocation(line: 90, column: 37, scope: !446)
!458 = !DILocalVariable(name: "inp_mem_row2", scope: !446, file: !3, line: 90, type: !136)
!459 = !DILocation(line: 90, column: 56, scope: !446)
!460 = !DILocalVariable(name: "wgt_mem_row0", scope: !446, file: !3, line: 91, type: !136)
!461 = !DILocation(line: 91, column: 18, scope: !446)
!462 = !DILocalVariable(name: "wgt_mem_row1", scope: !446, file: !3, line: 91, type: !136)
!463 = !DILocation(line: 91, column: 37, scope: !446)
!464 = !DILocalVariable(name: "wgt_mem_row2", scope: !446, file: !3, line: 91, type: !136)
!465 = !DILocation(line: 91, column: 56, scope: !446)
!466 = !DILocalVariable(name: "acc_mem_row0", scope: !446, file: !3, line: 92, type: !136)
!467 = !DILocation(line: 92, column: 18, scope: !446)
!468 = !DILocalVariable(name: "acc_mem_row1", scope: !446, file: !3, line: 92, type: !136)
!469 = !DILocation(line: 92, column: 37, scope: !446)
!470 = !DILocalVariable(name: "acc_mem_row2", scope: !446, file: !3, line: 92, type: !136)
!471 = !DILocation(line: 92, column: 56, scope: !446)
!472 = !DILocalVariable(name: "acc_mem_ref", scope: !446, file: !3, line: 93, type: !10)
!473 = !DILocation(line: 93, column: 20, scope: !446)
!474 = !DILocalVariable(name: "acc_mem_val", scope: !446, file: !3, line: 94, type: !10)
!475 = !DILocation(line: 94, column: 20, scope: !446)
!476 = !DILocalVariable(name: "acc_mem_gemm", scope: !446, file: !3, line: 95, type: !10)
!477 = !DILocation(line: 95, column: 20, scope: !446)
!478 = !DILocalVariable(name: "opcode", scope: !446, file: !3, line: 96, type: !11)
!479 = !DILocation(line: 96, column: 18, scope: !446)
!480 = !DILocalVariable(name: "op_type", scope: !446, file: !3, line: 96, type: !11)
!481 = !DILocation(line: 96, column: 25, scope: !446)
!482 = !DILocalVariable(name: "acc_stage2", scope: !446, file: !3, line: 97, type: !25)
!483 = !DILocation(line: 97, column: 18, scope: !446)
!484 = !DILocalVariable(name: "acc_stage1", scope: !446, file: !3, line: 98, type: !25)
!485 = !DILocation(line: 98, column: 18, scope: !446)
!486 = !DILocalVariable(name: "acc_stage3", scope: !446, file: !3, line: 99, type: !25)
!487 = !DILocation(line: 99, column: 18, scope: !446)
!488 = !DILocation(line: 100, column: 5, scope: !446)
!489 = !DILocation(line: 102, column: 5, scope: !446)
!490 = !DILocation(line: 103, column: 5, scope: !446)
!491 = !DILocation(line: 104, column: 5, scope: !446)
!492 = !DILocation(line: 105, column: 5, scope: !446)
!493 = !DILocation(line: 106, column: 5, scope: !446)
!494 = !DILocation(line: 107, column: 5, scope: !446)
!495 = !DILocation(line: 108, column: 5, scope: !446)
!496 = !DILocation(line: 109, column: 5, scope: !446)
!497 = !DILocation(line: 110, column: 5, scope: !446)
!498 = !DILocation(line: 111, column: 24, scope: !446)
!499 = !DILocation(line: 111, column: 5, scope: !446)
!500 = !DILocation(line: 112, column: 24, scope: !446)
!501 = !DILocation(line: 112, column: 5, scope: !446)
!502 = !DILocalVariable(name: "gemm_uop", scope: !446, file: !3, line: 119, type: !503)
!503 = !DICompositeType(tag: DW_TAG_array_type, baseType: !319, size: 1728, elements: !26)
!504 = !DILocation(line: 119, column: 21, scope: !446)
!505 = !DILocation(line: 119, column: 35, scope: !446)
!506 = !DILocation(line: 119, column: 36, scope: !446)
!507 = !DILocation(line: 119, column: 38, scope: !446)
!508 = !DILocation(line: 119, column: 55, scope: !446)
!509 = !DILocation(line: 119, column: 72, scope: !446)
!510 = !DILocation(line: 119, column: 89, scope: !446)
!511 = !DILocation(line: 119, column: 91, scope: !446)
!512 = !DILocation(line: 119, column: 108, scope: !446)
!513 = !DILocation(line: 119, column: 125, scope: !446)
!514 = !DILocation(line: 120, column: 36, scope: !446)
!515 = !DILocation(line: 120, column: 38, scope: !446)
!516 = !DILocation(line: 120, column: 55, scope: !446)
!517 = !DILocation(line: 120, column: 72, scope: !446)
!518 = !DILocation(line: 120, column: 89, scope: !446)
!519 = !DILocation(line: 120, column: 91, scope: !446)
!520 = !DILocation(line: 120, column: 108, scope: !446)
!521 = !DILocation(line: 120, column: 125, scope: !446)
!522 = !DILocation(line: 121, column: 36, scope: !446)
!523 = !DILocation(line: 121, column: 38, scope: !446)
!524 = !DILocation(line: 121, column: 55, scope: !446)
!525 = !DILocation(line: 121, column: 72, scope: !446)
!526 = !DILocation(line: 121, column: 89, scope: !446)
!527 = !DILocation(line: 121, column: 91, scope: !446)
!528 = !DILocation(line: 121, column: 108, scope: !446)
!529 = !DILocation(line: 121, column: 125, scope: !446)
!530 = !DILocation(line: 122, column: 36, scope: !446)
!531 = !DILocation(line: 122, column: 38, scope: !446)
!532 = !DILocation(line: 122, column: 55, scope: !446)
!533 = !DILocation(line: 122, column: 72, scope: !446)
!534 = !DILocation(line: 122, column: 89, scope: !446)
!535 = !DILocation(line: 122, column: 91, scope: !446)
!536 = !DILocation(line: 122, column: 108, scope: !446)
!537 = !DILocation(line: 122, column: 125, scope: !446)
!538 = !DILocation(line: 123, column: 36, scope: !446)
!539 = !DILocation(line: 123, column: 38, scope: !446)
!540 = !DILocation(line: 123, column: 55, scope: !446)
!541 = !DILocation(line: 123, column: 72, scope: !446)
!542 = !DILocalVariable(name: "gemm", scope: !446, file: !3, line: 126, type: !543)
!543 = !DICompositeType(tag: DW_TAG_array_type, baseType: !389, size: 864, elements: !26)
!544 = !DILocation(line: 126, column: 21, scope: !446)
!545 = !DILocation(line: 126, column: 31, scope: !446)
!546 = !DILocation(line: 126, column: 32, scope: !446)
!547 = !DILocation(line: 126, column: 33, scope: !446)
!548 = !DILocation(line: 126, column: 49, scope: !446)
!549 = !DILocation(line: 126, column: 65, scope: !446)
!550 = !DILocation(line: 126, column: 82, scope: !446)
!551 = !DILocation(line: 126, column: 83, scope: !446)
!552 = !DILocation(line: 126, column: 99, scope: !446)
!553 = !DILocation(line: 126, column: 115, scope: !446)
!554 = !DILocation(line: 127, column: 32, scope: !446)
!555 = !DILocation(line: 127, column: 33, scope: !446)
!556 = !DILocation(line: 127, column: 49, scope: !446)
!557 = !DILocation(line: 127, column: 65, scope: !446)
!558 = !DILocation(line: 127, column: 82, scope: !446)
!559 = !DILocation(line: 127, column: 83, scope: !446)
!560 = !DILocation(line: 127, column: 99, scope: !446)
!561 = !DILocation(line: 127, column: 115, scope: !446)
!562 = !DILocation(line: 128, column: 32, scope: !446)
!563 = !DILocation(line: 128, column: 33, scope: !446)
!564 = !DILocation(line: 128, column: 49, scope: !446)
!565 = !DILocation(line: 128, column: 65, scope: !446)
!566 = !DILocation(line: 128, column: 82, scope: !446)
!567 = !DILocation(line: 128, column: 83, scope: !446)
!568 = !DILocation(line: 128, column: 99, scope: !446)
!569 = !DILocation(line: 128, column: 115, scope: !446)
!570 = !DILocation(line: 129, column: 32, scope: !446)
!571 = !DILocation(line: 129, column: 33, scope: !446)
!572 = !DILocation(line: 129, column: 49, scope: !446)
!573 = !DILocation(line: 129, column: 65, scope: !446)
!574 = !DILocation(line: 129, column: 82, scope: !446)
!575 = !DILocation(line: 129, column: 83, scope: !446)
!576 = !DILocation(line: 129, column: 99, scope: !446)
!577 = !DILocation(line: 129, column: 115, scope: !446)
!578 = !DILocation(line: 130, column: 32, scope: !446)
!579 = !DILocation(line: 130, column: 33, scope: !446)
!580 = !DILocation(line: 130, column: 49, scope: !446)
!581 = !DILocation(line: 130, column: 65, scope: !446)
!582 = !DILocalVariable(name: "microop", scope: !446, file: !3, line: 134, type: !583)
!583 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 2880, elements: !26)
!584 = !DILocation(line: 134, column: 11, scope: !446)
!585 = !DILocation(line: 134, column: 24, scope: !446)
!586 = !DILocation(line: 134, column: 25, scope: !446)
!587 = !DILocation(line: 134, column: 32, scope: !446)
!588 = !DILocation(line: 134, column: 45, scope: !446)
!589 = !DILocation(line: 134, column: 52, scope: !446)
!590 = !DILocation(line: 134, column: 65, scope: !446)
!591 = !DILocation(line: 134, column: 72, scope: !446)
!592 = !DILocation(line: 134, column: 85, scope: !446)
!593 = !DILocation(line: 134, column: 92, scope: !446)
!594 = !DILocation(line: 135, column: 25, scope: !446)
!595 = !DILocation(line: 135, column: 32, scope: !446)
!596 = !DILocation(line: 135, column: 46, scope: !446)
!597 = !DILocation(line: 135, column: 53, scope: !446)
!598 = !DILocation(line: 135, column: 66, scope: !446)
!599 = !DILocation(line: 135, column: 73, scope: !446)
!600 = !DILocation(line: 135, column: 86, scope: !446)
!601 = !DILocation(line: 135, column: 93, scope: !446)
!602 = !DILocation(line: 135, column: 106, scope: !446)
!603 = !DILocation(line: 135, column: 113, scope: !446)
!604 = !DILocalVariable(name: "microop_val", scope: !446, file: !3, line: 137, type: !605)
!605 = !DICompositeType(tag: DW_TAG_array_type, baseType: !383, size: 1728, elements: !26)
!606 = !DILocation(line: 137, column: 15, scope: !446)
!607 = !DILocation(line: 137, column: 32, scope: !446)
!608 = !DILocation(line: 137, column: 33, scope: !446)
!609 = !DILocation(line: 137, column: 40, scope: !446)
!610 = !DILocation(line: 137, column: 49, scope: !446)
!611 = !DILocation(line: 137, column: 56, scope: !446)
!612 = !DILocation(line: 137, column: 65, scope: !446)
!613 = !DILocation(line: 137, column: 72, scope: !446)
!614 = !DILocation(line: 137, column: 81, scope: !446)
!615 = !DILocation(line: 137, column: 88, scope: !446)
!616 = !DILocation(line: 138, column: 33, scope: !446)
!617 = !DILocation(line: 138, column: 40, scope: !446)
!618 = !DILocation(line: 138, column: 50, scope: !446)
!619 = !DILocation(line: 138, column: 57, scope: !446)
!620 = !DILocation(line: 138, column: 66, scope: !446)
!621 = !DILocation(line: 138, column: 73, scope: !446)
!622 = !DILocation(line: 138, column: 82, scope: !446)
!623 = !DILocation(line: 138, column: 89, scope: !446)
!624 = !DILocation(line: 138, column: 98, scope: !446)
!625 = !DILocation(line: 138, column: 105, scope: !446)
!626 = !DILocation(line: 140, column: 20, scope: !446)
!627 = !DILocation(line: 140, column: 18, scope: !446)
!628 = !DILocalVariable(name: "i", scope: !629, file: !3, line: 141, type: !38)
!629 = distinct !DILexicalBlock(scope: !446, file: !3, line: 141, column: 5)
!630 = !DILocation(line: 141, column: 14, scope: !629)
!631 = !DILocation(line: 141, column: 10, scope: !629)
!632 = !DILocation(line: 141, column: 18, scope: !633)
!633 = distinct !DILexicalBlock(scope: !629, file: !3, line: 141, column: 5)
!634 = !DILocation(line: 141, column: 19, scope: !633)
!635 = !DILocation(line: 141, column: 5, scope: !629)
!636 = !DILocation(line: 142, column: 23, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !3, line: 141, column: 26)
!638 = !DILocation(line: 142, column: 36, scope: !637)
!639 = !DILocation(line: 142, column: 20, scope: !637)
!640 = !DILocation(line: 142, column: 9, scope: !637)
!641 = !DILocation(line: 142, column: 22, scope: !637)
!642 = !DILocation(line: 141, column: 23, scope: !633)
!643 = !DILocation(line: 141, column: 5, scope: !633)
!644 = distinct !{!644, !635, !645}
!645 = !DILocation(line: 143, column: 5, scope: !629)
!646 = !DILocation(line: 145, column: 10, scope: !647)
!647 = distinct !DILexicalBlock(scope: !446, file: !3, line: 145, column: 9)
!648 = !DILocation(line: 145, column: 17, scope: !647)
!649 = !DILocation(line: 145, column: 27, scope: !647)
!650 = !DILocation(line: 145, column: 35, scope: !647)
!651 = !DILocation(line: 145, column: 22, scope: !647)
!652 = !DILocation(line: 145, column: 45, scope: !647)
!653 = !DILocation(line: 145, column: 52, scope: !647)
!654 = !DILocalVariable(name: "i", scope: !655, file: !3, line: 146, type: !38)
!655 = distinct !DILexicalBlock(scope: !656, file: !3, line: 146, column: 9)
!656 = distinct !DILexicalBlock(scope: !647, file: !3, line: 145, column: 58)
!657 = !DILocation(line: 146, column: 18, scope: !655)
!658 = !DILocation(line: 146, column: 14, scope: !655)
!659 = !DILocation(line: 146, column: 22, scope: !660)
!660 = distinct !DILexicalBlock(scope: !655, file: !3, line: 146, column: 9)
!661 = !DILocation(line: 146, column: 23, scope: !660)
!662 = !DILocation(line: 146, column: 9, scope: !655)
!663 = !DILocation(line: 147, column: 49, scope: !664)
!664 = distinct !DILexicalBlock(scope: !660, file: !3, line: 146, column: 30)
!665 = !DILocation(line: 147, column: 41, scope: !664)
!666 = !DILocation(line: 147, column: 27, scope: !664)
!667 = !DILocation(line: 147, column: 25, scope: !664)
!668 = !DILocation(line: 146, column: 27, scope: !660)
!669 = !DILocation(line: 146, column: 9, scope: !660)
!670 = distinct !{!670, !662, !671}
!671 = !DILocation(line: 149, column: 13, scope: !655)
!672 = !DILocalVariable(name: "i", scope: !673, file: !3, line: 150, type: !38)
!673 = distinct !DILexicalBlock(scope: !656, file: !3, line: 150, column: 9)
!674 = !DILocation(line: 150, column: 18, scope: !673)
!675 = !DILocation(line: 150, column: 14, scope: !673)
!676 = !DILocation(line: 150, column: 22, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !3, line: 150, column: 9)
!678 = !DILocation(line: 150, column: 23, scope: !677)
!679 = !DILocation(line: 150, column: 9, scope: !673)
!680 = !DILocation(line: 151, column: 57, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !3, line: 150, column: 30)
!682 = !DILocation(line: 151, column: 45, scope: !681)
!683 = !DILocation(line: 151, column: 27, scope: !681)
!684 = !DILocation(line: 151, column: 25, scope: !681)
!685 = !DILocation(line: 150, column: 27, scope: !677)
!686 = !DILocation(line: 150, column: 9, scope: !677)
!687 = distinct !{!687, !679, !688}
!688 = !DILocation(line: 153, column: 13, scope: !673)
!689 = !DILocalVariable(name: "i", scope: !690, file: !3, line: 154, type: !38)
!690 = distinct !DILexicalBlock(scope: !656, file: !3, line: 154, column: 9)
!691 = !DILocation(line: 154, column: 18, scope: !690)
!692 = !DILocation(line: 154, column: 14, scope: !690)
!693 = !DILocation(line: 154, column: 25, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !3, line: 154, column: 9)
!695 = !DILocation(line: 154, column: 27, scope: !694)
!696 = !DILocation(line: 154, column: 9, scope: !690)
!697 = !DILocation(line: 155, column: 10, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !3, line: 154, column: 43)
!699 = !DILocation(line: 154, column: 39, scope: !694)
!700 = !DILocation(line: 154, column: 9, scope: !694)
!701 = distinct !{!701, !696, !702}
!702 = !DILocation(line: 156, column: 13, scope: !690)
!703 = !DILocation(line: 162, column: 1, scope: !446)
!704 = distinct !DISubprogram(name: "memcpy", scope: !705, file: !705, line: 12, type: !706, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !125, retainedNodes: !4)
!705 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!706 = !DISubroutineType(types: !707)
!707 = !{!35, !35, !36, !708}
!708 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !709, line: 46, baseType: !41)
!709 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!710 = !DILocalVariable(name: "destaddr", arg: 1, scope: !704, file: !705, line: 12, type: !35)
!711 = !DILocation(line: 12, column: 20, scope: !704)
!712 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !704, file: !705, line: 12, type: !36)
!713 = !DILocation(line: 12, column: 42, scope: !704)
!714 = !DILocalVariable(name: "len", arg: 3, scope: !704, file: !705, line: 12, type: !708)
!715 = !DILocation(line: 12, column: 58, scope: !704)
!716 = !DILocalVariable(name: "dest", scope: !704, file: !705, line: 13, type: !65)
!717 = !DILocation(line: 13, column: 9, scope: !704)
!718 = !DILocation(line: 13, column: 16, scope: !704)
!719 = !DILocalVariable(name: "src", scope: !704, file: !705, line: 14, type: !69)
!720 = !DILocation(line: 14, column: 15, scope: !704)
!721 = !DILocation(line: 14, column: 21, scope: !704)
!722 = !DILocation(line: 16, column: 3, scope: !704)
!723 = !DILocation(line: 16, column: 13, scope: !704)
!724 = !DILocation(line: 16, column: 16, scope: !704)
!725 = !DILocation(line: 17, column: 19, scope: !704)
!726 = !DILocation(line: 17, column: 15, scope: !704)
!727 = !DILocation(line: 17, column: 10, scope: !704)
!728 = !DILocation(line: 17, column: 13, scope: !704)
!729 = distinct !{!729, !722, !725}
!730 = !DILocation(line: 18, column: 10, scope: !704)
!731 = !DILocation(line: 18, column: 3, scope: !704)
