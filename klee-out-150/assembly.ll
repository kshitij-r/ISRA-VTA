; ModuleID = 'gemm.bc'
source_filename = "gemm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@result = dso_local global [10 x i32] zeroinitializer, align 16, !dbg !0
@product = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !8
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !14
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !18
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !20
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !22
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !24
@acc_mem_base_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !29
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@__const.main.gemm_base = private unnamed_addr constant %struct.GEMM_STRUCT_REF { i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i32 0, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [31 x i8] c"acc_stage3[i] == acc_stage2[i]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"gemm.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"acc_stage1[i] == acc_stage2[i]\00", align 1

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
define dso_local i32* @_Z14matrixMultiplyPKjS0_(i32* %mat1, i32* %mat2) #0 !dbg !178 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res_index = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !184, metadata !DIExpression()), !dbg !185
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %res_index, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 0, i32* %res_index, align 4, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %res, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 0, i32* %res, align 4, !dbg !191
  call void @llvm.dbg.declare(metadata i32* %i, metadata !192, metadata !DIExpression()), !dbg !194
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !196
  %cmp = icmp slt i32 %0, 3, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !200
  %2 = load i32, i32* %i, align 4, !dbg !202
  %idxprom = sext i32 %2 to i64, !dbg !200
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !200
  %3 = load i32, i32* %arrayidx, align 4, !dbg !200
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !203
  %5 = load i32, i32* %i, align 4, !dbg !204
  %idxprom1 = sext i32 %5 to i64, !dbg !203
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !203
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !203
  %mul = mul i32 %3, %6, !dbg !205
  %7 = load i32, i32* %res, align 4, !dbg !206
  %add = add i32 %7, %mul, !dbg !206
  store i32 %add, i32* %res, align 4, !dbg !206
  %8 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %8, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !211
  %10 = load i32, i32* %res_index, align 4, !dbg !212
  %idxprom3 = sext i32 %10 to i64, !dbg !213
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @result, i64 0, i64 %idxprom3, !dbg !213
  store i32 %9, i32* %arrayidx4, align 4, !dbg !214
  %11 = load i32, i32* %res_index, align 4, !dbg !215
  %inc5 = add nsw i32 %11, 1, !dbg !215
  store i32 %inc5, i32* %res_index, align 4, !dbg !215
  ret i32* getelementptr inbounds ([10 x i32], [10 x i32]* @result, i64 0, i64 0), !dbg !216
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %myinsn) #0 !dbg !217 {
entry:
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %i26 = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %myinsn, metadata !232, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32* %row, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %col, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32* %i, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !240, metadata !DIExpression()), !dbg !241
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %myinsn, i32 0, i32 1, !dbg !242
  %0 = load i32, i32* %OPCODE, align 4, !dbg !242
  %cmp = icmp eq i32 %0, 2, !dbg !244
  br i1 %cmp, label %if.then, label %if.end, !dbg !245

if.then:                                          ; preds = %entry
  store i32 0, i32* %row, align 4, !dbg !246
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc23, %if.then
  %1 = load i32, i32* %row, align 4, !dbg !250
  %cmp1 = icmp ult i32 %1, 3, !dbg !252
  br i1 %cmp1, label %for.body, label %for.end25, !dbg !253

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %col, align 4, !dbg !254
  br label %for.cond2, !dbg !257

for.cond2:                                        ; preds = %for.end, %for.body
  %2 = load i32, i32* %col, align 4, !dbg !258
  %cmp3 = icmp ult i32 %2, 3, !dbg !260
  br i1 %cmp3, label %for.body4, label %for.inc23, !dbg !261

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %sum, align 4, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !264
  br label %for.cond5, !dbg !266

for.cond5:                                        ; preds = %for.body7, %for.body4
  %3 = load i32, i32* %i, align 4, !dbg !267
  %cmp6 = icmp ult i32 %3, 3, !dbg !269
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !270

for.body7:                                        ; preds = %for.cond5
  %4 = load i32, i32* %row, align 4, !dbg !271
  %idx.ext = zext i32 %4 to i64, !dbg !273
  %add.ptr = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), i64 %idx.ext, !dbg !273
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr, i64 0, i64 0, !dbg !274
  %5 = load i32, i32* %i, align 4, !dbg !275
  %idx.ext8 = zext i32 %5 to i64, !dbg !276
  %add.ptr9 = getelementptr inbounds i32, i32* %arraydecay, i64 %idx.ext8, !dbg !276
  %6 = load i32, i32* %add.ptr9, align 4, !dbg !277
  %7 = load i32, i32* %i, align 4, !dbg !278
  %idx.ext10 = zext i32 %7 to i64, !dbg !279
  %add.ptr11 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), i64 %idx.ext10, !dbg !279
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr11, i64 0, i64 0, !dbg !280
  %8 = load i32, i32* %col, align 4, !dbg !281
  %idx.ext13 = zext i32 %8 to i64, !dbg !282
  %add.ptr14 = getelementptr inbounds i32, i32* %arraydecay12, i64 %idx.ext13, !dbg !282
  %9 = load i32, i32* %add.ptr14, align 4, !dbg !283
  %mul = mul i32 %6, %9, !dbg !284
  %10 = load i32, i32* %sum, align 4, !dbg !285
  %add = add i32 %10, %mul, !dbg !285
  store i32 %add, i32* %sum, align 4, !dbg !285
  %11 = load i32, i32* %i, align 4, !dbg !286
  %inc = add i32 %11, 1, !dbg !286
  store i32 %inc, i32* %i, align 4, !dbg !286
  br label %for.cond5, !dbg !287, !llvm.loop !288

for.end:                                          ; preds = %for.cond5
  %12 = load i32, i32* %sum, align 4, !dbg !290
  %13 = load i32, i32* %row, align 4, !dbg !291
  %idx.ext15 = zext i32 %13 to i64, !dbg !292
  %add.ptr16 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 0), i64 %idx.ext15, !dbg !292
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr16, i64 0, i64 0, !dbg !293
  %14 = load i32, i32* %col, align 4, !dbg !294
  %idx.ext18 = zext i32 %14 to i64, !dbg !295
  %add.ptr19 = getelementptr inbounds i32, i32* %arraydecay17, i64 %idx.ext18, !dbg !295
  store i32 %12, i32* %add.ptr19, align 4, !dbg !296
  %15 = load i32, i32* %col, align 4, !dbg !297
  %inc21 = add i32 %15, 1, !dbg !297
  store i32 %inc21, i32* %col, align 4, !dbg !297
  br label %for.cond2, !dbg !298, !llvm.loop !299

for.inc23:                                        ; preds = %for.cond2
  %16 = load i32, i32* %row, align 4, !dbg !301
  %inc24 = add i32 %16, 1, !dbg !301
  store i32 %inc24, i32* %row, align 4, !dbg !301
  br label %for.cond, !dbg !302, !llvm.loop !303

for.end25:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !305, metadata !DIExpression()), !dbg !307
  store i32 0, i32* %i26, align 4, !dbg !307
  br label %for.cond27, !dbg !308

for.cond27:                                       ; preds = %for.inc42, %for.end25
  %17 = load i32, i32* %i26, align 4, !dbg !309
  %cmp28 = icmp slt i32 %17, 3, !dbg !311
  br i1 %cmp28, label %for.body29, label %if.end, !dbg !312

for.body29:                                       ; preds = %for.cond27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !313, metadata !DIExpression()), !dbg !316
  store i32 0, i32* %j, align 4, !dbg !316
  br label %for.cond30, !dbg !317

for.cond30:                                       ; preds = %for.body32, %for.body29
  %18 = load i32, i32* %j, align 4, !dbg !318
  %cmp31 = icmp slt i32 %18, 3, !dbg !320
  %19 = load i32, i32* %i26, align 4, !dbg !321
  br i1 %cmp31, label %for.body32, label %for.inc42, !dbg !322

for.body32:                                       ; preds = %for.cond30
  %idxprom = sext i32 %19 to i64, !dbg !323
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 %idxprom, !dbg !323
  %20 = load i32, i32* %j, align 4, !dbg !325
  %idxprom33 = sext i32 %20 to i64, !dbg !323
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom33, !dbg !323
  %21 = load i32, i32* %arrayidx34, align 4, !dbg !323
  %22 = load i32, i32* %i26, align 4, !dbg !326
  %mul35 = mul nsw i32 %22, 3, !dbg !327
  %23 = load i32, i32* %j, align 4, !dbg !328
  %add36 = add nsw i32 %mul35, %23, !dbg !329
  %idxprom37 = sext i32 %add36 to i64, !dbg !330
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 %idxprom37, !dbg !330
  store i32 %21, i32* %arrayidx38, align 4, !dbg !331
  %24 = load i32, i32* %j, align 4, !dbg !332
  %inc40 = add nsw i32 %24, 1, !dbg !332
  store i32 %inc40, i32* %j, align 4, !dbg !332
  br label %for.cond30, !dbg !333, !llvm.loop !334

for.inc42:                                        ; preds = %for.cond30
  %inc43 = add nsw i32 %19, 1, !dbg !336
  store i32 %inc43, i32* %i26, align 4, !dbg !336
  br label %for.cond27, !dbg !337, !llvm.loop !338

if.end:                                           ; preds = %for.cond27, %entry
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 0), !dbg !340
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* %mat1, [3 x i32]* %mat2, [3 x i32]* %res) #0 !dbg !341 {
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
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat1.addr, metadata !344, metadata !DIExpression()), !dbg !345
  store [3 x i32]* %mat2, [3 x i32]** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat2.addr, metadata !346, metadata !DIExpression()), !dbg !347
  store [3 x i32]* %res, [3 x i32]** %res.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %res.addr, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.declare(metadata i32* %i, metadata !350, metadata !DIExpression()), !dbg !352
  store i32 0, i32* %i, align 4, !dbg !352
  br label %for.cond, !dbg !353

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !354
  %cmp = icmp slt i32 %0, 3, !dbg !356
  br i1 %cmp, label %for.body, label %for.end22, !dbg !357

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !358, metadata !DIExpression()), !dbg !361
  store i32 0, i32* %j, align 4, !dbg !361
  br label %for.cond1, !dbg !362

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !363
  %cmp2 = icmp slt i32 %1, 3, !dbg !365
  br i1 %cmp2, label %for.body3, label %for.inc20, !dbg !366

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !367, metadata !DIExpression()), !dbg !370
  store i32 0, i32* %k, align 4, !dbg !370
  br label %for.cond4, !dbg !371

for.cond4:                                        ; preds = %for.body6, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !372
  %cmp5 = icmp slt i32 %2, 3, !dbg !374
  br i1 %cmp5, label %for.body6, label %for.inc17, !dbg !375

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !376
  %idxprom = sext i32 %3 to i64, !dbg !378
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 %idxprom, !dbg !378
  %4 = load i32, i32* %k, align 4, !dbg !379
  %idxprom7 = sext i32 %4 to i64, !dbg !378
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !378
  %5 = load i32, i32* %arrayidx8, align 4, !dbg !378
  %6 = load i32, i32* %k, align 4, !dbg !380
  %idxprom9 = sext i32 %6 to i64, !dbg !381
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 %idxprom9, !dbg !381
  %7 = load i32, i32* %j, align 4, !dbg !382
  %idxprom11 = sext i32 %7 to i64, !dbg !381
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 %idxprom11, !dbg !381
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !381
  %mul = mul i32 %5, %8, !dbg !383
  %9 = load i32, i32* %i, align 4, !dbg !384
  %idxprom13 = sext i32 %9 to i64, !dbg !385
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom13, !dbg !385
  %10 = load i32, i32* %j, align 4, !dbg !386
  %idxprom15 = sext i32 %10 to i64, !dbg !385
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 %idxprom15, !dbg !385
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !387
  %add = add i32 %11, %mul, !dbg !387
  store i32 %add, i32* %arrayidx16, align 4, !dbg !387
  %12 = load i32, i32* %k, align 4, !dbg !388
  %inc = add nsw i32 %12, 1, !dbg !388
  store i32 %inc, i32* %k, align 4, !dbg !388
  br label %for.cond4, !dbg !389, !llvm.loop !390

for.inc17:                                        ; preds = %for.cond4
  %13 = load i32, i32* %j, align 4, !dbg !392
  %inc18 = add nsw i32 %13, 1, !dbg !392
  store i32 %inc18, i32* %j, align 4, !dbg !392
  br label %for.cond1, !dbg !393, !llvm.loop !394

for.inc20:                                        ; preds = %for.cond1
  %14 = load i32, i32* %i, align 4, !dbg !396
  %inc21 = add nsw i32 %14, 1, !dbg !396
  store i32 %inc21, i32* %i, align 4, !dbg !396
  br label %for.cond, !dbg !397, !llvm.loop !398

for.end22:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !400, metadata !DIExpression()), !dbg !402
  store i32 0, i32* %i23, align 4, !dbg !402
  br label %for.cond24, !dbg !403

for.cond24:                                       ; preds = %for.inc42, %for.end22
  %15 = load i32, i32* %i23, align 4, !dbg !404
  %cmp25 = icmp slt i32 %15, 3, !dbg !406
  br i1 %cmp25, label %for.body26, label %for.end44, !dbg !407

for.body26:                                       ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i32* %j27, metadata !408, metadata !DIExpression()), !dbg !411
  store i32 0, i32* %j27, align 4, !dbg !411
  br label %for.cond28, !dbg !412

