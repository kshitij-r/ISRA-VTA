; ModuleID = 'gemm.bc'
source_filename = "gemm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@res_index = dso_local global i32 0, align 4, !dbg !0
@result = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !8
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !14
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !19
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !21
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !23
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !25
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@__const.main.gemm_instr = private unnamed_addr constant %struct.GEMM_STRUCT_REF { i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i32 0, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [34 x i8] c"acc_mem_ref[i] == acc_mem_gemm[i]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"gemm.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !128 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !134, metadata !DIExpression()), !dbg !135
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %j, metadata !140, metadata !DIExpression()), !dbg !141
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !145
  %cmp = icmp slt i32 %0, 3, !dbg !147
  br i1 %cmp, label %for.body, label %for.end12, !dbg !148

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !149
  br label %for.cond1, !dbg !151

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !152
  %cmp2 = icmp slt i32 %1, 3, !dbg !154
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !155

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !156
  %3 = load i32, i32* %j, align 4, !dbg !157
  %idxprom = sext i32 %3 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !156
  %4 = load i32, i32* %i, align 4, !dbg !158
  %idxprom4 = sext i32 %4 to i64, !dbg !156
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !156
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !156
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !159
  %7 = load i32, i32* %i, align 4, !dbg !160
  %idxprom6 = sext i32 %7 to i64, !dbg !159
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !159
  %8 = load i32, i32* %j, align 4, !dbg !161
  %idxprom8 = sext i32 %8 to i64, !dbg !159
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !159
  store i32 %5, i32* %arrayidx9, align 4, !dbg !162
  %9 = load i32, i32* %j, align 4, !dbg !163
  %inc = add nsw i32 %9, 1, !dbg !163
  store i32 %inc, i32* %j, align 4, !dbg !163
  br label %for.cond1, !dbg !164, !llvm.loop !165

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !167
  %inc11 = add nsw i32 %10, 1, !dbg !167
  store i32 %inc11, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !171
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPjS_(i32* %mat1, i32* %mat2) #0 !dbg !172 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !176, metadata !DIExpression()), !dbg !177
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i32* %res, metadata !180, metadata !DIExpression()), !dbg !181
  store i32 0, i32* %res, align 4, !dbg !181
  call void @llvm.dbg.declare(metadata i32* %i, metadata !182, metadata !DIExpression()), !dbg !184
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !186
  %cmp = icmp slt i32 %0, 3, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !190
  %2 = load i32, i32* %i, align 4, !dbg !192
  %idxprom = sext i32 %2 to i64, !dbg !190
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !190
  %3 = load i32, i32* %arrayidx, align 4, !dbg !190
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !193
  %5 = load i32, i32* %i, align 4, !dbg !194
  %idxprom1 = sext i32 %5 to i64, !dbg !193
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !193
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !193
  %mul = mul i32 %3, %6, !dbg !195
  %7 = load i32, i32* %res, align 4, !dbg !196
  %add = add i32 %7, %mul, !dbg !196
  store i32 %add, i32* %res, align 4, !dbg !196
  %8 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %8, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !201
  %10 = load i32, i32* @res_index, align 4, !dbg !202
  %idxprom3 = sext i32 %10 to i64, !dbg !203
  %arrayidx4 = getelementptr inbounds [9 x i32], [9 x i32]* @result, i64 0, i64 %idxprom3, !dbg !203
  store i32 %9, i32* %arrayidx4, align 4, !dbg !204
  %11 = load i32, i32* @res_index, align 4, !dbg !205
  %inc5 = add nsw i32 %11, 1, !dbg !205
  store i32 %inc5, i32* @res_index, align 4, !dbg !205
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @result, i64 0, i64 0), !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* %mat1, [3 x i32]* %mat2, [3 x i32]* %res) #0 !dbg !207 {
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
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat1.addr, metadata !210, metadata !DIExpression()), !dbg !211
  store [3 x i32]* %mat2, [3 x i32]** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat2.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store [3 x i32]* %res, [3 x i32]** %res.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %res.addr, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32* %i, metadata !216, metadata !DIExpression()), !dbg !218
  store i32 0, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !220
  %cmp = icmp slt i32 %0, 3, !dbg !222
  br i1 %cmp, label %for.body, label %for.end22, !dbg !223

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !224, metadata !DIExpression()), !dbg !227
  store i32 0, i32* %j, align 4, !dbg !227
  br label %for.cond1, !dbg !228

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !229
  %cmp2 = icmp slt i32 %1, 3, !dbg !231
  br i1 %cmp2, label %for.body3, label %for.inc20, !dbg !232

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !233, metadata !DIExpression()), !dbg !236
  store i32 0, i32* %k, align 4, !dbg !236
  br label %for.cond4, !dbg !237

for.cond4:                                        ; preds = %for.body6, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !238
  %cmp5 = icmp slt i32 %2, 3, !dbg !240
  br i1 %cmp5, label %for.body6, label %for.inc17, !dbg !241

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %3 to i64, !dbg !244
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 %idxprom, !dbg !244
  %4 = load i32, i32* %k, align 4, !dbg !245
  %idxprom7 = sext i32 %4 to i64, !dbg !244
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !244
  %5 = load i32, i32* %arrayidx8, align 4, !dbg !244
  %6 = load i32, i32* %k, align 4, !dbg !246
  %idxprom9 = sext i32 %6 to i64, !dbg !247
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 %idxprom9, !dbg !247
  %7 = load i32, i32* %j, align 4, !dbg !248
  %idxprom11 = sext i32 %7 to i64, !dbg !247
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 %idxprom11, !dbg !247
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !247
  %mul = mul i32 %5, %8, !dbg !249
  %9 = load i32, i32* %i, align 4, !dbg !250
  %idxprom13 = sext i32 %9 to i64, !dbg !251
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom13, !dbg !251
  %10 = load i32, i32* %j, align 4, !dbg !252
  %idxprom15 = sext i32 %10 to i64, !dbg !251
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 %idxprom15, !dbg !251
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !253
  %add = add i32 %11, %mul, !dbg !253
  store i32 %add, i32* %arrayidx16, align 4, !dbg !253
  %12 = load i32, i32* %k, align 4, !dbg !254
  %inc = add nsw i32 %12, 1, !dbg !254
  store i32 %inc, i32* %k, align 4, !dbg !254
  br label %for.cond4, !dbg !255, !llvm.loop !256

for.inc17:                                        ; preds = %for.cond4
  %13 = load i32, i32* %j, align 4, !dbg !258
  %inc18 = add nsw i32 %13, 1, !dbg !258
  store i32 %inc18, i32* %j, align 4, !dbg !258
  br label %for.cond1, !dbg !259, !llvm.loop !260

for.inc20:                                        ; preds = %for.cond1
  %14 = load i32, i32* %i, align 4, !dbg !262
  %inc21 = add nsw i32 %14, 1, !dbg !262
  store i32 %inc21, i32* %i, align 4, !dbg !262
  br label %for.cond, !dbg !263, !llvm.loop !264

for.end22:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !266, metadata !DIExpression()), !dbg !268
  store i32 0, i32* %i23, align 4, !dbg !268
  br label %for.cond24, !dbg !269

for.cond24:                                       ; preds = %for.inc42, %for.end22
  %15 = load i32, i32* %i23, align 4, !dbg !270
  %cmp25 = icmp slt i32 %15, 3, !dbg !272
  br i1 %cmp25, label %for.body26, label %for.end44, !dbg !273

for.body26:                                       ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i32* %j27, metadata !274, metadata !DIExpression()), !dbg !277
  store i32 0, i32* %j27, align 4, !dbg !277
  br label %for.cond28, !dbg !278

for.cond28:                                       ; preds = %for.body30, %for.body26
  %16 = load i32, i32* %j27, align 4, !dbg !279
  %cmp29 = icmp slt i32 %16, 3, !dbg !281
  %17 = load i32, i32* %i23, align 4, !dbg !282
  br i1 %cmp29, label %for.body30, label %for.inc42, !dbg !283

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %17 to i64, !dbg !284
  %arrayidx32 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom31, !dbg !284
  %18 = load i32, i32* %j27, align 4, !dbg !286
  %idxprom33 = sext i32 %18 to i64, !dbg !284
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !284
  %19 = load i32, i32* %arrayidx34, align 4, !dbg !284
  %20 = load i32, i32* %i23, align 4, !dbg !287
  %mul35 = mul nsw i32 %20, 3, !dbg !288
  %21 = load i32, i32* %j27, align 4, !dbg !289
  %add36 = add nsw i32 %mul35, %21, !dbg !290
  %idxprom37 = sext i32 %add36 to i64, !dbg !291
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 %idxprom37, !dbg !291
  store i32 %19, i32* %arrayidx38, align 4, !dbg !292
  %22 = load i32, i32* %j27, align 4, !dbg !293
  %inc40 = add nsw i32 %22, 1, !dbg !293
  store i32 %inc40, i32* %j27, align 4, !dbg !293
  br label %for.cond28, !dbg !294, !llvm.loop !295

for.inc42:                                        ; preds = %for.cond28
  %inc43 = add nsw i32 %17, 1, !dbg !297
  store i32 %inc43, i32* %i23, align 4, !dbg !297
  br label %for.cond24, !dbg !298, !llvm.loop !299

for.end44:                                        ; preds = %for.cond24
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 0), !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !302 {
entry:
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !321, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata i32* %i, metadata !323, metadata !DIExpression()), !dbg !325
  store i32 0, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !327
  %cmp = icmp slt i32 %0, 3, !dbg !329
  br i1 %cmp, label %for.body, label %for.end, !dbg !330

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !331
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !333
  %1 = load i32*, i32** %inp_mem, align 8, !dbg !333
  %2 = load i32, i32* %i, align 4, !dbg !334
  %idx.ext = sext i32 %2 to i64, !dbg !335
  %add.ptr = getelementptr inbounds i32, i32* %1, i64 %idx.ext, !dbg !335
  %3 = load i32, i32* %add.ptr, align 4, !dbg !336
  %4 = load i32, i32* %i, align 4, !dbg !337
  %idxprom = sext i32 %4 to i64, !dbg !338
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !338
  store i32 %3, i32* %arrayidx, align 4, !dbg !339
  %5 = load i32, i32* %i, align 4, !dbg !340
  %inc = add nsw i32 %5, 1, !dbg !340
  store i32 %inc, i32* %i, align 4, !dbg !340
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !344, metadata !DIExpression()), !dbg !346
  store i32 0, i32* %i1, align 4, !dbg !346
  br label %for.cond2, !dbg !347

