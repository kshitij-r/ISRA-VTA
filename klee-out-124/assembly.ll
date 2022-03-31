; ModuleID = 'gemm.bc'
source_filename = "gemm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@result = dso_local global [10 x i32] zeroinitializer, align 16, !dbg !0
@arr_val = dso_local global i32* null, align 8, !dbg !6
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !10
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !15
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !17
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !19
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !21
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !130 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !136, metadata !DIExpression()), !dbg !137
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %j, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !147
  %cmp = icmp slt i32 %0, 3, !dbg !149
  br i1 %cmp, label %for.body, label %for.end12, !dbg !150

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !151
  br label %for.cond1, !dbg !153

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !154
  %cmp2 = icmp slt i32 %1, 3, !dbg !156
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !157

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !158
  %3 = load i32, i32* %j, align 4, !dbg !159
  %idxprom = sext i32 %3 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !158
  %4 = load i32, i32* %i, align 4, !dbg !160
  %idxprom4 = sext i32 %4 to i64, !dbg !158
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !158
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !158
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !161
  %7 = load i32, i32* %i, align 4, !dbg !162
  %idxprom6 = sext i32 %7 to i64, !dbg !161
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !161
  %8 = load i32, i32* %j, align 4, !dbg !163
  %idxprom8 = sext i32 %8 to i64, !dbg !161
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !161
  store i32 %5, i32* %arrayidx9, align 4, !dbg !164
  %9 = load i32, i32* %j, align 4, !dbg !165
  %inc = add nsw i32 %9, 1, !dbg !165
  store i32 %inc, i32* %j, align 4, !dbg !165
  br label %for.cond1, !dbg !166, !llvm.loop !167

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !169
  %inc11 = add nsw i32 %10, 1, !dbg !169
  store i32 %inc11, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !173
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPKjS0_(i32* %mat1, i32* %mat2) #0 !dbg !174 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res_index = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !179, metadata !DIExpression()), !dbg !180
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %res_index, metadata !183, metadata !DIExpression()), !dbg !184
  store i32 0, i32* %res_index, align 4, !dbg !184
  call void @llvm.dbg.declare(metadata i32* %res, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 0, i32* %res, align 4, !dbg !186
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !189
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !191
  %cmp = icmp slt i32 %0, 3, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !195
  %2 = load i32, i32* %i, align 4, !dbg !197
  %idxprom = sext i32 %2 to i64, !dbg !195
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !195
  %3 = load i32, i32* %arrayidx, align 4, !dbg !195
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !198
  %5 = load i32, i32* %i, align 4, !dbg !199
  %idxprom1 = sext i32 %5 to i64, !dbg !198
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !198
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !198
  %mul = mul i32 %3, %6, !dbg !200
  %7 = load i32, i32* %res, align 4, !dbg !201
  %add = add i32 %7, %mul, !dbg !201
  store i32 %add, i32* %res, align 4, !dbg !201
  %8 = load i32, i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %8, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !206
  %10 = load i32, i32* %res_index, align 4, !dbg !207
  %idxprom3 = sext i32 %10 to i64, !dbg !208
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @result, i64 0, i64 %idxprom3, !dbg !208
  store i32 %9, i32* %arrayidx4, align 4, !dbg !209
  %11 = load i32, i32* %res_index, align 4, !dbg !210
  %inc5 = add nsw i32 %11, 1, !dbg !210
  store i32 %inc5, i32* %res_index, align 4, !dbg !210
  ret i32* getelementptr inbounds ([10 x i32], [10 x i32]* @result, i64 0, i64 0), !dbg !211
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* %mat1, [3 x i32]* %mat2, [3 x i32]* %res) #0 !dbg !212 {
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
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat1.addr, metadata !215, metadata !DIExpression()), !dbg !216
  store [3 x i32]* %mat2, [3 x i32]** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat2.addr, metadata !217, metadata !DIExpression()), !dbg !218
  store [3 x i32]* %res, [3 x i32]** %res.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %res.addr, metadata !219, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata i32* %i, metadata !221, metadata !DIExpression()), !dbg !223
  store i32 0, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !225
  %cmp = icmp slt i32 %0, 3, !dbg !227
  br i1 %cmp, label %for.body, label %for.end22, !dbg !228

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !229, metadata !DIExpression()), !dbg !232
  store i32 0, i32* %j, align 4, !dbg !232
  br label %for.cond1, !dbg !233

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !234
  %cmp2 = icmp slt i32 %1, 3, !dbg !236
  br i1 %cmp2, label %for.body3, label %for.inc20, !dbg !237

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !238, metadata !DIExpression()), !dbg !241
  store i32 0, i32* %k, align 4, !dbg !241
  br label %for.cond4, !dbg !242

for.cond4:                                        ; preds = %for.body6, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !243
  %cmp5 = icmp slt i32 %2, 3, !dbg !245
  br i1 %cmp5, label %for.body6, label %for.inc17, !dbg !246

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !247
  %idxprom = sext i32 %3 to i64, !dbg !249
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 %idxprom, !dbg !249
  %4 = load i32, i32* %k, align 4, !dbg !250
  %idxprom7 = sext i32 %4 to i64, !dbg !249
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !249
  %5 = load i32, i32* %arrayidx8, align 4, !dbg !249
  %6 = load i32, i32* %k, align 4, !dbg !251
  %idxprom9 = sext i32 %6 to i64, !dbg !252
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 %idxprom9, !dbg !252
  %7 = load i32, i32* %j, align 4, !dbg !253
  %idxprom11 = sext i32 %7 to i64, !dbg !252
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 %idxprom11, !dbg !252
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !252
  %mul = mul i32 %5, %8, !dbg !254
  %9 = load i32, i32* %i, align 4, !dbg !255
  %idxprom13 = sext i32 %9 to i64, !dbg !256
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom13, !dbg !256
  %10 = load i32, i32* %j, align 4, !dbg !257
  %idxprom15 = sext i32 %10 to i64, !dbg !256
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 %idxprom15, !dbg !256
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !258
  %add = add i32 %11, %mul, !dbg !258
  store i32 %add, i32* %arrayidx16, align 4, !dbg !258
  %12 = load i32, i32* %k, align 4, !dbg !259
  %inc = add nsw i32 %12, 1, !dbg !259
  store i32 %inc, i32* %k, align 4, !dbg !259
  br label %for.cond4, !dbg !260, !llvm.loop !261

for.inc17:                                        ; preds = %for.cond4
  %13 = load i32, i32* %j, align 4, !dbg !263
  %inc18 = add nsw i32 %13, 1, !dbg !263
  store i32 %inc18, i32* %j, align 4, !dbg !263
  br label %for.cond1, !dbg !264, !llvm.loop !265

for.inc20:                                        ; preds = %for.cond1
  %14 = load i32, i32* %i, align 4, !dbg !267
  %inc21 = add nsw i32 %14, 1, !dbg !267
  store i32 %inc21, i32* %i, align 4, !dbg !267
  br label %for.cond, !dbg !268, !llvm.loop !269

for.end22:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !271, metadata !DIExpression()), !dbg !273
  store i32 0, i32* %i23, align 4, !dbg !273
  br label %for.cond24, !dbg !274

for.cond24:                                       ; preds = %for.inc42, %for.end22
  %15 = load i32, i32* %i23, align 4, !dbg !275
  %cmp25 = icmp slt i32 %15, 3, !dbg !277
  br i1 %cmp25, label %for.body26, label %for.end44, !dbg !278

for.body26:                                       ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i32* %j27, metadata !279, metadata !DIExpression()), !dbg !282
  store i32 0, i32* %j27, align 4, !dbg !282
  br label %for.cond28, !dbg !283

for.cond28:                                       ; preds = %for.body30, %for.body26
  %16 = load i32, i32* %j27, align 4, !dbg !284
  %cmp29 = icmp slt i32 %16, 3, !dbg !286
  %17 = load i32, i32* %i23, align 4, !dbg !287
  br i1 %cmp29, label %for.body30, label %for.inc42, !dbg !288

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %17 to i64, !dbg !289
  %arrayidx32 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom31, !dbg !289
  %18 = load i32, i32* %j27, align 4, !dbg !291
  %idxprom33 = sext i32 %18 to i64, !dbg !289
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !289
  %19 = load i32, i32* %arrayidx34, align 4, !dbg !289
  %20 = load i32, i32* %i23, align 4, !dbg !292
  %mul35 = mul nsw i32 %20, 3, !dbg !293
  %21 = load i32, i32* %j27, align 4, !dbg !294
  %add36 = add nsw i32 %mul35, %21, !dbg !295
  %idxprom37 = sext i32 %add36 to i64, !dbg !296
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 %idxprom37, !dbg !296
  store i32 %19, i32* %arrayidx38, align 4, !dbg !297
  %22 = load i32, i32* %j27, align 4, !dbg !298
  %inc40 = add nsw i32 %22, 1, !dbg !298
  store i32 %inc40, i32* %j27, align 4, !dbg !298
  br label %for.cond28, !dbg !299, !llvm.loop !300

for.inc42:                                        ; preds = %for.cond28
  %inc43 = add nsw i32 %17, 1, !dbg !302
  store i32 %inc43, i32* %i23, align 4, !dbg !302
  br label %for.cond24, !dbg !303, !llvm.loop !304

for.end44:                                        ; preds = %for.cond24
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 0), !dbg !306
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !307 {
entry:
  %arr_ref = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !322, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !324, metadata !DIExpression()), !dbg !325
  store i32* null, i32** %arr_ref, align 8, !dbg !325
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !326, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !328, metadata !DIExpression()), !dbg !329
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 1, !dbg !330
  %0 = load i32, i32* %OPCODE, align 4, !dbg !330
  %cmp = icmp eq i32 %0, 2, !dbg !332
  br i1 %cmp, label %if.then, label %if.end, !dbg !333

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !334, metadata !DIExpression()), !dbg !337
  store i32 0, i32* %i, align 4, !dbg !337
  br label %for.cond, !dbg !338

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !339
  %cmp1 = icmp slt i32 %1, 3, !dbg !341
  br i1 %cmp1, label %for.body, label %for.end, !dbg !342

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !343
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !345
  %2 = load i32*, i32** %inp_mem, align 8, !dbg !345
  %3 = load i32, i32* %i, align 4, !dbg !346
  %idx.ext = sext i32 %3 to i64, !dbg !347
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %idx.ext, !dbg !347
  %4 = load i32, i32* %add.ptr, align 4, !dbg !348
  %5 = load i32, i32* %i, align 4, !dbg !349
  %idxprom = sext i32 %5 to i64, !dbg !350
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !350
  store i32 %4, i32* %arrayidx, align 4, !dbg !351
  %6 = load i32, i32* %i, align 4, !dbg !352
  %inc = add nsw i32 %6, 1, !dbg !352
  store i32 %inc, i32* %i, align 4, !dbg !352
  br label %for.cond, !dbg !353, !llvm.loop !354

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !356, metadata !DIExpression()), !dbg !358
  store i32 0, i32* %i2, align 4, !dbg !358
  br label %for.cond3, !dbg !359