for.cond28:                                       ; preds = %for.body30, %for.body26
  %16 = load i32, i32* %j27, align 4, !dbg !413
  %cmp29 = icmp slt i32 %16, 3, !dbg !415
  %17 = load i32, i32* %i23, align 4, !dbg !416
  br i1 %cmp29, label %for.body30, label %for.inc42, !dbg !417

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %17 to i64, !dbg !418
  %arrayidx32 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom31, !dbg !418
  %18 = load i32, i32* %j27, align 4, !dbg !420
  %idxprom33 = sext i32 %18 to i64, !dbg !418
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !418
  %19 = load i32, i32* %arrayidx34, align 4, !dbg !418
  %20 = load i32, i32* %i23, align 4, !dbg !421
  %mul35 = mul nsw i32 %20, 3, !dbg !422
  %21 = load i32, i32* %j27, align 4, !dbg !423
  %add36 = add nsw i32 %mul35, %21, !dbg !424
  %idxprom37 = sext i32 %add36 to i64, !dbg !425
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 %idxprom37, !dbg !425
  store i32 %19, i32* %arrayidx38, align 4, !dbg !426
  %22 = load i32, i32* %j27, align 4, !dbg !427
  %inc40 = add nsw i32 %22, 1, !dbg !427
  store i32 %inc40, i32* %j27, align 4, !dbg !427
  br label %for.cond28, !dbg !428, !llvm.loop !429

for.inc42:                                        ; preds = %for.cond28
  %inc43 = add nsw i32 %17, 1, !dbg !431
  store i32 %inc43, i32* %i23, align 4, !dbg !431
  br label %for.cond24, !dbg !432, !llvm.loop !433

for.end44:                                        ; preds = %for.cond24
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 0), !dbg !435
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !436 {
entry:
  %arr_ref = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !437, metadata !DIExpression()), !dbg !438
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !439, metadata !DIExpression()), !dbg !440
  store i32* null, i32** %arr_ref, align 8, !dbg !440
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !441, metadata !DIExpression()), !dbg !442
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !443, metadata !DIExpression()), !dbg !444
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 1, !dbg !445
  %0 = load i32, i32* %OPCODE, align 4, !dbg !445
  %cmp = icmp eq i32 %0, 2, !dbg !447
  br i1 %cmp, label %if.then, label %if.end, !dbg !448

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !449, metadata !DIExpression()), !dbg !452
  store i32 0, i32* %i, align 4, !dbg !452
  br label %for.cond, !dbg !453

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !454
  %cmp1 = icmp slt i32 %1, 3, !dbg !456
  br i1 %cmp1, label %for.body, label %for.end, !dbg !457

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !458
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !460
  %2 = load i32*, i32** %inp_mem, align 8, !dbg !460
  %3 = load i32, i32* %i, align 4, !dbg !461
  %idx.ext = sext i32 %3 to i64, !dbg !462
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %idx.ext, !dbg !462
  %4 = load i32, i32* %add.ptr, align 4, !dbg !463
  %5 = load i32, i32* %i, align 4, !dbg !464
  %idxprom = sext i32 %5 to i64, !dbg !465
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !465
  store i32 %4, i32* %arrayidx, align 4, !dbg !466
  %6 = load i32, i32* %i, align 4, !dbg !467
  %inc = add nsw i32 %6, 1, !dbg !467
  store i32 %inc, i32* %i, align 4, !dbg !467
  br label %for.cond, !dbg !468, !llvm.loop !469

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !471, metadata !DIExpression()), !dbg !473
  store i32 0, i32* %i2, align 4, !dbg !473
  br label %for.cond3, !dbg !474

for.cond3:                                        ; preds = %for.body5, %for.end
  %7 = load i32, i32* %i2, align 4, !dbg !475
  %cmp4 = icmp slt i32 %7, 3, !dbg !477
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !478

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !479
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS6, i32 0, i32 1, !dbg !481
  %8 = load i32*, i32** %wgt_mem, align 8, !dbg !481
  %9 = load i32, i32* %i2, align 4, !dbg !482
  %idx.ext7 = sext i32 %9 to i64, !dbg !483
  %add.ptr8 = getelementptr inbounds i32, i32* %8, i64 %idx.ext7, !dbg !483
  %10 = load i32, i32* %add.ptr8, align 4, !dbg !484
  %11 = load i32, i32* %i2, align 4, !dbg !485
  %idxprom9 = sext i32 %11 to i64, !dbg !486
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom9, !dbg !486
  store i32 %10, i32* %arrayidx10, align 4, !dbg !487
  %12 = load i32, i32* %i2, align 4, !dbg !488
  %inc12 = add nsw i32 %12, 1, !dbg !488
  store i32 %inc12, i32* %i2, align 4, !dbg !488
  br label %for.cond3, !dbg !489, !llvm.loop !490

for.end13:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !492
  %arraydecay14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !493
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay14), !dbg !494
  store i32* %call, i32** %arr_ref, align 8, !dbg !495
  br label %if.end, !dbg !496

if.end:                                           ; preds = %for.end13, %entry
  %13 = load i32*, i32** %arr_ref, align 8, !dbg !497
  ret i32* %13, !dbg !498
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !499 {
entry:
  %arr_val = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !513, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !515, metadata !DIExpression()), !dbg !516
  store i32* null, i32** %arr_val, align 8, !dbg !516
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !517, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !519, metadata !DIExpression()), !dbg !520
  %OPCODE = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 1, !dbg !521
  %0 = load i32, i32* %OPCODE, align 4, !dbg !521
  %cmp = icmp eq i32 %0, 2, !dbg !523
  br i1 %cmp, label %if.then, label %if.end, !dbg !524

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !525, metadata !DIExpression()), !dbg !528
  store i32 0, i32* %i, align 4, !dbg !528
  br label %for.cond, !dbg !529

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !530
  %cmp1 = icmp slt i32 %1, 3, !dbg !532
  br i1 %cmp1, label %for.body, label %for.end, !dbg !533

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !534
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !536
  %2 = load i32, i32* %inp_mem, align 4, !dbg !536
  %3 = load i32, i32* %i, align 4, !dbg !537
  %add = add i32 %2, %3, !dbg !538
  %4 = load i32, i32* %i, align 4, !dbg !539
  %idxprom = sext i32 %4 to i64, !dbg !540
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !540
  store i32 %add, i32* %arrayidx, align 4, !dbg !541
  %5 = load i32, i32* %i, align 4, !dbg !542
  %inc = add nsw i32 %5, 1, !dbg !542
  store i32 %inc, i32* %i, align 4, !dbg !542
  br label %for.cond, !dbg !543, !llvm.loop !544

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !546, metadata !DIExpression()), !dbg !548
  store i32 0, i32* %i2, align 4, !dbg !548
  br label %for.cond3, !dbg !549

for.cond3:                                        ; preds = %for.body5, %for.end
  %6 = load i32, i32* %i2, align 4, !dbg !550
  %cmp4 = icmp slt i32 %6, 3, !dbg !552
  br i1 %cmp4, label %for.body5, label %for.end11, !dbg !553

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !554
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS6, i32 0, i32 1, !dbg !556
  %7 = load i32, i32* %wgt_mem, align 4, !dbg !556
  %8 = load i32, i32* %i2, align 4, !dbg !557
  %idxprom7 = sext i32 %8 to i64, !dbg !558
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom7, !dbg !558
  store i32 %7, i32* %arrayidx8, align 4, !dbg !559
  %9 = load i32, i32* %i2, align 4, !dbg !560
  %inc10 = add nsw i32 %9, 1, !dbg !560
  store i32 %inc10, i32* %i2, align 4, !dbg !560
  br label %for.cond3, !dbg !561, !llvm.loop !562

for.end11:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !564
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !565
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay12), !dbg !566
  store i32* %call, i32** %arr_val, align 8, !dbg !567
  br label %if.end, !dbg !568