for.cond2:                                        ; preds = %for.body4, %for.end
  %6 = load i32, i32* %i1, align 4, !dbg !348
  %cmp3 = icmp slt i32 %6, 3, !dbg !350
  br i1 %cmp3, label %for.body4, label %for.end12, !dbg !351

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !352
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS5, i32 0, i32 1, !dbg !354
  %7 = load i32*, i32** %wgt_mem, align 8, !dbg !354
  %8 = load i32, i32* %i1, align 4, !dbg !355
  %idx.ext6 = sext i32 %8 to i64, !dbg !356
  %add.ptr7 = getelementptr inbounds i32, i32* %7, i64 %idx.ext6, !dbg !356
  %9 = load i32, i32* %add.ptr7, align 4, !dbg !357
  %10 = load i32, i32* %i1, align 4, !dbg !358
  %idxprom8 = sext i32 %10 to i64, !dbg !359
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom8, !dbg !359
  store i32 %9, i32* %arrayidx9, align 4, !dbg !360
  %11 = load i32, i32* %i1, align 4, !dbg !361
  %inc11 = add nsw i32 %11, 1, !dbg !361
  store i32 %inc11, i32* %i1, align 4, !dbg !361
  br label %for.cond2, !dbg !362, !llvm.loop !363

for.end12:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !365, metadata !DIExpression()), !dbg !366
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !367
  %arraydecay13 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !368
  %call = call i32* @_Z14matrixMultiplyPjS_(i32* %arraydecay, i32* %arraydecay13), !dbg !369
  store i32* %call, i32** %arr, align 8, !dbg !366
  %12 = load i32*, i32** %arr, align 8, !dbg !370
  ret i32* %12, !dbg !371
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !372 {
entry:
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !386, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !388, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !390, metadata !DIExpression()), !dbg !391
  call void @llvm.dbg.declare(metadata i32* %i, metadata !392, metadata !DIExpression()), !dbg !394
  store i32 0, i32* %i, align 4, !dbg !394
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !396
  %cmp = icmp slt i32 %0, 3, !dbg !398
  br i1 %cmp, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !400
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !402
  %1 = load i32, i32* %inp_mem, align 4, !dbg !402
  %2 = load i32, i32* %i, align 4, !dbg !403
  %add = add i32 %1, %2, !dbg !404
  %3 = load i32, i32* %i, align 4, !dbg !405
  %idxprom = sext i32 %3 to i64, !dbg !406
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !406
  store i32 %add, i32* %arrayidx, align 4, !dbg !407
  %4 = load i32, i32* %i, align 4, !dbg !408
  %inc = add nsw i32 %4, 1, !dbg !408
  store i32 %inc, i32* %i, align 4, !dbg !408
  br label %for.cond, !dbg !409, !llvm.loop !410

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !412, metadata !DIExpression()), !dbg !414
  store i32 0, i32* %i1, align 4, !dbg !414
  br label %for.cond2, !dbg !415

for.cond2:                                        ; preds = %for.body4, %for.end
  %5 = load i32, i32* %i1, align 4, !dbg !416
  %cmp3 = icmp slt i32 %5, 3, !dbg !418
  br i1 %cmp3, label %for.body4, label %for.end10, !dbg !419

for.body4:                                        ; preds = %for.cond2
  %OPERANDS5 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !420
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS5, i32 0, i32 1, !dbg !422
  %6 = load i32, i32* %wgt_mem, align 4, !dbg !422
  %7 = load i32, i32* %i1, align 4, !dbg !423
  %idxprom6 = sext i32 %7 to i64, !dbg !424
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom6, !dbg !424
  store i32 %6, i32* %arrayidx7, align 4, !dbg !425
  %8 = load i32, i32* %i1, align 4, !dbg !426
  %inc9 = add nsw i32 %8, 1, !dbg !426
  store i32 %inc9, i32* %i1, align 4, !dbg !426
  br label %for.cond2, !dbg !427, !llvm.loop !428