for.cond3:                                        ; preds = %for.body5, %for.end
  %7 = load i32, i32* %i2, align 4, !dbg !360
  %cmp4 = icmp slt i32 %7, 3, !dbg !362
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !363

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !364
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS6, i32 0, i32 1, !dbg !366
  %8 = load i32*, i32** %wgt_mem, align 8, !dbg !366
  %9 = load i32, i32* %i2, align 4, !dbg !367
  %idx.ext7 = sext i32 %9 to i64, !dbg !368
  %add.ptr8 = getelementptr inbounds i32, i32* %8, i64 %idx.ext7, !dbg !368
  %10 = load i32, i32* %add.ptr8, align 4, !dbg !369
  %11 = load i32, i32* %i2, align 4, !dbg !370
  %idxprom9 = sext i32 %11 to i64, !dbg !371
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom9, !dbg !371
  store i32 %10, i32* %arrayidx10, align 4, !dbg !372
  %12 = load i32, i32* %i2, align 4, !dbg !373
  %inc12 = add nsw i32 %12, 1, !dbg !373
  store i32 %inc12, i32* %i2, align 4, !dbg !373
  br label %for.cond3, !dbg !374, !llvm.loop !375

for.end13:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !377
  %arraydecay14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !378
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay14), !dbg !379
  store i32* %call, i32** %arr_ref, align 8, !dbg !380
  br label %if.end, !dbg !381

if.end:                                           ; preds = %for.end13, %entry
  %13 = load i32*, i32** %arr_ref, align 8, !dbg !382
  ret i32* %13, !dbg !383
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !384 {
entry:
  %arr_val = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !400, metadata !DIExpression()), !dbg !401
  store i32* null, i32** %arr_val, align 8, !dbg !401
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !404, metadata !DIExpression()), !dbg !405
  %OPCODE = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 1, !dbg !406
  %0 = load i32, i32* %OPCODE, align 4, !dbg !406
  %cmp = icmp eq i32 %0, 2, !dbg !408
  br i1 %cmp, label %if.then, label %if.end, !dbg !409

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !410, metadata !DIExpression()), !dbg !413
  store i32 0, i32* %i, align 4, !dbg !413
  br label %for.cond, !dbg !414

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !415
  %cmp1 = icmp slt i32 %1, 3, !dbg !417
  br i1 %cmp1, label %for.body, label %for.end, !dbg !418

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !419
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !421
  %2 = load i32, i32* %inp_mem, align 4, !dbg !421
  %3 = load i32, i32* %i, align 4, !dbg !422
  %add = add i32 %2, %3, !dbg !423
  %4 = load i32, i32* %i, align 4, !dbg !424
  %idxprom = sext i32 %4 to i64, !dbg !425
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !425
  store i32 %add, i32* %arrayidx, align 4, !dbg !426
  %5 = load i32, i32* %i, align 4, !dbg !427
  %inc = add nsw i32 %5, 1, !dbg !427
  store i32 %inc, i32* %i, align 4, !dbg !427
  br label %for.cond, !dbg !428, !llvm.loop !429

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !431, metadata !DIExpression()), !dbg !433
  store i32 0, i32* %i2, align 4, !dbg !433
  br label %for.cond3, !dbg !434

for.cond3:                                        ; preds = %for.body5, %for.end
  %6 = load i32, i32* %i2, align 4, !dbg !435
  %cmp4 = icmp slt i32 %6, 3, !dbg !437
  br i1 %cmp4, label %for.body5, label %for.end11, !dbg !438

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !439
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS6, i32 0, i32 1, !dbg !441
  %7 = load i32, i32* %wgt_mem, align 4, !dbg !441
  %8 = load i32, i32* %i2, align 4, !dbg !442
  %idxprom7 = sext i32 %8 to i64, !dbg !443
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom7, !dbg !443
  store i32 %7, i32* %arrayidx8, align 4, !dbg !444
  %9 = load i32, i32* %i2, align 4, !dbg !445
  %inc10 = add nsw i32 %9, 1, !dbg !445
  store i32 %inc10, i32* %i2, align 4, !dbg !445
  br label %for.cond3, !dbg !446, !llvm.loop !447

for.end11:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !449
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !450
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay12), !dbg !451
  store i32* %call, i32** %arr_val, align 8, !dbg !452
  br label %if.end, !dbg !453