if.end:                                           ; preds = %for.end11, %entry
  %10 = load i32*, i32** %arr_val, align 8, !dbg !569
  ret i32* %10, !dbg !570
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !571 {
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
  %acc_stage1 = alloca [9 x i32], align 16
  %acc_stage2 = alloca [9 x i32], align 16
  %acc_stage3 = alloca [9 x i32], align 16
  %gemm_base = alloca %struct.GEMM_STRUCT_REF, align 8
  %instruction = alloca %struct.INSTR, align 8
  %gemm_uop = alloca [9 x %struct.GEMM_STRUCT_REF], align 16
  %gemm = alloca [9 x %struct.GEMM_STRUCT_VAL], align 16
  %microop = alloca [9 x %struct.INSTR], align 16
  %microop_val = alloca [9 x %struct.INSTR_VAL], align 16
  %agg.tmp = alloca %struct.INSTR, align 8
  %i = alloca i32, align 4
  %i242 = alloca i32, align 4
  %agg.tmp246 = alloca %struct.INSTR, align 8
  %i257 = alloca i32, align 4
  %agg.tmp261 = alloca %struct.INSTR_VAL, align 8
  %i272 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !575, metadata !DIExpression()), !dbg !576
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !577, metadata !DIExpression()), !dbg !578
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !581, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !583, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !585, metadata !DIExpression()), !dbg !586
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !587, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !595, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !601, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !605, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !607, metadata !DIExpression()), !dbg !608
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !609, metadata !DIExpression()), !dbg !610
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !611, metadata !DIExpression()), !dbg !612
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !613
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !614
  %0 = bitcast i32* %arraydecay to i8*, !dbg !614
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !614
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !615
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !615
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !615
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !616
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !616
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !616
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !617
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !617
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !617
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !618
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !618
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !618
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !619
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !619
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !619
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !620
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !620
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !620
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !621
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !621
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !621
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !622
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !622
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !622
  %18 = bitcast i32* %op_type to i8*, !dbg !623
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !624
  %19 = bitcast i32* %opcode to i8*, !dbg !625
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !626
  call void @llvm.dbg.declare(metadata %struct.GEMM_STRUCT_REF* %gemm_base, metadata !627, metadata !DIExpression()), !dbg !628
  %20 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !628
  %21 = call i8* @memcpy(i8* %20, i8* bitcast (%struct.GEMM_STRUCT_REF* @__const.main.gemm_base to i8*), i64 24), !dbg !628
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instruction, metadata !629, metadata !DIExpression()), !dbg !630
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 0, !dbg !631
  store i32 0, i32* %ID, align 8, !dbg !631
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 1, !dbg !631
  store i32 2, i32* %OPCODE, align 4, !dbg !631
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 2, !dbg !631
  store i32 0, i32* %OPTYPE, align 8, !dbg !631
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 3, !dbg !631
  %22 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !632
  %23 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !632
  %24 = call i8* @memcpy(i8* %22, i8* %23, i64 24), !dbg !632
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !633, metadata !DIExpression()), !dbg !635
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !636
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !637
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !638
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !637
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !637
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !639
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !637
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !637
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !640
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !637
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !636
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !641
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !642
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !641
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !641
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !643
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !641
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !641
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !644
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !641
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !636
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !645
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !646
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !645
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !645
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !647
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !645
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !645
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !648
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !645
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !636
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !649
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !650
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !649
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !649
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !651
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !649
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !649
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !652
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !649
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !636
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !653
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !654
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !653
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !653
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !655
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !653
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !653
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !656
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !653
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !636
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !657
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !658
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !657
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !657
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !659
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !657
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !657
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !660
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !657
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !636
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !661
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !662
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !661
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !661
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !663
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !661
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !661
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !664
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !661
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !636
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !665
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !666
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !665
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !665
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !667
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !665
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !665
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !668
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !665
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !636
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !669
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !670
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !669
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !669
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !671
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !669
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !669
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !672
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !669
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !673, metadata !DIExpression()), !dbg !675
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !676
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !677
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !678
  %25 = load i32, i32* %arrayidx68, align 4, !dbg !678
  store i32 %25, i32* %inp_mem67, align 4, !dbg !677
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !677
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !679
  %26 = load i32, i32* %arrayidx70, align 4, !dbg !679
  store i32 %26, i32* %wgt_mem69, align 4, !dbg !677
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !677
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !680
  %27 = load i32, i32* %arrayidx72, align 4, !dbg !680
  store i32 %27, i32* %acc_mem71, align 4, !dbg !677
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !676
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !681
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !682
  %28 = load i32, i32* %arrayidx75, align 4, !dbg !682
  store i32 %28, i32* %inp_mem74, align 4, !dbg !681
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !681
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !683
  %29 = load i32, i32* %arrayidx77, align 4, !dbg !683
  store i32 %29, i32* %wgt_mem76, align 4, !dbg !681
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !681
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !684
  %30 = load i32, i32* %arrayidx79, align 4, !dbg !684
  store i32 %30, i32* %acc_mem78, align 4, !dbg !681
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !676
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !685
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !686
  %31 = load i32, i32* %arrayidx82, align 4, !dbg !686
  store i32 %31, i32* %inp_mem81, align 4, !dbg !685
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !685
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !687
  %32 = load i32, i32* %arrayidx84, align 4, !dbg !687
  store i32 %32, i32* %wgt_mem83, align 4, !dbg !685
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !685
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !688
  %33 = load i32, i32* %arrayidx86, align 4, !dbg !688
  store i32 %33, i32* %acc_mem85, align 4, !dbg !685
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !676
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !689
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !690
  %34 = load i32, i32* %arrayidx89, align 4, !dbg !690
  store i32 %34, i32* %inp_mem88, align 4, !dbg !689
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !689
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !691
  %35 = load i32, i32* %arrayidx91, align 4, !dbg !691
  store i32 %35, i32* %wgt_mem90, align 4, !dbg !689
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !689
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !692
  %36 = load i32, i32* %arrayidx93, align 4, !dbg !692
  store i32 %36, i32* %acc_mem92, align 4, !dbg !689
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !676
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !693
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !694
  %37 = load i32, i32* %arrayidx96, align 4, !dbg !694
  store i32 %37, i32* %inp_mem95, align 4, !dbg !693
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !693
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !695
  %38 = load i32, i32* %arrayidx98, align 4, !dbg !695
  store i32 %38, i32* %wgt_mem97, align 4, !dbg !693
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !693
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !696
  %39 = load i32, i32* %arrayidx100, align 4, !dbg !696
  store i32 %39, i32* %acc_mem99, align 4, !dbg !693
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !676
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !697
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !698
  %40 = load i32, i32* %arrayidx103, align 4, !dbg !698
  store i32 %40, i32* %inp_mem102, align 4, !dbg !697
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !697
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !699
  %41 = load i32, i32* %arrayidx105, align 4, !dbg !699
  store i32 %41, i32* %wgt_mem104, align 4, !dbg !697
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !697
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !700
  %42 = load i32, i32* %arrayidx107, align 4, !dbg !700
  store i32 %42, i32* %acc_mem106, align 4, !dbg !697
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !676
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !701
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !702
  %43 = load i32, i32* %arrayidx110, align 4, !dbg !702
  store i32 %43, i32* %inp_mem109, align 4, !dbg !701
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !701
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !703
  %44 = load i32, i32* %arrayidx112, align 4, !dbg !703
  store i32 %44, i32* %wgt_mem111, align 4, !dbg !701
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !701
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !704
  %45 = load i32, i32* %arrayidx114, align 4, !dbg !704
  store i32 %45, i32* %acc_mem113, align 4, !dbg !701
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !676
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !705
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !706
  %46 = load i32, i32* %arrayidx117, align 4, !dbg !706
  store i32 %46, i32* %inp_mem116, align 4, !dbg !705
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !705
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !707
  %47 = load i32, i32* %arrayidx119, align 4, !dbg !707
  store i32 %47, i32* %wgt_mem118, align 4, !dbg !705
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !705
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !708
  %48 = load i32, i32* %arrayidx121, align 4, !dbg !708
  store i32 %48, i32* %acc_mem120, align 4, !dbg !705
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !676
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !709
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !710
  %49 = load i32, i32* %arrayidx124, align 4, !dbg !710
  store i32 %49, i32* %inp_mem123, align 4, !dbg !709
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !709
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !711
  %50 = load i32, i32* %arrayidx126, align 4, !dbg !711
  store i32 %50, i32* %wgt_mem125, align 4, !dbg !709
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !709
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !712
  %51 = load i32, i32* %arrayidx128, align 4, !dbg !712
  store i32 %51, i32* %acc_mem127, align 4, !dbg !709
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !713, metadata !DIExpression()), !dbg !715
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !716
  %ID130 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !717
  store i32 0, i32* %ID130, align 8, !dbg !717
  %OPCODE131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !717
  store i32 2, i32* %OPCODE131, align 4, !dbg !717
  %OPTYPE132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !717
  store i32 0, i32* %OPTYPE132, align 8, !dbg !717
  %OPERANDS133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !717
  %arrayidx134 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !718
  %52 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS133 to i8*, !dbg !718
  %53 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx134 to i8*, !dbg !718
  %54 = call i8* @memcpy(i8* %52, i8* %53, i64 24), !dbg !718
  %arrayinit.element135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !716
  %ID136 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 0, !dbg !719
  store i32 1, i32* %ID136, align 8, !dbg !719
  %OPCODE137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 1, !dbg !719
  store i32 2, i32* %OPCODE137, align 4, !dbg !719
  %OPTYPE138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 2, !dbg !719
  store i32 0, i32* %OPTYPE138, align 8, !dbg !719
  %OPERANDS139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 3, !dbg !719
  %arrayidx140 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !720
  %55 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS139 to i8*, !dbg !720
  %56 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx140 to i8*, !dbg !720
  %57 = call i8* @memcpy(i8* %55, i8* %56, i64 24), !dbg !720
  %arrayinit.element141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i64 1, !dbg !716
  %ID142 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 0, !dbg !721
  store i32 2, i32* %ID142, align 8, !dbg !721
  %OPCODE143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 1, !dbg !721
  store i32 2, i32* %OPCODE143, align 4, !dbg !721
  %OPTYPE144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 2, !dbg !721
  store i32 0, i32* %OPTYPE144, align 8, !dbg !721
  %OPERANDS145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 3, !dbg !721
  %arrayidx146 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !722
  %58 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS145 to i8*, !dbg !722
  %59 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx146 to i8*, !dbg !722
  %60 = call i8* @memcpy(i8* %58, i8* %59, i64 24), !dbg !722
  %arrayinit.element147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i64 1, !dbg !716
  %ID148 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 0, !dbg !723
  store i32 3, i32* %ID148, align 8, !dbg !723
  %OPCODE149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 1, !dbg !723
  store i32 2, i32* %OPCODE149, align 4, !dbg !723
  %OPTYPE150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 2, !dbg !723
  store i32 0, i32* %OPTYPE150, align 8, !dbg !723
  %OPERANDS151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 3, !dbg !723
  %arrayidx152 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !724
  %61 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS151 to i8*, !dbg !724
  %62 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx152 to i8*, !dbg !724
  %63 = call i8* @memcpy(i8* %61, i8* %62, i64 24), !dbg !724
  %arrayinit.element153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i64 1, !dbg !716
  %ID154 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 0, !dbg !725
  store i32 4, i32* %ID154, align 8, !dbg !725
  %OPCODE155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 1, !dbg !725
  store i32 2, i32* %OPCODE155, align 4, !dbg !725
  %OPTYPE156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 2, !dbg !725
  store i32 0, i32* %OPTYPE156, align 8, !dbg !725
  %OPERANDS157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 3, !dbg !725
  %arrayidx158 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !726
  %64 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS157 to i8*, !dbg !726
  %65 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx158 to i8*, !dbg !726
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 24), !dbg !726
  %arrayinit.element159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i64 1, !dbg !716
  %ID160 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 0, !dbg !727
  store i32 5, i32* %ID160, align 8, !dbg !727
  %OPCODE161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 1, !dbg !727
  store i32 2, i32* %OPCODE161, align 4, !dbg !727
  %OPTYPE162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 2, !dbg !727
  store i32 0, i32* %OPTYPE162, align 8, !dbg !727
  %OPERANDS163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 3, !dbg !727
  %arrayidx164 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !728
  %67 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS163 to i8*, !dbg !728
  %68 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx164 to i8*, !dbg !728
  %69 = call i8* @memcpy(i8* %67, i8* %68, i64 24), !dbg !728
  %arrayinit.element165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i64 1, !dbg !716
  %ID166 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 0, !dbg !729
  store i32 6, i32* %ID166, align 8, !dbg !729
  %OPCODE167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 1, !dbg !729
  store i32 2, i32* %OPCODE167, align 4, !dbg !729
  %OPTYPE168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 2, !dbg !729
  store i32 0, i32* %OPTYPE168, align 8, !dbg !729
  %OPERANDS169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 3, !dbg !729
  %arrayidx170 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !730
  %70 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS169 to i8*, !dbg !730
  %71 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx170 to i8*, !dbg !730
  %72 = call i8* @memcpy(i8* %70, i8* %71, i64 24), !dbg !730
  %arrayinit.element171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i64 1, !dbg !716
  %ID172 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 0, !dbg !731
  store i32 7, i32* %ID172, align 8, !dbg !731
  %OPCODE173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 1, !dbg !731
  store i32 2, i32* %OPCODE173, align 4, !dbg !731
  %OPTYPE174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 2, !dbg !731
  store i32 0, i32* %OPTYPE174, align 8, !dbg !731
  %OPERANDS175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 3, !dbg !731
  %arrayidx176 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !732
  %73 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS175 to i8*, !dbg !732
  %74 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx176 to i8*, !dbg !732
  %75 = call i8* @memcpy(i8* %73, i8* %74, i64 24), !dbg !732
  %arrayinit.element177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i64 1, !dbg !716
  %ID178 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 0, !dbg !733
  store i32 8, i32* %ID178, align 8, !dbg !733
  %OPCODE179 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 1, !dbg !733
  store i32 2, i32* %OPCODE179, align 4, !dbg !733
  %OPTYPE180 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 2, !dbg !733
  store i32 0, i32* %OPTYPE180, align 8, !dbg !733
  %OPERANDS181 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 3, !dbg !733
  %arrayidx182 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !734
  %76 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS181 to i8*, !dbg !734
  %77 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx182 to i8*, !dbg !734
  %78 = call i8* @memcpy(i8* %76, i8* %77, i64 24), !dbg !734
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !735, metadata !DIExpression()), !dbg !737
  %arrayinit.begin183 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !738
  %ID184 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 0, !dbg !739
  store i32 0, i32* %ID184, align 8, !dbg !739
  %OPCODE185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 1, !dbg !739
  store i32 2, i32* %OPCODE185, align 4, !dbg !739
  %OPTYPE186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 2, !dbg !739
  store i32 0, i32* %OPTYPE186, align 8, !dbg !739
  %OPERANDS187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 3, !dbg !739
  %arrayidx188 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !740
  %79 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS187 to i8*, !dbg !740
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx188 to i8*, !dbg !740
  %81 = call i8* @memcpy(i8* %79, i8* %80, i64 12), !dbg !740
  %arrayinit.element189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i64 1, !dbg !738
  %ID190 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 0, !dbg !741
  store i32 1, i32* %ID190, align 8, !dbg !741
  %OPCODE191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 1, !dbg !741
  store i32 2, i32* %OPCODE191, align 4, !dbg !741
  %OPTYPE192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 2, !dbg !741
  store i32 0, i32* %OPTYPE192, align 8, !dbg !741
  %OPERANDS193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 3, !dbg !741
  %arrayidx194 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !742
  %82 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS193 to i8*, !dbg !742
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx194 to i8*, !dbg !742
  %84 = call i8* @memcpy(i8* %82, i8* %83, i64 12), !dbg !742
  %arrayinit.element195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i64 1, !dbg !738
  %ID196 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 0, !dbg !743
  store i32 2, i32* %ID196, align 8, !dbg !743
  %OPCODE197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 1, !dbg !743
  store i32 2, i32* %OPCODE197, align 4, !dbg !743
  %OPTYPE198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 2, !dbg !743
  store i32 0, i32* %OPTYPE198, align 8, !dbg !743
  %OPERANDS199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 3, !dbg !743
  %arrayidx200 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !744
  %85 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS199 to i8*, !dbg !744
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx200 to i8*, !dbg !744
  %87 = call i8* @memcpy(i8* %85, i8* %86, i64 12), !dbg !744
  %arrayinit.element201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i64 1, !dbg !738
  %ID202 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 0, !dbg !745
  store i32 3, i32* %ID202, align 8, !dbg !745
  %OPCODE203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 1, !dbg !745
  store i32 2, i32* %OPCODE203, align 4, !dbg !745
  %OPTYPE204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 2, !dbg !745
  store i32 0, i32* %OPTYPE204, align 8, !dbg !745
  %OPERANDS205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 3, !dbg !745
  %arrayidx206 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !746
  %88 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS205 to i8*, !dbg !746
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx206 to i8*, !dbg !746
  %90 = call i8* @memcpy(i8* %88, i8* %89, i64 12), !dbg !746
  %arrayinit.element207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i64 1, !dbg !738
  %ID208 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 0, !dbg !747
  store i32 4, i32* %ID208, align 8, !dbg !747
  %OPCODE209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 1, !dbg !747
  store i32 2, i32* %OPCODE209, align 4, !dbg !747
  %OPTYPE210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 2, !dbg !747
  store i32 0, i32* %OPTYPE210, align 8, !dbg !747
  %OPERANDS211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 3, !dbg !747
  %arrayidx212 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !748
  %91 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS211 to i8*, !dbg !748
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx212 to i8*, !dbg !748
  %93 = call i8* @memcpy(i8* %91, i8* %92, i64 12), !dbg !748
  %arrayinit.element213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i64 1, !dbg !738
  %ID214 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 0, !dbg !749
  store i32 5, i32* %ID214, align 8, !dbg !749
  %OPCODE215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 1, !dbg !749
  store i32 2, i32* %OPCODE215, align 4, !dbg !749
  %OPTYPE216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 2, !dbg !749
  store i32 0, i32* %OPTYPE216, align 8, !dbg !749
  %OPERANDS217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 3, !dbg !749
  %arrayidx218 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !750
  %94 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS217 to i8*, !dbg !750
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx218 to i8*, !dbg !750
  %96 = call i8* @memcpy(i8* %94, i8* %95, i64 12), !dbg !750
  %arrayinit.element219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i64 1, !dbg !738
  %ID220 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 0, !dbg !751
  store i32 6, i32* %ID220, align 8, !dbg !751
  %OPCODE221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 1, !dbg !751
  store i32 2, i32* %OPCODE221, align 4, !dbg !751
  %OPTYPE222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 2, !dbg !751
  store i32 0, i32* %OPTYPE222, align 8, !dbg !751
  %OPERANDS223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 3, !dbg !751
  %arrayidx224 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !752
  %97 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS223 to i8*, !dbg !752
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx224 to i8*, !dbg !752
  %99 = call i8* @memcpy(i8* %97, i8* %98, i64 12), !dbg !752
  %arrayinit.element225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i64 1, !dbg !738
  %ID226 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 0, !dbg !753
  store i32 7, i32* %ID226, align 8, !dbg !753
  %OPCODE227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 1, !dbg !753
  store i32 2, i32* %OPCODE227, align 4, !dbg !753
  %OPTYPE228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 2, !dbg !753
  store i32 0, i32* %OPTYPE228, align 8, !dbg !753
  %OPERANDS229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 3, !dbg !753
  %arrayidx230 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !754
  %100 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS229 to i8*, !dbg !754
  %101 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx230 to i8*, !dbg !754
  %102 = call i8* @memcpy(i8* %100, i8* %101, i64 12), !dbg !754
  %arrayinit.element231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i64 1, !dbg !738
  %ID232 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 0, !dbg !755
  store i32 8, i32* %ID232, align 8, !dbg !755
  %OPCODE233 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 1, !dbg !755
  store i32 2, i32* %OPCODE233, align 4, !dbg !755
  %OPTYPE234 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 2, !dbg !755
  store i32 0, i32* %OPTYPE234, align 8, !dbg !755
  %OPERANDS235 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 3, !dbg !755
  %arrayidx236 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !756
  %103 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS235 to i8*, !dbg !756
  %104 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx236 to i8*, !dbg !756
  %105 = call i8* @memcpy(i8* %103, i8* %104, i64 12), !dbg !756
  %106 = load i32, i32* %opcode, align 4, !dbg !757
  %cmp = icmp eq i32 %106, 2, !dbg !759
  %107 = load i32, i32* %op_type, align 4, !dbg !760
  %cmp237 = icmp eq i32 %107, 0, !dbg !761
  %or.cond = and i1 %cmp, %cmp237, !dbg !762
  br i1 %or.cond, label %if.then, label %if.end, !dbg !762