for.end10:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !430, metadata !DIExpression()), !dbg !431
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !432
  %arraydecay11 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !433
  %call = call i32* @_Z14matrixMultiplyPjS_(i32* %arraydecay, i32* %arraydecay11), !dbg !434
  store i32* %call, i32** %arr, align 8, !dbg !431
  %9 = load i32*, i32** %arr, align 8, !dbg !435
  ret i32* %9, !dbg !436
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !437 {
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
  %gemm_instr = alloca %struct.GEMM_STRUCT_REF, align 8
  %instruction = alloca %struct.INSTR, align 8
  %gemm_uop = alloca [9 x %struct.GEMM_STRUCT_REF], align 16
  %gemm = alloca [9 x %struct.GEMM_STRUCT_VAL], align 16
  %microop = alloca [9 x %struct.INSTR], align 16
  %microop_val = alloca [9 x %struct.INSTR_VAL], align 16
  %i = alloca i32, align 4
  %agg.tmp = alloca %struct.INSTR, align 8
  %i243 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !441, metadata !DIExpression()), !dbg !442
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !443, metadata !DIExpression()), !dbg !444
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !445, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !447, metadata !DIExpression()), !dbg !448
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !449, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !451, metadata !DIExpression()), !dbg !452
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !453, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !455, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !459, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !461, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !463, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !465, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !471, metadata !DIExpression()), !dbg !472
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !473, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !475, metadata !DIExpression()), !dbg !476
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !477, metadata !DIExpression()), !dbg !478
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !479
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !480
  %0 = bitcast i32* %arraydecay to i8*, !dbg !480
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !480
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !481
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !481
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !481
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !482
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !482
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !482
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !483
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !483
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !483
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !484
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !484
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !484
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !485
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !485
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !485
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !486
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !486
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !486
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !487
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !487
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !487
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !488
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !488
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !488
  %18 = bitcast i32* %op_type to i8*, !dbg !489
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !490
  %19 = bitcast i32* %opcode to i8*, !dbg !491
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !492
  call void @llvm.dbg.declare(metadata %struct.GEMM_STRUCT_REF* %gemm_instr, metadata !493, metadata !DIExpression()), !dbg !494
  %20 = bitcast %struct.GEMM_STRUCT_REF* %gemm_instr to i8*, !dbg !494
  %21 = call i8* @memcpy(i8* %20, i8* bitcast (%struct.GEMM_STRUCT_REF* @__const.main.gemm_instr to i8*), i64 24), !dbg !494
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instruction, metadata !495, metadata !DIExpression()), !dbg !496
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 0, !dbg !497
  store i32 0, i32* %ID, align 8, !dbg !497
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 1, !dbg !497
  store i32 2, i32* %OPCODE, align 4, !dbg !497
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 2, !dbg !497
  store i32 0, i32* %OPTYPE, align 8, !dbg !497
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 3, !dbg !497
  %22 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !498
  %23 = bitcast %struct.GEMM_STRUCT_REF* %gemm_instr to i8*, !dbg !498
  %24 = call i8* @memcpy(i8* %22, i8* %23, i64 24), !dbg !498
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !499, metadata !DIExpression()), !dbg !501
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !502
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !503
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !504
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !503
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !503
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !505
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !503
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !503
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !506
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !503
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !502
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !507
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !508
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !507
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !507
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !509
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !507
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !507
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !510
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !507
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !502
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !511
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !512
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !511
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !511
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !513
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !511
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !511
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !514
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !511
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !502
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !515
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !516
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !515
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !515
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !517
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !515
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !515
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !518
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !515
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !502
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !519
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !520
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !519
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !519
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !521
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !519
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !519
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !522
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !519
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !502
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !523
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !524
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !523
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !523
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !525
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !523
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !523
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !526
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !523
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !502
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !527
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !528
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !527
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !527
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !529
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !527
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !527
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !530
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !527
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !502
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !531
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !532
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !531
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !531
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !533
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !531
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !531
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !534
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !531
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !502
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !535
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !536
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !535
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !535
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !537
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !535
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !535
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !538
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !535
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !539, metadata !DIExpression()), !dbg !541
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !542
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !543
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !544
  %25 = load i32, i32* %arrayidx68, align 4, !dbg !544
  store i32 %25, i32* %inp_mem67, align 4, !dbg !543
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !543
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !545
  %26 = load i32, i32* %arrayidx70, align 4, !dbg !545
  store i32 %26, i32* %wgt_mem69, align 4, !dbg !543
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !543
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !546
  %27 = load i32, i32* %arrayidx72, align 4, !dbg !546
  store i32 %27, i32* %acc_mem71, align 4, !dbg !543
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !542
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !547
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !548
  %28 = load i32, i32* %arrayidx75, align 4, !dbg !548
  store i32 %28, i32* %inp_mem74, align 4, !dbg !547
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !547
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !549
  %29 = load i32, i32* %arrayidx77, align 4, !dbg !549
  store i32 %29, i32* %wgt_mem76, align 4, !dbg !547
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !547
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !550
  %30 = load i32, i32* %arrayidx79, align 4, !dbg !550
  store i32 %30, i32* %acc_mem78, align 4, !dbg !547
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !542
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !551
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !552
  %31 = load i32, i32* %arrayidx82, align 4, !dbg !552
  store i32 %31, i32* %inp_mem81, align 4, !dbg !551
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !551
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !553
  %32 = load i32, i32* %arrayidx84, align 4, !dbg !553
  store i32 %32, i32* %wgt_mem83, align 4, !dbg !551
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !551
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !554
  %33 = load i32, i32* %arrayidx86, align 4, !dbg !554
  store i32 %33, i32* %acc_mem85, align 4, !dbg !551
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !542
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !555
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !556
  %34 = load i32, i32* %arrayidx89, align 4, !dbg !556
  store i32 %34, i32* %inp_mem88, align 4, !dbg !555
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !555
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !557
  %35 = load i32, i32* %arrayidx91, align 4, !dbg !557
  store i32 %35, i32* %wgt_mem90, align 4, !dbg !555
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !555
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !558
  %36 = load i32, i32* %arrayidx93, align 4, !dbg !558
  store i32 %36, i32* %acc_mem92, align 4, !dbg !555
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !542
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !559
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !560
  %37 = load i32, i32* %arrayidx96, align 4, !dbg !560
  store i32 %37, i32* %inp_mem95, align 4, !dbg !559
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !559
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !561
  %38 = load i32, i32* %arrayidx98, align 4, !dbg !561
  store i32 %38, i32* %wgt_mem97, align 4, !dbg !559
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !559
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !562
  %39 = load i32, i32* %arrayidx100, align 4, !dbg !562
  store i32 %39, i32* %acc_mem99, align 4, !dbg !559
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !542
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !563
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !564
  %40 = load i32, i32* %arrayidx103, align 4, !dbg !564
  store i32 %40, i32* %inp_mem102, align 4, !dbg !563
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !563
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !565
  %41 = load i32, i32* %arrayidx105, align 4, !dbg !565
  store i32 %41, i32* %wgt_mem104, align 4, !dbg !563
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !563
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !566
  %42 = load i32, i32* %arrayidx107, align 4, !dbg !566
  store i32 %42, i32* %acc_mem106, align 4, !dbg !563
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !542
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !567
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !568
  %43 = load i32, i32* %arrayidx110, align 4, !dbg !568
  store i32 %43, i32* %inp_mem109, align 4, !dbg !567
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !567
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !569
  %44 = load i32, i32* %arrayidx112, align 4, !dbg !569
  store i32 %44, i32* %wgt_mem111, align 4, !dbg !567
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !567
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !570
  %45 = load i32, i32* %arrayidx114, align 4, !dbg !570
  store i32 %45, i32* %acc_mem113, align 4, !dbg !567
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !542
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !571
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !572
  %46 = load i32, i32* %arrayidx117, align 4, !dbg !572
  store i32 %46, i32* %inp_mem116, align 4, !dbg !571
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !571
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !573
  %47 = load i32, i32* %arrayidx119, align 4, !dbg !573
  store i32 %47, i32* %wgt_mem118, align 4, !dbg !571
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !571
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !574
  %48 = load i32, i32* %arrayidx121, align 4, !dbg !574
  store i32 %48, i32* %acc_mem120, align 4, !dbg !571
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !542
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !575
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !576
  %49 = load i32, i32* %arrayidx124, align 4, !dbg !576
  store i32 %49, i32* %inp_mem123, align 4, !dbg !575
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !575
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !577
  %50 = load i32, i32* %arrayidx126, align 4, !dbg !577
  store i32 %50, i32* %wgt_mem125, align 4, !dbg !575
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !575
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !578
  %51 = load i32, i32* %arrayidx128, align 4, !dbg !578
  store i32 %51, i32* %acc_mem127, align 4, !dbg !575
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !579, metadata !DIExpression()), !dbg !581
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !582
  %ID130 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !583
  store i32 0, i32* %ID130, align 8, !dbg !583
  %OPCODE131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !583
  store i32 2, i32* %OPCODE131, align 4, !dbg !583
  %OPTYPE132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !583
  store i32 0, i32* %OPTYPE132, align 8, !dbg !583
  %OPERANDS133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !583
  %arrayidx134 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !584
  %52 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS133 to i8*, !dbg !584
  %53 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx134 to i8*, !dbg !584
  %54 = call i8* @memcpy(i8* %52, i8* %53, i64 24), !dbg !584
  %arrayinit.element135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !582
  %ID136 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 0, !dbg !585
  store i32 1, i32* %ID136, align 8, !dbg !585
  %OPCODE137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 1, !dbg !585
  store i32 2, i32* %OPCODE137, align 4, !dbg !585
  %OPTYPE138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 2, !dbg !585
  store i32 0, i32* %OPTYPE138, align 8, !dbg !585
  %OPERANDS139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 3, !dbg !585
  %arrayidx140 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !586
  %55 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS139 to i8*, !dbg !586
  %56 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx140 to i8*, !dbg !586
  %57 = call i8* @memcpy(i8* %55, i8* %56, i64 24), !dbg !586
  %arrayinit.element141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i64 1, !dbg !582
  %ID142 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 0, !dbg !587
  store i32 2, i32* %ID142, align 8, !dbg !587
  %OPCODE143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 1, !dbg !587
  store i32 2, i32* %OPCODE143, align 4, !dbg !587
  %OPTYPE144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 2, !dbg !587
  store i32 0, i32* %OPTYPE144, align 8, !dbg !587
  %OPERANDS145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 3, !dbg !587
  %arrayidx146 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !588
  %58 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS145 to i8*, !dbg !588
  %59 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx146 to i8*, !dbg !588
  %60 = call i8* @memcpy(i8* %58, i8* %59, i64 24), !dbg !588
  %arrayinit.element147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i64 1, !dbg !582
  %ID148 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 0, !dbg !589
  store i32 3, i32* %ID148, align 8, !dbg !589
  %OPCODE149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 1, !dbg !589
  store i32 2, i32* %OPCODE149, align 4, !dbg !589
  %OPTYPE150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 2, !dbg !589
  store i32 0, i32* %OPTYPE150, align 8, !dbg !589
  %OPERANDS151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 3, !dbg !589
  %arrayidx152 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !590
  %61 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS151 to i8*, !dbg !590
  %62 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx152 to i8*, !dbg !590
  %63 = call i8* @memcpy(i8* %61, i8* %62, i64 24), !dbg !590
  %arrayinit.element153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i64 1, !dbg !582
  %ID154 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 0, !dbg !591
  store i32 4, i32* %ID154, align 8, !dbg !591
  %OPCODE155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 1, !dbg !591
  store i32 2, i32* %OPCODE155, align 4, !dbg !591
  %OPTYPE156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 2, !dbg !591
  store i32 0, i32* %OPTYPE156, align 8, !dbg !591
  %OPERANDS157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 3, !dbg !591
  %arrayidx158 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !592
  %64 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS157 to i8*, !dbg !592
  %65 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx158 to i8*, !dbg !592
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 24), !dbg !592
  %arrayinit.element159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i64 1, !dbg !582
  %ID160 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 0, !dbg !593
  store i32 5, i32* %ID160, align 8, !dbg !593
  %OPCODE161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 1, !dbg !593
  store i32 2, i32* %OPCODE161, align 4, !dbg !593
  %OPTYPE162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 2, !dbg !593
  store i32 0, i32* %OPTYPE162, align 8, !dbg !593
  %OPERANDS163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 3, !dbg !593
  %arrayidx164 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !594
  %67 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS163 to i8*, !dbg !594
  %68 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx164 to i8*, !dbg !594
  %69 = call i8* @memcpy(i8* %67, i8* %68, i64 24), !dbg !594
  %arrayinit.element165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i64 1, !dbg !582
  %ID166 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 0, !dbg !595
  store i32 6, i32* %ID166, align 8, !dbg !595
  %OPCODE167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 1, !dbg !595
  store i32 2, i32* %OPCODE167, align 4, !dbg !595
  %OPTYPE168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 2, !dbg !595
  store i32 0, i32* %OPTYPE168, align 8, !dbg !595
  %OPERANDS169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 3, !dbg !595
  %arrayidx170 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !596
  %70 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS169 to i8*, !dbg !596
  %71 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx170 to i8*, !dbg !596
  %72 = call i8* @memcpy(i8* %70, i8* %71, i64 24), !dbg !596
  %arrayinit.element171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i64 1, !dbg !582
  %ID172 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 0, !dbg !597
  store i32 7, i32* %ID172, align 8, !dbg !597
  %OPCODE173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 1, !dbg !597
  store i32 2, i32* %OPCODE173, align 4, !dbg !597
  %OPTYPE174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 2, !dbg !597
  store i32 0, i32* %OPTYPE174, align 8, !dbg !597
  %OPERANDS175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 3, !dbg !597
  %arrayidx176 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !598
  %73 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS175 to i8*, !dbg !598
  %74 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx176 to i8*, !dbg !598
  %75 = call i8* @memcpy(i8* %73, i8* %74, i64 24), !dbg !598
  %arrayinit.element177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i64 1, !dbg !582
  %ID178 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 0, !dbg !599
  store i32 8, i32* %ID178, align 8, !dbg !599
  %OPCODE179 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 1, !dbg !599
  store i32 2, i32* %OPCODE179, align 4, !dbg !599
  %OPTYPE180 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 2, !dbg !599
  store i32 0, i32* %OPTYPE180, align 8, !dbg !599
  %OPERANDS181 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 3, !dbg !599
  %arrayidx182 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !600
  %76 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS181 to i8*, !dbg !600
  %77 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx182 to i8*, !dbg !600
  %78 = call i8* @memcpy(i8* %76, i8* %77, i64 24), !dbg !600
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !601, metadata !DIExpression()), !dbg !603
  %arrayinit.begin183 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !604
  %ID184 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 0, !dbg !605
  store i32 0, i32* %ID184, align 8, !dbg !605
  %OPCODE185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 1, !dbg !605
  store i32 2, i32* %OPCODE185, align 4, !dbg !605
  %OPTYPE186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 2, !dbg !605
  store i32 0, i32* %OPTYPE186, align 8, !dbg !605
  %OPERANDS187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 3, !dbg !605
  %arrayidx188 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !606
  %79 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS187 to i8*, !dbg !606
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx188 to i8*, !dbg !606
  %81 = call i8* @memcpy(i8* %79, i8* %80, i64 12), !dbg !606
  %arrayinit.element189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i64 1, !dbg !604
  %ID190 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 0, !dbg !607
  store i32 1, i32* %ID190, align 8, !dbg !607
  %OPCODE191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 1, !dbg !607
  store i32 2, i32* %OPCODE191, align 4, !dbg !607
  %OPTYPE192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 2, !dbg !607
  store i32 0, i32* %OPTYPE192, align 8, !dbg !607
  %OPERANDS193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 3, !dbg !607
  %arrayidx194 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !608
  %82 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS193 to i8*, !dbg !608
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx194 to i8*, !dbg !608
  %84 = call i8* @memcpy(i8* %82, i8* %83, i64 12), !dbg !608
  %arrayinit.element195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i64 1, !dbg !604
  %ID196 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 0, !dbg !609
  store i32 2, i32* %ID196, align 8, !dbg !609
  %OPCODE197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 1, !dbg !609
  store i32 2, i32* %OPCODE197, align 4, !dbg !609
  %OPTYPE198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 2, !dbg !609
  store i32 0, i32* %OPTYPE198, align 8, !dbg !609
  %OPERANDS199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 3, !dbg !609
  %arrayidx200 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !610
  %85 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS199 to i8*, !dbg !610
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx200 to i8*, !dbg !610
  %87 = call i8* @memcpy(i8* %85, i8* %86, i64 12), !dbg !610
  %arrayinit.element201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i64 1, !dbg !604
  %ID202 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 0, !dbg !611
  store i32 3, i32* %ID202, align 8, !dbg !611
  %OPCODE203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 1, !dbg !611
  store i32 2, i32* %OPCODE203, align 4, !dbg !611
  %OPTYPE204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 2, !dbg !611
  store i32 0, i32* %OPTYPE204, align 8, !dbg !611
  %OPERANDS205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 3, !dbg !611
  %arrayidx206 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !612
  %88 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS205 to i8*, !dbg !612
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx206 to i8*, !dbg !612
  %90 = call i8* @memcpy(i8* %88, i8* %89, i64 12), !dbg !612
  %arrayinit.element207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i64 1, !dbg !604
  %ID208 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 0, !dbg !613
  store i32 4, i32* %ID208, align 8, !dbg !613
  %OPCODE209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 1, !dbg !613
  store i32 2, i32* %OPCODE209, align 4, !dbg !613
  %OPTYPE210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 2, !dbg !613
  store i32 0, i32* %OPTYPE210, align 8, !dbg !613
  %OPERANDS211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 3, !dbg !613
  %arrayidx212 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !614
  %91 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS211 to i8*, !dbg !614
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx212 to i8*, !dbg !614
  %93 = call i8* @memcpy(i8* %91, i8* %92, i64 12), !dbg !614
  %arrayinit.element213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i64 1, !dbg !604
  %ID214 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 0, !dbg !615
  store i32 5, i32* %ID214, align 8, !dbg !615
  %OPCODE215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 1, !dbg !615
  store i32 2, i32* %OPCODE215, align 4, !dbg !615
  %OPTYPE216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 2, !dbg !615
  store i32 0, i32* %OPTYPE216, align 8, !dbg !615
  %OPERANDS217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 3, !dbg !615
  %arrayidx218 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !616
  %94 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS217 to i8*, !dbg !616
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx218 to i8*, !dbg !616
  %96 = call i8* @memcpy(i8* %94, i8* %95, i64 12), !dbg !616
  %arrayinit.element219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i64 1, !dbg !604
  %ID220 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 0, !dbg !617
  store i32 6, i32* %ID220, align 8, !dbg !617
  %OPCODE221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 1, !dbg !617
  store i32 2, i32* %OPCODE221, align 4, !dbg !617
  %OPTYPE222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 2, !dbg !617
  store i32 0, i32* %OPTYPE222, align 8, !dbg !617
  %OPERANDS223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 3, !dbg !617
  %arrayidx224 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !618
  %97 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS223 to i8*, !dbg !618
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx224 to i8*, !dbg !618
  %99 = call i8* @memcpy(i8* %97, i8* %98, i64 12), !dbg !618
  %arrayinit.element225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i64 1, !dbg !604
  %ID226 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 0, !dbg !619
  store i32 7, i32* %ID226, align 8, !dbg !619
  %OPCODE227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 1, !dbg !619
  store i32 2, i32* %OPCODE227, align 4, !dbg !619
  %OPTYPE228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 2, !dbg !619
  store i32 0, i32* %OPTYPE228, align 8, !dbg !619
  %OPERANDS229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 3, !dbg !619
  %arrayidx230 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !620
  %100 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS229 to i8*, !dbg !620
  %101 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx230 to i8*, !dbg !620
  %102 = call i8* @memcpy(i8* %100, i8* %101, i64 12), !dbg !620
  %arrayinit.element231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i64 1, !dbg !604
  %ID232 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 0, !dbg !621
  store i32 8, i32* %ID232, align 8, !dbg !621
  %OPCODE233 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 1, !dbg !621
  store i32 2, i32* %OPCODE233, align 4, !dbg !621
  %OPTYPE234 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 2, !dbg !621
  store i32 0, i32* %OPTYPE234, align 8, !dbg !621
  %OPERANDS235 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 3, !dbg !621
  %arrayidx236 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !622
  %103 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS235 to i8*, !dbg !622
  %104 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx236 to i8*, !dbg !622
  %105 = call i8* @memcpy(i8* %103, i8* %104, i64 12), !dbg !622
  %call = call i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 0)), !dbg !623
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !624
  %106 = load i32, i32* %opcode, align 4, !dbg !625
  %cmp = icmp eq i32 %106, 2, !dbg !627
  %107 = load i32, i32* %op_type, align 4, !dbg !628
  %cmp237 = icmp uge i32 %107, 0, !dbg !629
  %or.cond = and i1 %cmp, %cmp237, !dbg !630
  %108 = load i32, i32* %op_type, align 4, !dbg !631
  %cmp239 = icmp ule i32 %108, 3, !dbg !632
  %or.cond1 = and i1 %or.cond, %cmp239, !dbg !630
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !630

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !633, metadata !DIExpression()), !dbg !636
  store i32 0, i32* %i, align 4, !dbg !636
  br label %for.cond, !dbg !637