if.end:                                           ; preds = %for.end11, %entry
  %10 = load i32*, i32** %arr_val, align 8, !dbg !454
  ret i32* %10, !dbg !455
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !456 {
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
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !460, metadata !DIExpression()), !dbg !461
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !470, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !472, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !474, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !488, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !490, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !492, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !494, metadata !DIExpression()), !dbg !495
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !496, metadata !DIExpression()), !dbg !497
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !498
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !499
  %0 = bitcast i32* %arraydecay to i8*, !dbg !499
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !499
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !500
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !500
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !500
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !501
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !501
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !501
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !502
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !502
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !502
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !503
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !503
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !503
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !504
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !504
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !504
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !505
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !505
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !505
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !506
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !506
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !506
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !507
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !507
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !507
  %18 = bitcast i32* %op_type to i8*, !dbg !508
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !509
  %19 = bitcast i32* %opcode to i8*, !dbg !510
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !511
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !512, metadata !DIExpression()), !dbg !514
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !515
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !516
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !517
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !516
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !516
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !518
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !516
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !516
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !519
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !516
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !515
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !520
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !521
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !520
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !520
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !522
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !520
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !520
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !523
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !520
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !515
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !524
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !525
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !524
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !524
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !526
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !524
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !524
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !527
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !524
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !515
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !528
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !529
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !528
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !528
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !530
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !528
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !528
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !531
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !528
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !515
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !532
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !533
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !532
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !532
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !534
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !532
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !532
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !535
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !532
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !515
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !536
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !537
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !536
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !536
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !538
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !536
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !536
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !539
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !536
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !515
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !540
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !541
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !540
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !540
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !542
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !540
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !540
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !543
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !540
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !515
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !544
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !545
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !544
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !544
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !546
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !544
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !544
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !547
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !544
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !515
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !548
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !549
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !548
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !548
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !550
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !548
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !548
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !551
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !548
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !552, metadata !DIExpression()), !dbg !554
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !555
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !556
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !557
  %20 = load i32, i32* %arrayidx68, align 4, !dbg !557
  store i32 %20, i32* %inp_mem67, align 4, !dbg !556
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !556
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !558
  %21 = load i32, i32* %arrayidx70, align 4, !dbg !558
  store i32 %21, i32* %wgt_mem69, align 4, !dbg !556
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !556
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !559
  %22 = load i32, i32* %arrayidx72, align 4, !dbg !559
  store i32 %22, i32* %acc_mem71, align 4, !dbg !556
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !555
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !560
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !561
  %23 = load i32, i32* %arrayidx75, align 4, !dbg !561
  store i32 %23, i32* %inp_mem74, align 4, !dbg !560
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !560
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !562
  %24 = load i32, i32* %arrayidx77, align 4, !dbg !562
  store i32 %24, i32* %wgt_mem76, align 4, !dbg !560
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !560
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !563
  %25 = load i32, i32* %arrayidx79, align 4, !dbg !563
  store i32 %25, i32* %acc_mem78, align 4, !dbg !560
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !555
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !564
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !565
  %26 = load i32, i32* %arrayidx82, align 4, !dbg !565
  store i32 %26, i32* %inp_mem81, align 4, !dbg !564
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !564
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !566
  %27 = load i32, i32* %arrayidx84, align 4, !dbg !566
  store i32 %27, i32* %wgt_mem83, align 4, !dbg !564
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !564
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !567
  %28 = load i32, i32* %arrayidx86, align 4, !dbg !567
  store i32 %28, i32* %acc_mem85, align 4, !dbg !564
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !555
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !568
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !569
  %29 = load i32, i32* %arrayidx89, align 4, !dbg !569
  store i32 %29, i32* %inp_mem88, align 4, !dbg !568
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !568
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !570
  %30 = load i32, i32* %arrayidx91, align 4, !dbg !570
  store i32 %30, i32* %wgt_mem90, align 4, !dbg !568
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !568
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !571
  %31 = load i32, i32* %arrayidx93, align 4, !dbg !571
  store i32 %31, i32* %acc_mem92, align 4, !dbg !568
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !555
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !572
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !573
  %32 = load i32, i32* %arrayidx96, align 4, !dbg !573
  store i32 %32, i32* %inp_mem95, align 4, !dbg !572
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !572
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !574
  %33 = load i32, i32* %arrayidx98, align 4, !dbg !574
  store i32 %33, i32* %wgt_mem97, align 4, !dbg !572
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !572
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !575
  %34 = load i32, i32* %arrayidx100, align 4, !dbg !575
  store i32 %34, i32* %acc_mem99, align 4, !dbg !572
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !555
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !576
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !577
  %35 = load i32, i32* %arrayidx103, align 4, !dbg !577
  store i32 %35, i32* %inp_mem102, align 4, !dbg !576
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !576
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !578
  %36 = load i32, i32* %arrayidx105, align 4, !dbg !578
  store i32 %36, i32* %wgt_mem104, align 4, !dbg !576
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !576
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !579
  %37 = load i32, i32* %arrayidx107, align 4, !dbg !579
  store i32 %37, i32* %acc_mem106, align 4, !dbg !576
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !555
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !580
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !581
  %38 = load i32, i32* %arrayidx110, align 4, !dbg !581
  store i32 %38, i32* %inp_mem109, align 4, !dbg !580
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !580
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !582
  %39 = load i32, i32* %arrayidx112, align 4, !dbg !582
  store i32 %39, i32* %wgt_mem111, align 4, !dbg !580
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !580
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !583
  %40 = load i32, i32* %arrayidx114, align 4, !dbg !583
  store i32 %40, i32* %acc_mem113, align 4, !dbg !580
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !555
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !584
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !585
  %41 = load i32, i32* %arrayidx117, align 4, !dbg !585
  store i32 %41, i32* %inp_mem116, align 4, !dbg !584
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !584
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !586
  %42 = load i32, i32* %arrayidx119, align 4, !dbg !586
  store i32 %42, i32* %wgt_mem118, align 4, !dbg !584
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !584
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !587
  %43 = load i32, i32* %arrayidx121, align 4, !dbg !587
  store i32 %43, i32* %acc_mem120, align 4, !dbg !584
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !555
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !588
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !589
  %44 = load i32, i32* %arrayidx124, align 4, !dbg !589
  store i32 %44, i32* %inp_mem123, align 4, !dbg !588
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !588
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !590
  %45 = load i32, i32* %arrayidx126, align 4, !dbg !590
  store i32 %45, i32* %wgt_mem125, align 4, !dbg !588
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !588
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !591
  %46 = load i32, i32* %arrayidx128, align 4, !dbg !591
  store i32 %46, i32* %acc_mem127, align 4, !dbg !588
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !592, metadata !DIExpression()), !dbg !594
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !595
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !596
  store i32 0, i32* %ID, align 8, !dbg !596
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !596
  store i32 2, i32* %OPCODE, align 4, !dbg !596
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !596
  store i32 0, i32* %OPTYPE, align 8, !dbg !596
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !596
  %arrayidx130 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !597
  %47 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !597
  %48 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx130 to i8*, !dbg !597
  %49 = call i8* @memcpy(i8* %47, i8* %48, i64 24), !dbg !597
  %arrayinit.element131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !595
  %ID132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 0, !dbg !598
  store i32 1, i32* %ID132, align 8, !dbg !598
  %OPCODE133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 1, !dbg !598
  store i32 2, i32* %OPCODE133, align 4, !dbg !598
  %OPTYPE134 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 2, !dbg !598
  store i32 0, i32* %OPTYPE134, align 8, !dbg !598
  %OPERANDS135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i32 0, i32 3, !dbg !598
  %arrayidx136 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !599
  %50 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS135 to i8*, !dbg !599
  %51 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx136 to i8*, !dbg !599
  %52 = call i8* @memcpy(i8* %50, i8* %51, i64 24), !dbg !599
  %arrayinit.element137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element131, i64 1, !dbg !595
  %ID138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 0, !dbg !600
  store i32 2, i32* %ID138, align 8, !dbg !600
  %OPCODE139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 1, !dbg !600
  store i32 2, i32* %OPCODE139, align 4, !dbg !600
  %OPTYPE140 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 2, !dbg !600
  store i32 0, i32* %OPTYPE140, align 8, !dbg !600
  %OPERANDS141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i32 0, i32 3, !dbg !600
  %arrayidx142 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !601
  %53 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS141 to i8*, !dbg !601
  %54 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx142 to i8*, !dbg !601
  %55 = call i8* @memcpy(i8* %53, i8* %54, i64 24), !dbg !601
  %arrayinit.element143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element137, i64 1, !dbg !595
  %ID144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 0, !dbg !602
  store i32 3, i32* %ID144, align 8, !dbg !602
  %OPCODE145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 1, !dbg !602
  store i32 2, i32* %OPCODE145, align 4, !dbg !602
  %OPTYPE146 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 2, !dbg !602
  store i32 0, i32* %OPTYPE146, align 8, !dbg !602
  %OPERANDS147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i32 0, i32 3, !dbg !602
  %arrayidx148 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !603
  %56 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS147 to i8*, !dbg !603
  %57 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx148 to i8*, !dbg !603
  %58 = call i8* @memcpy(i8* %56, i8* %57, i64 24), !dbg !603
  %arrayinit.element149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element143, i64 1, !dbg !595
  %ID150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 0, !dbg !604
  store i32 4, i32* %ID150, align 8, !dbg !604
  %OPCODE151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 1, !dbg !604
  store i32 2, i32* %OPCODE151, align 4, !dbg !604
  %OPTYPE152 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 2, !dbg !604
  store i32 0, i32* %OPTYPE152, align 8, !dbg !604
  %OPERANDS153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i32 0, i32 3, !dbg !604
  %arrayidx154 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !605
  %59 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS153 to i8*, !dbg !605
  %60 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx154 to i8*, !dbg !605
  %61 = call i8* @memcpy(i8* %59, i8* %60, i64 24), !dbg !605
  %arrayinit.element155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element149, i64 1, !dbg !595
  %ID156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 0, !dbg !606
  store i32 5, i32* %ID156, align 8, !dbg !606
  %OPCODE157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 1, !dbg !606
  store i32 2, i32* %OPCODE157, align 4, !dbg !606
  %OPTYPE158 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 2, !dbg !606
  store i32 0, i32* %OPTYPE158, align 8, !dbg !606
  %OPERANDS159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i32 0, i32 3, !dbg !606
  %arrayidx160 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !607
  %62 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS159 to i8*, !dbg !607
  %63 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx160 to i8*, !dbg !607
  %64 = call i8* @memcpy(i8* %62, i8* %63, i64 24), !dbg !607
  %arrayinit.element161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element155, i64 1, !dbg !595
  %ID162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 0, !dbg !608
  store i32 6, i32* %ID162, align 8, !dbg !608
  %OPCODE163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 1, !dbg !608
  store i32 2, i32* %OPCODE163, align 4, !dbg !608
  %OPTYPE164 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 2, !dbg !608
  store i32 0, i32* %OPTYPE164, align 8, !dbg !608
  %OPERANDS165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i32 0, i32 3, !dbg !608
  %arrayidx166 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !609
  %65 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS165 to i8*, !dbg !609
  %66 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx166 to i8*, !dbg !609
  %67 = call i8* @memcpy(i8* %65, i8* %66, i64 24), !dbg !609
  %arrayinit.element167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element161, i64 1, !dbg !595
  %ID168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 0, !dbg !610
  store i32 7, i32* %ID168, align 8, !dbg !610
  %OPCODE169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 1, !dbg !610
  store i32 2, i32* %OPCODE169, align 4, !dbg !610
  %OPTYPE170 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 2, !dbg !610
  store i32 0, i32* %OPTYPE170, align 8, !dbg !610
  %OPERANDS171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i32 0, i32 3, !dbg !610
  %arrayidx172 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !611
  %68 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS171 to i8*, !dbg !611
  %69 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx172 to i8*, !dbg !611
  %70 = call i8* @memcpy(i8* %68, i8* %69, i64 24), !dbg !611
  %arrayinit.element173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element167, i64 1, !dbg !595
  %ID174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 0, !dbg !612
  store i32 8, i32* %ID174, align 8, !dbg !612
  %OPCODE175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 1, !dbg !612
  store i32 2, i32* %OPCODE175, align 4, !dbg !612
  %OPTYPE176 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 2, !dbg !612
  store i32 0, i32* %OPTYPE176, align 8, !dbg !612
  %OPERANDS177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element173, i32 0, i32 3, !dbg !612
  %arrayidx178 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !613
  %71 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS177 to i8*, !dbg !613
  %72 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx178 to i8*, !dbg !613
  %73 = call i8* @memcpy(i8* %71, i8* %72, i64 24), !dbg !613
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !614, metadata !DIExpression()), !dbg !616
  %arrayinit.begin179 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !617
  %ID180 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 0, !dbg !618
  store i32 0, i32* %ID180, align 8, !dbg !618
  %OPCODE181 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 1, !dbg !618
  store i32 2, i32* %OPCODE181, align 4, !dbg !618
  %OPTYPE182 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 2, !dbg !618
  store i32 0, i32* %OPTYPE182, align 8, !dbg !618
  %OPERANDS183 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i32 0, i32 3, !dbg !618
  %arrayidx184 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !619
  %74 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS183 to i8*, !dbg !619
  %75 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx184 to i8*, !dbg !619
  %76 = call i8* @memcpy(i8* %74, i8* %75, i64 12), !dbg !619
  %arrayinit.element185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin179, i64 1, !dbg !617
  %ID186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 0, !dbg !620
  store i32 1, i32* %ID186, align 8, !dbg !620
  %OPCODE187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 1, !dbg !620
  store i32 2, i32* %OPCODE187, align 4, !dbg !620
  %OPTYPE188 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 2, !dbg !620
  store i32 0, i32* %OPTYPE188, align 8, !dbg !620
  %OPERANDS189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i32 0, i32 3, !dbg !620
  %arrayidx190 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !621
  %77 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS189 to i8*, !dbg !621
  %78 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx190 to i8*, !dbg !621
  %79 = call i8* @memcpy(i8* %77, i8* %78, i64 12), !dbg !621
  %arrayinit.element191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element185, i64 1, !dbg !617
  %ID192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 0, !dbg !622
  store i32 2, i32* %ID192, align 8, !dbg !622
  %OPCODE193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 1, !dbg !622
  store i32 2, i32* %OPCODE193, align 4, !dbg !622
  %OPTYPE194 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 2, !dbg !622
  store i32 0, i32* %OPTYPE194, align 8, !dbg !622
  %OPERANDS195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i32 0, i32 3, !dbg !622
  %arrayidx196 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !623
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS195 to i8*, !dbg !623
  %81 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx196 to i8*, !dbg !623
  %82 = call i8* @memcpy(i8* %80, i8* %81, i64 12), !dbg !623
  %arrayinit.element197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element191, i64 1, !dbg !617
  %ID198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 0, !dbg !624
  store i32 3, i32* %ID198, align 8, !dbg !624
  %OPCODE199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 1, !dbg !624
  store i32 2, i32* %OPCODE199, align 4, !dbg !624
  %OPTYPE200 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 2, !dbg !624
  store i32 0, i32* %OPTYPE200, align 8, !dbg !624
  %OPERANDS201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i32 0, i32 3, !dbg !624
  %arrayidx202 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !625
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS201 to i8*, !dbg !625
  %84 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx202 to i8*, !dbg !625
  %85 = call i8* @memcpy(i8* %83, i8* %84, i64 12), !dbg !625
  %arrayinit.element203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element197, i64 1, !dbg !617
  %ID204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 0, !dbg !626
  store i32 4, i32* %ID204, align 8, !dbg !626
  %OPCODE205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 1, !dbg !626
  store i32 2, i32* %OPCODE205, align 4, !dbg !626
  %OPTYPE206 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 2, !dbg !626
  store i32 0, i32* %OPTYPE206, align 8, !dbg !626
  %OPERANDS207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i32 0, i32 3, !dbg !626
  %arrayidx208 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !627
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS207 to i8*, !dbg !627
  %87 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx208 to i8*, !dbg !627
  %88 = call i8* @memcpy(i8* %86, i8* %87, i64 12), !dbg !627
  %arrayinit.element209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element203, i64 1, !dbg !617
  %ID210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 0, !dbg !628
  store i32 5, i32* %ID210, align 8, !dbg !628
  %OPCODE211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 1, !dbg !628
  store i32 2, i32* %OPCODE211, align 4, !dbg !628
  %OPTYPE212 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 2, !dbg !628
  store i32 0, i32* %OPTYPE212, align 8, !dbg !628
  %OPERANDS213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i32 0, i32 3, !dbg !628
  %arrayidx214 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !629
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS213 to i8*, !dbg !629
  %90 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx214 to i8*, !dbg !629
  %91 = call i8* @memcpy(i8* %89, i8* %90, i64 12), !dbg !629
  %arrayinit.element215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element209, i64 1, !dbg !617
  %ID216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 0, !dbg !630
  store i32 6, i32* %ID216, align 8, !dbg !630
  %OPCODE217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 1, !dbg !630
  store i32 2, i32* %OPCODE217, align 4, !dbg !630
  %OPTYPE218 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 2, !dbg !630
  store i32 0, i32* %OPTYPE218, align 8, !dbg !630
  %OPERANDS219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i32 0, i32 3, !dbg !630
  %arrayidx220 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !631
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS219 to i8*, !dbg !631
  %93 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx220 to i8*, !dbg !631
  %94 = call i8* @memcpy(i8* %92, i8* %93, i64 12), !dbg !631
  %arrayinit.element221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element215, i64 1, !dbg !617
  %ID222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 0, !dbg !632
  store i32 7, i32* %ID222, align 8, !dbg !632
  %OPCODE223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 1, !dbg !632
  store i32 2, i32* %OPCODE223, align 4, !dbg !632
  %OPTYPE224 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 2, !dbg !632
  store i32 0, i32* %OPTYPE224, align 8, !dbg !632
  %OPERANDS225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i32 0, i32 3, !dbg !632
  %arrayidx226 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !633
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS225 to i8*, !dbg !633
  %96 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx226 to i8*, !dbg !633
  %97 = call i8* @memcpy(i8* %95, i8* %96, i64 12), !dbg !633
  %arrayinit.element227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element221, i64 1, !dbg !617
  %ID228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 0, !dbg !634
  store i32 8, i32* %ID228, align 8, !dbg !634
  %OPCODE229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 1, !dbg !634
  store i32 2, i32* %OPCODE229, align 4, !dbg !634
  %OPTYPE230 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 2, !dbg !634
  store i32 0, i32* %OPTYPE230, align 8, !dbg !634
  %OPERANDS231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element227, i32 0, i32 3, !dbg !634
  %arrayidx232 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !635
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS231 to i8*, !dbg !635
  %99 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx232 to i8*, !dbg !635
  %100 = call i8* @memcpy(i8* %98, i8* %99, i64 12), !dbg !635
  %call = call i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 0)), !dbg !636
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !637
  call void @llvm.dbg.declare(metadata i32* %i, metadata !638, metadata !DIExpression()), !dbg !640
  store i32 0, i32* %i, align 4, !dbg !640
  br label %for.cond, !dbg !641