if.then:                                          ; preds = %entry
  %108 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !763
  %109 = bitcast %struct.INSTR* %instruction to i8*, !dbg !763
  %110 = call i8* @memcpy(i8* %108, i8* %109, i64 40), !dbg !763
  %call = call i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !765
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !766
  call void @llvm.dbg.declare(metadata i32* %i, metadata !767, metadata !DIExpression()), !dbg !769
  store i32 0, i32* %i, align 4, !dbg !769
  br label %for.cond, !dbg !770

for.cond:                                         ; preds = %for.body, %if.then
  %111 = load i32, i32* %i, align 4, !dbg !771
  %cmp238 = icmp slt i32 %111, 9, !dbg !773
  br i1 %cmp238, label %for.body, label %for.end, !dbg !774

for.body:                                         ; preds = %for.cond
  %112 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !775
  %113 = load i32, i32* %i, align 4, !dbg !777
  %idxprom = sext i32 %113 to i64, !dbg !775
  %arrayidx239 = getelementptr inbounds i32, i32* %112, i64 %idxprom, !dbg !775
  %114 = load i32, i32* %arrayidx239, align 4, !dbg !775
  %115 = load i32, i32* %i, align 4, !dbg !778
  %idxprom240 = sext i32 %115 to i64, !dbg !779
  %arrayidx241 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom240, !dbg !779
  store i32 %114, i32* %arrayidx241, align 4, !dbg !780
  %116 = load i32, i32* %i, align 4, !dbg !781
  %inc = add nsw i32 %116, 1, !dbg !781
  store i32 %inc, i32* %i, align 4, !dbg !781
  br label %for.cond, !dbg !782, !llvm.loop !783

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i242, metadata !785, metadata !DIExpression()), !dbg !787
  store i32 0, i32* %i242, align 4, !dbg !787
  br label %for.cond243, !dbg !788

for.cond243:                                      ; preds = %for.body245, %for.end
  %117 = load i32, i32* %i242, align 4, !dbg !789
  %cmp244 = icmp slt i32 %117, 9, !dbg !791
  br i1 %cmp244, label %for.body245, label %for.end256, !dbg !792

for.body245:                                      ; preds = %for.cond243
  %118 = load i32, i32* %i242, align 4, !dbg !793
  %idxprom247 = sext i32 %118 to i64, !dbg !795
  %arrayidx248 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom247, !dbg !795
  %119 = bitcast %struct.INSTR* %agg.tmp246 to i8*, !dbg !795
  %120 = bitcast %struct.INSTR* %arrayidx248 to i8*, !dbg !795
  %121 = call i8* @memcpy(i8* %119, i8* %120, i64 40), !dbg !795
  %call249 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp246), !dbg !796
  store i32* %call249, i32** %acc_mem_ref, align 8, !dbg !797
  %122 = load i32*, i32** %acc_mem_ref, align 8, !dbg !798
  %123 = load i32, i32* %i242, align 4, !dbg !799
  %idxprom250 = sext i32 %123 to i64, !dbg !798
  %arrayidx251 = getelementptr inbounds i32, i32* %122, i64 %idxprom250, !dbg !798
  %124 = load i32, i32* %arrayidx251, align 4, !dbg !798
  %125 = load i32, i32* %i242, align 4, !dbg !800
  %idxprom252 = sext i32 %125 to i64, !dbg !801
  %arrayidx253 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom252, !dbg !801
  store i32 %124, i32* %arrayidx253, align 4, !dbg !802
  %126 = load i32, i32* %i242, align 4, !dbg !803
  %inc255 = add nsw i32 %126, 1, !dbg !803
  store i32 %inc255, i32* %i242, align 4, !dbg !803
  br label %for.cond243, !dbg !804, !llvm.loop !805

for.end256:                                       ; preds = %for.cond243
  call void @llvm.dbg.declare(metadata i32* %i257, metadata !807, metadata !DIExpression()), !dbg !809
  store i32 0, i32* %i257, align 4, !dbg !809
  br label %for.cond258, !dbg !810

for.cond258:                                      ; preds = %for.body260, %for.end256
  %127 = load i32, i32* %i257, align 4, !dbg !811
  %cmp259 = icmp slt i32 %127, 9, !dbg !813
  br i1 %cmp259, label %for.body260, label %for.end271, !dbg !814

for.body260:                                      ; preds = %for.cond258
  %128 = load i32, i32* %i257, align 4, !dbg !815
  %idxprom262 = sext i32 %128 to i64, !dbg !817
  %arrayidx263 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom262, !dbg !817
  %129 = bitcast %struct.INSTR_VAL* %agg.tmp261 to i8*, !dbg !817
  %130 = bitcast %struct.INSTR_VAL* %arrayidx263 to i8*, !dbg !817
  %131 = call i8* @memcpy(i8* %129, i8* %130, i64 24), !dbg !817
  %call264 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp261), !dbg !818
  store i32* %call264, i32** %acc_mem_val, align 8, !dbg !819
  %132 = load i32*, i32** %acc_mem_val, align 8, !dbg !820
  %133 = load i32, i32* %i257, align 4, !dbg !821
  %idxprom265 = sext i32 %133 to i64, !dbg !820
  %arrayidx266 = getelementptr inbounds i32, i32* %132, i64 %idxprom265, !dbg !820
  %134 = load i32, i32* %arrayidx266, align 4, !dbg !820
  %135 = load i32, i32* %i257, align 4, !dbg !822
  %idxprom267 = sext i32 %135 to i64, !dbg !823
  %arrayidx268 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom267, !dbg !823
  store i32 %134, i32* %arrayidx268, align 4, !dbg !824
  %136 = load i32, i32* %i257, align 4, !dbg !825
  %inc270 = add nsw i32 %136, 1, !dbg !825
  store i32 %inc270, i32* %i257, align 4, !dbg !825
  br label %for.cond258, !dbg !826, !llvm.loop !827

for.end271:                                       ; preds = %for.cond258
  call void @llvm.dbg.declare(metadata i32* %i272, metadata !829, metadata !DIExpression()), !dbg !831
  store i32 0, i32* %i272, align 4, !dbg !831
  br label %for.cond273, !dbg !832

for.cond273:                                      ; preds = %for.inc289, %for.end271
  %137 = load i32, i32* %i272, align 4, !dbg !833
  %cmp274 = icmp slt i32 %137, 9, !dbg !835
  br i1 %cmp274, label %for.body275, label %if.end, !dbg !836

for.body275:                                      ; preds = %for.cond273
  %138 = load i32, i32* %i272, align 4, !dbg !837
  %idxprom276 = sext i32 %138 to i64, !dbg !837
  %arrayidx277 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom276, !dbg !837
  %139 = load i32, i32* %arrayidx277, align 4, !dbg !837
  %140 = load i32, i32* %i272, align 4, !dbg !837
  %idxprom278 = sext i32 %140 to i64, !dbg !837
  %arrayidx279 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom278, !dbg !837
  %141 = load i32, i32* %arrayidx279, align 4, !dbg !837
  %cmp280 = icmp eq i32 %139, %141, !dbg !837
  br i1 %cmp280, label %cond.end, label %cond.false, !dbg !837

cond.false:                                       ; preds = %for.body275
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 189, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !837
  unreachable, !dbg !837

cond.end:                                         ; preds = %for.body275
  %142 = load i32, i32* %i272, align 4, !dbg !839
  %idxprom281 = sext i32 %142 to i64, !dbg !839
  %arrayidx282 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom281, !dbg !839
  %143 = load i32, i32* %arrayidx282, align 4, !dbg !839
  %144 = load i32, i32* %i272, align 4, !dbg !839
  %idxprom283 = sext i32 %144 to i64, !dbg !839
  %arrayidx284 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom283, !dbg !839
  %145 = load i32, i32* %arrayidx284, align 4, !dbg !839
  %cmp285 = icmp eq i32 %143, %145, !dbg !839
  br i1 %cmp285, label %for.inc289, label %cond.false287, !dbg !839

cond.false287:                                    ; preds = %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 190, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !839
  unreachable, !dbg !839

for.inc289:                                       ; preds = %cond.end
  %146 = load i32, i32* %i272, align 4, !dbg !840
  %inc290 = add nsw i32 %146, 1, !dbg !840
  store i32 %inc290, i32* %i272, align 4, !dbg !840
  br label %for.cond273, !dbg !841, !llvm.loop !842