for.cond:                                         ; preds = %for.body, %if.then
  %109 = load i32, i32* %i, align 4, !dbg !638
  %cmp240 = icmp slt i32 %109, 9, !dbg !640
  br i1 %cmp240, label %for.body, label %for.end, !dbg !641

for.body:                                         ; preds = %for.cond
  %110 = load i32, i32* %i, align 4, !dbg !642
  %idxprom = sext i32 %110 to i64, !dbg !644
  %arrayidx241 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom, !dbg !644
  %111 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !644
  %112 = bitcast %struct.INSTR* %arrayidx241 to i8*, !dbg !644
  %113 = call i8* @memcpy(i8* %111, i8* %112, i64 40), !dbg !644
  %call242 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !645
  store i32* %call242, i32** %acc_mem_ref, align 8, !dbg !646
  %114 = load i32, i32* %i, align 4, !dbg !647
  %inc = add nsw i32 %114, 1, !dbg !647
  store i32 %inc, i32* %i, align 4, !dbg !647
  br label %for.cond, !dbg !648, !llvm.loop !649

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i243, metadata !651, metadata !DIExpression()), !dbg !653
  store i32 0, i32* %i243, align 4, !dbg !653
  br label %for.cond244, !dbg !654

for.cond244:                                      ; preds = %for.inc252, %for.end
  %115 = load i32, i32* %i243, align 4, !dbg !655
  %cmp245 = icmp slt i32 %115, 9, !dbg !657
  br i1 %cmp245, label %for.body246, label %if.end, !dbg !658

for.body246:                                      ; preds = %for.cond244
  %116 = load i32*, i32** %acc_mem_ref, align 8, !dbg !659
  %117 = load i32, i32* %i243, align 4, !dbg !659
  %idxprom247 = sext i32 %117 to i64, !dbg !659
  %arrayidx248 = getelementptr inbounds i32, i32* %116, i64 %idxprom247, !dbg !659
  %118 = load i32, i32* %arrayidx248, align 4, !dbg !659
  %119 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !659
  %120 = load i32, i32* %i243, align 4, !dbg !659
  %idxprom249 = sext i32 %120 to i64, !dbg !659
  %arrayidx250 = getelementptr inbounds i32, i32* %119, i64 %idxprom249, !dbg !659
  %121 = load i32, i32* %arrayidx250, align 4, !dbg !659
  %cmp251 = icmp eq i32 %118, %121, !dbg !659
  br i1 %cmp251, label %for.inc252, label %cond.false, !dbg !659

cond.false:                                       ; preds = %for.body246
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 151, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !659
  unreachable, !dbg !659

for.inc252:                                       ; preds = %for.body246
  %122 = load i32, i32* %i243, align 4, !dbg !661
  %inc253 = add nsw i32 %122, 1, !dbg !661
  store i32 %inc253, i32* %i243, align 4, !dbg !661
  br label %for.cond244, !dbg !662, !llvm.loop !663