for.cond:                                         ; preds = %for.body, %entry
  %101 = load i32, i32* %i, align 4, !dbg !642
  %cmp = icmp slt i32 %101, 9, !dbg !644
  br i1 %cmp, label %for.body, label %for.end, !dbg !645

for.body:                                         ; preds = %for.cond
  %102 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !646
  %103 = load i32, i32* %i, align 4, !dbg !648
  %idxprom = sext i32 %103 to i64, !dbg !646
  %arrayidx233 = getelementptr inbounds i32, i32* %102, i64 %idxprom, !dbg !646
  %104 = load i32, i32* %arrayidx233, align 4, !dbg !646
  %105 = load i32, i32* %i, align 4, !dbg !649
  %idxprom234 = sext i32 %105 to i64, !dbg !650
  %arrayidx235 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom234, !dbg !650
  store i32 %104, i32* %arrayidx235, align 4, !dbg !651
  %106 = load i32, i32* %i, align 4, !dbg !652
  %inc = add nsw i32 %106, 1, !dbg !652
  store i32 %inc, i32* %i, align 4, !dbg !652
  br label %for.cond, !dbg !653, !llvm.loop !654

for.end:                                          ; preds = %for.cond
  %107 = load i32, i32* %opcode, align 4, !dbg !656
  %cmp236 = icmp eq i32 %107, 2, !dbg !658
  %108 = load i32, i32* %op_type, align 4, !dbg !659
  %cmp237 = icmp uge i32 %108, 0, !dbg !660
  %or.cond = and i1 %cmp236, %cmp237, !dbg !661
  %109 = load i32, i32* %op_type, align 4, !dbg !662
  %cmp239 = icmp ule i32 %109, 3, !dbg !663
  %or.cond1 = and i1 %or.cond, %cmp239, !dbg !661
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !661

if.then:                                          ; preds = %for.end
  call void @llvm.dbg.declare(metadata i32* %i240, metadata !664, metadata !DIExpression()), !dbg !667
  store i32 0, i32* %i240, align 4, !dbg !667
  br label %for.cond241, !dbg !668

for.cond241:                                      ; preds = %for.body243, %if.then
  %110 = load i32, i32* %i240, align 4, !dbg !669
  %cmp242 = icmp slt i32 %110, 9, !dbg !671
  br i1 %cmp242, label %for.body243, label %for.end249, !dbg !672

for.body243:                                      ; preds = %for.cond241
  %111 = load i32, i32* %i240, align 4, !dbg !673
  %idxprom244 = sext i32 %111 to i64, !dbg !675
  %arrayidx245 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom244, !dbg !675
  %112 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !675
  %113 = bitcast %struct.INSTR* %arrayidx245 to i8*, !dbg !675
  %114 = call i8* @memcpy(i8* %112, i8* %113, i64 40), !dbg !675
  %call246 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !676
  store i32* %call246, i32** %acc_mem_ref, align 8, !dbg !677
  %115 = load i32, i32* %i240, align 4, !dbg !678
  %inc248 = add nsw i32 %115, 1, !dbg !678
  store i32 %inc248, i32* %i240, align 4, !dbg !678
  br label %for.cond241, !dbg !679, !llvm.loop !680

for.end249:                                       ; preds = %for.cond241
  call void @llvm.dbg.declare(metadata i32* %i250, metadata !682, metadata !DIExpression()), !dbg !684
  store i32 0, i32* %i250, align 4, !dbg !684
  br label %for.cond251, !dbg !685

for.cond251:                                      ; preds = %for.body253, %for.end249
  %116 = load i32, i32* %i250, align 4, !dbg !686
  %cmp252 = icmp slt i32 %116, 9, !dbg !688
  br i1 %cmp252, label %for.body253, label %if.end, !dbg !689

for.body253:                                      ; preds = %for.cond251
  %117 = load i32, i32* %i250, align 4, !dbg !690
  %idxprom255 = sext i32 %117 to i64, !dbg !692
  %arrayidx256 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom255, !dbg !692
  %118 = bitcast %struct.INSTR_VAL* %agg.tmp254 to i8*, !dbg !692
  %119 = bitcast %struct.INSTR_VAL* %arrayidx256 to i8*, !dbg !692
  %120 = call i8* @memcpy(i8* %118, i8* %119, i64 24), !dbg !692
  %call257 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp254), !dbg !693
  store i32* %call257, i32** %acc_mem_val, align 8, !dbg !694
  %121 = load i32, i32* %i250, align 4, !dbg !695
  %inc259 = add nsw i32 %121, 1, !dbg !695
  store i32 %inc259, i32* %i250, align 4, !dbg !695
  br label %for.cond251, !dbg !696, !llvm.loop !697