if.end:                                           ; preds = %for.cond273, %entry
  ret i32 0, !dbg !844
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !845 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !851, metadata !DIExpression()), !dbg !852
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !853, metadata !DIExpression()), !dbg !854
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !855, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.declare(metadata i8** %7, metadata !857, metadata !DIExpression()), !dbg !858
  %9 = load i8*, i8** %4, align 8, !dbg !859
  store i8* %9, i8** %7, align 8, !dbg !858
  call void @llvm.dbg.declare(metadata i8** %8, metadata !860, metadata !DIExpression()), !dbg !861
  %10 = load i8*, i8** %5, align 8, !dbg !862
  store i8* %10, i8** %8, align 8, !dbg !861
  br label %11, !dbg !863

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !864
  %13 = add i64 %12, -1, !dbg !864
  store i64 %13, i64* %6, align 8, !dbg !864
  %14 = icmp ugt i64 %12, 0, !dbg !865
  br i1 %14, label %15, label %21, !dbg !863

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !866
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !866
  store i8* %17, i8** %8, align 8, !dbg !866
  %18 = load i8, i8* %16, align 1, !dbg !867
  %19 = load i8*, i8** %7, align 8, !dbg !868
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !868
  store i8* %20, i8** %7, align 8, !dbg !868
  store i8 %18, i8* %19, align 1, !dbg !869
  br label %11, !dbg !863, !llvm.loop !870

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !871
  ret i8* %22, !dbg !872
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
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !31, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !14, !18, !20, !22, !24, !29}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "product", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !12)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13, !13}
!13 = !DISubrange(count: 3)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 14, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 288, elements: !12)
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 15, type: !16, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 16, type: !16, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 17, type: !16, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 18, type: !26, isLocal: false, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 288, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 9)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "acc_mem_base_flat", scope: !2, file: !3, line: 19, type: !26, isLocal: false, isDefinition: true)
!31 = !{!32, !45, !49, !55, !59, !63, !73, !77, !79, !81, !85, !89, !93, !97, !101, !103, !105, !107, !111, !115, !119, !121, !123}
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !34, file: !44, line: 75)
!33 = !DINamespace(name: "std", scope: null)
!34 = !DISubprogram(name: "memchr", scope: !35, file: !35, line: 90, type: !36, flags: DIFlagPrototyped, spFlags: 0)
!35 = !DIFile(filename: "/usr/include/string.h", directory: "")
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !39, !11, !41}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !46, file: !44, line: 76)
!46 = !DISubprogram(name: "memcmp", scope: !35, file: !35, line: 63, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DISubroutineType(types: !48)
!48 = !{!11, !39, !39, !41}
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !50, file: !44, line: 77)
!50 = !DISubprogram(name: "memcpy", scope: !35, file: !35, line: 42, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DISubroutineType(types: !52)
!52 = !{!38, !53, !54, !41}
!53 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !38)
!54 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !39)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !56, file: !44, line: 78)
!56 = !DISubprogram(name: "memmove", scope: !35, file: !35, line: 46, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DISubroutineType(types: !58)
!58 = !{!38, !38, !39, !41}
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !60, file: !44, line: 79)
!60 = !DISubprogram(name: "memset", scope: !35, file: !35, line: 60, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!38, !38, !11, !41}
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !64, file: !44, line: 80)
!64 = !DISubprogram(name: "strcat", scope: !35, file: !35, line: 129, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !69, !70}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !67)
!70 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !68)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !74, file: !44, line: 81)
!74 = !DISubprogram(name: "strcmp", scope: !35, file: !35, line: 136, type: !75, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DISubroutineType(types: !76)
!76 = !{!11, !71, !71}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !78, file: !44, line: 82)
!78 = !DISubprogram(name: "strcoll", scope: !35, file: !35, line: 143, type: !75, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !80, file: !44, line: 83)
!80 = !DISubprogram(name: "strcpy", scope: !35, file: !35, line: 121, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !82, file: !44, line: 84)
!82 = !DISubprogram(name: "strcspn", scope: !35, file: !35, line: 272, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DISubroutineType(types: !84)
!84 = !{!41, !71, !71}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !86, file: !44, line: 85)
!86 = !DISubprogram(name: "strerror", scope: !35, file: !35, line: 396, type: !87, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DISubroutineType(types: !88)
!88 = !{!67, !11}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !90, file: !44, line: 86)
!90 = !DISubprogram(name: "strlen", scope: !35, file: !35, line: 384, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!91 = !DISubroutineType(types: !92)
!92 = !{!41, !71}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !94, file: !44, line: 87)
!94 = !DISubprogram(name: "strncat", scope: !35, file: !35, line: 132, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!67, !69, !70, !41}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !98, file: !44, line: 88)
!98 = !DISubprogram(name: "strncmp", scope: !35, file: !35, line: 139, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DISubroutineType(types: !100)
!100 = !{!11, !71, !71, !41}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !102, file: !44, line: 89)
!102 = !DISubprogram(name: "strncpy", scope: !35, file: !35, line: 124, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !104, file: !44, line: 90)
!104 = !DISubprogram(name: "strspn", scope: !35, file: !35, line: 276, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !106, file: !44, line: 91)
!106 = !DISubprogram(name: "strtok", scope: !35, file: !35, line: 335, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !108, file: !44, line: 92)
!108 = !DISubprogram(name: "strxfrm", scope: !35, file: !35, line: 146, type: !109, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DISubroutineType(types: !110)
!110 = !{!41, !69, !70, !41}
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !112, file: !44, line: 93)
!112 = !DISubprogram(name: "strchr", scope: !35, file: !35, line: 225, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DISubroutineType(types: !114)
!114 = !{!67, !71, !11}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !116, file: !44, line: 94)
!116 = !DISubprogram(name: "strpbrk", scope: !35, file: !35, line: 302, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DISubroutineType(types: !118)
!118 = !{!67, !71, !71}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !120, file: !44, line: 95)
!120 = !DISubprogram(name: "strrchr", scope: !35, file: !35, line: 252, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !122, file: !44, line: 96)
!122 = !DISubprogram(name: "strstr", scope: !35, file: !35, line: 329, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !33, file: !3, line: 6)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 10)
!127 = distinct !DICompileUnit(language: DW_LANG_C99, file: !128, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!128 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!129 = !{i32 2, !"Dwarf Version", i32 4}
!130 = !{i32 2, !"Debug Info Version", i32 3}
!131 = !{i32 1, !"wchar_size", i32 4}
!132 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!133 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!134 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 21, type: !135, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !137, !137}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !139)
!139 = !{!13}
!140 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !134, file: !3, line: 21, type: !137)
!141 = !DILocation(line: 21, column: 29, scope: !134)
!142 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !134, file: !3, line: 21, type: !137)
!143 = !DILocation(line: 21, column: 58, scope: !134)
!144 = !DILocalVariable(name: "i", scope: !134, file: !3, line: 23, type: !11)
!145 = !DILocation(line: 23, column: 9, scope: !134)
!146 = !DILocalVariable(name: "j", scope: !134, file: !3, line: 23, type: !11)
!147 = !DILocation(line: 23, column: 12, scope: !134)
!148 = !DILocation(line: 24, column: 12, scope: !149)
!149 = distinct !DILexicalBlock(scope: !134, file: !3, line: 24, column: 5)
!150 = !DILocation(line: 24, column: 10, scope: !149)
!151 = !DILocation(line: 24, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 24, column: 5)
!153 = !DILocation(line: 24, column: 19, scope: !152)
!154 = !DILocation(line: 24, column: 5, scope: !149)
!155 = !DILocation(line: 25, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 25, column: 9)
!157 = !DILocation(line: 25, column: 14, scope: !156)
!158 = !DILocation(line: 25, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 25, column: 9)
!160 = !DILocation(line: 25, column: 23, scope: !159)
!161 = !DILocation(line: 25, column: 9, scope: !156)
!162 = !DILocation(line: 26, column: 35, scope: !159)
!163 = !DILocation(line: 26, column: 43, scope: !159)
!164 = !DILocation(line: 26, column: 46, scope: !159)
!165 = !DILocation(line: 26, column: 13, scope: !159)
!166 = !DILocation(line: 26, column: 27, scope: !159)
!167 = !DILocation(line: 26, column: 30, scope: !159)
!168 = !DILocation(line: 26, column: 33, scope: !159)
!169 = !DILocation(line: 25, column: 31, scope: !159)
!170 = !DILocation(line: 25, column: 9, scope: !159)
!171 = distinct !{!171, !161, !172}
!172 = !DILocation(line: 26, column: 47, scope: !156)
!173 = !DILocation(line: 24, column: 27, scope: !152)
!174 = !DILocation(line: 24, column: 5, scope: !152)
!175 = distinct !{!175, !154, !176}
!176 = !DILocation(line: 26, column: 47, scope: !149)
!177 = !DILocation(line: 27, column: 1, scope: !134)
!178 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPKjS0_", scope: !3, file: !3, line: 29, type: !179, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DISubroutineType(types: !180)
!180 = !{!181, !182, !182}
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!183 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!184 = !DILocalVariable(name: "mat1", arg: 1, scope: !178, file: !3, line: 29, type: !182)
!185 = !DILocation(line: 29, column: 49, scope: !178)
!186 = !DILocalVariable(name: "mat2", arg: 2, scope: !178, file: !3, line: 29, type: !182)
!187 = !DILocation(line: 29, column: 76, scope: !178)
!188 = !DILocalVariable(name: "res_index", scope: !178, file: !3, line: 31, type: !11)
!189 = !DILocation(line: 31, column: 9, scope: !178)
!190 = !DILocalVariable(name: "res", scope: !178, file: !3, line: 32, type: !17)
!191 = !DILocation(line: 32, column: 18, scope: !178)
!192 = !DILocalVariable(name: "i", scope: !193, file: !3, line: 33, type: !11)
!193 = distinct !DILexicalBlock(scope: !178, file: !3, line: 33, column: 5)
!194 = !DILocation(line: 33, column: 13, scope: !193)
!195 = !DILocation(line: 33, column: 9, scope: !193)
!196 = !DILocation(line: 33, column: 20, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !3, line: 33, column: 5)
!198 = !DILocation(line: 33, column: 22, scope: !197)
!199 = !DILocation(line: 33, column: 5, scope: !193)
!200 = !DILocation(line: 35, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !3, line: 34, column: 5)
!202 = !DILocation(line: 35, column: 21, scope: !201)
!203 = !DILocation(line: 35, column: 26, scope: !201)
!204 = !DILocation(line: 35, column: 31, scope: !201)
!205 = !DILocation(line: 35, column: 24, scope: !201)
!206 = !DILocation(line: 35, column: 13, scope: !201)
!207 = !DILocation(line: 33, column: 28, scope: !197)
!208 = !DILocation(line: 33, column: 5, scope: !197)
!209 = distinct !{!209, !199, !210}
!210 = !DILocation(line: 36, column: 5, scope: !193)
!211 = !DILocation(line: 37, column: 25, scope: !178)
!212 = !DILocation(line: 37, column: 12, scope: !178)
!213 = !DILocation(line: 37, column: 5, scope: !178)
!214 = !DILocation(line: 37, column: 23, scope: !178)
!215 = !DILocation(line: 38, column: 14, scope: !178)
!216 = !DILocation(line: 39, column: 5, scope: !178)
!217 = distinct !DISubprogram(name: "base_gemm", linkageName: "_Z9base_gemm5INSTR", scope: !3, file: !3, line: 42, type: !218, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!218 = !DISubroutineType(types: !219)
!219 = !{!181, !220}
!220 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !221, line: 23, size: 320, flags: DIFlagTypePassByValue, elements: !222, identifier: "_ZTS5INSTR")
!221 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!222 = !{!223, !224, !225, !226}
!223 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !220, file: !221, line: 24, baseType: !17, size: 32)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !220, file: !221, line: 25, baseType: !17, size: 32, offset: 32)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !220, file: !221, line: 26, baseType: !17, size: 32, offset: 64)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !220, file: !221, line: 27, baseType: !227, size: 192, offset: 128)
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !221, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !228, identifier: "_ZTS15GEMM_STRUCT_REF")
!228 = !{!229, !230, !231}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !227, file: !221, line: 6, baseType: !181, size: 64)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !227, file: !221, line: 7, baseType: !181, size: 64, offset: 64)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !227, file: !221, line: 8, baseType: !181, size: 64, offset: 128)
!232 = !DILocalVariable(name: "myinsn", arg: 1, scope: !217, file: !3, line: 42, type: !220)
!233 = !DILocation(line: 42, column: 32, scope: !217)
!234 = !DILocalVariable(name: "row", scope: !217, file: !3, line: 43, type: !17)
!235 = !DILocation(line: 43, column: 18, scope: !217)
!236 = !DILocalVariable(name: "col", scope: !217, file: !3, line: 43, type: !17)
!237 = !DILocation(line: 43, column: 23, scope: !217)
!238 = !DILocalVariable(name: "i", scope: !217, file: !3, line: 43, type: !17)
!239 = !DILocation(line: 43, column: 28, scope: !217)
!240 = !DILocalVariable(name: "sum", scope: !217, file: !3, line: 44, type: !17)
!241 = !DILocation(line: 44, column: 18, scope: !217)
!242 = !DILocation(line: 45, column: 15, scope: !243)
!243 = distinct !DILexicalBlock(scope: !217, file: !3, line: 45, column: 8)
!244 = !DILocation(line: 45, column: 21, scope: !243)
!245 = !DILocation(line: 45, column: 8, scope: !217)
!246 = !DILocation(line: 46, column: 14, scope: !247)
!247 = distinct !DILexicalBlock(scope: !248, file: !3, line: 46, column: 5)
!248 = distinct !DILexicalBlock(scope: !243, file: !3, line: 45, column: 26)
!249 = !DILocation(line: 46, column: 10, scope: !247)
!250 = !DILocation(line: 46, column: 19, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 46, column: 5)
!252 = !DILocation(line: 46, column: 23, scope: !251)
!253 = !DILocation(line: 46, column: 5, scope: !247)
!254 = !DILocation(line: 48, column: 18, scope: !255)
!255 = distinct !DILexicalBlock(scope: !256, file: !3, line: 48, column: 9)
!256 = distinct !DILexicalBlock(scope: !251, file: !3, line: 47, column: 5)
!257 = !DILocation(line: 48, column: 14, scope: !255)
!258 = !DILocation(line: 48, column: 23, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !3, line: 48, column: 9)
!260 = !DILocation(line: 48, column: 27, scope: !259)
!261 = !DILocation(line: 48, column: 9, scope: !255)
!262 = !DILocation(line: 50, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !3, line: 49, column: 9)
!264 = !DILocation(line: 51, column: 20, scope: !265)
!265 = distinct !DILexicalBlock(scope: !263, file: !3, line: 51, column: 13)
!266 = !DILocation(line: 51, column: 18, scope: !265)
!267 = !DILocation(line: 51, column: 25, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !3, line: 51, column: 13)
!269 = !DILocation(line: 51, column: 27, scope: !268)
!270 = !DILocation(line: 51, column: 13, scope: !265)
!271 = !DILocation(line: 53, column: 39, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !3, line: 52, column: 13)
!273 = !DILocation(line: 53, column: 37, scope: !272)
!274 = !DILocation(line: 53, column: 27, scope: !272)
!275 = !DILocation(line: 53, column: 46, scope: !272)
!276 = !DILocation(line: 53, column: 44, scope: !272)
!277 = !DILocation(line: 53, column: 25, scope: !272)
!278 = !DILocation(line: 53, column: 67, scope: !272)
!279 = !DILocation(line: 53, column: 65, scope: !272)
!280 = !DILocation(line: 53, column: 55, scope: !272)
!281 = !DILocation(line: 53, column: 72, scope: !272)
!282 = !DILocation(line: 53, column: 70, scope: !272)
!283 = !DILocation(line: 53, column: 53, scope: !272)
!284 = !DILocation(line: 53, column: 50, scope: !272)
!285 = !DILocation(line: 53, column: 21, scope: !272)
!286 = !DILocation(line: 51, column: 35, scope: !268)
!287 = !DILocation(line: 51, column: 13, scope: !268)
!288 = distinct !{!288, !270, !289}
!289 = !DILocation(line: 54, column: 13, scope: !265)
!290 = !DILocation(line: 55, column: 41, scope: !263)
!291 = !DILocation(line: 55, column: 27, scope: !263)
!292 = !DILocation(line: 55, column: 25, scope: !263)
!293 = !DILocation(line: 55, column: 15, scope: !263)
!294 = !DILocation(line: 55, column: 34, scope: !263)
!295 = !DILocation(line: 55, column: 32, scope: !263)
!296 = !DILocation(line: 55, column: 39, scope: !263)
!297 = !DILocation(line: 48, column: 37, scope: !259)
!298 = !DILocation(line: 48, column: 9, scope: !259)
!299 = distinct !{!299, !261, !300}
!300 = !DILocation(line: 56, column: 9, scope: !255)
!301 = !DILocation(line: 46, column: 33, scope: !251)
!302 = !DILocation(line: 46, column: 5, scope: !251)
!303 = distinct !{!303, !253, !304}
!304 = !DILocation(line: 57, column: 5, scope: !247)
!305 = !DILocalVariable(name: "i", scope: !306, file: !3, line: 59, type: !11)
!306 = distinct !DILexicalBlock(scope: !248, file: !3, line: 59, column: 5)
!307 = !DILocation(line: 59, column: 13, scope: !306)
!308 = !DILocation(line: 59, column: 9, scope: !306)
!309 = !DILocation(line: 59, column: 18, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !3, line: 59, column: 5)
!311 = !DILocation(line: 59, column: 19, scope: !310)
!312 = !DILocation(line: 59, column: 5, scope: !306)
!313 = !DILocalVariable(name: "j", scope: !314, file: !3, line: 60, type: !11)
!314 = distinct !DILexicalBlock(scope: !315, file: !3, line: 60, column: 9)
!315 = distinct !DILexicalBlock(scope: !310, file: !3, line: 59, column: 28)
!316 = !DILocation(line: 60, column: 17, scope: !314)
!317 = !DILocation(line: 60, column: 13, scope: !314)
!318 = !DILocation(line: 60, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !3, line: 60, column: 9)
!320 = !DILocation(line: 60, column: 22, scope: !319)
!321 = !DILocation(line: 0, scope: !310)
!322 = !DILocation(line: 60, column: 9, scope: !314)
!323 = !DILocation(line: 61, column: 42, scope: !324)
!324 = distinct !DILexicalBlock(scope: !319, file: !3, line: 60, column: 31)
!325 = !DILocation(line: 61, column: 53, scope: !324)
!326 = !DILocation(line: 61, column: 31, scope: !324)
!327 = !DILocation(line: 61, column: 32, scope: !324)
!328 = !DILocation(line: 61, column: 37, scope: !324)
!329 = !DILocation(line: 61, column: 36, scope: !324)
!330 = !DILocation(line: 61, column: 13, scope: !324)
!331 = !DILocation(line: 61, column: 40, scope: !324)
!332 = !DILocation(line: 60, column: 28, scope: !319)
!333 = !DILocation(line: 60, column: 9, scope: !319)
!334 = distinct !{!334, !322, !335}
!335 = !DILocation(line: 62, column: 9, scope: !314)
!336 = !DILocation(line: 59, column: 25, scope: !310)
!337 = !DILocation(line: 59, column: 5, scope: !310)
!338 = distinct !{!338, !312, !339}
!339 = !DILocation(line: 63, column: 5, scope: !306)
!340 = !DILocation(line: 65, column: 5, scope: !217)
!341 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 68, type: !342, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DISubroutineType(types: !343)
!343 = !{!181, !137, !137, !137}
!344 = !DILocalVariable(name: "mat1", arg: 1, scope: !341, file: !3, line: 68, type: !137)
!345 = !DILocation(line: 68, column: 35, scope: !341)
!346 = !DILocalVariable(name: "mat2", arg: 2, scope: !341, file: !3, line: 68, type: !137)
!347 = !DILocation(line: 68, column: 61, scope: !341)
!348 = !DILocalVariable(name: "res", arg: 3, scope: !341, file: !3, line: 68, type: !137)
!349 = !DILocation(line: 68, column: 87, scope: !341)
!350 = !DILocalVariable(name: "i", scope: !351, file: !3, line: 69, type: !11)
!351 = distinct !DILexicalBlock(scope: !341, file: !3, line: 69, column: 5)
!352 = !DILocation(line: 69, column: 14, scope: !351)
!353 = !DILocation(line: 69, column: 10, scope: !351)
!354 = !DILocation(line: 69, column: 21, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !3, line: 69, column: 5)
!356 = !DILocation(line: 69, column: 23, scope: !355)
!357 = !DILocation(line: 69, column: 5, scope: !351)
!358 = !DILocalVariable(name: "j", scope: !359, file: !3, line: 70, type: !11)
!359 = distinct !DILexicalBlock(scope: !360, file: !3, line: 70, column: 9)
!360 = distinct !DILexicalBlock(scope: !355, file: !3, line: 69, column: 35)
!361 = !DILocation(line: 70, column: 18, scope: !359)
!362 = !DILocation(line: 70, column: 14, scope: !359)
!363 = !DILocation(line: 70, column: 25, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !3, line: 70, column: 9)
!365 = !DILocation(line: 70, column: 27, scope: !364)
!366 = !DILocation(line: 70, column: 9, scope: !359)
!367 = !DILocalVariable(name: "k", scope: !368, file: !3, line: 71, type: !11)
!368 = distinct !DILexicalBlock(scope: !369, file: !3, line: 71, column: 13)
!369 = distinct !DILexicalBlock(scope: !364, file: !3, line: 70, column: 39)
!370 = !DILocation(line: 71, column: 22, scope: !368)
!371 = !DILocation(line: 71, column: 18, scope: !368)
!372 = !DILocation(line: 71, column: 29, scope: !373)
!373 = distinct !DILexicalBlock(scope: !368, file: !3, line: 71, column: 13)
!374 = !DILocation(line: 71, column: 31, scope: !373)
!375 = !DILocation(line: 71, column: 13, scope: !368)
!376 = !DILocation(line: 72, column: 42, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !3, line: 71, column: 43)
!378 = !DILocation(line: 72, column: 34, scope: !377)
!379 = !DILocation(line: 72, column: 45, scope: !377)
!380 = !DILocation(line: 72, column: 58, scope: !377)
!381 = !DILocation(line: 72, column: 50, scope: !377)
!382 = !DILocation(line: 72, column: 61, scope: !377)
!383 = !DILocation(line: 72, column: 48, scope: !377)
!384 = !DILocation(line: 72, column: 25, scope: !377)
!385 = !DILocation(line: 72, column: 17, scope: !377)
!386 = !DILocation(line: 72, column: 28, scope: !377)
!387 = !DILocation(line: 72, column: 31, scope: !377)
!388 = !DILocation(line: 71, column: 39, scope: !373)
!389 = !DILocation(line: 71, column: 13, scope: !373)
!390 = distinct !{!390, !375, !391}
!391 = !DILocation(line: 73, column: 13, scope: !368)
!392 = !DILocation(line: 70, column: 35, scope: !364)
!393 = !DILocation(line: 70, column: 9, scope: !364)
!394 = distinct !{!394, !366, !395}
!395 = !DILocation(line: 74, column: 9, scope: !359)
!396 = !DILocation(line: 69, column: 31, scope: !355)
!397 = !DILocation(line: 69, column: 5, scope: !355)
!398 = distinct !{!398, !357, !399}
!399 = !DILocation(line: 75, column: 5, scope: !351)
!400 = !DILocalVariable(name: "i", scope: !401, file: !3, line: 76, type: !11)
!401 = distinct !DILexicalBlock(scope: !341, file: !3, line: 76, column: 5)
!402 = !DILocation(line: 76, column: 13, scope: !401)
!403 = !DILocation(line: 76, column: 9, scope: !401)
!404 = !DILocation(line: 76, column: 18, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !3, line: 76, column: 5)
!406 = !DILocation(line: 76, column: 19, scope: !405)
!407 = !DILocation(line: 76, column: 5, scope: !401)
!408 = !DILocalVariable(name: "j", scope: !409, file: !3, line: 77, type: !11)
!409 = distinct !DILexicalBlock(scope: !410, file: !3, line: 77, column: 9)
!410 = distinct !DILexicalBlock(scope: !405, file: !3, line: 76, column: 28)
!411 = !DILocation(line: 77, column: 17, scope: !409)
!412 = !DILocation(line: 77, column: 13, scope: !409)
!413 = !DILocation(line: 77, column: 21, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !3, line: 77, column: 9)
!415 = !DILocation(line: 77, column: 22, scope: !414)
!416 = !DILocation(line: 0, scope: !405)
!417 = !DILocation(line: 77, column: 9, scope: !409)
!418 = !DILocation(line: 78, column: 37, scope: !419)
!419 = distinct !DILexicalBlock(scope: !414, file: !3, line: 77, column: 31)
!420 = !DILocation(line: 78, column: 48, scope: !419)
!421 = !DILocation(line: 78, column: 26, scope: !419)
!422 = !DILocation(line: 78, column: 27, scope: !419)
!423 = !DILocation(line: 78, column: 32, scope: !419)
!424 = !DILocation(line: 78, column: 31, scope: !419)
!425 = !DILocation(line: 78, column: 13, scope: !419)
!426 = !DILocation(line: 78, column: 35, scope: !419)
!427 = !DILocation(line: 77, column: 28, scope: !414)
!428 = !DILocation(line: 77, column: 9, scope: !414)
!429 = distinct !{!429, !417, !430}
!430 = !DILocation(line: 79, column: 9, scope: !409)
!431 = !DILocation(line: 76, column: 25, scope: !405)
!432 = !DILocation(line: 76, column: 5, scope: !405)
!433 = distinct !{!433, !407, !434}
!434 = !DILocation(line: 80, column: 5, scope: !401)
!435 = !DILocation(line: 81, column: 5, scope: !341)
!436 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 84, type: !218, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!437 = !DILocalVariable(name: "instr", arg: 1, scope: !436, file: !3, line: 84, type: !220)
!438 = !DILocation(line: 84, column: 35, scope: !436)
!439 = !DILocalVariable(name: "arr_ref", scope: !436, file: !3, line: 86, type: !181)
!440 = !DILocation(line: 86, column: 20, scope: !436)
!441 = !DILocalVariable(name: "inp", scope: !436, file: !3, line: 87, type: !138)
!442 = !DILocation(line: 87, column: 18, scope: !436)
!443 = !DILocalVariable(name: "wgt", scope: !436, file: !3, line: 87, type: !138)
!444 = !DILocation(line: 87, column: 26, scope: !436)
!445 = !DILocation(line: 88, column: 14, scope: !446)
!446 = distinct !DILexicalBlock(scope: !436, file: !3, line: 88, column: 8)
!447 = !DILocation(line: 88, column: 20, scope: !446)
!448 = !DILocation(line: 88, column: 8, scope: !436)
!449 = !DILocalVariable(name: "i", scope: !450, file: !3, line: 89, type: !11)
!450 = distinct !DILexicalBlock(scope: !451, file: !3, line: 89, column: 9)
!451 = distinct !DILexicalBlock(scope: !446, file: !3, line: 88, column: 25)
!452 = !DILocation(line: 89, column: 18, scope: !450)
!453 = !DILocation(line: 89, column: 14, scope: !450)
!454 = !DILocation(line: 89, column: 22, scope: !455)
!455 = distinct !DILexicalBlock(scope: !450, file: !3, line: 89, column: 9)
!456 = !DILocation(line: 89, column: 23, scope: !455)
!457 = !DILocation(line: 89, column: 9, scope: !450)
!458 = !DILocation(line: 90, column: 30, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !3, line: 89, column: 30)
!460 = !DILocation(line: 90, column: 39, scope: !459)
!461 = !DILocation(line: 90, column: 47, scope: !459)
!462 = !DILocation(line: 90, column: 46, scope: !459)
!463 = !DILocation(line: 90, column: 22, scope: !459)
!464 = !DILocation(line: 90, column: 17, scope: !459)
!465 = !DILocation(line: 90, column: 13, scope: !459)
!466 = !DILocation(line: 90, column: 20, scope: !459)
!467 = !DILocation(line: 89, column: 27, scope: !455)
!468 = !DILocation(line: 89, column: 9, scope: !455)
!469 = distinct !{!469, !457, !470}
!470 = !DILocation(line: 91, column: 9, scope: !450)
!471 = !DILocalVariable(name: "i", scope: !472, file: !3, line: 92, type: !11)
!472 = distinct !DILexicalBlock(scope: !451, file: !3, line: 92, column: 9)
!473 = !DILocation(line: 92, column: 18, scope: !472)
!474 = !DILocation(line: 92, column: 14, scope: !472)
!475 = !DILocation(line: 92, column: 22, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !3, line: 92, column: 9)
!477 = !DILocation(line: 92, column: 23, scope: !476)
!478 = !DILocation(line: 92, column: 9, scope: !472)
!479 = !DILocation(line: 93, column: 30, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !3, line: 92, column: 30)
!481 = !DILocation(line: 93, column: 39, scope: !480)
!482 = !DILocation(line: 93, column: 47, scope: !480)
!483 = !DILocation(line: 93, column: 46, scope: !480)
!484 = !DILocation(line: 93, column: 22, scope: !480)
!485 = !DILocation(line: 93, column: 17, scope: !480)
!486 = !DILocation(line: 93, column: 13, scope: !480)
!487 = !DILocation(line: 93, column: 20, scope: !480)
!488 = !DILocation(line: 92, column: 27, scope: !476)
!489 = !DILocation(line: 92, column: 9, scope: !476)
!490 = distinct !{!490, !478, !491}
!491 = !DILocation(line: 94, column: 9, scope: !472)
!492 = !DILocation(line: 95, column: 34, scope: !451)
!493 = !DILocation(line: 95, column: 38, scope: !451)
!494 = !DILocation(line: 95, column: 19, scope: !451)
!495 = !DILocation(line: 95, column: 17, scope: !451)
!496 = !DILocation(line: 96, column: 5, scope: !451)
!497 = !DILocation(line: 97, column: 12, scope: !436)
!498 = !DILocation(line: 97, column: 5, scope: !436)
!499 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 100, type: !500, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!500 = !DISubroutineType(types: !501)
!501 = !{!181, !502}
!502 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !221, line: 37, size: 192, flags: DIFlagTypePassByValue, elements: !503, identifier: "_ZTS9INSTR_VAL")
!503 = !{!504, !505, !506, !507}
!504 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !502, file: !221, line: 38, baseType: !17, size: 32)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !502, file: !221, line: 39, baseType: !17, size: 32, offset: 32)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !502, file: !221, line: 40, baseType: !17, size: 32, offset: 64)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !502, file: !221, line: 41, baseType: !508, size: 96, offset: 96)
!508 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !221, line: 17, size: 96, flags: DIFlagTypePassByValue, elements: !509, identifier: "_ZTS15GEMM_STRUCT_VAL")
!509 = !{!510, !511, !512}
!510 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !508, file: !221, line: 18, baseType: !17, size: 32)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !508, file: !221, line: 19, baseType: !17, size: 32, offset: 32)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !508, file: !221, line: 20, baseType: !17, size: 32, offset: 64)
!513 = !DILocalVariable(name: "instr", arg: 1, scope: !499, file: !3, line: 100, type: !502)
!514 = !DILocation(line: 100, column: 43, scope: !499)
!515 = !DILocalVariable(name: "arr_val", scope: !499, file: !3, line: 102, type: !181)
!516 = !DILocation(line: 102, column: 20, scope: !499)
!517 = !DILocalVariable(name: "inp", scope: !499, file: !3, line: 103, type: !138)
!518 = !DILocation(line: 103, column: 18, scope: !499)
!519 = !DILocalVariable(name: "wgt", scope: !499, file: !3, line: 103, type: !138)
!520 = !DILocation(line: 103, column: 26, scope: !499)
!521 = !DILocation(line: 104, column: 14, scope: !522)
!522 = distinct !DILexicalBlock(scope: !499, file: !3, line: 104, column: 8)
!523 = !DILocation(line: 104, column: 20, scope: !522)
!524 = !DILocation(line: 104, column: 8, scope: !499)
!525 = !DILocalVariable(name: "i", scope: !526, file: !3, line: 105, type: !11)
!526 = distinct !DILexicalBlock(scope: !527, file: !3, line: 105, column: 9)
!527 = distinct !DILexicalBlock(scope: !522, file: !3, line: 104, column: 25)
!528 = !DILocation(line: 105, column: 18, scope: !526)
!529 = !DILocation(line: 105, column: 14, scope: !526)
!530 = !DILocation(line: 105, column: 22, scope: !531)
!531 = distinct !DILexicalBlock(scope: !526, file: !3, line: 105, column: 9)
!532 = !DILocation(line: 105, column: 23, scope: !531)
!533 = !DILocation(line: 105, column: 9, scope: !526)
!534 = !DILocation(line: 106, column: 28, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !3, line: 105, column: 30)
!536 = !DILocation(line: 106, column: 37, scope: !535)
!537 = !DILocation(line: 106, column: 45, scope: !535)
!538 = !DILocation(line: 106, column: 44, scope: !535)
!539 = !DILocation(line: 106, column: 17, scope: !535)
!540 = !DILocation(line: 106, column: 13, scope: !535)
!541 = !DILocation(line: 106, column: 20, scope: !535)
!542 = !DILocation(line: 105, column: 27, scope: !531)
!543 = !DILocation(line: 105, column: 9, scope: !531)
!544 = distinct !{!544, !533, !545}
!545 = !DILocation(line: 107, column: 9, scope: !526)
!546 = !DILocalVariable(name: "i", scope: !547, file: !3, line: 108, type: !11)
!547 = distinct !DILexicalBlock(scope: !527, file: !3, line: 108, column: 9)
!548 = !DILocation(line: 108, column: 18, scope: !547)
!549 = !DILocation(line: 108, column: 14, scope: !547)
!550 = !DILocation(line: 108, column: 22, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !3, line: 108, column: 9)
!552 = !DILocation(line: 108, column: 23, scope: !551)
!553 = !DILocation(line: 108, column: 9, scope: !547)
!554 = !DILocation(line: 109, column: 28, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !3, line: 108, column: 30)
!556 = !DILocation(line: 109, column: 37, scope: !555)
!557 = !DILocation(line: 109, column: 17, scope: !555)
!558 = !DILocation(line: 109, column: 13, scope: !555)
!559 = !DILocation(line: 109, column: 20, scope: !555)
!560 = !DILocation(line: 108, column: 27, scope: !551)
!561 = !DILocation(line: 108, column: 9, scope: !551)
!562 = distinct !{!562, !553, !563}
!563 = !DILocation(line: 110, column: 9, scope: !547)
!564 = !DILocation(line: 111, column: 34, scope: !527)
!565 = !DILocation(line: 111, column: 38, scope: !527)
!566 = !DILocation(line: 111, column: 19, scope: !527)
!567 = !DILocation(line: 111, column: 17, scope: !527)
!568 = !DILocation(line: 112, column: 5, scope: !527)
!569 = !DILocation(line: 113, column: 12, scope: !499)
!570 = !DILocation(line: 113, column: 5, scope: !499)
!571 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 120, type: !572, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!572 = !DISubroutineType(types: !573)
!573 = !{!11, !11, !574}
!574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!575 = !DILocalVariable(name: "argc", arg: 1, scope: !571, file: !3, line: 120, type: !11)
!576 = !DILocation(line: 120, column: 14, scope: !571)
!577 = !DILocalVariable(name: "argv", arg: 2, scope: !571, file: !3, line: 120, type: !574)
!578 = !DILocation(line: 120, column: 32, scope: !571)
!579 = !DILocalVariable(name: "inp_mem_row0", scope: !571, file: !3, line: 122, type: !138)
!580 = !DILocation(line: 122, column: 18, scope: !571)
!581 = !DILocalVariable(name: "inp_mem_row1", scope: !571, file: !3, line: 122, type: !138)
!582 = !DILocation(line: 122, column: 37, scope: !571)
!583 = !DILocalVariable(name: "inp_mem_row2", scope: !571, file: !3, line: 122, type: !138)
!584 = !DILocation(line: 122, column: 56, scope: !571)
!585 = !DILocalVariable(name: "wgt_mem_row0", scope: !571, file: !3, line: 123, type: !138)
!586 = !DILocation(line: 123, column: 18, scope: !571)
!587 = !DILocalVariable(name: "wgt_mem_row1", scope: !571, file: !3, line: 123, type: !138)
!588 = !DILocation(line: 123, column: 37, scope: !571)
!589 = !DILocalVariable(name: "wgt_mem_row2", scope: !571, file: !3, line: 123, type: !138)
!590 = !DILocation(line: 123, column: 56, scope: !571)
!591 = !DILocalVariable(name: "acc_mem_row0", scope: !571, file: !3, line: 124, type: !138)
!592 = !DILocation(line: 124, column: 18, scope: !571)
!593 = !DILocalVariable(name: "acc_mem_row1", scope: !571, file: !3, line: 124, type: !138)
!594 = !DILocation(line: 124, column: 37, scope: !571)
!595 = !DILocalVariable(name: "acc_mem_row2", scope: !571, file: !3, line: 124, type: !138)
!596 = !DILocation(line: 124, column: 56, scope: !571)
!597 = !DILocalVariable(name: "acc_mem_ref", scope: !571, file: !3, line: 125, type: !181)
!598 = !DILocation(line: 125, column: 20, scope: !571)
!599 = !DILocalVariable(name: "acc_mem_val", scope: !571, file: !3, line: 126, type: !181)
!600 = !DILocation(line: 126, column: 20, scope: !571)
!601 = !DILocalVariable(name: "acc_mem_gemm", scope: !571, file: !3, line: 127, type: !181)
!602 = !DILocation(line: 127, column: 20, scope: !571)
!603 = !DILocalVariable(name: "opcode", scope: !571, file: !3, line: 128, type: !17)
!604 = !DILocation(line: 128, column: 18, scope: !571)
!605 = !DILocalVariable(name: "op_type", scope: !571, file: !3, line: 128, type: !17)
!606 = !DILocation(line: 128, column: 26, scope: !571)
!607 = !DILocalVariable(name: "acc_stage1", scope: !571, file: !3, line: 129, type: !26)
!608 = !DILocation(line: 129, column: 18, scope: !571)
!609 = !DILocalVariable(name: "acc_stage2", scope: !571, file: !3, line: 130, type: !26)
!610 = !DILocation(line: 130, column: 18, scope: !571)
!611 = !DILocalVariable(name: "acc_stage3", scope: !571, file: !3, line: 131, type: !26)
!612 = !DILocation(line: 131, column: 18, scope: !571)
!613 = !DILocation(line: 132, column: 5, scope: !571)
!614 = !DILocation(line: 134, column: 5, scope: !571)
!615 = !DILocation(line: 135, column: 5, scope: !571)
!616 = !DILocation(line: 136, column: 5, scope: !571)
!617 = !DILocation(line: 137, column: 5, scope: !571)
!618 = !DILocation(line: 138, column: 5, scope: !571)
!619 = !DILocation(line: 139, column: 5, scope: !571)
!620 = !DILocation(line: 140, column: 5, scope: !571)
!621 = !DILocation(line: 141, column: 5, scope: !571)
!622 = !DILocation(line: 142, column: 5, scope: !571)
!623 = !DILocation(line: 143, column: 24, scope: !571)
!624 = !DILocation(line: 143, column: 5, scope: !571)
!625 = !DILocation(line: 144, column: 24, scope: !571)
!626 = !DILocation(line: 144, column: 5, scope: !571)
!627 = !DILocalVariable(name: "gemm_base", scope: !571, file: !3, line: 147, type: !227)
!628 = !DILocation(line: 147, column: 21, scope: !571)
!629 = !DILocalVariable(name: "instruction", scope: !571, file: !3, line: 148, type: !220)
!630 = !DILocation(line: 148, column: 11, scope: !571)
!631 = !DILocation(line: 148, column: 25, scope: !571)
!632 = !DILocation(line: 148, column: 33, scope: !571)
!633 = !DILocalVariable(name: "gemm_uop", scope: !571, file: !3, line: 152, type: !634)
!634 = !DICompositeType(tag: DW_TAG_array_type, baseType: !227, size: 1728, elements: !27)
!635 = !DILocation(line: 152, column: 21, scope: !571)
!636 = !DILocation(line: 152, column: 35, scope: !571)
!637 = !DILocation(line: 152, column: 36, scope: !571)
!638 = !DILocation(line: 152, column: 38, scope: !571)
!639 = !DILocation(line: 152, column: 55, scope: !571)
!640 = !DILocation(line: 152, column: 72, scope: !571)
!641 = !DILocation(line: 152, column: 89, scope: !571)
!642 = !DILocation(line: 152, column: 91, scope: !571)
!643 = !DILocation(line: 152, column: 108, scope: !571)
!644 = !DILocation(line: 152, column: 125, scope: !571)
!645 = !DILocation(line: 153, column: 36, scope: !571)
!646 = !DILocation(line: 153, column: 38, scope: !571)
!647 = !DILocation(line: 153, column: 55, scope: !571)
!648 = !DILocation(line: 153, column: 72, scope: !571)
!649 = !DILocation(line: 153, column: 89, scope: !571)
!650 = !DILocation(line: 153, column: 91, scope: !571)
!651 = !DILocation(line: 153, column: 108, scope: !571)
!652 = !DILocation(line: 153, column: 125, scope: !571)
!653 = !DILocation(line: 154, column: 36, scope: !571)
!654 = !DILocation(line: 154, column: 38, scope: !571)
!655 = !DILocation(line: 154, column: 55, scope: !571)
!656 = !DILocation(line: 154, column: 72, scope: !571)
!657 = !DILocation(line: 154, column: 89, scope: !571)
!658 = !DILocation(line: 154, column: 91, scope: !571)
!659 = !DILocation(line: 154, column: 108, scope: !571)
!660 = !DILocation(line: 154, column: 125, scope: !571)
!661 = !DILocation(line: 155, column: 36, scope: !571)
!662 = !DILocation(line: 155, column: 38, scope: !571)
!663 = !DILocation(line: 155, column: 55, scope: !571)
!664 = !DILocation(line: 155, column: 72, scope: !571)
!665 = !DILocation(line: 155, column: 89, scope: !571)
!666 = !DILocation(line: 155, column: 91, scope: !571)
!667 = !DILocation(line: 155, column: 108, scope: !571)
!668 = !DILocation(line: 155, column: 125, scope: !571)
!669 = !DILocation(line: 156, column: 36, scope: !571)
!670 = !DILocation(line: 156, column: 38, scope: !571)
!671 = !DILocation(line: 156, column: 55, scope: !571)
!672 = !DILocation(line: 156, column: 72, scope: !571)
!673 = !DILocalVariable(name: "gemm", scope: !571, file: !3, line: 159, type: !674)
!674 = !DICompositeType(tag: DW_TAG_array_type, baseType: !508, size: 864, elements: !27)
!675 = !DILocation(line: 159, column: 21, scope: !571)
!676 = !DILocation(line: 159, column: 31, scope: !571)
!677 = !DILocation(line: 159, column: 32, scope: !571)
!678 = !DILocation(line: 159, column: 33, scope: !571)
!679 = !DILocation(line: 159, column: 49, scope: !571)
!680 = !DILocation(line: 159, column: 65, scope: !571)
!681 = !DILocation(line: 159, column: 82, scope: !571)
!682 = !DILocation(line: 159, column: 83, scope: !571)
!683 = !DILocation(line: 159, column: 99, scope: !571)
!684 = !DILocation(line: 159, column: 115, scope: !571)
!685 = !DILocation(line: 160, column: 32, scope: !571)
!686 = !DILocation(line: 160, column: 33, scope: !571)
!687 = !DILocation(line: 160, column: 49, scope: !571)
!688 = !DILocation(line: 160, column: 65, scope: !571)
!689 = !DILocation(line: 160, column: 82, scope: !571)
!690 = !DILocation(line: 160, column: 83, scope: !571)
!691 = !DILocation(line: 160, column: 99, scope: !571)
!692 = !DILocation(line: 160, column: 115, scope: !571)
!693 = !DILocation(line: 161, column: 32, scope: !571)
!694 = !DILocation(line: 161, column: 33, scope: !571)
!695 = !DILocation(line: 161, column: 49, scope: !571)
!696 = !DILocation(line: 161, column: 65, scope: !571)
!697 = !DILocation(line: 161, column: 82, scope: !571)
!698 = !DILocation(line: 161, column: 83, scope: !571)
!699 = !DILocation(line: 161, column: 99, scope: !571)
!700 = !DILocation(line: 161, column: 115, scope: !571)
!701 = !DILocation(line: 162, column: 32, scope: !571)
!702 = !DILocation(line: 162, column: 33, scope: !571)
!703 = !DILocation(line: 162, column: 49, scope: !571)
!704 = !DILocation(line: 162, column: 65, scope: !571)
!705 = !DILocation(line: 162, column: 82, scope: !571)
!706 = !DILocation(line: 162, column: 83, scope: !571)
!707 = !DILocation(line: 162, column: 99, scope: !571)
!708 = !DILocation(line: 162, column: 115, scope: !571)
!709 = !DILocation(line: 163, column: 32, scope: !571)
!710 = !DILocation(line: 163, column: 33, scope: !571)
!711 = !DILocation(line: 163, column: 49, scope: !571)
!712 = !DILocation(line: 163, column: 65, scope: !571)
!713 = !DILocalVariable(name: "microop", scope: !571, file: !3, line: 167, type: !714)
!714 = !DICompositeType(tag: DW_TAG_array_type, baseType: !220, size: 2880, elements: !27)
!715 = !DILocation(line: 167, column: 11, scope: !571)
!716 = !DILocation(line: 167, column: 24, scope: !571)
!717 = !DILocation(line: 167, column: 25, scope: !571)
!718 = !DILocation(line: 167, column: 32, scope: !571)
!719 = !DILocation(line: 167, column: 45, scope: !571)
!720 = !DILocation(line: 167, column: 52, scope: !571)
!721 = !DILocation(line: 167, column: 65, scope: !571)
!722 = !DILocation(line: 167, column: 72, scope: !571)
!723 = !DILocation(line: 167, column: 85, scope: !571)
!724 = !DILocation(line: 167, column: 92, scope: !571)
!725 = !DILocation(line: 168, column: 25, scope: !571)
!726 = !DILocation(line: 168, column: 32, scope: !571)
!727 = !DILocation(line: 168, column: 46, scope: !571)
!728 = !DILocation(line: 168, column: 53, scope: !571)
!729 = !DILocation(line: 168, column: 66, scope: !571)
!730 = !DILocation(line: 168, column: 73, scope: !571)
!731 = !DILocation(line: 168, column: 86, scope: !571)
!732 = !DILocation(line: 168, column: 93, scope: !571)
!733 = !DILocation(line: 168, column: 106, scope: !571)
!734 = !DILocation(line: 168, column: 113, scope: !571)
!735 = !DILocalVariable(name: "microop_val", scope: !571, file: !3, line: 170, type: !736)
!736 = !DICompositeType(tag: DW_TAG_array_type, baseType: !502, size: 1728, elements: !27)
!737 = !DILocation(line: 170, column: 15, scope: !571)
!738 = !DILocation(line: 170, column: 32, scope: !571)
!739 = !DILocation(line: 170, column: 33, scope: !571)
!740 = !DILocation(line: 170, column: 40, scope: !571)
!741 = !DILocation(line: 170, column: 49, scope: !571)
!742 = !DILocation(line: 170, column: 56, scope: !571)
!743 = !DILocation(line: 170, column: 65, scope: !571)
!744 = !DILocation(line: 170, column: 72, scope: !571)
!745 = !DILocation(line: 170, column: 81, scope: !571)
!746 = !DILocation(line: 170, column: 88, scope: !571)
!747 = !DILocation(line: 171, column: 33, scope: !571)
!748 = !DILocation(line: 171, column: 40, scope: !571)
!749 = !DILocation(line: 171, column: 50, scope: !571)
!750 = !DILocation(line: 171, column: 57, scope: !571)
!751 = !DILocation(line: 171, column: 66, scope: !571)
!752 = !DILocation(line: 171, column: 73, scope: !571)
!753 = !DILocation(line: 171, column: 82, scope: !571)
!754 = !DILocation(line: 171, column: 89, scope: !571)
!755 = !DILocation(line: 171, column: 98, scope: !571)
!756 = !DILocation(line: 171, column: 105, scope: !571)
!757 = !DILocation(line: 175, column: 9, scope: !758)
!758 = distinct !DILexicalBlock(scope: !571, file: !3, line: 175, column: 8)
!759 = !DILocation(line: 175, column: 16, scope: !758)
!760 = !DILocation(line: 175, column: 27, scope: !758)
!761 = !DILocation(line: 175, column: 35, scope: !758)
!762 = !DILocation(line: 175, column: 22, scope: !758)
!763 = !DILocation(line: 176, column: 35, scope: !764)
!764 = distinct !DILexicalBlock(scope: !758, file: !3, line: 175, column: 42)
!765 = !DILocation(line: 176, column: 25, scope: !764)
!766 = !DILocation(line: 176, column: 23, scope: !764)
!767 = !DILocalVariable(name: "i", scope: !768, file: !3, line: 177, type: !11)
!768 = distinct !DILexicalBlock(scope: !764, file: !3, line: 177, column: 9)
!769 = !DILocation(line: 177, column: 18, scope: !768)
!770 = !DILocation(line: 177, column: 14, scope: !768)
!771 = !DILocation(line: 177, column: 22, scope: !772)
!772 = distinct !DILexicalBlock(scope: !768, file: !3, line: 177, column: 9)
!773 = !DILocation(line: 177, column: 23, scope: !772)
!774 = !DILocation(line: 177, column: 9, scope: !768)
!775 = !DILocation(line: 178, column: 27, scope: !776)
!776 = distinct !DILexicalBlock(scope: !772, file: !3, line: 177, column: 30)
!777 = !DILocation(line: 178, column: 40, scope: !776)
!778 = !DILocation(line: 178, column: 24, scope: !776)
!779 = !DILocation(line: 178, column: 13, scope: !776)
!780 = !DILocation(line: 178, column: 26, scope: !776)
!781 = !DILocation(line: 177, column: 27, scope: !772)
!782 = !DILocation(line: 177, column: 9, scope: !772)
!783 = distinct !{!783, !774, !784}
!784 = !DILocation(line: 179, column: 10, scope: !768)
!785 = !DILocalVariable(name: "i", scope: !786, file: !3, line: 180, type: !11)
!786 = distinct !DILexicalBlock(scope: !764, file: !3, line: 180, column: 9)
!787 = !DILocation(line: 180, column: 18, scope: !786)
!788 = !DILocation(line: 180, column: 14, scope: !786)
!789 = !DILocation(line: 180, column: 22, scope: !790)
!790 = distinct !DILexicalBlock(scope: !786, file: !3, line: 180, column: 9)
!791 = !DILocation(line: 180, column: 23, scope: !790)
!792 = !DILocation(line: 180, column: 9, scope: !786)
!793 = !DILocation(line: 181, column: 49, scope: !794)
!794 = distinct !DILexicalBlock(scope: !790, file: !3, line: 180, column: 30)
!795 = !DILocation(line: 181, column: 41, scope: !794)
!796 = !DILocation(line: 181, column: 27, scope: !794)
!797 = !DILocation(line: 181, column: 25, scope: !794)
!798 = !DILocation(line: 182, column: 27, scope: !794)
!799 = !DILocation(line: 182, column: 39, scope: !794)
!800 = !DILocation(line: 182, column: 24, scope: !794)
!801 = !DILocation(line: 182, column: 13, scope: !794)
!802 = !DILocation(line: 182, column: 26, scope: !794)
!803 = !DILocation(line: 180, column: 27, scope: !790)
!804 = !DILocation(line: 180, column: 9, scope: !790)
!805 = distinct !{!805, !792, !806}
!806 = !DILocation(line: 183, column: 13, scope: !786)
!807 = !DILocalVariable(name: "i", scope: !808, file: !3, line: 184, type: !11)
!808 = distinct !DILexicalBlock(scope: !764, file: !3, line: 184, column: 9)
!809 = !DILocation(line: 184, column: 18, scope: !808)
!810 = !DILocation(line: 184, column: 14, scope: !808)
!811 = !DILocation(line: 184, column: 22, scope: !812)
!812 = distinct !DILexicalBlock(scope: !808, file: !3, line: 184, column: 9)
!813 = !DILocation(line: 184, column: 23, scope: !812)
!814 = !DILocation(line: 184, column: 9, scope: !808)
!815 = !DILocation(line: 185, column: 57, scope: !816)
!816 = distinct !DILexicalBlock(scope: !812, file: !3, line: 184, column: 30)
!817 = !DILocation(line: 185, column: 45, scope: !816)
!818 = !DILocation(line: 185, column: 27, scope: !816)
!819 = !DILocation(line: 185, column: 25, scope: !816)
!820 = !DILocation(line: 186, column: 27, scope: !816)
!821 = !DILocation(line: 186, column: 39, scope: !816)
!822 = !DILocation(line: 186, column: 24, scope: !816)
!823 = !DILocation(line: 186, column: 13, scope: !816)
!824 = !DILocation(line: 186, column: 26, scope: !816)
!825 = !DILocation(line: 184, column: 27, scope: !812)
!826 = !DILocation(line: 184, column: 9, scope: !812)
!827 = distinct !{!827, !814, !828}
!828 = !DILocation(line: 187, column: 13, scope: !808)
!829 = !DILocalVariable(name: "i", scope: !830, file: !3, line: 188, type: !11)
!830 = distinct !DILexicalBlock(scope: !764, file: !3, line: 188, column: 9)
!831 = !DILocation(line: 188, column: 18, scope: !830)
!832 = !DILocation(line: 188, column: 14, scope: !830)
!833 = !DILocation(line: 188, column: 25, scope: !834)
!834 = distinct !DILexicalBlock(scope: !830, file: !3, line: 188, column: 9)
!835 = !DILocation(line: 188, column: 27, scope: !834)
!836 = !DILocation(line: 188, column: 9, scope: !830)
!837 = !DILocation(line: 189, column: 10, scope: !838)
!838 = distinct !DILexicalBlock(scope: !834, file: !3, line: 188, column: 43)
!839 = !DILocation(line: 190, column: 13, scope: !838)
!840 = !DILocation(line: 188, column: 39, scope: !834)
!841 = !DILocation(line: 188, column: 9, scope: !834)
!842 = distinct !{!842, !836, !843}
!843 = !DILocation(line: 191, column: 13, scope: !830)
!844 = !DILocation(line: 204, column: 1, scope: !571)
!845 = distinct !DISubprogram(name: "memcpy", scope: !846, file: !846, line: 12, type: !847, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !127, retainedNodes: !4)
!846 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!847 = !DISubroutineType(types: !848)
!848 = !{!38, !38, !39, !849}
!849 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !850, line: 46, baseType: !43)
!850 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!851 = !DILocalVariable(name: "destaddr", arg: 1, scope: !845, file: !846, line: 12, type: !38)
!852 = !DILocation(line: 12, column: 20, scope: !845)
!853 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !845, file: !846, line: 12, type: !39)
!854 = !DILocation(line: 12, column: 42, scope: !845)
!855 = !DILocalVariable(name: "len", arg: 3, scope: !845, file: !846, line: 12, type: !849)
!856 = !DILocation(line: 12, column: 58, scope: !845)
!857 = !DILocalVariable(name: "dest", scope: !845, file: !846, line: 13, type: !67)
!858 = !DILocation(line: 13, column: 9, scope: !845)
!859 = !DILocation(line: 13, column: 16, scope: !845)
!860 = !DILocalVariable(name: "src", scope: !845, file: !846, line: 14, type: !71)
!861 = !DILocation(line: 14, column: 15, scope: !845)
!862 = !DILocation(line: 14, column: 21, scope: !845)
!863 = !DILocation(line: 16, column: 3, scope: !845)
!864 = !DILocation(line: 16, column: 13, scope: !845)
!865 = !DILocation(line: 16, column: 16, scope: !845)
!866 = !DILocation(line: 17, column: 19, scope: !845)
!867 = !DILocation(line: 17, column: 15, scope: !845)
!868 = !DILocation(line: 17, column: 10, scope: !845)
!869 = !DILocation(line: 17, column: 13, scope: !845)
!870 = distinct !{!870, !863, !866}
!871 = !DILocation(line: 18, column: 10, scope: !845)
!872 = !DILocation(line: 18, column: 3, scope: !845)