if.end:                                           ; preds = %for.cond244, %entry
  ret i32 0, !dbg !665
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !666 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !672, metadata !DIExpression()), !dbg !673
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !674, metadata !DIExpression()), !dbg !675
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !676, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.declare(metadata i8** %7, metadata !678, metadata !DIExpression()), !dbg !679
  %9 = load i8*, i8** %4, align 8, !dbg !680
  store i8* %9, i8** %7, align 8, !dbg !679
  call void @llvm.dbg.declare(metadata i8** %8, metadata !681, metadata !DIExpression()), !dbg !682
  %10 = load i8*, i8** %5, align 8, !dbg !683
  store i8* %10, i8** %8, align 8, !dbg !682
  br label %11, !dbg !684

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !685
  %13 = add i64 %12, -1, !dbg !685
  store i64 %13, i64* %6, align 8, !dbg !685
  %14 = icmp ugt i64 %12, 0, !dbg !686
  br i1 %14, label %15, label %21, !dbg !684

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !687
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !687
  store i8* %17, i8** %8, align 8, !dbg !687
  %18 = load i8, i8* %16, align 1, !dbg !688
  %19 = load i8*, i8** %7, align 8, !dbg !689
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !689
  store i8* %20, i8** %7, align 8, !dbg !689
  store i8 %18, i8* %19, align 1, !dbg !690
  br label %11, !dbg !684, !llvm.loop !691

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !692
  ret i8* %22, !dbg !693
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !121}
!llvm.module.flags = !{!123, !124, !125}
!llvm.ident = !{!126, !127}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "res_index", scope: !2, file: !3, line: 9, type: !37, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !27, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !14, !19, !21, !23, !25}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 10, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !12)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!13}
!13 = !DISubrange(count: 9)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 12, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !17)
!17 = !{!18, !18}
!18 = !DISubrange(count: 3)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 13, type: !16, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 14, type: !16, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 15, type: !16, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 16, type: !10, isLocal: false, isDefinition: true)
!27 = !{!28, !42, !46, !52, !56, !60, !70, !74, !76, !78, !82, !86, !90, !94, !98, !100, !102, !104, !108, !112, !116, !118, !120}
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !30, file: !41, line: 75)
!29 = !DINamespace(name: "std", scope: null)
!30 = !DISubprogram(name: "memchr", scope: !31, file: !31, line: 90, type: !32, flags: DIFlagPrototyped, spFlags: 0)
!31 = !DIFile(filename: "/usr/include/string.h", directory: "")
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !35, !37, !38}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !43, file: !41, line: 76)
!43 = !DISubprogram(name: "memcmp", scope: !31, file: !31, line: 63, type: !44, flags: DIFlagPrototyped, spFlags: 0)
!44 = !DISubroutineType(types: !45)
!45 = !{!37, !35, !35, !38}
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !47, file: !41, line: 77)
!47 = !DISubprogram(name: "memcpy", scope: !31, file: !31, line: 42, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!48 = !DISubroutineType(types: !49)
!49 = !{!34, !50, !51, !38}
!50 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!51 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !35)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !53, file: !41, line: 78)
!53 = !DISubprogram(name: "memmove", scope: !31, file: !31, line: 46, type: !54, flags: DIFlagPrototyped, spFlags: 0)
!54 = !DISubroutineType(types: !55)
!55 = !{!34, !34, !35, !38}
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !57, file: !41, line: 79)
!57 = !DISubprogram(name: "memset", scope: !31, file: !31, line: 60, type: !58, flags: DIFlagPrototyped, spFlags: 0)
!58 = !DISubroutineType(types: !59)
!59 = !{!34, !34, !37, !38}
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !61, file: !41, line: 80)
!61 = !DISubprogram(name: "strcat", scope: !31, file: !31, line: 129, type: !62, flags: DIFlagPrototyped, spFlags: 0)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !66, !67}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !64)
!67 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !71, file: !41, line: 81)
!71 = !DISubprogram(name: "strcmp", scope: !31, file: !31, line: 136, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!72 = !DISubroutineType(types: !73)
!73 = !{!37, !68, !68}
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !75, file: !41, line: 82)
!75 = !DISubprogram(name: "strcoll", scope: !31, file: !31, line: 143, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !77, file: !41, line: 83)
!77 = !DISubprogram(name: "strcpy", scope: !31, file: !31, line: 121, type: !62, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !79, file: !41, line: 84)
!79 = !DISubprogram(name: "strcspn", scope: !31, file: !31, line: 272, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DISubroutineType(types: !81)
!81 = !{!38, !68, !68}
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !83, file: !41, line: 85)
!83 = !DISubprogram(name: "strerror", scope: !31, file: !31, line: 396, type: !84, flags: DIFlagPrototyped, spFlags: 0)
!84 = !DISubroutineType(types: !85)
!85 = !{!64, !37}
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !87, file: !41, line: 86)
!87 = !DISubprogram(name: "strlen", scope: !31, file: !31, line: 384, type: !88, flags: DIFlagPrototyped, spFlags: 0)
!88 = !DISubroutineType(types: !89)
!89 = !{!38, !68}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !91, file: !41, line: 87)
!91 = !DISubprogram(name: "strncat", scope: !31, file: !31, line: 132, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!92 = !DISubroutineType(types: !93)
!93 = !{!64, !66, !67, !38}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !95, file: !41, line: 88)
!95 = !DISubprogram(name: "strncmp", scope: !31, file: !31, line: 139, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!37, !68, !68, !38}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !99, file: !41, line: 89)
!99 = !DISubprogram(name: "strncpy", scope: !31, file: !31, line: 124, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !101, file: !41, line: 90)
!101 = !DISubprogram(name: "strspn", scope: !31, file: !31, line: 276, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !103, file: !41, line: 91)
!103 = !DISubprogram(name: "strtok", scope: !31, file: !31, line: 335, type: !62, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !105, file: !41, line: 92)
!105 = !DISubprogram(name: "strxfrm", scope: !31, file: !31, line: 146, type: !106, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DISubroutineType(types: !107)
!107 = !{!38, !66, !67, !38}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !109, file: !41, line: 93)
!109 = !DISubprogram(name: "strchr", scope: !31, file: !31, line: 225, type: !110, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DISubroutineType(types: !111)
!111 = !{!64, !68, !37}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !113, file: !41, line: 94)
!113 = !DISubprogram(name: "strpbrk", scope: !31, file: !31, line: 302, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!114 = !DISubroutineType(types: !115)
!115 = !{!64, !68, !68}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !117, file: !41, line: 95)
!117 = !DISubprogram(name: "strrchr", scope: !31, file: !31, line: 252, type: !110, flags: DIFlagPrototyped, spFlags: 0)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !29, entity: !119, file: !41, line: 96)
!119 = !DISubprogram(name: "strstr", scope: !31, file: !31, line: 329, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !29, file: !3, line: 6)
!121 = distinct !DICompileUnit(language: DW_LANG_C99, file: !122, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!122 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!123 = !{i32 2, !"Dwarf Version", i32 4}
!124 = !{i32 2, !"Debug Info Version", i32 3}
!125 = !{i32 1, !"wchar_size", i32 4}
!126 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!127 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!128 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 18, type: !129, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DISubroutineType(types: !130)
!130 = !{null, !131, !131}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !133)
!133 = !{!18}
!134 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !128, file: !3, line: 18, type: !131)
!135 = !DILocation(line: 18, column: 29, scope: !128)
!136 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !128, file: !3, line: 18, type: !131)
!137 = !DILocation(line: 18, column: 58, scope: !128)
!138 = !DILocalVariable(name: "i", scope: !128, file: !3, line: 20, type: !37)
!139 = !DILocation(line: 20, column: 9, scope: !128)
!140 = !DILocalVariable(name: "j", scope: !128, file: !3, line: 20, type: !37)
!141 = !DILocation(line: 20, column: 12, scope: !128)
!142 = !DILocation(line: 21, column: 12, scope: !143)
!143 = distinct !DILexicalBlock(scope: !128, file: !3, line: 21, column: 5)
!144 = !DILocation(line: 21, column: 10, scope: !143)
!145 = !DILocation(line: 21, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !3, line: 21, column: 5)
!147 = !DILocation(line: 21, column: 19, scope: !146)
!148 = !DILocation(line: 21, column: 5, scope: !143)
!149 = !DILocation(line: 22, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 22, column: 9)
!151 = !DILocation(line: 22, column: 14, scope: !150)
!152 = !DILocation(line: 22, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !3, line: 22, column: 9)
!154 = !DILocation(line: 22, column: 23, scope: !153)
!155 = !DILocation(line: 22, column: 9, scope: !150)
!156 = !DILocation(line: 23, column: 35, scope: !153)
!157 = !DILocation(line: 23, column: 43, scope: !153)
!158 = !DILocation(line: 23, column: 46, scope: !153)
!159 = !DILocation(line: 23, column: 13, scope: !153)
!160 = !DILocation(line: 23, column: 27, scope: !153)
!161 = !DILocation(line: 23, column: 30, scope: !153)
!162 = !DILocation(line: 23, column: 33, scope: !153)
!163 = !DILocation(line: 22, column: 31, scope: !153)
!164 = !DILocation(line: 22, column: 9, scope: !153)
!165 = distinct !{!165, !155, !166}
!166 = !DILocation(line: 23, column: 47, scope: !150)
!167 = !DILocation(line: 21, column: 27, scope: !146)
!168 = !DILocation(line: 21, column: 5, scope: !146)
!169 = distinct !{!169, !148, !170}
!170 = !DILocation(line: 23, column: 47, scope: !143)
!171 = !DILocation(line: 24, column: 1, scope: !128)
!172 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPjS_", scope: !3, file: !3, line: 26, type: !173, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DISubroutineType(types: !174)
!174 = !{!175, !175, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!176 = !DILocalVariable(name: "mat1", arg: 1, scope: !172, file: !3, line: 26, type: !175)
!177 = !DILocation(line: 26, column: 43, scope: !172)
!178 = !DILocalVariable(name: "mat2", arg: 2, scope: !172, file: !3, line: 26, type: !175)
!179 = !DILocation(line: 26, column: 64, scope: !172)
!180 = !DILocalVariable(name: "res", scope: !172, file: !3, line: 28, type: !11)
!181 = !DILocation(line: 28, column: 18, scope: !172)
!182 = !DILocalVariable(name: "i", scope: !183, file: !3, line: 29, type: !37)
!183 = distinct !DILexicalBlock(scope: !172, file: !3, line: 29, column: 5)
!184 = !DILocation(line: 29, column: 13, scope: !183)
!185 = !DILocation(line: 29, column: 9, scope: !183)
!186 = !DILocation(line: 29, column: 20, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !3, line: 29, column: 5)
!188 = !DILocation(line: 29, column: 22, scope: !187)
!189 = !DILocation(line: 29, column: 5, scope: !183)
!190 = !DILocation(line: 31, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !3, line: 30, column: 5)
!192 = !DILocation(line: 31, column: 21, scope: !191)
!193 = !DILocation(line: 31, column: 26, scope: !191)
!194 = !DILocation(line: 31, column: 31, scope: !191)
!195 = !DILocation(line: 31, column: 24, scope: !191)
!196 = !DILocation(line: 31, column: 13, scope: !191)
!197 = !DILocation(line: 29, column: 28, scope: !187)
!198 = !DILocation(line: 29, column: 5, scope: !187)
!199 = distinct !{!199, !189, !200}
!200 = !DILocation(line: 32, column: 5, scope: !183)
!201 = !DILocation(line: 33, column: 25, scope: !172)
!202 = !DILocation(line: 33, column: 12, scope: !172)
!203 = !DILocation(line: 33, column: 5, scope: !172)
!204 = !DILocation(line: 33, column: 23, scope: !172)
!205 = !DILocation(line: 34, column: 14, scope: !172)
!206 = !DILocation(line: 35, column: 5, scope: !172)
!207 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 38, type: !208, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!175, !131, !131, !131}
!210 = !DILocalVariable(name: "mat1", arg: 1, scope: !207, file: !3, line: 38, type: !131)
!211 = !DILocation(line: 38, column: 35, scope: !207)
!212 = !DILocalVariable(name: "mat2", arg: 2, scope: !207, file: !3, line: 38, type: !131)
!213 = !DILocation(line: 38, column: 61, scope: !207)
!214 = !DILocalVariable(name: "res", arg: 3, scope: !207, file: !3, line: 38, type: !131)
!215 = !DILocation(line: 38, column: 87, scope: !207)
!216 = !DILocalVariable(name: "i", scope: !217, file: !3, line: 39, type: !37)
!217 = distinct !DILexicalBlock(scope: !207, file: !3, line: 39, column: 5)
!218 = !DILocation(line: 39, column: 14, scope: !217)
!219 = !DILocation(line: 39, column: 10, scope: !217)
!220 = !DILocation(line: 39, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !3, line: 39, column: 5)
!222 = !DILocation(line: 39, column: 23, scope: !221)
!223 = !DILocation(line: 39, column: 5, scope: !217)
!224 = !DILocalVariable(name: "j", scope: !225, file: !3, line: 40, type: !37)
!225 = distinct !DILexicalBlock(scope: !226, file: !3, line: 40, column: 9)
!226 = distinct !DILexicalBlock(scope: !221, file: !3, line: 39, column: 35)
!227 = !DILocation(line: 40, column: 18, scope: !225)
!228 = !DILocation(line: 40, column: 14, scope: !225)
!229 = !DILocation(line: 40, column: 25, scope: !230)
!230 = distinct !DILexicalBlock(scope: !225, file: !3, line: 40, column: 9)
!231 = !DILocation(line: 40, column: 27, scope: !230)
!232 = !DILocation(line: 40, column: 9, scope: !225)
!233 = !DILocalVariable(name: "k", scope: !234, file: !3, line: 41, type: !37)
!234 = distinct !DILexicalBlock(scope: !235, file: !3, line: 41, column: 13)
!235 = distinct !DILexicalBlock(scope: !230, file: !3, line: 40, column: 39)
!236 = !DILocation(line: 41, column: 22, scope: !234)
!237 = !DILocation(line: 41, column: 18, scope: !234)
!238 = !DILocation(line: 41, column: 29, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !3, line: 41, column: 13)
!240 = !DILocation(line: 41, column: 31, scope: !239)
!241 = !DILocation(line: 41, column: 13, scope: !234)
!242 = !DILocation(line: 42, column: 42, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !3, line: 41, column: 43)
!244 = !DILocation(line: 42, column: 34, scope: !243)
!245 = !DILocation(line: 42, column: 45, scope: !243)
!246 = !DILocation(line: 42, column: 58, scope: !243)
!247 = !DILocation(line: 42, column: 50, scope: !243)
!248 = !DILocation(line: 42, column: 61, scope: !243)
!249 = !DILocation(line: 42, column: 48, scope: !243)
!250 = !DILocation(line: 42, column: 25, scope: !243)
!251 = !DILocation(line: 42, column: 17, scope: !243)
!252 = !DILocation(line: 42, column: 28, scope: !243)
!253 = !DILocation(line: 42, column: 31, scope: !243)
!254 = !DILocation(line: 41, column: 39, scope: !239)
!255 = !DILocation(line: 41, column: 13, scope: !239)
!256 = distinct !{!256, !241, !257}
!257 = !DILocation(line: 43, column: 13, scope: !234)
!258 = !DILocation(line: 40, column: 35, scope: !230)
!259 = !DILocation(line: 40, column: 9, scope: !230)
!260 = distinct !{!260, !232, !261}
!261 = !DILocation(line: 44, column: 9, scope: !225)
!262 = !DILocation(line: 39, column: 31, scope: !221)
!263 = !DILocation(line: 39, column: 5, scope: !221)
!264 = distinct !{!264, !223, !265}
!265 = !DILocation(line: 45, column: 5, scope: !217)
!266 = !DILocalVariable(name: "i", scope: !267, file: !3, line: 46, type: !37)
!267 = distinct !DILexicalBlock(scope: !207, file: !3, line: 46, column: 5)
!268 = !DILocation(line: 46, column: 13, scope: !267)
!269 = !DILocation(line: 46, column: 9, scope: !267)
!270 = !DILocation(line: 46, column: 18, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !3, line: 46, column: 5)
!272 = !DILocation(line: 46, column: 19, scope: !271)
!273 = !DILocation(line: 46, column: 5, scope: !267)
!274 = !DILocalVariable(name: "j", scope: !275, file: !3, line: 47, type: !37)
!275 = distinct !DILexicalBlock(scope: !276, file: !3, line: 47, column: 9)
!276 = distinct !DILexicalBlock(scope: !271, file: !3, line: 46, column: 28)
!277 = !DILocation(line: 47, column: 17, scope: !275)
!278 = !DILocation(line: 47, column: 13, scope: !275)
!279 = !DILocation(line: 47, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !275, file: !3, line: 47, column: 9)
!281 = !DILocation(line: 47, column: 22, scope: !280)
!282 = !DILocation(line: 0, scope: !271)
!283 = !DILocation(line: 47, column: 9, scope: !275)
!284 = !DILocation(line: 48, column: 37, scope: !285)
!285 = distinct !DILexicalBlock(scope: !280, file: !3, line: 47, column: 31)
!286 = !DILocation(line: 48, column: 48, scope: !285)
!287 = !DILocation(line: 48, column: 26, scope: !285)
!288 = !DILocation(line: 48, column: 27, scope: !285)
!289 = !DILocation(line: 48, column: 32, scope: !285)
!290 = !DILocation(line: 48, column: 31, scope: !285)
!291 = !DILocation(line: 48, column: 13, scope: !285)
!292 = !DILocation(line: 48, column: 35, scope: !285)
!293 = !DILocation(line: 47, column: 28, scope: !280)
!294 = !DILocation(line: 47, column: 9, scope: !280)
!295 = distinct !{!295, !283, !296}
!296 = !DILocation(line: 49, column: 9, scope: !275)
!297 = !DILocation(line: 46, column: 25, scope: !271)
!298 = !DILocation(line: 46, column: 5, scope: !271)
!299 = distinct !{!299, !273, !300}
!300 = !DILocation(line: 50, column: 5, scope: !267)
!301 = !DILocation(line: 51, column: 5, scope: !207)
!302 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 54, type: !303, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!303 = !DISubroutineType(types: !304)
!304 = !{!175, !305}
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !306, line: 17, size: 320, flags: DIFlagTypePassByValue, elements: !307, identifier: "_ZTS5INSTR")
!306 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!307 = !{!308, !309, !310, !311}
!308 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !305, file: !306, line: 18, baseType: !11, size: 32)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !305, file: !306, line: 19, baseType: !11, size: 32, offset: 32)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !305, file: !306, line: 20, baseType: !11, size: 32, offset: 64)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !305, file: !306, line: 21, baseType: !312, size: 192, offset: 128)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !306, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !313, identifier: "_ZTS15GEMM_STRUCT_REF")
!313 = !{!314, !315, !316}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !312, file: !306, line: 6, baseType: !175, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !312, file: !306, line: 7, baseType: !175, size: 64, offset: 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !312, file: !306, line: 8, baseType: !175, size: 64, offset: 128)
!317 = !DILocalVariable(name: "instr", arg: 1, scope: !302, file: !3, line: 54, type: !305)
!318 = !DILocation(line: 54, column: 35, scope: !302)
!319 = !DILocalVariable(name: "inp", scope: !302, file: !3, line: 56, type: !132)
!320 = !DILocation(line: 56, column: 18, scope: !302)
!321 = !DILocalVariable(name: "wgt", scope: !302, file: !3, line: 56, type: !132)
!322 = !DILocation(line: 56, column: 26, scope: !302)
!323 = !DILocalVariable(name: "i", scope: !324, file: !3, line: 57, type: !37)
!324 = distinct !DILexicalBlock(scope: !302, file: !3, line: 57, column: 5)
!325 = !DILocation(line: 57, column: 14, scope: !324)
!326 = !DILocation(line: 57, column: 10, scope: !324)
!327 = !DILocation(line: 57, column: 18, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !3, line: 57, column: 5)
!329 = !DILocation(line: 57, column: 19, scope: !328)
!330 = !DILocation(line: 57, column: 5, scope: !324)
!331 = !DILocation(line: 58, column: 26, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !3, line: 57, column: 26)
!333 = !DILocation(line: 58, column: 35, scope: !332)
!334 = !DILocation(line: 58, column: 43, scope: !332)
!335 = !DILocation(line: 58, column: 42, scope: !332)
!336 = !DILocation(line: 58, column: 18, scope: !332)
!337 = !DILocation(line: 58, column: 13, scope: !332)
!338 = !DILocation(line: 58, column: 9, scope: !332)
!339 = !DILocation(line: 58, column: 16, scope: !332)
!340 = !DILocation(line: 57, column: 23, scope: !328)
!341 = !DILocation(line: 57, column: 5, scope: !328)
!342 = distinct !{!342, !330, !343}
!343 = !DILocation(line: 59, column: 5, scope: !324)
!344 = !DILocalVariable(name: "i", scope: !345, file: !3, line: 60, type: !37)
!345 = distinct !DILexicalBlock(scope: !302, file: !3, line: 60, column: 5)
!346 = !DILocation(line: 60, column: 14, scope: !345)
!347 = !DILocation(line: 60, column: 10, scope: !345)
!348 = !DILocation(line: 60, column: 18, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !3, line: 60, column: 5)
!350 = !DILocation(line: 60, column: 19, scope: !349)
!351 = !DILocation(line: 60, column: 5, scope: !345)
!352 = !DILocation(line: 61, column: 26, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !3, line: 60, column: 26)
!354 = !DILocation(line: 61, column: 35, scope: !353)
!355 = !DILocation(line: 61, column: 43, scope: !353)
!356 = !DILocation(line: 61, column: 42, scope: !353)
!357 = !DILocation(line: 61, column: 18, scope: !353)
!358 = !DILocation(line: 61, column: 13, scope: !353)
!359 = !DILocation(line: 61, column: 9, scope: !353)
!360 = !DILocation(line: 61, column: 16, scope: !353)
!361 = !DILocation(line: 60, column: 23, scope: !349)
!362 = !DILocation(line: 60, column: 5, scope: !349)
!363 = distinct !{!363, !351, !364}
!364 = !DILocation(line: 62, column: 5, scope: !345)
!365 = !DILocalVariable(name: "arr", scope: !302, file: !3, line: 63, type: !175)
!366 = !DILocation(line: 63, column: 20, scope: !302)
!367 = !DILocation(line: 63, column: 41, scope: !302)
!368 = !DILocation(line: 63, column: 45, scope: !302)
!369 = !DILocation(line: 63, column: 26, scope: !302)
!370 = !DILocation(line: 64, column: 12, scope: !302)
!371 = !DILocation(line: 64, column: 5, scope: !302)
!372 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 67, type: !373, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!373 = !DISubroutineType(types: !374)
!374 = !{!175, !375}
!375 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !306, line: 24, size: 192, flags: DIFlagTypePassByValue, elements: !376, identifier: "_ZTS9INSTR_VAL")
!376 = !{!377, !378, !379, !380}
!377 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !375, file: !306, line: 25, baseType: !11, size: 32)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !375, file: !306, line: 26, baseType: !11, size: 32, offset: 32)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !375, file: !306, line: 27, baseType: !11, size: 32, offset: 64)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !375, file: !306, line: 28, baseType: !381, size: 96, offset: 96)
!381 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !306, line: 11, size: 96, flags: DIFlagTypePassByValue, elements: !382, identifier: "_ZTS15GEMM_STRUCT_VAL")
!382 = !{!383, !384, !385}
!383 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !381, file: !306, line: 12, baseType: !11, size: 32)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !381, file: !306, line: 13, baseType: !11, size: 32, offset: 32)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !381, file: !306, line: 14, baseType: !11, size: 32, offset: 64)
!386 = !DILocalVariable(name: "instr", arg: 1, scope: !372, file: !3, line: 67, type: !375)
!387 = !DILocation(line: 67, column: 43, scope: !372)
!388 = !DILocalVariable(name: "inp", scope: !372, file: !3, line: 69, type: !132)
!389 = !DILocation(line: 69, column: 18, scope: !372)
!390 = !DILocalVariable(name: "wgt", scope: !372, file: !3, line: 69, type: !132)
!391 = !DILocation(line: 69, column: 26, scope: !372)
!392 = !DILocalVariable(name: "i", scope: !393, file: !3, line: 70, type: !37)
!393 = distinct !DILexicalBlock(scope: !372, file: !3, line: 70, column: 5)
!394 = !DILocation(line: 70, column: 14, scope: !393)
!395 = !DILocation(line: 70, column: 10, scope: !393)
!396 = !DILocation(line: 70, column: 18, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !3, line: 70, column: 5)
!398 = !DILocation(line: 70, column: 19, scope: !397)
!399 = !DILocation(line: 70, column: 5, scope: !393)
!400 = !DILocation(line: 71, column: 24, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !3, line: 70, column: 26)
!402 = !DILocation(line: 71, column: 33, scope: !401)
!403 = !DILocation(line: 71, column: 41, scope: !401)
!404 = !DILocation(line: 71, column: 40, scope: !401)
!405 = !DILocation(line: 71, column: 13, scope: !401)
!406 = !DILocation(line: 71, column: 9, scope: !401)
!407 = !DILocation(line: 71, column: 16, scope: !401)
!408 = !DILocation(line: 70, column: 23, scope: !397)
!409 = !DILocation(line: 70, column: 5, scope: !397)
!410 = distinct !{!410, !399, !411}
!411 = !DILocation(line: 72, column: 5, scope: !393)
!412 = !DILocalVariable(name: "i", scope: !413, file: !3, line: 73, type: !37)
!413 = distinct !DILexicalBlock(scope: !372, file: !3, line: 73, column: 5)
!414 = !DILocation(line: 73, column: 14, scope: !413)
!415 = !DILocation(line: 73, column: 10, scope: !413)
!416 = !DILocation(line: 73, column: 18, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !3, line: 73, column: 5)
!418 = !DILocation(line: 73, column: 19, scope: !417)
!419 = !DILocation(line: 73, column: 5, scope: !413)
!420 = !DILocation(line: 74, column: 24, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !3, line: 73, column: 26)
!422 = !DILocation(line: 74, column: 33, scope: !421)
!423 = !DILocation(line: 74, column: 13, scope: !421)
!424 = !DILocation(line: 74, column: 9, scope: !421)
!425 = !DILocation(line: 74, column: 16, scope: !421)
!426 = !DILocation(line: 73, column: 23, scope: !417)
!427 = !DILocation(line: 73, column: 5, scope: !417)
!428 = distinct !{!428, !419, !429}
!429 = !DILocation(line: 75, column: 5, scope: !413)
!430 = !DILocalVariable(name: "arr", scope: !372, file: !3, line: 76, type: !175)
!431 = !DILocation(line: 76, column: 20, scope: !372)
!432 = !DILocation(line: 76, column: 41, scope: !372)
!433 = !DILocation(line: 76, column: 45, scope: !372)
!434 = !DILocation(line: 76, column: 26, scope: !372)
!435 = !DILocation(line: 77, column: 12, scope: !372)
!436 = !DILocation(line: 77, column: 5, scope: !372)
!437 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 84, type: !438, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!438 = !DISubroutineType(types: !439)
!439 = !{!37, !37, !440}
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!441 = !DILocalVariable(name: "argc", arg: 1, scope: !437, file: !3, line: 84, type: !37)
!442 = !DILocation(line: 84, column: 14, scope: !437)
!443 = !DILocalVariable(name: "argv", arg: 2, scope: !437, file: !3, line: 84, type: !440)
!444 = !DILocation(line: 84, column: 32, scope: !437)
!445 = !DILocalVariable(name: "inp_mem_row0", scope: !437, file: !3, line: 86, type: !132)
!446 = !DILocation(line: 86, column: 18, scope: !437)
!447 = !DILocalVariable(name: "inp_mem_row1", scope: !437, file: !3, line: 86, type: !132)
!448 = !DILocation(line: 86, column: 37, scope: !437)
!449 = !DILocalVariable(name: "inp_mem_row2", scope: !437, file: !3, line: 86, type: !132)
!450 = !DILocation(line: 86, column: 56, scope: !437)
!451 = !DILocalVariable(name: "wgt_mem_row0", scope: !437, file: !3, line: 87, type: !132)
!452 = !DILocation(line: 87, column: 18, scope: !437)
!453 = !DILocalVariable(name: "wgt_mem_row1", scope: !437, file: !3, line: 87, type: !132)
!454 = !DILocation(line: 87, column: 37, scope: !437)
!455 = !DILocalVariable(name: "wgt_mem_row2", scope: !437, file: !3, line: 87, type: !132)
!456 = !DILocation(line: 87, column: 56, scope: !437)
!457 = !DILocalVariable(name: "acc_mem_row0", scope: !437, file: !3, line: 88, type: !132)
!458 = !DILocation(line: 88, column: 18, scope: !437)
!459 = !DILocalVariable(name: "acc_mem_row1", scope: !437, file: !3, line: 88, type: !132)
!460 = !DILocation(line: 88, column: 37, scope: !437)
!461 = !DILocalVariable(name: "acc_mem_row2", scope: !437, file: !3, line: 88, type: !132)
!462 = !DILocation(line: 88, column: 56, scope: !437)
!463 = !DILocalVariable(name: "acc_mem_ref", scope: !437, file: !3, line: 89, type: !175)
!464 = !DILocation(line: 89, column: 20, scope: !437)
!465 = !DILocalVariable(name: "acc_mem_val", scope: !437, file: !3, line: 90, type: !175)
!466 = !DILocation(line: 90, column: 20, scope: !437)
!467 = !DILocalVariable(name: "acc_mem_gemm", scope: !437, file: !3, line: 91, type: !175)
!468 = !DILocation(line: 91, column: 20, scope: !437)
!469 = !DILocalVariable(name: "opcode", scope: !437, file: !3, line: 92, type: !11)
!470 = !DILocation(line: 92, column: 18, scope: !437)
!471 = !DILocalVariable(name: "op_type", scope: !437, file: !3, line: 92, type: !11)
!472 = !DILocation(line: 92, column: 25, scope: !437)
!473 = !DILocalVariable(name: "acc_stage2", scope: !437, file: !3, line: 93, type: !10)
!474 = !DILocation(line: 93, column: 18, scope: !437)
!475 = !DILocalVariable(name: "acc_stage1", scope: !437, file: !3, line: 94, type: !10)
!476 = !DILocation(line: 94, column: 18, scope: !437)
!477 = !DILocalVariable(name: "acc_stage3", scope: !437, file: !3, line: 95, type: !10)
!478 = !DILocation(line: 95, column: 18, scope: !437)
!479 = !DILocation(line: 96, column: 5, scope: !437)
!480 = !DILocation(line: 98, column: 5, scope: !437)
!481 = !DILocation(line: 99, column: 5, scope: !437)
!482 = !DILocation(line: 100, column: 5, scope: !437)
!483 = !DILocation(line: 101, column: 5, scope: !437)
!484 = !DILocation(line: 102, column: 5, scope: !437)
!485 = !DILocation(line: 103, column: 5, scope: !437)
!486 = !DILocation(line: 104, column: 5, scope: !437)
!487 = !DILocation(line: 105, column: 5, scope: !437)
!488 = !DILocation(line: 106, column: 5, scope: !437)
!489 = !DILocation(line: 107, column: 24, scope: !437)
!490 = !DILocation(line: 107, column: 5, scope: !437)
!491 = !DILocation(line: 108, column: 24, scope: !437)
!492 = !DILocation(line: 108, column: 5, scope: !437)
!493 = !DILocalVariable(name: "gemm_instr", scope: !437, file: !3, line: 111, type: !312)
!494 = !DILocation(line: 111, column: 21, scope: !437)
!495 = !DILocalVariable(name: "instruction", scope: !437, file: !3, line: 112, type: !305)
!496 = !DILocation(line: 112, column: 11, scope: !437)
!497 = !DILocation(line: 112, column: 25, scope: !437)
!498 = !DILocation(line: 112, column: 32, scope: !437)
!499 = !DILocalVariable(name: "gemm_uop", scope: !437, file: !3, line: 115, type: !500)
!500 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 1728, elements: !12)
!501 = !DILocation(line: 115, column: 21, scope: !437)
!502 = !DILocation(line: 115, column: 35, scope: !437)
!503 = !DILocation(line: 115, column: 36, scope: !437)
!504 = !DILocation(line: 115, column: 38, scope: !437)
!505 = !DILocation(line: 115, column: 55, scope: !437)
!506 = !DILocation(line: 115, column: 72, scope: !437)
!507 = !DILocation(line: 115, column: 89, scope: !437)
!508 = !DILocation(line: 115, column: 91, scope: !437)
!509 = !DILocation(line: 115, column: 108, scope: !437)
!510 = !DILocation(line: 115, column: 125, scope: !437)
!511 = !DILocation(line: 116, column: 36, scope: !437)
!512 = !DILocation(line: 116, column: 38, scope: !437)
!513 = !DILocation(line: 116, column: 55, scope: !437)
!514 = !DILocation(line: 116, column: 72, scope: !437)
!515 = !DILocation(line: 116, column: 89, scope: !437)
!516 = !DILocation(line: 116, column: 91, scope: !437)
!517 = !DILocation(line: 116, column: 108, scope: !437)
!518 = !DILocation(line: 116, column: 125, scope: !437)
!519 = !DILocation(line: 117, column: 36, scope: !437)
!520 = !DILocation(line: 117, column: 38, scope: !437)
!521 = !DILocation(line: 117, column: 55, scope: !437)
!522 = !DILocation(line: 117, column: 72, scope: !437)
!523 = !DILocation(line: 117, column: 89, scope: !437)
!524 = !DILocation(line: 117, column: 91, scope: !437)
!525 = !DILocation(line: 117, column: 108, scope: !437)
!526 = !DILocation(line: 117, column: 125, scope: !437)
!527 = !DILocation(line: 118, column: 36, scope: !437)
!528 = !DILocation(line: 118, column: 38, scope: !437)
!529 = !DILocation(line: 118, column: 55, scope: !437)
!530 = !DILocation(line: 118, column: 72, scope: !437)
!531 = !DILocation(line: 118, column: 89, scope: !437)
!532 = !DILocation(line: 118, column: 91, scope: !437)
!533 = !DILocation(line: 118, column: 108, scope: !437)
!534 = !DILocation(line: 118, column: 125, scope: !437)
!535 = !DILocation(line: 119, column: 36, scope: !437)
!536 = !DILocation(line: 119, column: 38, scope: !437)
!537 = !DILocation(line: 119, column: 55, scope: !437)
!538 = !DILocation(line: 119, column: 72, scope: !437)
!539 = !DILocalVariable(name: "gemm", scope: !437, file: !3, line: 122, type: !540)
!540 = !DICompositeType(tag: DW_TAG_array_type, baseType: !381, size: 864, elements: !12)
!541 = !DILocation(line: 122, column: 21, scope: !437)
!542 = !DILocation(line: 122, column: 31, scope: !437)
!543 = !DILocation(line: 122, column: 32, scope: !437)
!544 = !DILocation(line: 122, column: 33, scope: !437)
!545 = !DILocation(line: 122, column: 49, scope: !437)
!546 = !DILocation(line: 122, column: 65, scope: !437)
!547 = !DILocation(line: 122, column: 82, scope: !437)
!548 = !DILocation(line: 122, column: 83, scope: !437)
!549 = !DILocation(line: 122, column: 99, scope: !437)
!550 = !DILocation(line: 122, column: 115, scope: !437)
!551 = !DILocation(line: 123, column: 32, scope: !437)
!552 = !DILocation(line: 123, column: 33, scope: !437)
!553 = !DILocation(line: 123, column: 49, scope: !437)
!554 = !DILocation(line: 123, column: 65, scope: !437)
!555 = !DILocation(line: 123, column: 82, scope: !437)
!556 = !DILocation(line: 123, column: 83, scope: !437)
!557 = !DILocation(line: 123, column: 99, scope: !437)
!558 = !DILocation(line: 123, column: 115, scope: !437)
!559 = !DILocation(line: 124, column: 32, scope: !437)
!560 = !DILocation(line: 124, column: 33, scope: !437)
!561 = !DILocation(line: 124, column: 49, scope: !437)
!562 = !DILocation(line: 124, column: 65, scope: !437)
!563 = !DILocation(line: 124, column: 82, scope: !437)
!564 = !DILocation(line: 124, column: 83, scope: !437)
!565 = !DILocation(line: 124, column: 99, scope: !437)
!566 = !DILocation(line: 124, column: 115, scope: !437)
!567 = !DILocation(line: 125, column: 32, scope: !437)
!568 = !DILocation(line: 125, column: 33, scope: !437)
!569 = !DILocation(line: 125, column: 49, scope: !437)
!570 = !DILocation(line: 125, column: 65, scope: !437)
!571 = !DILocation(line: 125, column: 82, scope: !437)
!572 = !DILocation(line: 125, column: 83, scope: !437)
!573 = !DILocation(line: 125, column: 99, scope: !437)
!574 = !DILocation(line: 125, column: 115, scope: !437)
!575 = !DILocation(line: 126, column: 32, scope: !437)
!576 = !DILocation(line: 126, column: 33, scope: !437)
!577 = !DILocation(line: 126, column: 49, scope: !437)
!578 = !DILocation(line: 126, column: 65, scope: !437)
!579 = !DILocalVariable(name: "microop", scope: !437, file: !3, line: 130, type: !580)
!580 = !DICompositeType(tag: DW_TAG_array_type, baseType: !305, size: 2880, elements: !12)
!581 = !DILocation(line: 130, column: 11, scope: !437)
!582 = !DILocation(line: 130, column: 24, scope: !437)
!583 = !DILocation(line: 130, column: 25, scope: !437)
!584 = !DILocation(line: 130, column: 32, scope: !437)
!585 = !DILocation(line: 130, column: 45, scope: !437)
!586 = !DILocation(line: 130, column: 52, scope: !437)
!587 = !DILocation(line: 130, column: 65, scope: !437)
!588 = !DILocation(line: 130, column: 72, scope: !437)
!589 = !DILocation(line: 130, column: 85, scope: !437)
!590 = !DILocation(line: 130, column: 92, scope: !437)
!591 = !DILocation(line: 131, column: 25, scope: !437)
!592 = !DILocation(line: 131, column: 32, scope: !437)
!593 = !DILocation(line: 131, column: 46, scope: !437)
!594 = !DILocation(line: 131, column: 53, scope: !437)
!595 = !DILocation(line: 131, column: 66, scope: !437)
!596 = !DILocation(line: 131, column: 73, scope: !437)
!597 = !DILocation(line: 131, column: 86, scope: !437)
!598 = !DILocation(line: 131, column: 93, scope: !437)
!599 = !DILocation(line: 131, column: 106, scope: !437)
!600 = !DILocation(line: 131, column: 113, scope: !437)
!601 = !DILocalVariable(name: "microop_val", scope: !437, file: !3, line: 133, type: !602)
!602 = !DICompositeType(tag: DW_TAG_array_type, baseType: !375, size: 1728, elements: !12)
!603 = !DILocation(line: 133, column: 15, scope: !437)
!604 = !DILocation(line: 133, column: 32, scope: !437)
!605 = !DILocation(line: 133, column: 33, scope: !437)
!606 = !DILocation(line: 133, column: 40, scope: !437)
!607 = !DILocation(line: 133, column: 49, scope: !437)
!608 = !DILocation(line: 133, column: 56, scope: !437)
!609 = !DILocation(line: 133, column: 65, scope: !437)
!610 = !DILocation(line: 133, column: 72, scope: !437)
!611 = !DILocation(line: 133, column: 81, scope: !437)
!612 = !DILocation(line: 133, column: 88, scope: !437)
!613 = !DILocation(line: 134, column: 33, scope: !437)
!614 = !DILocation(line: 134, column: 40, scope: !437)
!615 = !DILocation(line: 134, column: 50, scope: !437)
!616 = !DILocation(line: 134, column: 57, scope: !437)
!617 = !DILocation(line: 134, column: 66, scope: !437)
!618 = !DILocation(line: 134, column: 73, scope: !437)
!619 = !DILocation(line: 134, column: 82, scope: !437)
!620 = !DILocation(line: 134, column: 89, scope: !437)
!621 = !DILocation(line: 134, column: 98, scope: !437)
!622 = !DILocation(line: 134, column: 105, scope: !437)
!623 = !DILocation(line: 136, column: 20, scope: !437)
!624 = !DILocation(line: 136, column: 18, scope: !437)
!625 = !DILocation(line: 141, column: 10, scope: !626)
!626 = distinct !DILexicalBlock(scope: !437, file: !3, line: 141, column: 9)
!627 = !DILocation(line: 141, column: 17, scope: !626)
!628 = !DILocation(line: 141, column: 27, scope: !626)
!629 = !DILocation(line: 141, column: 35, scope: !626)
!630 = !DILocation(line: 141, column: 22, scope: !626)
!631 = !DILocation(line: 141, column: 45, scope: !626)
!632 = !DILocation(line: 141, column: 52, scope: !626)
!633 = !DILocalVariable(name: "i", scope: !634, file: !3, line: 142, type: !37)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 142, column: 9)
!635 = distinct !DILexicalBlock(scope: !626, file: !3, line: 141, column: 58)
!636 = !DILocation(line: 142, column: 18, scope: !634)
!637 = !DILocation(line: 142, column: 14, scope: !634)
!638 = !DILocation(line: 142, column: 22, scope: !639)
!639 = distinct !DILexicalBlock(scope: !634, file: !3, line: 142, column: 9)
!640 = !DILocation(line: 142, column: 23, scope: !639)
!641 = !DILocation(line: 142, column: 9, scope: !634)
!642 = !DILocation(line: 143, column: 49, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !3, line: 142, column: 30)
!644 = !DILocation(line: 143, column: 41, scope: !643)
!645 = !DILocation(line: 143, column: 27, scope: !643)
!646 = !DILocation(line: 143, column: 25, scope: !643)
!647 = !DILocation(line: 142, column: 27, scope: !639)
!648 = !DILocation(line: 142, column: 9, scope: !639)
!649 = distinct !{!649, !641, !650}
!650 = !DILocation(line: 145, column: 13, scope: !634)
!651 = !DILocalVariable(name: "i", scope: !652, file: !3, line: 150, type: !37)
!652 = distinct !DILexicalBlock(scope: !635, file: !3, line: 150, column: 9)
!653 = !DILocation(line: 150, column: 18, scope: !652)
!654 = !DILocation(line: 150, column: 14, scope: !652)
!655 = !DILocation(line: 150, column: 25, scope: !656)
!656 = distinct !DILexicalBlock(scope: !652, file: !3, line: 150, column: 9)
!657 = !DILocation(line: 150, column: 27, scope: !656)
!658 = !DILocation(line: 150, column: 9, scope: !652)
!659 = !DILocation(line: 151, column: 10, scope: !660)
!660 = distinct !DILexicalBlock(scope: !656, file: !3, line: 150, column: 43)
!661 = !DILocation(line: 150, column: 39, scope: !656)
!662 = !DILocation(line: 150, column: 9, scope: !656)
!663 = distinct !{!663, !658, !664}
!664 = !DILocation(line: 152, column: 13, scope: !652)
!665 = !DILocation(line: 158, column: 1, scope: !437)
!666 = distinct !DISubprogram(name: "memcpy", scope: !667, file: !667, line: 12, type: !668, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !121, retainedNodes: !4)
!667 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!668 = !DISubroutineType(types: !669)
!669 = !{!34, !34, !35, !670}
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !671, line: 46, baseType: !40)
!671 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!672 = !DILocalVariable(name: "destaddr", arg: 1, scope: !666, file: !667, line: 12, type: !34)
!673 = !DILocation(line: 12, column: 20, scope: !666)
!674 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !666, file: !667, line: 12, type: !35)
!675 = !DILocation(line: 12, column: 42, scope: !666)
!676 = !DILocalVariable(name: "len", arg: 3, scope: !666, file: !667, line: 12, type: !670)
!677 = !DILocation(line: 12, column: 58, scope: !666)
!678 = !DILocalVariable(name: "dest", scope: !666, file: !667, line: 13, type: !64)
!679 = !DILocation(line: 13, column: 9, scope: !666)
!680 = !DILocation(line: 13, column: 16, scope: !666)
!681 = !DILocalVariable(name: "src", scope: !666, file: !667, line: 14, type: !68)
!682 = !DILocation(line: 14, column: 15, scope: !666)
!683 = !DILocation(line: 14, column: 21, scope: !666)
!684 = !DILocation(line: 16, column: 3, scope: !666)
!685 = !DILocation(line: 16, column: 13, scope: !666)
!686 = !DILocation(line: 16, column: 16, scope: !666)
!687 = !DILocation(line: 17, column: 19, scope: !666)
!688 = !DILocation(line: 17, column: 15, scope: !666)
!689 = !DILocation(line: 17, column: 10, scope: !666)
!690 = !DILocation(line: 17, column: 13, scope: !666)
!691 = distinct !{!691, !684, !687}
!692 = !DILocation(line: 18, column: 10, scope: !666)
!693 = !DILocation(line: 18, column: 3, scope: !666)