if.end:                                           ; preds = %for.cond251, %for.end
  ret i32 0, !dbg !699
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !700 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !706, metadata !DIExpression()), !dbg !707
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !708, metadata !DIExpression()), !dbg !709
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !710, metadata !DIExpression()), !dbg !711
  call void @llvm.dbg.declare(metadata i8** %7, metadata !712, metadata !DIExpression()), !dbg !713
  %9 = load i8*, i8** %4, align 8, !dbg !714
  store i8* %9, i8** %7, align 8, !dbg !713
  call void @llvm.dbg.declare(metadata i8** %8, metadata !715, metadata !DIExpression()), !dbg !716
  %10 = load i8*, i8** %5, align 8, !dbg !717
  store i8* %10, i8** %8, align 8, !dbg !716
  br label %11, !dbg !718

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !719
  %13 = add i64 %12, -1, !dbg !719
  store i64 %13, i64* %6, align 8, !dbg !719
  %14 = icmp ugt i64 %12, 0, !dbg !720
  br i1 %14, label %15, label %21, !dbg !718

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !721
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !721
  store i8* %17, i8** %8, align 8, !dbg !721
  %18 = load i8, i8* %16, align 1, !dbg !722
  %19 = load i8*, i8** %7, align 8, !dbg !723
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !723
  store i8* %20, i8** %7, align 8, !dbg !723
  store i8 %18, i8* %19, align 1, !dbg !724
  br label %11, !dbg !718, !llvm.loop !725

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !726
  ret i8* %22, !dbg !727
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2, !123}
!llvm.module.flags = !{!125, !126, !127}
!llvm.ident = !{!128, !129}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 10, type: !120, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, imports: !26, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!0, !6, !10, !15, !17, !19, !21}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "arr_val", scope: !2, file: !3, line: 12, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 13, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 288, elements: !13)
!13 = !{!14, !14}
!14 = !DISubrange(count: 3)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 14, type: !12, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 15, type: !12, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 16, type: !12, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 17, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 288, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 9)
!26 = !{!27, !41, !45, !51, !55, !59, !69, !73, !75, !77, !81, !85, !89, !93, !97, !99, !101, !103, !107, !111, !115, !117, !119}
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !29, file: !40, line: 75)
!28 = !DINamespace(name: "std", scope: null)
!29 = !DISubprogram(name: "memchr", scope: !30, file: !30, line: 90, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!30 = !DIFile(filename: "/usr/include/string.h", directory: "")
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !34, !36, !37}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !42, file: !40, line: 76)
!42 = !DISubprogram(name: "memcmp", scope: !30, file: !30, line: 63, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!43 = !DISubroutineType(types: !44)
!44 = !{!36, !34, !34, !37}
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !46, file: !40, line: 77)
!46 = !DISubprogram(name: "memcpy", scope: !30, file: !30, line: 42, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DISubroutineType(types: !48)
!48 = !{!33, !49, !50, !37}
!49 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !33)
!50 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !52, file: !40, line: 78)
!52 = !DISubprogram(name: "memmove", scope: !30, file: !30, line: 46, type: !53, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DISubroutineType(types: !54)
!54 = !{!33, !33, !34, !37}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !56, file: !40, line: 79)
!56 = !DISubprogram(name: "memset", scope: !30, file: !30, line: 60, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DISubroutineType(types: !58)
!58 = !{!33, !33, !36, !37}
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !60, file: !40, line: 80)
!60 = !DISubprogram(name: "strcat", scope: !30, file: !30, line: 129, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !65, !66}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !63)
!66 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !70, file: !40, line: 81)
!70 = !DISubprogram(name: "strcmp", scope: !30, file: !30, line: 136, type: !71, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DISubroutineType(types: !72)
!72 = !{!36, !67, !67}
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !74, file: !40, line: 82)
!74 = !DISubprogram(name: "strcoll", scope: !30, file: !30, line: 143, type: !71, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !76, file: !40, line: 83)
!76 = !DISubprogram(name: "strcpy", scope: !30, file: !30, line: 121, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !78, file: !40, line: 84)
!78 = !DISubprogram(name: "strcspn", scope: !30, file: !30, line: 272, type: !79, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DISubroutineType(types: !80)
!80 = !{!37, !67, !67}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !82, file: !40, line: 85)
!82 = !DISubprogram(name: "strerror", scope: !30, file: !30, line: 396, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DISubroutineType(types: !84)
!84 = !{!63, !36}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !86, file: !40, line: 86)
!86 = !DISubprogram(name: "strlen", scope: !30, file: !30, line: 384, type: !87, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DISubroutineType(types: !88)
!88 = !{!37, !67}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !90, file: !40, line: 87)
!90 = !DISubprogram(name: "strncat", scope: !30, file: !30, line: 132, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!91 = !DISubroutineType(types: !92)
!92 = !{!63, !65, !66, !37}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !94, file: !40, line: 88)
!94 = !DISubprogram(name: "strncmp", scope: !30, file: !30, line: 139, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!36, !67, !67, !37}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !98, file: !40, line: 89)
!98 = !DISubprogram(name: "strncpy", scope: !30, file: !30, line: 124, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !100, file: !40, line: 90)
!100 = !DISubprogram(name: "strspn", scope: !30, file: !30, line: 276, type: !79, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !102, file: !40, line: 91)
!102 = !DISubprogram(name: "strtok", scope: !30, file: !30, line: 335, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !104, file: !40, line: 92)
!104 = !DISubprogram(name: "strxfrm", scope: !30, file: !30, line: 146, type: !105, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DISubroutineType(types: !106)
!106 = !{!37, !65, !66, !37}
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !108, file: !40, line: 93)
!108 = !DISubprogram(name: "strchr", scope: !30, file: !30, line: 225, type: !109, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DISubroutineType(types: !110)
!110 = !{!63, !67, !36}
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !112, file: !40, line: 94)
!112 = !DISubprogram(name: "strpbrk", scope: !30, file: !30, line: 302, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DISubroutineType(types: !114)
!114 = !{!63, !67, !67}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !116, file: !40, line: 95)
!116 = !DISubprogram(name: "strrchr", scope: !30, file: !30, line: 252, type: !109, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !118, file: !40, line: 96)
!118 = !DISubprogram(name: "strstr", scope: !30, file: !30, line: 329, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !28, file: !3, line: 6)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 10)
!123 = distinct !DICompileUnit(language: DW_LANG_C99, file: !124, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!124 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!125 = !{i32 2, !"Dwarf Version", i32 4}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!129 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!130 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 19, type: !131, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DISubroutineType(types: !132)
!132 = !{null, !133, !133}
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 96, elements: !135)
!135 = !{!14}
!136 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !130, file: !3, line: 19, type: !133)
!137 = !DILocation(line: 19, column: 29, scope: !130)
!138 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !130, file: !3, line: 19, type: !133)
!139 = !DILocation(line: 19, column: 58, scope: !130)
!140 = !DILocalVariable(name: "i", scope: !130, file: !3, line: 21, type: !36)
!141 = !DILocation(line: 21, column: 9, scope: !130)
!142 = !DILocalVariable(name: "j", scope: !130, file: !3, line: 21, type: !36)
!143 = !DILocation(line: 21, column: 12, scope: !130)
!144 = !DILocation(line: 22, column: 12, scope: !145)
!145 = distinct !DILexicalBlock(scope: !130, file: !3, line: 22, column: 5)
!146 = !DILocation(line: 22, column: 10, scope: !145)
!147 = !DILocation(line: 22, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 22, column: 5)
!149 = !DILocation(line: 22, column: 19, scope: !148)
!150 = !DILocation(line: 22, column: 5, scope: !145)
!151 = !DILocation(line: 23, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 23, column: 9)
!153 = !DILocation(line: 23, column: 14, scope: !152)
!154 = !DILocation(line: 23, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !3, line: 23, column: 9)
!156 = !DILocation(line: 23, column: 23, scope: !155)
!157 = !DILocation(line: 23, column: 9, scope: !152)
!158 = !DILocation(line: 24, column: 35, scope: !155)
!159 = !DILocation(line: 24, column: 43, scope: !155)
!160 = !DILocation(line: 24, column: 46, scope: !155)
!161 = !DILocation(line: 24, column: 13, scope: !155)
!162 = !DILocation(line: 24, column: 27, scope: !155)
!163 = !DILocation(line: 24, column: 30, scope: !155)
!164 = !DILocation(line: 24, column: 33, scope: !155)
!165 = !DILocation(line: 23, column: 31, scope: !155)
!166 = !DILocation(line: 23, column: 9, scope: !155)
!167 = distinct !{!167, !157, !168}
!168 = !DILocation(line: 24, column: 47, scope: !152)
!169 = !DILocation(line: 22, column: 27, scope: !148)
!170 = !DILocation(line: 22, column: 5, scope: !148)
!171 = distinct !{!171, !150, !172}
!172 = !DILocation(line: 24, column: 47, scope: !145)
!173 = !DILocation(line: 25, column: 1, scope: !130)
!174 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPKjS0_", scope: !3, file: !3, line: 27, type: !175, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!175 = !DISubroutineType(types: !176)
!176 = !{!8, !177, !177}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!179 = !DILocalVariable(name: "mat1", arg: 1, scope: !174, file: !3, line: 27, type: !177)
!180 = !DILocation(line: 27, column: 49, scope: !174)
!181 = !DILocalVariable(name: "mat2", arg: 2, scope: !174, file: !3, line: 27, type: !177)
!182 = !DILocation(line: 27, column: 76, scope: !174)
!183 = !DILocalVariable(name: "res_index", scope: !174, file: !3, line: 29, type: !36)
!184 = !DILocation(line: 29, column: 9, scope: !174)
!185 = !DILocalVariable(name: "res", scope: !174, file: !3, line: 30, type: !9)
!186 = !DILocation(line: 30, column: 18, scope: !174)
!187 = !DILocalVariable(name: "i", scope: !188, file: !3, line: 31, type: !36)
!188 = distinct !DILexicalBlock(scope: !174, file: !3, line: 31, column: 5)
!189 = !DILocation(line: 31, column: 13, scope: !188)
!190 = !DILocation(line: 31, column: 9, scope: !188)
!191 = !DILocation(line: 31, column: 20, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !3, line: 31, column: 5)
!193 = !DILocation(line: 31, column: 22, scope: !192)
!194 = !DILocation(line: 31, column: 5, scope: !188)
!195 = !DILocation(line: 33, column: 16, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 32, column: 5)
!197 = !DILocation(line: 33, column: 21, scope: !196)
!198 = !DILocation(line: 33, column: 26, scope: !196)
!199 = !DILocation(line: 33, column: 31, scope: !196)
!200 = !DILocation(line: 33, column: 24, scope: !196)
!201 = !DILocation(line: 33, column: 13, scope: !196)
!202 = !DILocation(line: 31, column: 28, scope: !192)
!203 = !DILocation(line: 31, column: 5, scope: !192)
!204 = distinct !{!204, !194, !205}
!205 = !DILocation(line: 34, column: 5, scope: !188)
!206 = !DILocation(line: 35, column: 25, scope: !174)
!207 = !DILocation(line: 35, column: 12, scope: !174)
!208 = !DILocation(line: 35, column: 5, scope: !174)
!209 = !DILocation(line: 35, column: 23, scope: !174)
!210 = !DILocation(line: 36, column: 14, scope: !174)
!211 = !DILocation(line: 37, column: 5, scope: !174)
!212 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 40, type: !213, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!213 = !DISubroutineType(types: !214)
!214 = !{!8, !133, !133, !133}
!215 = !DILocalVariable(name: "mat1", arg: 1, scope: !212, file: !3, line: 40, type: !133)
!216 = !DILocation(line: 40, column: 35, scope: !212)
!217 = !DILocalVariable(name: "mat2", arg: 2, scope: !212, file: !3, line: 40, type: !133)
!218 = !DILocation(line: 40, column: 61, scope: !212)
!219 = !DILocalVariable(name: "res", arg: 3, scope: !212, file: !3, line: 40, type: !133)
!220 = !DILocation(line: 40, column: 87, scope: !212)
!221 = !DILocalVariable(name: "i", scope: !222, file: !3, line: 41, type: !36)
!222 = distinct !DILexicalBlock(scope: !212, file: !3, line: 41, column: 5)
!223 = !DILocation(line: 41, column: 14, scope: !222)
!224 = !DILocation(line: 41, column: 10, scope: !222)
!225 = !DILocation(line: 41, column: 21, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !3, line: 41, column: 5)
!227 = !DILocation(line: 41, column: 23, scope: !226)
!228 = !DILocation(line: 41, column: 5, scope: !222)
!229 = !DILocalVariable(name: "j", scope: !230, file: !3, line: 42, type: !36)
!230 = distinct !DILexicalBlock(scope: !231, file: !3, line: 42, column: 9)
!231 = distinct !DILexicalBlock(scope: !226, file: !3, line: 41, column: 35)
!232 = !DILocation(line: 42, column: 18, scope: !230)
!233 = !DILocation(line: 42, column: 14, scope: !230)
!234 = !DILocation(line: 42, column: 25, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !3, line: 42, column: 9)
!236 = !DILocation(line: 42, column: 27, scope: !235)
!237 = !DILocation(line: 42, column: 9, scope: !230)
!238 = !DILocalVariable(name: "k", scope: !239, file: !3, line: 43, type: !36)
!239 = distinct !DILexicalBlock(scope: !240, file: !3, line: 43, column: 13)
!240 = distinct !DILexicalBlock(scope: !235, file: !3, line: 42, column: 39)
!241 = !DILocation(line: 43, column: 22, scope: !239)
!242 = !DILocation(line: 43, column: 18, scope: !239)
!243 = !DILocation(line: 43, column: 29, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !3, line: 43, column: 13)
!245 = !DILocation(line: 43, column: 31, scope: !244)
!246 = !DILocation(line: 43, column: 13, scope: !239)
!247 = !DILocation(line: 44, column: 42, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !3, line: 43, column: 43)
!249 = !DILocation(line: 44, column: 34, scope: !248)
!250 = !DILocation(line: 44, column: 45, scope: !248)
!251 = !DILocation(line: 44, column: 58, scope: !248)
!252 = !DILocation(line: 44, column: 50, scope: !248)
!253 = !DILocation(line: 44, column: 61, scope: !248)
!254 = !DILocation(line: 44, column: 48, scope: !248)
!255 = !DILocation(line: 44, column: 25, scope: !248)
!256 = !DILocation(line: 44, column: 17, scope: !248)
!257 = !DILocation(line: 44, column: 28, scope: !248)
!258 = !DILocation(line: 44, column: 31, scope: !248)
!259 = !DILocation(line: 43, column: 39, scope: !244)
!260 = !DILocation(line: 43, column: 13, scope: !244)
!261 = distinct !{!261, !246, !262}
!262 = !DILocation(line: 45, column: 13, scope: !239)
!263 = !DILocation(line: 42, column: 35, scope: !235)
!264 = !DILocation(line: 42, column: 9, scope: !235)
!265 = distinct !{!265, !237, !266}
!266 = !DILocation(line: 46, column: 9, scope: !230)
!267 = !DILocation(line: 41, column: 31, scope: !226)
!268 = !DILocation(line: 41, column: 5, scope: !226)
!269 = distinct !{!269, !228, !270}
!270 = !DILocation(line: 47, column: 5, scope: !222)
!271 = !DILocalVariable(name: "i", scope: !272, file: !3, line: 48, type: !36)
!272 = distinct !DILexicalBlock(scope: !212, file: !3, line: 48, column: 5)
!273 = !DILocation(line: 48, column: 13, scope: !272)
!274 = !DILocation(line: 48, column: 9, scope: !272)
!275 = !DILocation(line: 48, column: 18, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !3, line: 48, column: 5)
!277 = !DILocation(line: 48, column: 19, scope: !276)
!278 = !DILocation(line: 48, column: 5, scope: !272)
!279 = !DILocalVariable(name: "j", scope: !280, file: !3, line: 49, type: !36)
!280 = distinct !DILexicalBlock(scope: !281, file: !3, line: 49, column: 9)
!281 = distinct !DILexicalBlock(scope: !276, file: !3, line: 48, column: 28)
!282 = !DILocation(line: 49, column: 17, scope: !280)
!283 = !DILocation(line: 49, column: 13, scope: !280)
!284 = !DILocation(line: 49, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !280, file: !3, line: 49, column: 9)
!286 = !DILocation(line: 49, column: 22, scope: !285)
!287 = !DILocation(line: 0, scope: !276)
!288 = !DILocation(line: 49, column: 9, scope: !280)
!289 = !DILocation(line: 50, column: 37, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !3, line: 49, column: 31)
!291 = !DILocation(line: 50, column: 48, scope: !290)
!292 = !DILocation(line: 50, column: 26, scope: !290)
!293 = !DILocation(line: 50, column: 27, scope: !290)
!294 = !DILocation(line: 50, column: 32, scope: !290)
!295 = !DILocation(line: 50, column: 31, scope: !290)
!296 = !DILocation(line: 50, column: 13, scope: !290)
!297 = !DILocation(line: 50, column: 35, scope: !290)
!298 = !DILocation(line: 49, column: 28, scope: !285)
!299 = !DILocation(line: 49, column: 9, scope: !285)
!300 = distinct !{!300, !288, !301}
!301 = !DILocation(line: 51, column: 9, scope: !280)
!302 = !DILocation(line: 48, column: 25, scope: !276)
!303 = !DILocation(line: 48, column: 5, scope: !276)
!304 = distinct !{!304, !278, !305}
!305 = !DILocation(line: 52, column: 5, scope: !272)
!306 = !DILocation(line: 53, column: 5, scope: !212)
!307 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 56, type: !308, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!308 = !DISubroutineType(types: !309)
!309 = !{!8, !310}
!310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !311, line: 17, size: 320, flags: DIFlagTypePassByValue, elements: !312, identifier: "_ZTS5INSTR")
!311 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!312 = !{!313, !314, !315, !316}
!313 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !310, file: !311, line: 18, baseType: !9, size: 32)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !310, file: !311, line: 19, baseType: !9, size: 32, offset: 32)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !310, file: !311, line: 20, baseType: !9, size: 32, offset: 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !310, file: !311, line: 21, baseType: !317, size: 192, offset: 128)
!317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !311, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !318, identifier: "_ZTS15GEMM_STRUCT_REF")
!318 = !{!319, !320, !321}
!319 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !317, file: !311, line: 6, baseType: !8, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !317, file: !311, line: 7, baseType: !8, size: 64, offset: 64)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !317, file: !311, line: 8, baseType: !8, size: 64, offset: 128)
!322 = !DILocalVariable(name: "instr", arg: 1, scope: !307, file: !3, line: 56, type: !310)
!323 = !DILocation(line: 56, column: 35, scope: !307)
!324 = !DILocalVariable(name: "arr_ref", scope: !307, file: !3, line: 58, type: !8)
!325 = !DILocation(line: 58, column: 20, scope: !307)
!326 = !DILocalVariable(name: "inp", scope: !307, file: !3, line: 59, type: !134)
!327 = !DILocation(line: 59, column: 18, scope: !307)
!328 = !DILocalVariable(name: "wgt", scope: !307, file: !3, line: 59, type: !134)
!329 = !DILocation(line: 59, column: 26, scope: !307)
!330 = !DILocation(line: 60, column: 14, scope: !331)
!331 = distinct !DILexicalBlock(scope: !307, file: !3, line: 60, column: 8)
!332 = !DILocation(line: 60, column: 20, scope: !331)
!333 = !DILocation(line: 60, column: 8, scope: !307)
!334 = !DILocalVariable(name: "i", scope: !335, file: !3, line: 61, type: !36)
!335 = distinct !DILexicalBlock(scope: !336, file: !3, line: 61, column: 9)
!336 = distinct !DILexicalBlock(scope: !331, file: !3, line: 60, column: 25)
!337 = !DILocation(line: 61, column: 18, scope: !335)
!338 = !DILocation(line: 61, column: 14, scope: !335)
!339 = !DILocation(line: 61, column: 22, scope: !340)
!340 = distinct !DILexicalBlock(scope: !335, file: !3, line: 61, column: 9)
!341 = !DILocation(line: 61, column: 23, scope: !340)
!342 = !DILocation(line: 61, column: 9, scope: !335)
!343 = !DILocation(line: 62, column: 30, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !3, line: 61, column: 30)
!345 = !DILocation(line: 62, column: 39, scope: !344)
!346 = !DILocation(line: 62, column: 47, scope: !344)
!347 = !DILocation(line: 62, column: 46, scope: !344)
!348 = !DILocation(line: 62, column: 22, scope: !344)
!349 = !DILocation(line: 62, column: 17, scope: !344)
!350 = !DILocation(line: 62, column: 13, scope: !344)
!351 = !DILocation(line: 62, column: 20, scope: !344)
!352 = !DILocation(line: 61, column: 27, scope: !340)
!353 = !DILocation(line: 61, column: 9, scope: !340)
!354 = distinct !{!354, !342, !355}
!355 = !DILocation(line: 63, column: 9, scope: !335)
!356 = !DILocalVariable(name: "i", scope: !357, file: !3, line: 64, type: !36)
!357 = distinct !DILexicalBlock(scope: !336, file: !3, line: 64, column: 9)
!358 = !DILocation(line: 64, column: 18, scope: !357)
!359 = !DILocation(line: 64, column: 14, scope: !357)
!360 = !DILocation(line: 64, column: 22, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !3, line: 64, column: 9)
!362 = !DILocation(line: 64, column: 23, scope: !361)
!363 = !DILocation(line: 64, column: 9, scope: !357)
!364 = !DILocation(line: 65, column: 30, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !3, line: 64, column: 30)
!366 = !DILocation(line: 65, column: 39, scope: !365)
!367 = !DILocation(line: 65, column: 47, scope: !365)
!368 = !DILocation(line: 65, column: 46, scope: !365)
!369 = !DILocation(line: 65, column: 22, scope: !365)
!370 = !DILocation(line: 65, column: 17, scope: !365)
!371 = !DILocation(line: 65, column: 13, scope: !365)
!372 = !DILocation(line: 65, column: 20, scope: !365)
!373 = !DILocation(line: 64, column: 27, scope: !361)
!374 = !DILocation(line: 64, column: 9, scope: !361)
!375 = distinct !{!375, !363, !376}
!376 = !DILocation(line: 66, column: 9, scope: !357)
!377 = !DILocation(line: 67, column: 34, scope: !336)
!378 = !DILocation(line: 67, column: 38, scope: !336)
!379 = !DILocation(line: 67, column: 19, scope: !336)
!380 = !DILocation(line: 67, column: 17, scope: !336)
!381 = !DILocation(line: 68, column: 5, scope: !336)
!382 = !DILocation(line: 69, column: 12, scope: !307)
!383 = !DILocation(line: 69, column: 5, scope: !307)
!384 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 72, type: !385, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!385 = !DISubroutineType(types: !386)
!386 = !{!8, !387}
!387 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !311, line: 24, size: 192, flags: DIFlagTypePassByValue, elements: !388, identifier: "_ZTS9INSTR_VAL")
!388 = !{!389, !390, !391, !392}
!389 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !387, file: !311, line: 25, baseType: !9, size: 32)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !387, file: !311, line: 26, baseType: !9, size: 32, offset: 32)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !387, file: !311, line: 27, baseType: !9, size: 32, offset: 64)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !387, file: !311, line: 28, baseType: !393, size: 96, offset: 96)
!393 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !311, line: 11, size: 96, flags: DIFlagTypePassByValue, elements: !394, identifier: "_ZTS15GEMM_STRUCT_VAL")
!394 = !{!395, !396, !397}
!395 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !393, file: !311, line: 12, baseType: !9, size: 32)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !393, file: !311, line: 13, baseType: !9, size: 32, offset: 32)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !393, file: !311, line: 14, baseType: !9, size: 32, offset: 64)
!398 = !DILocalVariable(name: "instr", arg: 1, scope: !384, file: !3, line: 72, type: !387)
!399 = !DILocation(line: 72, column: 43, scope: !384)
!400 = !DILocalVariable(name: "arr_val", scope: !384, file: !3, line: 74, type: !8)
!401 = !DILocation(line: 74, column: 20, scope: !384)
!402 = !DILocalVariable(name: "inp", scope: !384, file: !3, line: 75, type: !134)
!403 = !DILocation(line: 75, column: 18, scope: !384)
!404 = !DILocalVariable(name: "wgt", scope: !384, file: !3, line: 75, type: !134)
!405 = !DILocation(line: 75, column: 26, scope: !384)
!406 = !DILocation(line: 76, column: 14, scope: !407)
!407 = distinct !DILexicalBlock(scope: !384, file: !3, line: 76, column: 8)
!408 = !DILocation(line: 76, column: 20, scope: !407)
!409 = !DILocation(line: 76, column: 8, scope: !384)
!410 = !DILocalVariable(name: "i", scope: !411, file: !3, line: 77, type: !36)
!411 = distinct !DILexicalBlock(scope: !412, file: !3, line: 77, column: 9)
!412 = distinct !DILexicalBlock(scope: !407, file: !3, line: 76, column: 25)
!413 = !DILocation(line: 77, column: 18, scope: !411)
!414 = !DILocation(line: 77, column: 14, scope: !411)
!415 = !DILocation(line: 77, column: 22, scope: !416)
!416 = distinct !DILexicalBlock(scope: !411, file: !3, line: 77, column: 9)
!417 = !DILocation(line: 77, column: 23, scope: !416)
!418 = !DILocation(line: 77, column: 9, scope: !411)
!419 = !DILocation(line: 78, column: 28, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !3, line: 77, column: 30)
!421 = !DILocation(line: 78, column: 37, scope: !420)
!422 = !DILocation(line: 78, column: 45, scope: !420)
!423 = !DILocation(line: 78, column: 44, scope: !420)
!424 = !DILocation(line: 78, column: 17, scope: !420)
!425 = !DILocation(line: 78, column: 13, scope: !420)
!426 = !DILocation(line: 78, column: 20, scope: !420)
!427 = !DILocation(line: 77, column: 27, scope: !416)
!428 = !DILocation(line: 77, column: 9, scope: !416)
!429 = distinct !{!429, !418, !430}
!430 = !DILocation(line: 79, column: 9, scope: !411)
!431 = !DILocalVariable(name: "i", scope: !432, file: !3, line: 80, type: !36)
!432 = distinct !DILexicalBlock(scope: !412, file: !3, line: 80, column: 9)
!433 = !DILocation(line: 80, column: 18, scope: !432)
!434 = !DILocation(line: 80, column: 14, scope: !432)
!435 = !DILocation(line: 80, column: 22, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !3, line: 80, column: 9)
!437 = !DILocation(line: 80, column: 23, scope: !436)
!438 = !DILocation(line: 80, column: 9, scope: !432)
!439 = !DILocation(line: 81, column: 28, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !3, line: 80, column: 30)
!441 = !DILocation(line: 81, column: 37, scope: !440)
!442 = !DILocation(line: 81, column: 17, scope: !440)
!443 = !DILocation(line: 81, column: 13, scope: !440)
!444 = !DILocation(line: 81, column: 20, scope: !440)
!445 = !DILocation(line: 80, column: 27, scope: !436)
!446 = !DILocation(line: 80, column: 9, scope: !436)
!447 = distinct !{!447, !438, !448}
!448 = !DILocation(line: 82, column: 9, scope: !432)
!449 = !DILocation(line: 83, column: 34, scope: !412)
!450 = !DILocation(line: 83, column: 38, scope: !412)
!451 = !DILocation(line: 83, column: 19, scope: !412)
!452 = !DILocation(line: 83, column: 17, scope: !412)
!453 = !DILocation(line: 84, column: 5, scope: !412)
!454 = !DILocation(line: 85, column: 12, scope: !384)
!455 = !DILocation(line: 85, column: 5, scope: !384)
!456 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 92, type: !457, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!457 = !DISubroutineType(types: !458)
!458 = !{!36, !36, !459}
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!460 = !DILocalVariable(name: "argc", arg: 1, scope: !456, file: !3, line: 92, type: !36)
!461 = !DILocation(line: 92, column: 14, scope: !456)
!462 = !DILocalVariable(name: "argv", arg: 2, scope: !456, file: !3, line: 92, type: !459)
!463 = !DILocation(line: 92, column: 32, scope: !456)
!464 = !DILocalVariable(name: "inp_mem_row0", scope: !456, file: !3, line: 94, type: !134)
!465 = !DILocation(line: 94, column: 18, scope: !456)
!466 = !DILocalVariable(name: "inp_mem_row1", scope: !456, file: !3, line: 94, type: !134)
!467 = !DILocation(line: 94, column: 37, scope: !456)
!468 = !DILocalVariable(name: "inp_mem_row2", scope: !456, file: !3, line: 94, type: !134)
!469 = !DILocation(line: 94, column: 56, scope: !456)
!470 = !DILocalVariable(name: "wgt_mem_row0", scope: !456, file: !3, line: 95, type: !134)
!471 = !DILocation(line: 95, column: 18, scope: !456)
!472 = !DILocalVariable(name: "wgt_mem_row1", scope: !456, file: !3, line: 95, type: !134)
!473 = !DILocation(line: 95, column: 37, scope: !456)
!474 = !DILocalVariable(name: "wgt_mem_row2", scope: !456, file: !3, line: 95, type: !134)
!475 = !DILocation(line: 95, column: 56, scope: !456)
!476 = !DILocalVariable(name: "acc_mem_row0", scope: !456, file: !3, line: 96, type: !134)
!477 = !DILocation(line: 96, column: 18, scope: !456)
!478 = !DILocalVariable(name: "acc_mem_row1", scope: !456, file: !3, line: 96, type: !134)
!479 = !DILocation(line: 96, column: 37, scope: !456)
!480 = !DILocalVariable(name: "acc_mem_row2", scope: !456, file: !3, line: 96, type: !134)
!481 = !DILocation(line: 96, column: 56, scope: !456)
!482 = !DILocalVariable(name: "acc_mem_ref", scope: !456, file: !3, line: 97, type: !8)
!483 = !DILocation(line: 97, column: 20, scope: !456)
!484 = !DILocalVariable(name: "acc_mem_val", scope: !456, file: !3, line: 98, type: !8)
!485 = !DILocation(line: 98, column: 20, scope: !456)
!486 = !DILocalVariable(name: "acc_mem_gemm", scope: !456, file: !3, line: 99, type: !8)
!487 = !DILocation(line: 99, column: 20, scope: !456)
!488 = !DILocalVariable(name: "opcode", scope: !456, file: !3, line: 100, type: !9)
!489 = !DILocation(line: 100, column: 18, scope: !456)
!490 = !DILocalVariable(name: "op_type", scope: !456, file: !3, line: 100, type: !9)
!491 = !DILocation(line: 100, column: 25, scope: !456)
!492 = !DILocalVariable(name: "acc_stage2", scope: !456, file: !3, line: 101, type: !23)
!493 = !DILocation(line: 101, column: 18, scope: !456)
!494 = !DILocalVariable(name: "acc_stage1", scope: !456, file: !3, line: 102, type: !23)
!495 = !DILocation(line: 102, column: 18, scope: !456)
!496 = !DILocalVariable(name: "acc_stage3", scope: !456, file: !3, line: 103, type: !23)
!497 = !DILocation(line: 103, column: 18, scope: !456)
!498 = !DILocation(line: 104, column: 5, scope: !456)
!499 = !DILocation(line: 106, column: 5, scope: !456)
!500 = !DILocation(line: 107, column: 5, scope: !456)
!501 = !DILocation(line: 108, column: 5, scope: !456)
!502 = !DILocation(line: 109, column: 5, scope: !456)
!503 = !DILocation(line: 110, column: 5, scope: !456)
!504 = !DILocation(line: 111, column: 5, scope: !456)
!505 = !DILocation(line: 112, column: 5, scope: !456)
!506 = !DILocation(line: 113, column: 5, scope: !456)
!507 = !DILocation(line: 114, column: 5, scope: !456)
!508 = !DILocation(line: 115, column: 24, scope: !456)
!509 = !DILocation(line: 115, column: 5, scope: !456)
!510 = !DILocation(line: 116, column: 24, scope: !456)
!511 = !DILocation(line: 116, column: 5, scope: !456)
!512 = !DILocalVariable(name: "gemm_uop", scope: !456, file: !3, line: 123, type: !513)
!513 = !DICompositeType(tag: DW_TAG_array_type, baseType: !317, size: 1728, elements: !24)
!514 = !DILocation(line: 123, column: 21, scope: !456)
!515 = !DILocation(line: 123, column: 35, scope: !456)
!516 = !DILocation(line: 123, column: 36, scope: !456)
!517 = !DILocation(line: 123, column: 38, scope: !456)
!518 = !DILocation(line: 123, column: 55, scope: !456)
!519 = !DILocation(line: 123, column: 72, scope: !456)
!520 = !DILocation(line: 123, column: 89, scope: !456)
!521 = !DILocation(line: 123, column: 91, scope: !456)
!522 = !DILocation(line: 123, column: 108, scope: !456)
!523 = !DILocation(line: 123, column: 125, scope: !456)
!524 = !DILocation(line: 124, column: 36, scope: !456)
!525 = !DILocation(line: 124, column: 38, scope: !456)
!526 = !DILocation(line: 124, column: 55, scope: !456)
!527 = !DILocation(line: 124, column: 72, scope: !456)
!528 = !DILocation(line: 124, column: 89, scope: !456)
!529 = !DILocation(line: 124, column: 91, scope: !456)
!530 = !DILocation(line: 124, column: 108, scope: !456)
!531 = !DILocation(line: 124, column: 125, scope: !456)
!532 = !DILocation(line: 125, column: 36, scope: !456)
!533 = !DILocation(line: 125, column: 38, scope: !456)
!534 = !DILocation(line: 125, column: 55, scope: !456)
!535 = !DILocation(line: 125, column: 72, scope: !456)
!536 = !DILocation(line: 125, column: 89, scope: !456)
!537 = !DILocation(line: 125, column: 91, scope: !456)
!538 = !DILocation(line: 125, column: 108, scope: !456)
!539 = !DILocation(line: 125, column: 125, scope: !456)
!540 = !DILocation(line: 126, column: 36, scope: !456)
!541 = !DILocation(line: 126, column: 38, scope: !456)
!542 = !DILocation(line: 126, column: 55, scope: !456)
!543 = !DILocation(line: 126, column: 72, scope: !456)
!544 = !DILocation(line: 126, column: 89, scope: !456)
!545 = !DILocation(line: 126, column: 91, scope: !456)
!546 = !DILocation(line: 126, column: 108, scope: !456)
!547 = !DILocation(line: 126, column: 125, scope: !456)
!548 = !DILocation(line: 127, column: 36, scope: !456)
!549 = !DILocation(line: 127, column: 38, scope: !456)
!550 = !DILocation(line: 127, column: 55, scope: !456)
!551 = !DILocation(line: 127, column: 72, scope: !456)
!552 = !DILocalVariable(name: "gemm", scope: !456, file: !3, line: 130, type: !553)
!553 = !DICompositeType(tag: DW_TAG_array_type, baseType: !393, size: 864, elements: !24)
!554 = !DILocation(line: 130, column: 21, scope: !456)
!555 = !DILocation(line: 130, column: 31, scope: !456)
!556 = !DILocation(line: 130, column: 32, scope: !456)
!557 = !DILocation(line: 130, column: 33, scope: !456)
!558 = !DILocation(line: 130, column: 49, scope: !456)
!559 = !DILocation(line: 130, column: 65, scope: !456)
!560 = !DILocation(line: 130, column: 82, scope: !456)
!561 = !DILocation(line: 130, column: 83, scope: !456)
!562 = !DILocation(line: 130, column: 99, scope: !456)
!563 = !DILocation(line: 130, column: 115, scope: !456)
!564 = !DILocation(line: 131, column: 32, scope: !456)
!565 = !DILocation(line: 131, column: 33, scope: !456)
!566 = !DILocation(line: 131, column: 49, scope: !456)
!567 = !DILocation(line: 131, column: 65, scope: !456)
!568 = !DILocation(line: 131, column: 82, scope: !456)
!569 = !DILocation(line: 131, column: 83, scope: !456)
!570 = !DILocation(line: 131, column: 99, scope: !456)
!571 = !DILocation(line: 131, column: 115, scope: !456)
!572 = !DILocation(line: 132, column: 32, scope: !456)
!573 = !DILocation(line: 132, column: 33, scope: !456)
!574 = !DILocation(line: 132, column: 49, scope: !456)
!575 = !DILocation(line: 132, column: 65, scope: !456)
!576 = !DILocation(line: 132, column: 82, scope: !456)
!577 = !DILocation(line: 132, column: 83, scope: !456)
!578 = !DILocation(line: 132, column: 99, scope: !456)
!579 = !DILocation(line: 132, column: 115, scope: !456)
!580 = !DILocation(line: 133, column: 32, scope: !456)
!581 = !DILocation(line: 133, column: 33, scope: !456)
!582 = !DILocation(line: 133, column: 49, scope: !456)
!583 = !DILocation(line: 133, column: 65, scope: !456)
!584 = !DILocation(line: 133, column: 82, scope: !456)
!585 = !DILocation(line: 133, column: 83, scope: !456)
!586 = !DILocation(line: 133, column: 99, scope: !456)
!587 = !DILocation(line: 133, column: 115, scope: !456)
!588 = !DILocation(line: 134, column: 32, scope: !456)
!589 = !DILocation(line: 134, column: 33, scope: !456)
!590 = !DILocation(line: 134, column: 49, scope: !456)
!591 = !DILocation(line: 134, column: 65, scope: !456)
!592 = !DILocalVariable(name: "microop", scope: !456, file: !3, line: 138, type: !593)
!593 = !DICompositeType(tag: DW_TAG_array_type, baseType: !310, size: 2880, elements: !24)
!594 = !DILocation(line: 138, column: 11, scope: !456)
!595 = !DILocation(line: 138, column: 24, scope: !456)
!596 = !DILocation(line: 138, column: 25, scope: !456)
!597 = !DILocation(line: 138, column: 32, scope: !456)
!598 = !DILocation(line: 138, column: 45, scope: !456)
!599 = !DILocation(line: 138, column: 52, scope: !456)
!600 = !DILocation(line: 138, column: 65, scope: !456)
!601 = !DILocation(line: 138, column: 72, scope: !456)
!602 = !DILocation(line: 138, column: 85, scope: !456)
!603 = !DILocation(line: 138, column: 92, scope: !456)
!604 = !DILocation(line: 139, column: 25, scope: !456)
!605 = !DILocation(line: 139, column: 32, scope: !456)
!606 = !DILocation(line: 139, column: 46, scope: !456)
!607 = !DILocation(line: 139, column: 53, scope: !456)
!608 = !DILocation(line: 139, column: 66, scope: !456)
!609 = !DILocation(line: 139, column: 73, scope: !456)
!610 = !DILocation(line: 139, column: 86, scope: !456)
!611 = !DILocation(line: 139, column: 93, scope: !456)
!612 = !DILocation(line: 139, column: 106, scope: !456)
!613 = !DILocation(line: 139, column: 113, scope: !456)
!614 = !DILocalVariable(name: "microop_val", scope: !456, file: !3, line: 141, type: !615)
!615 = !DICompositeType(tag: DW_TAG_array_type, baseType: !387, size: 1728, elements: !24)
!616 = !DILocation(line: 141, column: 15, scope: !456)
!617 = !DILocation(line: 141, column: 32, scope: !456)
!618 = !DILocation(line: 141, column: 33, scope: !456)
!619 = !DILocation(line: 141, column: 40, scope: !456)
!620 = !DILocation(line: 141, column: 49, scope: !456)
!621 = !DILocation(line: 141, column: 56, scope: !456)
!622 = !DILocation(line: 141, column: 65, scope: !456)
!623 = !DILocation(line: 141, column: 72, scope: !456)
!624 = !DILocation(line: 141, column: 81, scope: !456)
!625 = !DILocation(line: 141, column: 88, scope: !456)
!626 = !DILocation(line: 142, column: 33, scope: !456)
!627 = !DILocation(line: 142, column: 40, scope: !456)
!628 = !DILocation(line: 142, column: 50, scope: !456)
!629 = !DILocation(line: 142, column: 57, scope: !456)
!630 = !DILocation(line: 142, column: 66, scope: !456)
!631 = !DILocation(line: 142, column: 73, scope: !456)
!632 = !DILocation(line: 142, column: 82, scope: !456)
!633 = !DILocation(line: 142, column: 89, scope: !456)
!634 = !DILocation(line: 142, column: 98, scope: !456)
!635 = !DILocation(line: 142, column: 105, scope: !456)
!636 = !DILocation(line: 144, column: 20, scope: !456)
!637 = !DILocation(line: 144, column: 18, scope: !456)
!638 = !DILocalVariable(name: "i", scope: !639, file: !3, line: 145, type: !36)
!639 = distinct !DILexicalBlock(scope: !456, file: !3, line: 145, column: 5)
!640 = !DILocation(line: 145, column: 14, scope: !639)
!641 = !DILocation(line: 145, column: 10, scope: !639)
!642 = !DILocation(line: 145, column: 18, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !3, line: 145, column: 5)
!644 = !DILocation(line: 145, column: 19, scope: !643)
!645 = !DILocation(line: 145, column: 5, scope: !639)
!646 = !DILocation(line: 146, column: 23, scope: !647)
!647 = distinct !DILexicalBlock(scope: !643, file: !3, line: 145, column: 26)
!648 = !DILocation(line: 146, column: 36, scope: !647)
!649 = !DILocation(line: 146, column: 20, scope: !647)
!650 = !DILocation(line: 146, column: 9, scope: !647)
!651 = !DILocation(line: 146, column: 22, scope: !647)
!652 = !DILocation(line: 145, column: 23, scope: !643)
!653 = !DILocation(line: 145, column: 5, scope: !643)
!654 = distinct !{!654, !645, !655}
!655 = !DILocation(line: 147, column: 5, scope: !639)
!656 = !DILocation(line: 149, column: 10, scope: !657)
!657 = distinct !DILexicalBlock(scope: !456, file: !3, line: 149, column: 9)
!658 = !DILocation(line: 149, column: 17, scope: !657)
!659 = !DILocation(line: 149, column: 27, scope: !657)
!660 = !DILocation(line: 149, column: 35, scope: !657)
!661 = !DILocation(line: 149, column: 22, scope: !657)
!662 = !DILocation(line: 149, column: 45, scope: !657)
!663 = !DILocation(line: 149, column: 52, scope: !657)
!664 = !DILocalVariable(name: "i", scope: !665, file: !3, line: 150, type: !36)
!665 = distinct !DILexicalBlock(scope: !666, file: !3, line: 150, column: 9)
!666 = distinct !DILexicalBlock(scope: !657, file: !3, line: 149, column: 58)
!667 = !DILocation(line: 150, column: 18, scope: !665)
!668 = !DILocation(line: 150, column: 14, scope: !665)
!669 = !DILocation(line: 150, column: 22, scope: !670)
!670 = distinct !DILexicalBlock(scope: !665, file: !3, line: 150, column: 9)
!671 = !DILocation(line: 150, column: 23, scope: !670)
!672 = !DILocation(line: 150, column: 9, scope: !665)
!673 = !DILocation(line: 151, column: 49, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !3, line: 150, column: 30)
!675 = !DILocation(line: 151, column: 41, scope: !674)
!676 = !DILocation(line: 151, column: 27, scope: !674)
!677 = !DILocation(line: 151, column: 25, scope: !674)
!678 = !DILocation(line: 150, column: 27, scope: !670)
!679 = !DILocation(line: 150, column: 9, scope: !670)
!680 = distinct !{!680, !672, !681}
!681 = !DILocation(line: 153, column: 13, scope: !665)
!682 = !DILocalVariable(name: "i", scope: !683, file: !3, line: 154, type: !36)
!683 = distinct !DILexicalBlock(scope: !666, file: !3, line: 154, column: 9)
!684 = !DILocation(line: 154, column: 18, scope: !683)
!685 = !DILocation(line: 154, column: 14, scope: !683)
!686 = !DILocation(line: 154, column: 22, scope: !687)
!687 = distinct !DILexicalBlock(scope: !683, file: !3, line: 154, column: 9)
!688 = !DILocation(line: 154, column: 23, scope: !687)
!689 = !DILocation(line: 154, column: 9, scope: !683)
!690 = !DILocation(line: 155, column: 57, scope: !691)
!691 = distinct !DILexicalBlock(scope: !687, file: !3, line: 154, column: 30)
!692 = !DILocation(line: 155, column: 45, scope: !691)
!693 = !DILocation(line: 155, column: 27, scope: !691)
!694 = !DILocation(line: 155, column: 25, scope: !691)
!695 = !DILocation(line: 154, column: 27, scope: !687)
!696 = !DILocation(line: 154, column: 9, scope: !687)
!697 = distinct !{!697, !689, !698}
!698 = !DILocation(line: 157, column: 13, scope: !683)
!699 = !DILocation(line: 166, column: 1, scope: !456)
!700 = distinct !DISubprogram(name: "memcpy", scope: !701, file: !701, line: 12, type: !702, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !4)
!701 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!702 = !DISubroutineType(types: !703)
!703 = !{!33, !33, !34, !704}
!704 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !705, line: 46, baseType: !39)
!705 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!706 = !DILocalVariable(name: "destaddr", arg: 1, scope: !700, file: !701, line: 12, type: !33)
!707 = !DILocation(line: 12, column: 20, scope: !700)
!708 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !700, file: !701, line: 12, type: !34)
!709 = !DILocation(line: 12, column: 42, scope: !700)
!710 = !DILocalVariable(name: "len", arg: 3, scope: !700, file: !701, line: 12, type: !704)
!711 = !DILocation(line: 12, column: 58, scope: !700)
!712 = !DILocalVariable(name: "dest", scope: !700, file: !701, line: 13, type: !63)
!713 = !DILocation(line: 13, column: 9, scope: !700)
!714 = !DILocation(line: 13, column: 16, scope: !700)
!715 = !DILocalVariable(name: "src", scope: !700, file: !701, line: 14, type: !67)
!716 = !DILocation(line: 14, column: 15, scope: !700)
!717 = !DILocation(line: 14, column: 21, scope: !700)
!718 = !DILocation(line: 16, column: 3, scope: !700)
!719 = !DILocation(line: 16, column: 13, scope: !700)
!720 = !DILocation(line: 16, column: 16, scope: !700)
!721 = !DILocation(line: 17, column: 19, scope: !700)
!722 = !DILocation(line: 17, column: 15, scope: !700)
!723 = !DILocation(line: 17, column: 10, scope: !700)
!724 = !DILocation(line: 17, column: 13, scope: !700)
!725 = distinct !{!725, !718, !721}
!726 = !DILocation(line: 18, column: 10, scope: !700)
!727 = !DILocation(line: 18, column: 3, scope: !700)
