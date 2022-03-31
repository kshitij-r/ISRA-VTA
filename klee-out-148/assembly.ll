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
@arr_val = dso_local global i32* null, align 8, !dbg !14
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !18
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !21
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !23
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !25
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !27
@acc_mem_base_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !32
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@__const.main.gemm_base = private unnamed_addr constant %struct.GEMM_STRUCT_REF { i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i32 0, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [31 x i8] c"acc_stage3[i] == acc_stage2[i]\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"gemm.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !137 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !143, metadata !DIExpression()), !dbg !144
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %j, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !154
  %cmp = icmp slt i32 %0, 3, !dbg !156
  br i1 %cmp, label %for.body, label %for.end12, !dbg !157

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !158
  br label %for.cond1, !dbg !160

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !161
  %cmp2 = icmp slt i32 %1, 3, !dbg !163
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !164

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !165
  %3 = load i32, i32* %j, align 4, !dbg !166
  %idxprom = sext i32 %3 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !165
  %4 = load i32, i32* %i, align 4, !dbg !167
  %idxprom4 = sext i32 %4 to i64, !dbg !165
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !165
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !165
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !168
  %7 = load i32, i32* %i, align 4, !dbg !169
  %idxprom6 = sext i32 %7 to i64, !dbg !168
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !168
  %8 = load i32, i32* %j, align 4, !dbg !170
  %idxprom8 = sext i32 %8 to i64, !dbg !168
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !168
  store i32 %5, i32* %arrayidx9, align 4, !dbg !171
  %9 = load i32, i32* %j, align 4, !dbg !172
  %inc = add nsw i32 %9, 1, !dbg !172
  store i32 %inc, i32* %j, align 4, !dbg !172
  br label %for.cond1, !dbg !173, !llvm.loop !174

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !176
  %inc11 = add nsw i32 %10, 1, !dbg !176
  store i32 %inc11, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !180
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPKjS0_(i32* %mat1, i32* %mat2) #0 !dbg !181 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res_index = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !186, metadata !DIExpression()), !dbg !187
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i32* %res_index, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 0, i32* %res_index, align 4, !dbg !191
  call void @llvm.dbg.declare(metadata i32* %res, metadata !192, metadata !DIExpression()), !dbg !193
  store i32 0, i32* %res, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata i32* %i, metadata !194, metadata !DIExpression()), !dbg !196
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !198
  %cmp = icmp slt i32 %0, 3, !dbg !200
  br i1 %cmp, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !202
  %2 = load i32, i32* %i, align 4, !dbg !204
  %idxprom = sext i32 %2 to i64, !dbg !202
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !202
  %3 = load i32, i32* %arrayidx, align 4, !dbg !202
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !205
  %5 = load i32, i32* %i, align 4, !dbg !206
  %idxprom1 = sext i32 %5 to i64, !dbg !205
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !205
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !205
  %mul = mul i32 %3, %6, !dbg !207
  %7 = load i32, i32* %res, align 4, !dbg !208
  %add = add i32 %7, %mul, !dbg !208
  store i32 %add, i32* %res, align 4, !dbg !208
  %8 = load i32, i32* %i, align 4, !dbg !209
  %inc = add nsw i32 %8, 1, !dbg !209
  store i32 %inc, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !210, !llvm.loop !211

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !213
  %10 = load i32, i32* %res_index, align 4, !dbg !214
  %idxprom3 = sext i32 %10 to i64, !dbg !215
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @result, i64 0, i64 %idxprom3, !dbg !215
  store i32 %9, i32* %arrayidx4, align 4, !dbg !216
  %11 = load i32, i32* %res_index, align 4, !dbg !217
  %inc5 = add nsw i32 %11, 1, !dbg !217
  store i32 %inc5, i32* %res_index, align 4, !dbg !217
  ret i32* getelementptr inbounds ([10 x i32], [10 x i32]* @result, i64 0, i64 0), !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %myinsn) #0 !dbg !219 {
entry:
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %i26 = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %myinsn, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %row, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32* %col, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata i32* %i, metadata !240, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !242, metadata !DIExpression()), !dbg !243
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %myinsn, i32 0, i32 1, !dbg !244
  %0 = load i32, i32* %OPCODE, align 4, !dbg !244
  %cmp = icmp eq i32 %0, 2, !dbg !246
  br i1 %cmp, label %if.then, label %if.end, !dbg !247

if.then:                                          ; preds = %entry
  store i32 0, i32* %row, align 4, !dbg !248
  br label %for.cond, !dbg !251

for.cond:                                         ; preds = %for.inc23, %if.then
  %1 = load i32, i32* %row, align 4, !dbg !252
  %cmp1 = icmp ult i32 %1, 3, !dbg !254
  br i1 %cmp1, label %for.body, label %for.end25, !dbg !255

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %col, align 4, !dbg !256
  br label %for.cond2, !dbg !259

for.cond2:                                        ; preds = %for.end, %for.body
  %2 = load i32, i32* %col, align 4, !dbg !260
  %cmp3 = icmp ult i32 %2, 3, !dbg !262
  br i1 %cmp3, label %for.body4, label %for.inc23, !dbg !263

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %sum, align 4, !dbg !264
  store i32 0, i32* %i, align 4, !dbg !266
  br label %for.cond5, !dbg !268

for.cond5:                                        ; preds = %for.body7, %for.body4
  %3 = load i32, i32* %i, align 4, !dbg !269
  %cmp6 = icmp ult i32 %3, 3, !dbg !271
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !272

for.body7:                                        ; preds = %for.cond5
  %4 = load i32, i32* %row, align 4, !dbg !273
  %idx.ext = zext i32 %4 to i64, !dbg !275
  %add.ptr = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), i64 %idx.ext, !dbg !275
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr, i64 0, i64 0, !dbg !276
  %5 = load i32, i32* %i, align 4, !dbg !277
  %idx.ext8 = zext i32 %5 to i64, !dbg !278
  %add.ptr9 = getelementptr inbounds i32, i32* %arraydecay, i64 %idx.ext8, !dbg !278
  %6 = load i32, i32* %add.ptr9, align 4, !dbg !279
  %7 = load i32, i32* %i, align 4, !dbg !280
  %idx.ext10 = zext i32 %7 to i64, !dbg !281
  %add.ptr11 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), i64 %idx.ext10, !dbg !281
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr11, i64 0, i64 0, !dbg !282
  %8 = load i32, i32* %col, align 4, !dbg !283
  %idx.ext13 = zext i32 %8 to i64, !dbg !284
  %add.ptr14 = getelementptr inbounds i32, i32* %arraydecay12, i64 %idx.ext13, !dbg !284
  %9 = load i32, i32* %add.ptr14, align 4, !dbg !285
  %mul = mul i32 %6, %9, !dbg !286
  %10 = load i32, i32* %sum, align 4, !dbg !287
  %add = add i32 %10, %mul, !dbg !287
  store i32 %add, i32* %sum, align 4, !dbg !287
  %11 = load i32, i32* %i, align 4, !dbg !288
  %inc = add i32 %11, 1, !dbg !288
  store i32 %inc, i32* %i, align 4, !dbg !288
  br label %for.cond5, !dbg !289, !llvm.loop !290

for.end:                                          ; preds = %for.cond5
  %12 = load i32, i32* %sum, align 4, !dbg !292
  %13 = load i32, i32* %row, align 4, !dbg !293
  %idx.ext15 = zext i32 %13 to i64, !dbg !294
  %add.ptr16 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 0), i64 %idx.ext15, !dbg !294
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr16, i64 0, i64 0, !dbg !295
  %14 = load i32, i32* %col, align 4, !dbg !296
  %idx.ext18 = zext i32 %14 to i64, !dbg !297
  %add.ptr19 = getelementptr inbounds i32, i32* %arraydecay17, i64 %idx.ext18, !dbg !297
  store i32 %12, i32* %add.ptr19, align 4, !dbg !298
  %15 = load i32, i32* %col, align 4, !dbg !299
  %inc21 = add i32 %15, 1, !dbg !299
  store i32 %inc21, i32* %col, align 4, !dbg !299
  br label %for.cond2, !dbg !300, !llvm.loop !301

for.inc23:                                        ; preds = %for.cond2
  %16 = load i32, i32* %row, align 4, !dbg !303
  %inc24 = add i32 %16, 1, !dbg !303
  store i32 %inc24, i32* %row, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end25:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !307, metadata !DIExpression()), !dbg !309
  store i32 0, i32* %i26, align 4, !dbg !309
  br label %for.cond27, !dbg !310

for.cond27:                                       ; preds = %for.inc42, %for.end25
  %17 = load i32, i32* %i26, align 4, !dbg !311
  %cmp28 = icmp slt i32 %17, 3, !dbg !313
  br i1 %cmp28, label %for.body29, label %if.end, !dbg !314

for.body29:                                       ; preds = %for.cond27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !315, metadata !DIExpression()), !dbg !318
  store i32 0, i32* %j, align 4, !dbg !318
  br label %for.cond30, !dbg !319

for.cond30:                                       ; preds = %for.body32, %for.body29
  %18 = load i32, i32* %j, align 4, !dbg !320
  %cmp31 = icmp slt i32 %18, 3, !dbg !322
  %19 = load i32, i32* %i26, align 4, !dbg !323
  br i1 %cmp31, label %for.body32, label %for.inc42, !dbg !324

for.body32:                                       ; preds = %for.cond30
  %idxprom = sext i32 %19 to i64, !dbg !325
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 %idxprom, !dbg !325
  %20 = load i32, i32* %j, align 4, !dbg !327
  %idxprom33 = sext i32 %20 to i64, !dbg !325
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom33, !dbg !325
  %21 = load i32, i32* %arrayidx34, align 4, !dbg !325
  %22 = load i32, i32* %i26, align 4, !dbg !328
  %mul35 = mul nsw i32 %22, 3, !dbg !329
  %23 = load i32, i32* %j, align 4, !dbg !330
  %add36 = add nsw i32 %mul35, %23, !dbg !331
  %idxprom37 = sext i32 %add36 to i64, !dbg !332
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 %idxprom37, !dbg !332
  store i32 %21, i32* %arrayidx38, align 4, !dbg !333
  %24 = load i32, i32* %j, align 4, !dbg !334
  %inc40 = add nsw i32 %24, 1, !dbg !334
  store i32 %inc40, i32* %j, align 4, !dbg !334
  br label %for.cond30, !dbg !335, !llvm.loop !336

for.inc42:                                        ; preds = %for.cond30
  %inc43 = add nsw i32 %19, 1, !dbg !338
  store i32 %inc43, i32* %i26, align 4, !dbg !338
  br label %for.cond27, !dbg !339, !llvm.loop !340

if.end:                                           ; preds = %for.cond27, %entry
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 0), !dbg !342
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z6mulMatPA3_jS0_S0_([3 x i32]* %mat1, [3 x i32]* %mat2, [3 x i32]* %res) #0 !dbg !343 {
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
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat1.addr, metadata !346, metadata !DIExpression()), !dbg !347
  store [3 x i32]* %mat2, [3 x i32]** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %mat2.addr, metadata !348, metadata !DIExpression()), !dbg !349
  store [3 x i32]* %res, [3 x i32]** %res.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %res.addr, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata i32* %i, metadata !352, metadata !DIExpression()), !dbg !354
  store i32 0, i32* %i, align 4, !dbg !354
  br label %for.cond, !dbg !355

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !356
  %cmp = icmp slt i32 %0, 3, !dbg !358
  br i1 %cmp, label %for.body, label %for.end22, !dbg !359

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !360, metadata !DIExpression()), !dbg !363
  store i32 0, i32* %j, align 4, !dbg !363
  br label %for.cond1, !dbg !364

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !365
  %cmp2 = icmp slt i32 %1, 3, !dbg !367
  br i1 %cmp2, label %for.body3, label %for.inc20, !dbg !368

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !369, metadata !DIExpression()), !dbg !372
  store i32 0, i32* %k, align 4, !dbg !372
  br label %for.cond4, !dbg !373

for.cond4:                                        ; preds = %for.body6, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !374
  %cmp5 = icmp slt i32 %2, 3, !dbg !376
  br i1 %cmp5, label %for.body6, label %for.inc17, !dbg !377

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !378
  %idxprom = sext i32 %3 to i64, !dbg !380
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 %idxprom, !dbg !380
  %4 = load i32, i32* %k, align 4, !dbg !381
  %idxprom7 = sext i32 %4 to i64, !dbg !380
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !380
  %5 = load i32, i32* %arrayidx8, align 4, !dbg !380
  %6 = load i32, i32* %k, align 4, !dbg !382
  %idxprom9 = sext i32 %6 to i64, !dbg !383
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 %idxprom9, !dbg !383
  %7 = load i32, i32* %j, align 4, !dbg !384
  %idxprom11 = sext i32 %7 to i64, !dbg !383
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 %idxprom11, !dbg !383
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !383
  %mul = mul i32 %5, %8, !dbg !385
  %9 = load i32, i32* %i, align 4, !dbg !386
  %idxprom13 = sext i32 %9 to i64, !dbg !387
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom13, !dbg !387
  %10 = load i32, i32* %j, align 4, !dbg !388
  %idxprom15 = sext i32 %10 to i64, !dbg !387
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 %idxprom15, !dbg !387
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !389
  %add = add i32 %11, %mul, !dbg !389
  store i32 %add, i32* %arrayidx16, align 4, !dbg !389
  %12 = load i32, i32* %k, align 4, !dbg !390
  %inc = add nsw i32 %12, 1, !dbg !390
  store i32 %inc, i32* %k, align 4, !dbg !390
  br label %for.cond4, !dbg !391, !llvm.loop !392

for.inc17:                                        ; preds = %for.cond4
  %13 = load i32, i32* %j, align 4, !dbg !394
  %inc18 = add nsw i32 %13, 1, !dbg !394
  store i32 %inc18, i32* %j, align 4, !dbg !394
  br label %for.cond1, !dbg !395, !llvm.loop !396

for.inc20:                                        ; preds = %for.cond1
  %14 = load i32, i32* %i, align 4, !dbg !398
  %inc21 = add nsw i32 %14, 1, !dbg !398
  store i32 %inc21, i32* %i, align 4, !dbg !398
  br label %for.cond, !dbg !399, !llvm.loop !400

for.end22:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !402, metadata !DIExpression()), !dbg !404
  store i32 0, i32* %i23, align 4, !dbg !404
  br label %for.cond24, !dbg !405

for.cond24:                                       ; preds = %for.inc42, %for.end22
  %15 = load i32, i32* %i23, align 4, !dbg !406
  %cmp25 = icmp slt i32 %15, 3, !dbg !408
  br i1 %cmp25, label %for.body26, label %for.end44, !dbg !409

for.body26:                                       ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i32* %j27, metadata !410, metadata !DIExpression()), !dbg !413
  store i32 0, i32* %j27, align 4, !dbg !413
  br label %for.cond28, !dbg !414

for.cond28:                                       ; preds = %for.body30, %for.body26
  %16 = load i32, i32* %j27, align 4, !dbg !415
  %cmp29 = icmp slt i32 %16, 3, !dbg !417
  %17 = load i32, i32* %i23, align 4, !dbg !418
  br i1 %cmp29, label %for.body30, label %for.inc42, !dbg !419

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %17 to i64, !dbg !420
  %arrayidx32 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 %idxprom31, !dbg !420
  %18 = load i32, i32* %j27, align 4, !dbg !422
  %idxprom33 = sext i32 %18 to i64, !dbg !420
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx32, i64 0, i64 %idxprom33, !dbg !420
  %19 = load i32, i32* %arrayidx34, align 4, !dbg !420
  %20 = load i32, i32* %i23, align 4, !dbg !423
  %mul35 = mul nsw i32 %20, 3, !dbg !424
  %21 = load i32, i32* %j27, align 4, !dbg !425
  %add36 = add nsw i32 %mul35, %21, !dbg !426
  %idxprom37 = sext i32 %add36 to i64, !dbg !427
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 %idxprom37, !dbg !427
  store i32 %19, i32* %arrayidx38, align 4, !dbg !428
  %22 = load i32, i32* %j27, align 4, !dbg !429
  %inc40 = add nsw i32 %22, 1, !dbg !429
  store i32 %inc40, i32* %j27, align 4, !dbg !429
  br label %for.cond28, !dbg !430, !llvm.loop !431

for.inc42:                                        ; preds = %for.cond28
  %inc43 = add nsw i32 %17, 1, !dbg !433
  store i32 %inc43, i32* %i23, align 4, !dbg !433
  br label %for.cond24, !dbg !434, !llvm.loop !435

for.end44:                                        ; preds = %for.cond24
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_flat, i64 0, i64 0), !dbg !437
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !438 {
entry:
  %arr_ref = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !439, metadata !DIExpression()), !dbg !440
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !441, metadata !DIExpression()), !dbg !442
  store i32* null, i32** %arr_ref, align 8, !dbg !442
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !443, metadata !DIExpression()), !dbg !444
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !445, metadata !DIExpression()), !dbg !446
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 1, !dbg !447
  %0 = load i32, i32* %OPCODE, align 4, !dbg !447
  %cmp = icmp eq i32 %0, 2, !dbg !449
  br i1 %cmp, label %if.then, label %if.end, !dbg !450

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !451, metadata !DIExpression()), !dbg !454
  store i32 0, i32* %i, align 4, !dbg !454
  br label %for.cond, !dbg !455

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !456
  %cmp1 = icmp slt i32 %1, 3, !dbg !458
  br i1 %cmp1, label %for.body, label %for.end, !dbg !459

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !460
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !462
  %2 = load i32*, i32** %inp_mem, align 8, !dbg !462
  %3 = load i32, i32* %i, align 4, !dbg !463
  %idx.ext = sext i32 %3 to i64, !dbg !464
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %idx.ext, !dbg !464
  %4 = load i32, i32* %add.ptr, align 4, !dbg !465
  %5 = load i32, i32* %i, align 4, !dbg !466
  %idxprom = sext i32 %5 to i64, !dbg !467
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !467
  store i32 %4, i32* %arrayidx, align 4, !dbg !468
  %6 = load i32, i32* %i, align 4, !dbg !469
  %inc = add nsw i32 %6, 1, !dbg !469
  store i32 %inc, i32* %i, align 4, !dbg !469
  br label %for.cond, !dbg !470, !llvm.loop !471

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !473, metadata !DIExpression()), !dbg !475
  store i32 0, i32* %i2, align 4, !dbg !475
  br label %for.cond3, !dbg !476

for.cond3:                                        ; preds = %for.body5, %for.end
  %7 = load i32, i32* %i2, align 4, !dbg !477
  %cmp4 = icmp slt i32 %7, 3, !dbg !479
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !480

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !481
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS6, i32 0, i32 1, !dbg !483
  %8 = load i32*, i32** %wgt_mem, align 8, !dbg !483
  %9 = load i32, i32* %i2, align 4, !dbg !484
  %idx.ext7 = sext i32 %9 to i64, !dbg !485
  %add.ptr8 = getelementptr inbounds i32, i32* %8, i64 %idx.ext7, !dbg !485
  %10 = load i32, i32* %add.ptr8, align 4, !dbg !486
  %11 = load i32, i32* %i2, align 4, !dbg !487
  %idxprom9 = sext i32 %11 to i64, !dbg !488
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom9, !dbg !488
  store i32 %10, i32* %arrayidx10, align 4, !dbg !489
  %12 = load i32, i32* %i2, align 4, !dbg !490
  %inc12 = add nsw i32 %12, 1, !dbg !490
  store i32 %inc12, i32* %i2, align 4, !dbg !490
  br label %for.cond3, !dbg !491, !llvm.loop !492

for.end13:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !494
  %arraydecay14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !495
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay14), !dbg !496
  store i32* %call, i32** %arr_ref, align 8, !dbg !497
  br label %if.end, !dbg !498

if.end:                                           ; preds = %for.end13, %entry
  %13 = load i32*, i32** %arr_ref, align 8, !dbg !499
  ret i32* %13, !dbg !500
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !501 {
entry:
  %arr_val = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !515, metadata !DIExpression()), !dbg !516
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !517, metadata !DIExpression()), !dbg !518
  store i32* null, i32** %arr_val, align 8, !dbg !518
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !519, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !521, metadata !DIExpression()), !dbg !522
  %OPCODE = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 1, !dbg !523
  %0 = load i32, i32* %OPCODE, align 4, !dbg !523
  %cmp = icmp eq i32 %0, 2, !dbg !525
  br i1 %cmp, label %if.then, label %if.end, !dbg !526

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !527, metadata !DIExpression()), !dbg !530
  store i32 0, i32* %i, align 4, !dbg !530
  br label %for.cond, !dbg !531

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !532
  %cmp1 = icmp slt i32 %1, 3, !dbg !534
  br i1 %cmp1, label %for.body, label %for.end, !dbg !535

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !536
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !538
  %2 = load i32, i32* %inp_mem, align 4, !dbg !538
  %3 = load i32, i32* %i, align 4, !dbg !539
  %add = add i32 %2, %3, !dbg !540
  %4 = load i32, i32* %i, align 4, !dbg !541
  %idxprom = sext i32 %4 to i64, !dbg !542
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !542
  store i32 %add, i32* %arrayidx, align 4, !dbg !543
  %5 = load i32, i32* %i, align 4, !dbg !544
  %inc = add nsw i32 %5, 1, !dbg !544
  store i32 %inc, i32* %i, align 4, !dbg !544
  br label %for.cond, !dbg !545, !llvm.loop !546

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !548, metadata !DIExpression()), !dbg !550
  store i32 0, i32* %i2, align 4, !dbg !550
  br label %for.cond3, !dbg !551

for.cond3:                                        ; preds = %for.body5, %for.end
  %6 = load i32, i32* %i2, align 4, !dbg !552
  %cmp4 = icmp slt i32 %6, 3, !dbg !554
  br i1 %cmp4, label %for.body5, label %for.end11, !dbg !555

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !556
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS6, i32 0, i32 1, !dbg !558
  %7 = load i32, i32* %wgt_mem, align 4, !dbg !558
  %8 = load i32, i32* %i2, align 4, !dbg !559
  %idxprom7 = sext i32 %8 to i64, !dbg !560
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom7, !dbg !560
  store i32 %7, i32* %arrayidx8, align 4, !dbg !561
  %9 = load i32, i32* %i2, align 4, !dbg !562
  %inc10 = add nsw i32 %9, 1, !dbg !562
  store i32 %inc10, i32* %i2, align 4, !dbg !562
  br label %for.cond3, !dbg !563, !llvm.loop !564

for.end11:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !566
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !567
  %call = call i32* @_Z14matrixMultiplyPKjS0_(i32* %arraydecay, i32* %arraydecay12), !dbg !568
  store i32* %call, i32** %arr_val, align 8, !dbg !569
  br label %if.end, !dbg !570

if.end:                                           ; preds = %for.end11, %entry
  %10 = load i32*, i32** %arr_val, align 8, !dbg !571
  ret i32* %10, !dbg !572
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !573 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !581, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !583, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !585, metadata !DIExpression()), !dbg !586
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !587, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !595, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !601, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !605, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !607, metadata !DIExpression()), !dbg !608
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !609, metadata !DIExpression()), !dbg !610
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !613, metadata !DIExpression()), !dbg !614
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !615
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !616
  %0 = bitcast i32* %arraydecay to i8*, !dbg !616
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !616
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !617
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !617
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !617
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !618
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !618
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !618
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !619
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !619
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !619
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !620
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !620
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !620
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !621
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !621
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !621
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !622
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !622
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !622
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !623
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !623
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !623
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !624
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !624
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !624
  %18 = bitcast i32* %op_type to i8*, !dbg !625
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !626
  %19 = bitcast i32* %opcode to i8*, !dbg !627
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !628
  call void @llvm.dbg.declare(metadata %struct.GEMM_STRUCT_REF* %gemm_base, metadata !629, metadata !DIExpression()), !dbg !630
  %20 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !630
  %21 = call i8* @memcpy(i8* %20, i8* bitcast (%struct.GEMM_STRUCT_REF* @__const.main.gemm_base to i8*), i64 24), !dbg !630
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instruction, metadata !631, metadata !DIExpression()), !dbg !632
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 0, !dbg !633
  store i32 0, i32* %ID, align 8, !dbg !633
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 1, !dbg !633
  store i32 2, i32* %OPCODE, align 4, !dbg !633
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 2, !dbg !633
  store i32 0, i32* %OPTYPE, align 8, !dbg !633
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 3, !dbg !633
  %22 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !634
  %23 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !634
  %24 = call i8* @memcpy(i8* %22, i8* %23, i64 24), !dbg !634
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !635, metadata !DIExpression()), !dbg !637
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !638
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !639
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !640
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !639
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !639
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !641
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !639
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !639
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !642
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !639
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !638
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !643
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !644
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !643
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !643
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !645
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !643
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !643
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !646
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !643
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !638
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !647
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !648
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !647
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !647
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !649
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !647
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !647
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !650
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !647
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !638
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !651
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !652
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !651
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !651
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !653
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !651
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !651
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !654
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !651
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !638
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !655
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !656
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !655
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !655
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !657
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !655
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !655
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !658
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !655
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !638
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !659
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !660
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !659
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !659
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !661
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !659
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !659
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !662
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !659
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !638
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !663
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !664
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !663
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !663
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !665
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !663
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !663
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !666
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !663
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !638
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !667
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !668
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !667
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !667
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !669
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !667
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !667
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !670
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !667
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !638
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !671
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !672
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !671
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !671
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !673
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !671
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !671
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !674
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !671
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !675, metadata !DIExpression()), !dbg !677
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !678
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !679
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !680
  %25 = load i32, i32* %arrayidx68, align 4, !dbg !680
  store i32 %25, i32* %inp_mem67, align 4, !dbg !679
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !679
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !681
  %26 = load i32, i32* %arrayidx70, align 4, !dbg !681
  store i32 %26, i32* %wgt_mem69, align 4, !dbg !679
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !679
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !682
  %27 = load i32, i32* %arrayidx72, align 4, !dbg !682
  store i32 %27, i32* %acc_mem71, align 4, !dbg !679
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !678
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !683
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !684
  %28 = load i32, i32* %arrayidx75, align 4, !dbg !684
  store i32 %28, i32* %inp_mem74, align 4, !dbg !683
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !683
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !685
  %29 = load i32, i32* %arrayidx77, align 4, !dbg !685
  store i32 %29, i32* %wgt_mem76, align 4, !dbg !683
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !683
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !686
  %30 = load i32, i32* %arrayidx79, align 4, !dbg !686
  store i32 %30, i32* %acc_mem78, align 4, !dbg !683
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !678
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !687
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !688
  %31 = load i32, i32* %arrayidx82, align 4, !dbg !688
  store i32 %31, i32* %inp_mem81, align 4, !dbg !687
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !687
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !689
  %32 = load i32, i32* %arrayidx84, align 4, !dbg !689
  store i32 %32, i32* %wgt_mem83, align 4, !dbg !687
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !687
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !690
  %33 = load i32, i32* %arrayidx86, align 4, !dbg !690
  store i32 %33, i32* %acc_mem85, align 4, !dbg !687
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !678
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !691
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !692
  %34 = load i32, i32* %arrayidx89, align 4, !dbg !692
  store i32 %34, i32* %inp_mem88, align 4, !dbg !691
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !691
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !693
  %35 = load i32, i32* %arrayidx91, align 4, !dbg !693
  store i32 %35, i32* %wgt_mem90, align 4, !dbg !691
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !691
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !694
  %36 = load i32, i32* %arrayidx93, align 4, !dbg !694
  store i32 %36, i32* %acc_mem92, align 4, !dbg !691
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !678
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !695
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !696
  %37 = load i32, i32* %arrayidx96, align 4, !dbg !696
  store i32 %37, i32* %inp_mem95, align 4, !dbg !695
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !695
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !697
  %38 = load i32, i32* %arrayidx98, align 4, !dbg !697
  store i32 %38, i32* %wgt_mem97, align 4, !dbg !695
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !695
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !698
  %39 = load i32, i32* %arrayidx100, align 4, !dbg !698
  store i32 %39, i32* %acc_mem99, align 4, !dbg !695
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !678
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !699
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !700
  %40 = load i32, i32* %arrayidx103, align 4, !dbg !700
  store i32 %40, i32* %inp_mem102, align 4, !dbg !699
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !699
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !701
  %41 = load i32, i32* %arrayidx105, align 4, !dbg !701
  store i32 %41, i32* %wgt_mem104, align 4, !dbg !699
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !699
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !702
  %42 = load i32, i32* %arrayidx107, align 4, !dbg !702
  store i32 %42, i32* %acc_mem106, align 4, !dbg !699
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !678
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !703
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !704
  %43 = load i32, i32* %arrayidx110, align 4, !dbg !704
  store i32 %43, i32* %inp_mem109, align 4, !dbg !703
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !703
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !705
  %44 = load i32, i32* %arrayidx112, align 4, !dbg !705
  store i32 %44, i32* %wgt_mem111, align 4, !dbg !703
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !703
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !706
  %45 = load i32, i32* %arrayidx114, align 4, !dbg !706
  store i32 %45, i32* %acc_mem113, align 4, !dbg !703
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !678
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !707
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !708
  %46 = load i32, i32* %arrayidx117, align 4, !dbg !708
  store i32 %46, i32* %inp_mem116, align 4, !dbg !707
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !707
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !709
  %47 = load i32, i32* %arrayidx119, align 4, !dbg !709
  store i32 %47, i32* %wgt_mem118, align 4, !dbg !707
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !707
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !710
  %48 = load i32, i32* %arrayidx121, align 4, !dbg !710
  store i32 %48, i32* %acc_mem120, align 4, !dbg !707
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !678
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !711
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !712
  %49 = load i32, i32* %arrayidx124, align 4, !dbg !712
  store i32 %49, i32* %inp_mem123, align 4, !dbg !711
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !711
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !713
  %50 = load i32, i32* %arrayidx126, align 4, !dbg !713
  store i32 %50, i32* %wgt_mem125, align 4, !dbg !711
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !711
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !714
  %51 = load i32, i32* %arrayidx128, align 4, !dbg !714
  store i32 %51, i32* %acc_mem127, align 4, !dbg !711
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !715, metadata !DIExpression()), !dbg !717
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !718
  %ID130 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !719
  store i32 0, i32* %ID130, align 8, !dbg !719
  %OPCODE131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !719
  store i32 2, i32* %OPCODE131, align 4, !dbg !719
  %OPTYPE132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !719
  store i32 0, i32* %OPTYPE132, align 8, !dbg !719
  %OPERANDS133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !719
  %arrayidx134 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !720
  %52 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS133 to i8*, !dbg !720
  %53 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx134 to i8*, !dbg !720
  %54 = call i8* @memcpy(i8* %52, i8* %53, i64 24), !dbg !720
  %arrayinit.element135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !718
  %ID136 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 0, !dbg !721
  store i32 1, i32* %ID136, align 8, !dbg !721
  %OPCODE137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 1, !dbg !721
  store i32 2, i32* %OPCODE137, align 4, !dbg !721
  %OPTYPE138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 2, !dbg !721
  store i32 0, i32* %OPTYPE138, align 8, !dbg !721
  %OPERANDS139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 3, !dbg !721
  %arrayidx140 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !722
  %55 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS139 to i8*, !dbg !722
  %56 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx140 to i8*, !dbg !722
  %57 = call i8* @memcpy(i8* %55, i8* %56, i64 24), !dbg !722
  %arrayinit.element141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i64 1, !dbg !718
  %ID142 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 0, !dbg !723
  store i32 2, i32* %ID142, align 8, !dbg !723
  %OPCODE143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 1, !dbg !723
  store i32 2, i32* %OPCODE143, align 4, !dbg !723
  %OPTYPE144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 2, !dbg !723
  store i32 0, i32* %OPTYPE144, align 8, !dbg !723
  %OPERANDS145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 3, !dbg !723
  %arrayidx146 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !724
  %58 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS145 to i8*, !dbg !724
  %59 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx146 to i8*, !dbg !724
  %60 = call i8* @memcpy(i8* %58, i8* %59, i64 24), !dbg !724
  %arrayinit.element147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i64 1, !dbg !718
  %ID148 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 0, !dbg !725
  store i32 3, i32* %ID148, align 8, !dbg !725
  %OPCODE149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 1, !dbg !725
  store i32 2, i32* %OPCODE149, align 4, !dbg !725
  %OPTYPE150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 2, !dbg !725
  store i32 0, i32* %OPTYPE150, align 8, !dbg !725
  %OPERANDS151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 3, !dbg !725
  %arrayidx152 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !726
  %61 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS151 to i8*, !dbg !726
  %62 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx152 to i8*, !dbg !726
  %63 = call i8* @memcpy(i8* %61, i8* %62, i64 24), !dbg !726
  %arrayinit.element153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i64 1, !dbg !718
  %ID154 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 0, !dbg !727
  store i32 4, i32* %ID154, align 8, !dbg !727
  %OPCODE155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 1, !dbg !727
  store i32 2, i32* %OPCODE155, align 4, !dbg !727
  %OPTYPE156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 2, !dbg !727
  store i32 0, i32* %OPTYPE156, align 8, !dbg !727
  %OPERANDS157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 3, !dbg !727
  %arrayidx158 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !728
  %64 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS157 to i8*, !dbg !728
  %65 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx158 to i8*, !dbg !728
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 24), !dbg !728
  %arrayinit.element159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i64 1, !dbg !718
  %ID160 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 0, !dbg !729
  store i32 5, i32* %ID160, align 8, !dbg !729
  %OPCODE161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 1, !dbg !729
  store i32 2, i32* %OPCODE161, align 4, !dbg !729
  %OPTYPE162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 2, !dbg !729
  store i32 0, i32* %OPTYPE162, align 8, !dbg !729
  %OPERANDS163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 3, !dbg !729
  %arrayidx164 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !730
  %67 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS163 to i8*, !dbg !730
  %68 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx164 to i8*, !dbg !730
  %69 = call i8* @memcpy(i8* %67, i8* %68, i64 24), !dbg !730
  %arrayinit.element165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i64 1, !dbg !718
  %ID166 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 0, !dbg !731
  store i32 6, i32* %ID166, align 8, !dbg !731
  %OPCODE167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 1, !dbg !731
  store i32 2, i32* %OPCODE167, align 4, !dbg !731
  %OPTYPE168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 2, !dbg !731
  store i32 0, i32* %OPTYPE168, align 8, !dbg !731
  %OPERANDS169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 3, !dbg !731
  %arrayidx170 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !732
  %70 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS169 to i8*, !dbg !732
  %71 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx170 to i8*, !dbg !732
  %72 = call i8* @memcpy(i8* %70, i8* %71, i64 24), !dbg !732
  %arrayinit.element171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i64 1, !dbg !718
  %ID172 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 0, !dbg !733
  store i32 7, i32* %ID172, align 8, !dbg !733
  %OPCODE173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 1, !dbg !733
  store i32 2, i32* %OPCODE173, align 4, !dbg !733
  %OPTYPE174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 2, !dbg !733
  store i32 0, i32* %OPTYPE174, align 8, !dbg !733
  %OPERANDS175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 3, !dbg !733
  %arrayidx176 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !734
  %73 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS175 to i8*, !dbg !734
  %74 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx176 to i8*, !dbg !734
  %75 = call i8* @memcpy(i8* %73, i8* %74, i64 24), !dbg !734
  %arrayinit.element177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i64 1, !dbg !718
  %ID178 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 0, !dbg !735
  store i32 8, i32* %ID178, align 8, !dbg !735
  %OPCODE179 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 1, !dbg !735
  store i32 2, i32* %OPCODE179, align 4, !dbg !735
  %OPTYPE180 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 2, !dbg !735
  store i32 0, i32* %OPTYPE180, align 8, !dbg !735
  %OPERANDS181 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 3, !dbg !735
  %arrayidx182 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !736
  %76 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS181 to i8*, !dbg !736
  %77 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx182 to i8*, !dbg !736
  %78 = call i8* @memcpy(i8* %76, i8* %77, i64 24), !dbg !736
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !737, metadata !DIExpression()), !dbg !739
  %arrayinit.begin183 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !740
  %ID184 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 0, !dbg !741
  store i32 0, i32* %ID184, align 8, !dbg !741
  %OPCODE185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 1, !dbg !741
  store i32 2, i32* %OPCODE185, align 4, !dbg !741
  %OPTYPE186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 2, !dbg !741
  store i32 0, i32* %OPTYPE186, align 8, !dbg !741
  %OPERANDS187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 3, !dbg !741
  %arrayidx188 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !742
  %79 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS187 to i8*, !dbg !742
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx188 to i8*, !dbg !742
  %81 = call i8* @memcpy(i8* %79, i8* %80, i64 12), !dbg !742
  %arrayinit.element189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i64 1, !dbg !740
  %ID190 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 0, !dbg !743
  store i32 1, i32* %ID190, align 8, !dbg !743
  %OPCODE191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 1, !dbg !743
  store i32 2, i32* %OPCODE191, align 4, !dbg !743
  %OPTYPE192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 2, !dbg !743
  store i32 0, i32* %OPTYPE192, align 8, !dbg !743
  %OPERANDS193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 3, !dbg !743
  %arrayidx194 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !744
  %82 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS193 to i8*, !dbg !744
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx194 to i8*, !dbg !744
  %84 = call i8* @memcpy(i8* %82, i8* %83, i64 12), !dbg !744
  %arrayinit.element195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i64 1, !dbg !740
  %ID196 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 0, !dbg !745
  store i32 2, i32* %ID196, align 8, !dbg !745
  %OPCODE197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 1, !dbg !745
  store i32 2, i32* %OPCODE197, align 4, !dbg !745
  %OPTYPE198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 2, !dbg !745
  store i32 0, i32* %OPTYPE198, align 8, !dbg !745
  %OPERANDS199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 3, !dbg !745
  %arrayidx200 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !746
  %85 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS199 to i8*, !dbg !746
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx200 to i8*, !dbg !746
  %87 = call i8* @memcpy(i8* %85, i8* %86, i64 12), !dbg !746
  %arrayinit.element201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i64 1, !dbg !740
  %ID202 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 0, !dbg !747
  store i32 3, i32* %ID202, align 8, !dbg !747
  %OPCODE203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 1, !dbg !747
  store i32 2, i32* %OPCODE203, align 4, !dbg !747
  %OPTYPE204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 2, !dbg !747
  store i32 0, i32* %OPTYPE204, align 8, !dbg !747
  %OPERANDS205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 3, !dbg !747
  %arrayidx206 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !748
  %88 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS205 to i8*, !dbg !748
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx206 to i8*, !dbg !748
  %90 = call i8* @memcpy(i8* %88, i8* %89, i64 12), !dbg !748
  %arrayinit.element207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i64 1, !dbg !740
  %ID208 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 0, !dbg !749
  store i32 4, i32* %ID208, align 8, !dbg !749
  %OPCODE209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 1, !dbg !749
  store i32 2, i32* %OPCODE209, align 4, !dbg !749
  %OPTYPE210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 2, !dbg !749
  store i32 0, i32* %OPTYPE210, align 8, !dbg !749
  %OPERANDS211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 3, !dbg !749
  %arrayidx212 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !750
  %91 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS211 to i8*, !dbg !750
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx212 to i8*, !dbg !750
  %93 = call i8* @memcpy(i8* %91, i8* %92, i64 12), !dbg !750
  %arrayinit.element213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i64 1, !dbg !740
  %ID214 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 0, !dbg !751
  store i32 5, i32* %ID214, align 8, !dbg !751
  %OPCODE215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 1, !dbg !751
  store i32 2, i32* %OPCODE215, align 4, !dbg !751
  %OPTYPE216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 2, !dbg !751
  store i32 0, i32* %OPTYPE216, align 8, !dbg !751
  %OPERANDS217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 3, !dbg !751
  %arrayidx218 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !752
  %94 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS217 to i8*, !dbg !752
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx218 to i8*, !dbg !752
  %96 = call i8* @memcpy(i8* %94, i8* %95, i64 12), !dbg !752
  %arrayinit.element219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i64 1, !dbg !740
  %ID220 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 0, !dbg !753
  store i32 6, i32* %ID220, align 8, !dbg !753
  %OPCODE221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 1, !dbg !753
  store i32 2, i32* %OPCODE221, align 4, !dbg !753
  %OPTYPE222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 2, !dbg !753
  store i32 0, i32* %OPTYPE222, align 8, !dbg !753
  %OPERANDS223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 3, !dbg !753
  %arrayidx224 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !754
  %97 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS223 to i8*, !dbg !754
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx224 to i8*, !dbg !754
  %99 = call i8* @memcpy(i8* %97, i8* %98, i64 12), !dbg !754
  %arrayinit.element225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i64 1, !dbg !740
  %ID226 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 0, !dbg !755
  store i32 7, i32* %ID226, align 8, !dbg !755
  %OPCODE227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 1, !dbg !755
  store i32 2, i32* %OPCODE227, align 4, !dbg !755
  %OPTYPE228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 2, !dbg !755
  store i32 0, i32* %OPTYPE228, align 8, !dbg !755
  %OPERANDS229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 3, !dbg !755
  %arrayidx230 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !756
  %100 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS229 to i8*, !dbg !756
  %101 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx230 to i8*, !dbg !756
  %102 = call i8* @memcpy(i8* %100, i8* %101, i64 12), !dbg !756
  %arrayinit.element231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i64 1, !dbg !740
  %ID232 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 0, !dbg !757
  store i32 8, i32* %ID232, align 8, !dbg !757
  %OPCODE233 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 1, !dbg !757
  store i32 2, i32* %OPCODE233, align 4, !dbg !757
  %OPTYPE234 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 2, !dbg !757
  store i32 0, i32* %OPTYPE234, align 8, !dbg !757
  %OPERANDS235 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 3, !dbg !757
  %arrayidx236 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !758
  %103 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS235 to i8*, !dbg !758
  %104 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx236 to i8*, !dbg !758
  %105 = call i8* @memcpy(i8* %103, i8* %104, i64 12), !dbg !758
  %106 = load i32, i32* %opcode, align 4, !dbg !759
  %cmp = icmp eq i32 %106, 2, !dbg !761
  %107 = load i32, i32* %op_type, align 4, !dbg !762
  %cmp237 = icmp eq i32 %107, 0, !dbg !763
  %or.cond = and i1 %cmp, %cmp237, !dbg !764
  br i1 %or.cond, label %if.then, label %if.end, !dbg !764

if.then:                                          ; preds = %entry
  %108 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !765
  %109 = bitcast %struct.INSTR* %instruction to i8*, !dbg !765
  %110 = call i8* @memcpy(i8* %108, i8* %109, i64 40), !dbg !765
  %call = call i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !767
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !768
  call void @llvm.dbg.declare(metadata i32* %i, metadata !769, metadata !DIExpression()), !dbg !771
  store i32 0, i32* %i, align 4, !dbg !771
  br label %for.cond, !dbg !772

for.cond:                                         ; preds = %for.body, %if.then
  %111 = load i32, i32* %i, align 4, !dbg !773
  %cmp238 = icmp slt i32 %111, 9, !dbg !775
  br i1 %cmp238, label %for.body, label %for.end, !dbg !776

for.body:                                         ; preds = %for.cond
  %112 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !777
  %113 = load i32, i32* %i, align 4, !dbg !779
  %idxprom = sext i32 %113 to i64, !dbg !777
  %arrayidx239 = getelementptr inbounds i32, i32* %112, i64 %idxprom, !dbg !777
  %114 = load i32, i32* %arrayidx239, align 4, !dbg !777
  %115 = load i32, i32* %i, align 4, !dbg !780
  %idxprom240 = sext i32 %115 to i64, !dbg !781
  %arrayidx241 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom240, !dbg !781
  store i32 %114, i32* %arrayidx241, align 4, !dbg !782
  %116 = load i32, i32* %i, align 4, !dbg !783
  %inc = add nsw i32 %116, 1, !dbg !783
  store i32 %inc, i32* %i, align 4, !dbg !783
  br label %for.cond, !dbg !784, !llvm.loop !785

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i242, metadata !787, metadata !DIExpression()), !dbg !789
  store i32 0, i32* %i242, align 4, !dbg !789
  br label %for.cond243, !dbg !790

for.cond243:                                      ; preds = %for.body245, %for.end
  %117 = load i32, i32* %i242, align 4, !dbg !791
  %cmp244 = icmp slt i32 %117, 9, !dbg !793
  br i1 %cmp244, label %for.body245, label %for.end256, !dbg !794

for.body245:                                      ; preds = %for.cond243
  %118 = load i32, i32* %i242, align 4, !dbg !795
  %idxprom247 = sext i32 %118 to i64, !dbg !797
  %arrayidx248 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom247, !dbg !797
  %119 = bitcast %struct.INSTR* %agg.tmp246 to i8*, !dbg !797
  %120 = bitcast %struct.INSTR* %arrayidx248 to i8*, !dbg !797
  %121 = call i8* @memcpy(i8* %119, i8* %120, i64 40), !dbg !797
  %call249 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp246), !dbg !798
  store i32* %call249, i32** %acc_mem_ref, align 8, !dbg !799
  %122 = load i32*, i32** %acc_mem_ref, align 8, !dbg !800
  %123 = load i32, i32* %i242, align 4, !dbg !801
  %idxprom250 = sext i32 %123 to i64, !dbg !800
  %arrayidx251 = getelementptr inbounds i32, i32* %122, i64 %idxprom250, !dbg !800
  %124 = load i32, i32* %arrayidx251, align 4, !dbg !800
  %125 = load i32, i32* %i242, align 4, !dbg !802
  %idxprom252 = sext i32 %125 to i64, !dbg !803
  %arrayidx253 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom252, !dbg !803
  store i32 %124, i32* %arrayidx253, align 4, !dbg !804
  %126 = load i32, i32* %i242, align 4, !dbg !805
  %inc255 = add nsw i32 %126, 1, !dbg !805
  store i32 %inc255, i32* %i242, align 4, !dbg !805
  br label %for.cond243, !dbg !806, !llvm.loop !807

for.end256:                                       ; preds = %for.cond243
  call void @llvm.dbg.declare(metadata i32* %i257, metadata !809, metadata !DIExpression()), !dbg !811
  store i32 0, i32* %i257, align 4, !dbg !811
  br label %for.cond258, !dbg !812

for.cond258:                                      ; preds = %for.body260, %for.end256
  %127 = load i32, i32* %i257, align 4, !dbg !813
  %cmp259 = icmp slt i32 %127, 9, !dbg !815
  br i1 %cmp259, label %for.body260, label %for.end271, !dbg !816

for.body260:                                      ; preds = %for.cond258
  %128 = load i32, i32* %i257, align 4, !dbg !817
  %idxprom262 = sext i32 %128 to i64, !dbg !819
  %arrayidx263 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom262, !dbg !819
  %129 = bitcast %struct.INSTR_VAL* %agg.tmp261 to i8*, !dbg !819
  %130 = bitcast %struct.INSTR_VAL* %arrayidx263 to i8*, !dbg !819
  %131 = call i8* @memcpy(i8* %129, i8* %130, i64 24), !dbg !819
  %call264 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp261), !dbg !820
  store i32* %call264, i32** %acc_mem_val, align 8, !dbg !821
  %132 = load i32*, i32** %acc_mem_val, align 8, !dbg !822
  %133 = load i32, i32* %i257, align 4, !dbg !823
  %idxprom265 = sext i32 %133 to i64, !dbg !822
  %arrayidx266 = getelementptr inbounds i32, i32* %132, i64 %idxprom265, !dbg !822
  %134 = load i32, i32* %arrayidx266, align 4, !dbg !822
  %135 = load i32, i32* %i257, align 4, !dbg !824
  %idxprom267 = sext i32 %135 to i64, !dbg !825
  %arrayidx268 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom267, !dbg !825
  store i32 %134, i32* %arrayidx268, align 4, !dbg !826
  %136 = load i32, i32* %i257, align 4, !dbg !827
  %inc270 = add nsw i32 %136, 1, !dbg !827
  store i32 %inc270, i32* %i257, align 4, !dbg !827
  br label %for.cond258, !dbg !828, !llvm.loop !829

for.end271:                                       ; preds = %for.cond258
  call void @llvm.dbg.declare(metadata i32* %i272, metadata !831, metadata !DIExpression()), !dbg !833
  store i32 0, i32* %i272, align 4, !dbg !833
  br label %for.cond273, !dbg !834

for.cond273:                                      ; preds = %for.inc281, %for.end271
  %137 = load i32, i32* %i272, align 4, !dbg !835
  %cmp274 = icmp slt i32 %137, 9, !dbg !837
  br i1 %cmp274, label %for.body275, label %if.end, !dbg !838

for.body275:                                      ; preds = %for.cond273
  %138 = load i32, i32* %i272, align 4, !dbg !839
  %idxprom276 = sext i32 %138 to i64, !dbg !839
  %arrayidx277 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom276, !dbg !839
  %139 = load i32, i32* %arrayidx277, align 4, !dbg !839
  %140 = load i32, i32* %i272, align 4, !dbg !839
  %idxprom278 = sext i32 %140 to i64, !dbg !839
  %arrayidx279 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom278, !dbg !839
  %141 = load i32, i32* %arrayidx279, align 4, !dbg !839
  %cmp280 = icmp eq i32 %139, %141, !dbg !839
  br i1 %cmp280, label %for.inc281, label %cond.false, !dbg !839

cond.false:                                       ; preds = %for.body275
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 189, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !839
  unreachable, !dbg !839

for.inc281:                                       ; preds = %for.body275
  %142 = load i32, i32* %i272, align 4, !dbg !841
  %inc282 = add nsw i32 %142, 1, !dbg !841
  store i32 %inc282, i32* %i272, align 4, !dbg !841
  br label %for.cond273, !dbg !842, !llvm.loop !843

if.end:                                           ; preds = %for.cond273, %entry
  ret i32 0, !dbg !845
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !846 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !852, metadata !DIExpression()), !dbg !853
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !854, metadata !DIExpression()), !dbg !855
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !856, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.declare(metadata i8** %7, metadata !858, metadata !DIExpression()), !dbg !859
  %9 = load i8*, i8** %4, align 8, !dbg !860
  store i8* %9, i8** %7, align 8, !dbg !859
  call void @llvm.dbg.declare(metadata i8** %8, metadata !861, metadata !DIExpression()), !dbg !862
  %10 = load i8*, i8** %5, align 8, !dbg !863
  store i8* %10, i8** %8, align 8, !dbg !862
  br label %11, !dbg !864

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !865
  %13 = add i64 %12, -1, !dbg !865
  store i64 %13, i64* %6, align 8, !dbg !865
  %14 = icmp ugt i64 %12, 0, !dbg !866
  br i1 %14, label %15, label %21, !dbg !864

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !867
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !867
  store i8* %17, i8** %8, align 8, !dbg !867
  %18 = load i8, i8* %16, align 1, !dbg !868
  %19 = load i8*, i8** %7, align 8, !dbg !869
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !869
  store i8* %20, i8** %7, align 8, !dbg !869
  store i8 %18, i8* %19, align 1, !dbg !870
  br label %11, !dbg !864, !llvm.loop !871

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !872
  ret i8* %22, !dbg !873
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !130}
!llvm.module.flags = !{!132, !133, !134}
!llvm.ident = !{!135, !136}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 10, type: !127, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !34, nameTableKind: None)
!3 = !DIFile(filename: "gemm.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !14, !18, !21, !23, !25, !27, !32}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "product", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !12)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13, !13}
!13 = !DISubrange(count: 3)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "arr_val", scope: !2, file: !3, line: 13, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 14, type: !20, isLocal: false, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 288, elements: !12)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 15, type: !20, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 16, type: !20, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 17, type: !20, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 18, type: !29, isLocal: false, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 288, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 9)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "acc_mem_base_flat", scope: !2, file: !3, line: 19, type: !29, isLocal: false, isDefinition: true)
!34 = !{!35, !48, !52, !58, !62, !66, !76, !80, !82, !84, !88, !92, !96, !100, !104, !106, !108, !110, !114, !118, !122, !124, !126}
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !37, file: !47, line: 75)
!36 = !DINamespace(name: "std", scope: null)
!37 = !DISubprogram(name: "memchr", scope: !38, file: !38, line: 90, type: !39, flags: DIFlagPrototyped, spFlags: 0)
!38 = !DIFile(filename: "/usr/include/string.h", directory: "")
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !42, !11, !44}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !49, file: !47, line: 76)
!49 = !DISubprogram(name: "memcmp", scope: !38, file: !38, line: 63, type: !50, flags: DIFlagPrototyped, spFlags: 0)
!50 = !DISubroutineType(types: !51)
!51 = !{!11, !42, !42, !44}
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !53, file: !47, line: 77)
!53 = !DISubprogram(name: "memcpy", scope: !38, file: !38, line: 42, type: !54, flags: DIFlagPrototyped, spFlags: 0)
!54 = !DISubroutineType(types: !55)
!55 = !{!41, !56, !57, !44}
!56 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !41)
!57 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !42)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !59, file: !47, line: 78)
!59 = !DISubprogram(name: "memmove", scope: !38, file: !38, line: 46, type: !60, flags: DIFlagPrototyped, spFlags: 0)
!60 = !DISubroutineType(types: !61)
!61 = !{!41, !41, !42, !44}
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !63, file: !47, line: 79)
!63 = !DISubprogram(name: "memset", scope: !38, file: !38, line: 60, type: !64, flags: DIFlagPrototyped, spFlags: 0)
!64 = !DISubroutineType(types: !65)
!65 = !{!41, !41, !11, !44}
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !67, file: !47, line: 80)
!67 = !DISubprogram(name: "strcat", scope: !38, file: !38, line: 129, type: !68, flags: DIFlagPrototyped, spFlags: 0)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !72, !73}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !70)
!73 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !77, file: !47, line: 81)
!77 = !DISubprogram(name: "strcmp", scope: !38, file: !38, line: 136, type: !78, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!11, !74, !74}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !81, file: !47, line: 82)
!81 = !DISubprogram(name: "strcoll", scope: !38, file: !38, line: 143, type: !78, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !83, file: !47, line: 83)
!83 = !DISubprogram(name: "strcpy", scope: !38, file: !38, line: 121, type: !68, flags: DIFlagPrototyped, spFlags: 0)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !85, file: !47, line: 84)
!85 = !DISubprogram(name: "strcspn", scope: !38, file: !38, line: 272, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{!44, !74, !74}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !89, file: !47, line: 85)
!89 = !DISubprogram(name: "strerror", scope: !38, file: !38, line: 396, type: !90, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DISubroutineType(types: !91)
!91 = !{!70, !11}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !93, file: !47, line: 86)
!93 = !DISubprogram(name: "strlen", scope: !38, file: !38, line: 384, type: !94, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DISubroutineType(types: !95)
!95 = !{!44, !74}
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !97, file: !47, line: 87)
!97 = !DISubprogram(name: "strncat", scope: !38, file: !38, line: 132, type: !98, flags: DIFlagPrototyped, spFlags: 0)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !72, !73, !44}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !101, file: !47, line: 88)
!101 = !DISubprogram(name: "strncmp", scope: !38, file: !38, line: 139, type: !102, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DISubroutineType(types: !103)
!103 = !{!11, !74, !74, !44}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !105, file: !47, line: 89)
!105 = !DISubprogram(name: "strncpy", scope: !38, file: !38, line: 124, type: !98, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !107, file: !47, line: 90)
!107 = !DISubprogram(name: "strspn", scope: !38, file: !38, line: 276, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !109, file: !47, line: 91)
!109 = !DISubprogram(name: "strtok", scope: !38, file: !38, line: 335, type: !68, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !111, file: !47, line: 92)
!111 = !DISubprogram(name: "strxfrm", scope: !38, file: !38, line: 146, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!44, !72, !73, !44}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !115, file: !47, line: 93)
!115 = !DISubprogram(name: "strchr", scope: !38, file: !38, line: 225, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!70, !74, !11}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !119, file: !47, line: 94)
!119 = !DISubprogram(name: "strpbrk", scope: !38, file: !38, line: 302, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DISubroutineType(types: !121)
!121 = !{!70, !74, !74}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !123, file: !47, line: 95)
!123 = !DISubprogram(name: "strrchr", scope: !38, file: !38, line: 252, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !125, file: !47, line: 96)
!125 = !DISubprogram(name: "strstr", scope: !38, file: !38, line: 329, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!126 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !36, file: !3, line: 6)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 10)
!130 = distinct !DICompileUnit(language: DW_LANG_C99, file: !131, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!131 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!132 = !{i32 2, !"Dwarf Version", i32 4}
!133 = !{i32 2, !"Debug Info Version", i32 3}
!134 = !{i32 1, !"wchar_size", i32 4}
!135 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!136 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!137 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 21, type: !138, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !140, !140}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !142)
!142 = !{!13}
!143 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !137, file: !3, line: 21, type: !140)
!144 = !DILocation(line: 21, column: 29, scope: !137)
!145 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !137, file: !3, line: 21, type: !140)
!146 = !DILocation(line: 21, column: 58, scope: !137)
!147 = !DILocalVariable(name: "i", scope: !137, file: !3, line: 23, type: !11)
!148 = !DILocation(line: 23, column: 9, scope: !137)
!149 = !DILocalVariable(name: "j", scope: !137, file: !3, line: 23, type: !11)
!150 = !DILocation(line: 23, column: 12, scope: !137)
!151 = !DILocation(line: 24, column: 12, scope: !152)
!152 = distinct !DILexicalBlock(scope: !137, file: !3, line: 24, column: 5)
!153 = !DILocation(line: 24, column: 10, scope: !152)
!154 = !DILocation(line: 24, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !3, line: 24, column: 5)
!156 = !DILocation(line: 24, column: 19, scope: !155)
!157 = !DILocation(line: 24, column: 5, scope: !152)
!158 = !DILocation(line: 25, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !3, line: 25, column: 9)
!160 = !DILocation(line: 25, column: 14, scope: !159)
!161 = !DILocation(line: 25, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 25, column: 9)
!163 = !DILocation(line: 25, column: 23, scope: !162)
!164 = !DILocation(line: 25, column: 9, scope: !159)
!165 = !DILocation(line: 26, column: 35, scope: !162)
!166 = !DILocation(line: 26, column: 43, scope: !162)
!167 = !DILocation(line: 26, column: 46, scope: !162)
!168 = !DILocation(line: 26, column: 13, scope: !162)
!169 = !DILocation(line: 26, column: 27, scope: !162)
!170 = !DILocation(line: 26, column: 30, scope: !162)
!171 = !DILocation(line: 26, column: 33, scope: !162)
!172 = !DILocation(line: 25, column: 31, scope: !162)
!173 = !DILocation(line: 25, column: 9, scope: !162)
!174 = distinct !{!174, !164, !175}
!175 = !DILocation(line: 26, column: 47, scope: !159)
!176 = !DILocation(line: 24, column: 27, scope: !155)
!177 = !DILocation(line: 24, column: 5, scope: !155)
!178 = distinct !{!178, !157, !179}
!179 = !DILocation(line: 26, column: 47, scope: !152)
!180 = !DILocation(line: 27, column: 1, scope: !137)
!181 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPKjS0_", scope: !3, file: !3, line: 29, type: !182, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DISubroutineType(types: !183)
!183 = !{!16, !184, !184}
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!186 = !DILocalVariable(name: "mat1", arg: 1, scope: !181, file: !3, line: 29, type: !184)
!187 = !DILocation(line: 29, column: 49, scope: !181)
!188 = !DILocalVariable(name: "mat2", arg: 2, scope: !181, file: !3, line: 29, type: !184)
!189 = !DILocation(line: 29, column: 76, scope: !181)
!190 = !DILocalVariable(name: "res_index", scope: !181, file: !3, line: 31, type: !11)
!191 = !DILocation(line: 31, column: 9, scope: !181)
!192 = !DILocalVariable(name: "res", scope: !181, file: !3, line: 32, type: !17)
!193 = !DILocation(line: 32, column: 18, scope: !181)
!194 = !DILocalVariable(name: "i", scope: !195, file: !3, line: 33, type: !11)
!195 = distinct !DILexicalBlock(scope: !181, file: !3, line: 33, column: 5)
!196 = !DILocation(line: 33, column: 13, scope: !195)
!197 = !DILocation(line: 33, column: 9, scope: !195)
!198 = !DILocation(line: 33, column: 20, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !3, line: 33, column: 5)
!200 = !DILocation(line: 33, column: 22, scope: !199)
!201 = !DILocation(line: 33, column: 5, scope: !195)
!202 = !DILocation(line: 35, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !3, line: 34, column: 5)
!204 = !DILocation(line: 35, column: 21, scope: !203)
!205 = !DILocation(line: 35, column: 26, scope: !203)
!206 = !DILocation(line: 35, column: 31, scope: !203)
!207 = !DILocation(line: 35, column: 24, scope: !203)
!208 = !DILocation(line: 35, column: 13, scope: !203)
!209 = !DILocation(line: 33, column: 28, scope: !199)
!210 = !DILocation(line: 33, column: 5, scope: !199)
!211 = distinct !{!211, !201, !212}
!212 = !DILocation(line: 36, column: 5, scope: !195)
!213 = !DILocation(line: 37, column: 25, scope: !181)
!214 = !DILocation(line: 37, column: 12, scope: !181)
!215 = !DILocation(line: 37, column: 5, scope: !181)
!216 = !DILocation(line: 37, column: 23, scope: !181)
!217 = !DILocation(line: 38, column: 14, scope: !181)
!218 = !DILocation(line: 39, column: 5, scope: !181)
!219 = distinct !DISubprogram(name: "base_gemm", linkageName: "_Z9base_gemm5INSTR", scope: !3, file: !3, line: 42, type: !220, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!220 = !DISubroutineType(types: !221)
!221 = !{!16, !222}
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !223, line: 23, size: 320, flags: DIFlagTypePassByValue, elements: !224, identifier: "_ZTS5INSTR")
!223 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!224 = !{!225, !226, !227, !228}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !222, file: !223, line: 24, baseType: !17, size: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !222, file: !223, line: 25, baseType: !17, size: 32, offset: 32)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !222, file: !223, line: 26, baseType: !17, size: 32, offset: 64)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !222, file: !223, line: 27, baseType: !229, size: 192, offset: 128)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !223, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !230, identifier: "_ZTS15GEMM_STRUCT_REF")
!230 = !{!231, !232, !233}
!231 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !229, file: !223, line: 6, baseType: !16, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !229, file: !223, line: 7, baseType: !16, size: 64, offset: 64)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !229, file: !223, line: 8, baseType: !16, size: 64, offset: 128)
!234 = !DILocalVariable(name: "myinsn", arg: 1, scope: !219, file: !3, line: 42, type: !222)
!235 = !DILocation(line: 42, column: 32, scope: !219)
!236 = !DILocalVariable(name: "row", scope: !219, file: !3, line: 43, type: !17)
!237 = !DILocation(line: 43, column: 18, scope: !219)
!238 = !DILocalVariable(name: "col", scope: !219, file: !3, line: 43, type: !17)
!239 = !DILocation(line: 43, column: 23, scope: !219)
!240 = !DILocalVariable(name: "i", scope: !219, file: !3, line: 43, type: !17)
!241 = !DILocation(line: 43, column: 28, scope: !219)
!242 = !DILocalVariable(name: "sum", scope: !219, file: !3, line: 44, type: !17)
!243 = !DILocation(line: 44, column: 18, scope: !219)
!244 = !DILocation(line: 45, column: 15, scope: !245)
!245 = distinct !DILexicalBlock(scope: !219, file: !3, line: 45, column: 8)
!246 = !DILocation(line: 45, column: 21, scope: !245)
!247 = !DILocation(line: 45, column: 8, scope: !219)
!248 = !DILocation(line: 46, column: 14, scope: !249)
!249 = distinct !DILexicalBlock(scope: !250, file: !3, line: 46, column: 5)
!250 = distinct !DILexicalBlock(scope: !245, file: !3, line: 45, column: 26)
!251 = !DILocation(line: 46, column: 10, scope: !249)
!252 = !DILocation(line: 46, column: 19, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !3, line: 46, column: 5)
!254 = !DILocation(line: 46, column: 23, scope: !253)
!255 = !DILocation(line: 46, column: 5, scope: !249)
!256 = !DILocation(line: 48, column: 18, scope: !257)
!257 = distinct !DILexicalBlock(scope: !258, file: !3, line: 48, column: 9)
!258 = distinct !DILexicalBlock(scope: !253, file: !3, line: 47, column: 5)
!259 = !DILocation(line: 48, column: 14, scope: !257)
!260 = !DILocation(line: 48, column: 23, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !3, line: 48, column: 9)
!262 = !DILocation(line: 48, column: 27, scope: !261)
!263 = !DILocation(line: 48, column: 9, scope: !257)
!264 = !DILocation(line: 50, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !3, line: 49, column: 9)
!266 = !DILocation(line: 51, column: 20, scope: !267)
!267 = distinct !DILexicalBlock(scope: !265, file: !3, line: 51, column: 13)
!268 = !DILocation(line: 51, column: 18, scope: !267)
!269 = !DILocation(line: 51, column: 25, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !3, line: 51, column: 13)
!271 = !DILocation(line: 51, column: 27, scope: !270)
!272 = !DILocation(line: 51, column: 13, scope: !267)
!273 = !DILocation(line: 53, column: 39, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !3, line: 52, column: 13)
!275 = !DILocation(line: 53, column: 37, scope: !274)
!276 = !DILocation(line: 53, column: 27, scope: !274)
!277 = !DILocation(line: 53, column: 46, scope: !274)
!278 = !DILocation(line: 53, column: 44, scope: !274)
!279 = !DILocation(line: 53, column: 25, scope: !274)
!280 = !DILocation(line: 53, column: 67, scope: !274)
!281 = !DILocation(line: 53, column: 65, scope: !274)
!282 = !DILocation(line: 53, column: 55, scope: !274)
!283 = !DILocation(line: 53, column: 72, scope: !274)
!284 = !DILocation(line: 53, column: 70, scope: !274)
!285 = !DILocation(line: 53, column: 53, scope: !274)
!286 = !DILocation(line: 53, column: 50, scope: !274)
!287 = !DILocation(line: 53, column: 21, scope: !274)
!288 = !DILocation(line: 51, column: 35, scope: !270)
!289 = !DILocation(line: 51, column: 13, scope: !270)
!290 = distinct !{!290, !272, !291}
!291 = !DILocation(line: 54, column: 13, scope: !267)
!292 = !DILocation(line: 55, column: 41, scope: !265)
!293 = !DILocation(line: 55, column: 27, scope: !265)
!294 = !DILocation(line: 55, column: 25, scope: !265)
!295 = !DILocation(line: 55, column: 15, scope: !265)
!296 = !DILocation(line: 55, column: 34, scope: !265)
!297 = !DILocation(line: 55, column: 32, scope: !265)
!298 = !DILocation(line: 55, column: 39, scope: !265)
!299 = !DILocation(line: 48, column: 37, scope: !261)
!300 = !DILocation(line: 48, column: 9, scope: !261)
!301 = distinct !{!301, !263, !302}
!302 = !DILocation(line: 56, column: 9, scope: !257)
!303 = !DILocation(line: 46, column: 33, scope: !253)
!304 = !DILocation(line: 46, column: 5, scope: !253)
!305 = distinct !{!305, !255, !306}
!306 = !DILocation(line: 57, column: 5, scope: !249)
!307 = !DILocalVariable(name: "i", scope: !308, file: !3, line: 59, type: !11)
!308 = distinct !DILexicalBlock(scope: !250, file: !3, line: 59, column: 5)
!309 = !DILocation(line: 59, column: 13, scope: !308)
!310 = !DILocation(line: 59, column: 9, scope: !308)
!311 = !DILocation(line: 59, column: 18, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 59, column: 5)
!313 = !DILocation(line: 59, column: 19, scope: !312)
!314 = !DILocation(line: 59, column: 5, scope: !308)
!315 = !DILocalVariable(name: "j", scope: !316, file: !3, line: 60, type: !11)
!316 = distinct !DILexicalBlock(scope: !317, file: !3, line: 60, column: 9)
!317 = distinct !DILexicalBlock(scope: !312, file: !3, line: 59, column: 28)
!318 = !DILocation(line: 60, column: 17, scope: !316)
!319 = !DILocation(line: 60, column: 13, scope: !316)
!320 = !DILocation(line: 60, column: 21, scope: !321)
!321 = distinct !DILexicalBlock(scope: !316, file: !3, line: 60, column: 9)
!322 = !DILocation(line: 60, column: 22, scope: !321)
!323 = !DILocation(line: 0, scope: !312)
!324 = !DILocation(line: 60, column: 9, scope: !316)
!325 = !DILocation(line: 61, column: 42, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !3, line: 60, column: 31)
!327 = !DILocation(line: 61, column: 53, scope: !326)
!328 = !DILocation(line: 61, column: 31, scope: !326)
!329 = !DILocation(line: 61, column: 32, scope: !326)
!330 = !DILocation(line: 61, column: 37, scope: !326)
!331 = !DILocation(line: 61, column: 36, scope: !326)
!332 = !DILocation(line: 61, column: 13, scope: !326)
!333 = !DILocation(line: 61, column: 40, scope: !326)
!334 = !DILocation(line: 60, column: 28, scope: !321)
!335 = !DILocation(line: 60, column: 9, scope: !321)
!336 = distinct !{!336, !324, !337}
!337 = !DILocation(line: 62, column: 9, scope: !316)
!338 = !DILocation(line: 59, column: 25, scope: !312)
!339 = !DILocation(line: 59, column: 5, scope: !312)
!340 = distinct !{!340, !314, !341}
!341 = !DILocation(line: 63, column: 5, scope: !308)
!342 = !DILocation(line: 65, column: 5, scope: !219)
!343 = distinct !DISubprogram(name: "mulMat", linkageName: "_Z6mulMatPA3_jS0_S0_", scope: !3, file: !3, line: 68, type: !344, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!344 = !DISubroutineType(types: !345)
!345 = !{!16, !140, !140, !140}
!346 = !DILocalVariable(name: "mat1", arg: 1, scope: !343, file: !3, line: 68, type: !140)
!347 = !DILocation(line: 68, column: 35, scope: !343)
!348 = !DILocalVariable(name: "mat2", arg: 2, scope: !343, file: !3, line: 68, type: !140)
!349 = !DILocation(line: 68, column: 61, scope: !343)
!350 = !DILocalVariable(name: "res", arg: 3, scope: !343, file: !3, line: 68, type: !140)
!351 = !DILocation(line: 68, column: 87, scope: !343)
!352 = !DILocalVariable(name: "i", scope: !353, file: !3, line: 69, type: !11)
!353 = distinct !DILexicalBlock(scope: !343, file: !3, line: 69, column: 5)
!354 = !DILocation(line: 69, column: 14, scope: !353)
!355 = !DILocation(line: 69, column: 10, scope: !353)
!356 = !DILocation(line: 69, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !3, line: 69, column: 5)
!358 = !DILocation(line: 69, column: 23, scope: !357)
!359 = !DILocation(line: 69, column: 5, scope: !353)
!360 = !DILocalVariable(name: "j", scope: !361, file: !3, line: 70, type: !11)
!361 = distinct !DILexicalBlock(scope: !362, file: !3, line: 70, column: 9)
!362 = distinct !DILexicalBlock(scope: !357, file: !3, line: 69, column: 35)
!363 = !DILocation(line: 70, column: 18, scope: !361)
!364 = !DILocation(line: 70, column: 14, scope: !361)
!365 = !DILocation(line: 70, column: 25, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !3, line: 70, column: 9)
!367 = !DILocation(line: 70, column: 27, scope: !366)
!368 = !DILocation(line: 70, column: 9, scope: !361)
!369 = !DILocalVariable(name: "k", scope: !370, file: !3, line: 71, type: !11)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 71, column: 13)
!371 = distinct !DILexicalBlock(scope: !366, file: !3, line: 70, column: 39)
!372 = !DILocation(line: 71, column: 22, scope: !370)
!373 = !DILocation(line: 71, column: 18, scope: !370)
!374 = !DILocation(line: 71, column: 29, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !3, line: 71, column: 13)
!376 = !DILocation(line: 71, column: 31, scope: !375)
!377 = !DILocation(line: 71, column: 13, scope: !370)
!378 = !DILocation(line: 72, column: 42, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !3, line: 71, column: 43)
!380 = !DILocation(line: 72, column: 34, scope: !379)
!381 = !DILocation(line: 72, column: 45, scope: !379)
!382 = !DILocation(line: 72, column: 58, scope: !379)
!383 = !DILocation(line: 72, column: 50, scope: !379)
!384 = !DILocation(line: 72, column: 61, scope: !379)
!385 = !DILocation(line: 72, column: 48, scope: !379)
!386 = !DILocation(line: 72, column: 25, scope: !379)
!387 = !DILocation(line: 72, column: 17, scope: !379)
!388 = !DILocation(line: 72, column: 28, scope: !379)
!389 = !DILocation(line: 72, column: 31, scope: !379)
!390 = !DILocation(line: 71, column: 39, scope: !375)
!391 = !DILocation(line: 71, column: 13, scope: !375)
!392 = distinct !{!392, !377, !393}
!393 = !DILocation(line: 73, column: 13, scope: !370)
!394 = !DILocation(line: 70, column: 35, scope: !366)
!395 = !DILocation(line: 70, column: 9, scope: !366)
!396 = distinct !{!396, !368, !397}
!397 = !DILocation(line: 74, column: 9, scope: !361)
!398 = !DILocation(line: 69, column: 31, scope: !357)
!399 = !DILocation(line: 69, column: 5, scope: !357)
!400 = distinct !{!400, !359, !401}
!401 = !DILocation(line: 75, column: 5, scope: !353)
!402 = !DILocalVariable(name: "i", scope: !403, file: !3, line: 76, type: !11)
!403 = distinct !DILexicalBlock(scope: !343, file: !3, line: 76, column: 5)
!404 = !DILocation(line: 76, column: 13, scope: !403)
!405 = !DILocation(line: 76, column: 9, scope: !403)
!406 = !DILocation(line: 76, column: 18, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !3, line: 76, column: 5)
!408 = !DILocation(line: 76, column: 19, scope: !407)
!409 = !DILocation(line: 76, column: 5, scope: !403)
!410 = !DILocalVariable(name: "j", scope: !411, file: !3, line: 77, type: !11)
!411 = distinct !DILexicalBlock(scope: !412, file: !3, line: 77, column: 9)
!412 = distinct !DILexicalBlock(scope: !407, file: !3, line: 76, column: 28)
!413 = !DILocation(line: 77, column: 17, scope: !411)
!414 = !DILocation(line: 77, column: 13, scope: !411)
!415 = !DILocation(line: 77, column: 21, scope: !416)
!416 = distinct !DILexicalBlock(scope: !411, file: !3, line: 77, column: 9)
!417 = !DILocation(line: 77, column: 22, scope: !416)
!418 = !DILocation(line: 0, scope: !407)
!419 = !DILocation(line: 77, column: 9, scope: !411)
!420 = !DILocation(line: 78, column: 37, scope: !421)
!421 = distinct !DILexicalBlock(scope: !416, file: !3, line: 77, column: 31)
!422 = !DILocation(line: 78, column: 48, scope: !421)
!423 = !DILocation(line: 78, column: 26, scope: !421)
!424 = !DILocation(line: 78, column: 27, scope: !421)
!425 = !DILocation(line: 78, column: 32, scope: !421)
!426 = !DILocation(line: 78, column: 31, scope: !421)
!427 = !DILocation(line: 78, column: 13, scope: !421)
!428 = !DILocation(line: 78, column: 35, scope: !421)
!429 = !DILocation(line: 77, column: 28, scope: !416)
!430 = !DILocation(line: 77, column: 9, scope: !416)
!431 = distinct !{!431, !419, !432}
!432 = !DILocation(line: 79, column: 9, scope: !411)
!433 = !DILocation(line: 76, column: 25, scope: !407)
!434 = !DILocation(line: 76, column: 5, scope: !407)
!435 = distinct !{!435, !409, !436}
!436 = !DILocation(line: 80, column: 5, scope: !403)
!437 = !DILocation(line: 81, column: 5, scope: !343)
!438 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 84, type: !220, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!439 = !DILocalVariable(name: "instr", arg: 1, scope: !438, file: !3, line: 84, type: !222)
!440 = !DILocation(line: 84, column: 35, scope: !438)
!441 = !DILocalVariable(name: "arr_ref", scope: !438, file: !3, line: 86, type: !16)
!442 = !DILocation(line: 86, column: 20, scope: !438)
!443 = !DILocalVariable(name: "inp", scope: !438, file: !3, line: 87, type: !141)
!444 = !DILocation(line: 87, column: 18, scope: !438)
!445 = !DILocalVariable(name: "wgt", scope: !438, file: !3, line: 87, type: !141)
!446 = !DILocation(line: 87, column: 26, scope: !438)
!447 = !DILocation(line: 88, column: 14, scope: !448)
!448 = distinct !DILexicalBlock(scope: !438, file: !3, line: 88, column: 8)
!449 = !DILocation(line: 88, column: 20, scope: !448)
!450 = !DILocation(line: 88, column: 8, scope: !438)
!451 = !DILocalVariable(name: "i", scope: !452, file: !3, line: 89, type: !11)
!452 = distinct !DILexicalBlock(scope: !453, file: !3, line: 89, column: 9)
!453 = distinct !DILexicalBlock(scope: !448, file: !3, line: 88, column: 25)
!454 = !DILocation(line: 89, column: 18, scope: !452)
!455 = !DILocation(line: 89, column: 14, scope: !452)
!456 = !DILocation(line: 89, column: 22, scope: !457)
!457 = distinct !DILexicalBlock(scope: !452, file: !3, line: 89, column: 9)
!458 = !DILocation(line: 89, column: 23, scope: !457)
!459 = !DILocation(line: 89, column: 9, scope: !452)
!460 = !DILocation(line: 90, column: 30, scope: !461)
!461 = distinct !DILexicalBlock(scope: !457, file: !3, line: 89, column: 30)
!462 = !DILocation(line: 90, column: 39, scope: !461)
!463 = !DILocation(line: 90, column: 47, scope: !461)
!464 = !DILocation(line: 90, column: 46, scope: !461)
!465 = !DILocation(line: 90, column: 22, scope: !461)
!466 = !DILocation(line: 90, column: 17, scope: !461)
!467 = !DILocation(line: 90, column: 13, scope: !461)
!468 = !DILocation(line: 90, column: 20, scope: !461)
!469 = !DILocation(line: 89, column: 27, scope: !457)
!470 = !DILocation(line: 89, column: 9, scope: !457)
!471 = distinct !{!471, !459, !472}
!472 = !DILocation(line: 91, column: 9, scope: !452)
!473 = !DILocalVariable(name: "i", scope: !474, file: !3, line: 92, type: !11)
!474 = distinct !DILexicalBlock(scope: !453, file: !3, line: 92, column: 9)
!475 = !DILocation(line: 92, column: 18, scope: !474)
!476 = !DILocation(line: 92, column: 14, scope: !474)
!477 = !DILocation(line: 92, column: 22, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 92, column: 9)
!479 = !DILocation(line: 92, column: 23, scope: !478)
!480 = !DILocation(line: 92, column: 9, scope: !474)
!481 = !DILocation(line: 93, column: 30, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !3, line: 92, column: 30)
!483 = !DILocation(line: 93, column: 39, scope: !482)
!484 = !DILocation(line: 93, column: 47, scope: !482)
!485 = !DILocation(line: 93, column: 46, scope: !482)
!486 = !DILocation(line: 93, column: 22, scope: !482)
!487 = !DILocation(line: 93, column: 17, scope: !482)
!488 = !DILocation(line: 93, column: 13, scope: !482)
!489 = !DILocation(line: 93, column: 20, scope: !482)
!490 = !DILocation(line: 92, column: 27, scope: !478)
!491 = !DILocation(line: 92, column: 9, scope: !478)
!492 = distinct !{!492, !480, !493}
!493 = !DILocation(line: 94, column: 9, scope: !474)
!494 = !DILocation(line: 95, column: 34, scope: !453)
!495 = !DILocation(line: 95, column: 38, scope: !453)
!496 = !DILocation(line: 95, column: 19, scope: !453)
!497 = !DILocation(line: 95, column: 17, scope: !453)
!498 = !DILocation(line: 96, column: 5, scope: !453)
!499 = !DILocation(line: 97, column: 12, scope: !438)
!500 = !DILocation(line: 97, column: 5, scope: !438)
!501 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 100, type: !502, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!502 = !DISubroutineType(types: !503)
!503 = !{!16, !504}
!504 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !223, line: 37, size: 192, flags: DIFlagTypePassByValue, elements: !505, identifier: "_ZTS9INSTR_VAL")
!505 = !{!506, !507, !508, !509}
!506 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !504, file: !223, line: 38, baseType: !17, size: 32)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !504, file: !223, line: 39, baseType: !17, size: 32, offset: 32)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !504, file: !223, line: 40, baseType: !17, size: 32, offset: 64)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !504, file: !223, line: 41, baseType: !510, size: 96, offset: 96)
!510 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !223, line: 17, size: 96, flags: DIFlagTypePassByValue, elements: !511, identifier: "_ZTS15GEMM_STRUCT_VAL")
!511 = !{!512, !513, !514}
!512 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !510, file: !223, line: 18, baseType: !17, size: 32)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !510, file: !223, line: 19, baseType: !17, size: 32, offset: 32)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !510, file: !223, line: 20, baseType: !17, size: 32, offset: 64)
!515 = !DILocalVariable(name: "instr", arg: 1, scope: !501, file: !3, line: 100, type: !504)
!516 = !DILocation(line: 100, column: 43, scope: !501)
!517 = !DILocalVariable(name: "arr_val", scope: !501, file: !3, line: 102, type: !16)
!518 = !DILocation(line: 102, column: 20, scope: !501)
!519 = !DILocalVariable(name: "inp", scope: !501, file: !3, line: 103, type: !141)
!520 = !DILocation(line: 103, column: 18, scope: !501)
!521 = !DILocalVariable(name: "wgt", scope: !501, file: !3, line: 103, type: !141)
!522 = !DILocation(line: 103, column: 26, scope: !501)
!523 = !DILocation(line: 104, column: 14, scope: !524)
!524 = distinct !DILexicalBlock(scope: !501, file: !3, line: 104, column: 8)
!525 = !DILocation(line: 104, column: 20, scope: !524)
!526 = !DILocation(line: 104, column: 8, scope: !501)
!527 = !DILocalVariable(name: "i", scope: !528, file: !3, line: 105, type: !11)
!528 = distinct !DILexicalBlock(scope: !529, file: !3, line: 105, column: 9)
!529 = distinct !DILexicalBlock(scope: !524, file: !3, line: 104, column: 25)
!530 = !DILocation(line: 105, column: 18, scope: !528)
!531 = !DILocation(line: 105, column: 14, scope: !528)
!532 = !DILocation(line: 105, column: 22, scope: !533)
!533 = distinct !DILexicalBlock(scope: !528, file: !3, line: 105, column: 9)
!534 = !DILocation(line: 105, column: 23, scope: !533)
!535 = !DILocation(line: 105, column: 9, scope: !528)
!536 = !DILocation(line: 106, column: 28, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !3, line: 105, column: 30)
!538 = !DILocation(line: 106, column: 37, scope: !537)
!539 = !DILocation(line: 106, column: 45, scope: !537)
!540 = !DILocation(line: 106, column: 44, scope: !537)
!541 = !DILocation(line: 106, column: 17, scope: !537)
!542 = !DILocation(line: 106, column: 13, scope: !537)
!543 = !DILocation(line: 106, column: 20, scope: !537)
!544 = !DILocation(line: 105, column: 27, scope: !533)
!545 = !DILocation(line: 105, column: 9, scope: !533)
!546 = distinct !{!546, !535, !547}
!547 = !DILocation(line: 107, column: 9, scope: !528)
!548 = !DILocalVariable(name: "i", scope: !549, file: !3, line: 108, type: !11)
!549 = distinct !DILexicalBlock(scope: !529, file: !3, line: 108, column: 9)
!550 = !DILocation(line: 108, column: 18, scope: !549)
!551 = !DILocation(line: 108, column: 14, scope: !549)
!552 = !DILocation(line: 108, column: 22, scope: !553)
!553 = distinct !DILexicalBlock(scope: !549, file: !3, line: 108, column: 9)
!554 = !DILocation(line: 108, column: 23, scope: !553)
!555 = !DILocation(line: 108, column: 9, scope: !549)
!556 = !DILocation(line: 109, column: 28, scope: !557)
!557 = distinct !DILexicalBlock(scope: !553, file: !3, line: 108, column: 30)
!558 = !DILocation(line: 109, column: 37, scope: !557)
!559 = !DILocation(line: 109, column: 17, scope: !557)
!560 = !DILocation(line: 109, column: 13, scope: !557)
!561 = !DILocation(line: 109, column: 20, scope: !557)
!562 = !DILocation(line: 108, column: 27, scope: !553)
!563 = !DILocation(line: 108, column: 9, scope: !553)
!564 = distinct !{!564, !555, !565}
!565 = !DILocation(line: 110, column: 9, scope: !549)
!566 = !DILocation(line: 111, column: 34, scope: !529)
!567 = !DILocation(line: 111, column: 38, scope: !529)
!568 = !DILocation(line: 111, column: 19, scope: !529)
!569 = !DILocation(line: 111, column: 17, scope: !529)
!570 = !DILocation(line: 112, column: 5, scope: !529)
!571 = !DILocation(line: 113, column: 12, scope: !501)
!572 = !DILocation(line: 113, column: 5, scope: !501)
!573 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 120, type: !574, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!574 = !DISubroutineType(types: !575)
!575 = !{!11, !11, !576}
!576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!577 = !DILocalVariable(name: "argc", arg: 1, scope: !573, file: !3, line: 120, type: !11)
!578 = !DILocation(line: 120, column: 14, scope: !573)
!579 = !DILocalVariable(name: "argv", arg: 2, scope: !573, file: !3, line: 120, type: !576)
!580 = !DILocation(line: 120, column: 32, scope: !573)
!581 = !DILocalVariable(name: "inp_mem_row0", scope: !573, file: !3, line: 122, type: !141)
!582 = !DILocation(line: 122, column: 18, scope: !573)
!583 = !DILocalVariable(name: "inp_mem_row1", scope: !573, file: !3, line: 122, type: !141)
!584 = !DILocation(line: 122, column: 37, scope: !573)
!585 = !DILocalVariable(name: "inp_mem_row2", scope: !573, file: !3, line: 122, type: !141)
!586 = !DILocation(line: 122, column: 56, scope: !573)
!587 = !DILocalVariable(name: "wgt_mem_row0", scope: !573, file: !3, line: 123, type: !141)
!588 = !DILocation(line: 123, column: 18, scope: !573)
!589 = !DILocalVariable(name: "wgt_mem_row1", scope: !573, file: !3, line: 123, type: !141)
!590 = !DILocation(line: 123, column: 37, scope: !573)
!591 = !DILocalVariable(name: "wgt_mem_row2", scope: !573, file: !3, line: 123, type: !141)
!592 = !DILocation(line: 123, column: 56, scope: !573)
!593 = !DILocalVariable(name: "acc_mem_row0", scope: !573, file: !3, line: 124, type: !141)
!594 = !DILocation(line: 124, column: 18, scope: !573)
!595 = !DILocalVariable(name: "acc_mem_row1", scope: !573, file: !3, line: 124, type: !141)
!596 = !DILocation(line: 124, column: 37, scope: !573)
!597 = !DILocalVariable(name: "acc_mem_row2", scope: !573, file: !3, line: 124, type: !141)
!598 = !DILocation(line: 124, column: 56, scope: !573)
!599 = !DILocalVariable(name: "acc_mem_ref", scope: !573, file: !3, line: 125, type: !16)
!600 = !DILocation(line: 125, column: 20, scope: !573)
!601 = !DILocalVariable(name: "acc_mem_val", scope: !573, file: !3, line: 126, type: !16)
!602 = !DILocation(line: 126, column: 20, scope: !573)
!603 = !DILocalVariable(name: "acc_mem_gemm", scope: !573, file: !3, line: 127, type: !16)
!604 = !DILocation(line: 127, column: 20, scope: !573)
!605 = !DILocalVariable(name: "opcode", scope: !573, file: !3, line: 128, type: !17)
!606 = !DILocation(line: 128, column: 18, scope: !573)
!607 = !DILocalVariable(name: "op_type", scope: !573, file: !3, line: 128, type: !17)
!608 = !DILocation(line: 128, column: 26, scope: !573)
!609 = !DILocalVariable(name: "acc_stage1", scope: !573, file: !3, line: 129, type: !29)
!610 = !DILocation(line: 129, column: 18, scope: !573)
!611 = !DILocalVariable(name: "acc_stage2", scope: !573, file: !3, line: 130, type: !29)
!612 = !DILocation(line: 130, column: 18, scope: !573)
!613 = !DILocalVariable(name: "acc_stage3", scope: !573, file: !3, line: 131, type: !29)
!614 = !DILocation(line: 131, column: 18, scope: !573)
!615 = !DILocation(line: 132, column: 5, scope: !573)
!616 = !DILocation(line: 134, column: 5, scope: !573)
!617 = !DILocation(line: 135, column: 5, scope: !573)
!618 = !DILocation(line: 136, column: 5, scope: !573)
!619 = !DILocation(line: 137, column: 5, scope: !573)
!620 = !DILocation(line: 138, column: 5, scope: !573)
!621 = !DILocation(line: 139, column: 5, scope: !573)
!622 = !DILocation(line: 140, column: 5, scope: !573)
!623 = !DILocation(line: 141, column: 5, scope: !573)
!624 = !DILocation(line: 142, column: 5, scope: !573)
!625 = !DILocation(line: 143, column: 24, scope: !573)
!626 = !DILocation(line: 143, column: 5, scope: !573)
!627 = !DILocation(line: 144, column: 24, scope: !573)
!628 = !DILocation(line: 144, column: 5, scope: !573)
!629 = !DILocalVariable(name: "gemm_base", scope: !573, file: !3, line: 147, type: !229)
!630 = !DILocation(line: 147, column: 21, scope: !573)
!631 = !DILocalVariable(name: "instruction", scope: !573, file: !3, line: 148, type: !222)
!632 = !DILocation(line: 148, column: 11, scope: !573)
!633 = !DILocation(line: 148, column: 25, scope: !573)
!634 = !DILocation(line: 148, column: 33, scope: !573)
!635 = !DILocalVariable(name: "gemm_uop", scope: !573, file: !3, line: 152, type: !636)
!636 = !DICompositeType(tag: DW_TAG_array_type, baseType: !229, size: 1728, elements: !30)
!637 = !DILocation(line: 152, column: 21, scope: !573)
!638 = !DILocation(line: 152, column: 35, scope: !573)
!639 = !DILocation(line: 152, column: 36, scope: !573)
!640 = !DILocation(line: 152, column: 38, scope: !573)
!641 = !DILocation(line: 152, column: 55, scope: !573)
!642 = !DILocation(line: 152, column: 72, scope: !573)
!643 = !DILocation(line: 152, column: 89, scope: !573)
!644 = !DILocation(line: 152, column: 91, scope: !573)
!645 = !DILocation(line: 152, column: 108, scope: !573)
!646 = !DILocation(line: 152, column: 125, scope: !573)
!647 = !DILocation(line: 153, column: 36, scope: !573)
!648 = !DILocation(line: 153, column: 38, scope: !573)
!649 = !DILocation(line: 153, column: 55, scope: !573)
!650 = !DILocation(line: 153, column: 72, scope: !573)
!651 = !DILocation(line: 153, column: 89, scope: !573)
!652 = !DILocation(line: 153, column: 91, scope: !573)
!653 = !DILocation(line: 153, column: 108, scope: !573)
!654 = !DILocation(line: 153, column: 125, scope: !573)
!655 = !DILocation(line: 154, column: 36, scope: !573)
!656 = !DILocation(line: 154, column: 38, scope: !573)
!657 = !DILocation(line: 154, column: 55, scope: !573)
!658 = !DILocation(line: 154, column: 72, scope: !573)
!659 = !DILocation(line: 154, column: 89, scope: !573)
!660 = !DILocation(line: 154, column: 91, scope: !573)
!661 = !DILocation(line: 154, column: 108, scope: !573)
!662 = !DILocation(line: 154, column: 125, scope: !573)
!663 = !DILocation(line: 155, column: 36, scope: !573)
!664 = !DILocation(line: 155, column: 38, scope: !573)
!665 = !DILocation(line: 155, column: 55, scope: !573)
!666 = !DILocation(line: 155, column: 72, scope: !573)
!667 = !DILocation(line: 155, column: 89, scope: !573)
!668 = !DILocation(line: 155, column: 91, scope: !573)
!669 = !DILocation(line: 155, column: 108, scope: !573)
!670 = !DILocation(line: 155, column: 125, scope: !573)
!671 = !DILocation(line: 156, column: 36, scope: !573)
!672 = !DILocation(line: 156, column: 38, scope: !573)
!673 = !DILocation(line: 156, column: 55, scope: !573)
!674 = !DILocation(line: 156, column: 72, scope: !573)
!675 = !DILocalVariable(name: "gemm", scope: !573, file: !3, line: 159, type: !676)
!676 = !DICompositeType(tag: DW_TAG_array_type, baseType: !510, size: 864, elements: !30)
!677 = !DILocation(line: 159, column: 21, scope: !573)
!678 = !DILocation(line: 159, column: 31, scope: !573)
!679 = !DILocation(line: 159, column: 32, scope: !573)
!680 = !DILocation(line: 159, column: 33, scope: !573)
!681 = !DILocation(line: 159, column: 49, scope: !573)
!682 = !DILocation(line: 159, column: 65, scope: !573)
!683 = !DILocation(line: 159, column: 82, scope: !573)
!684 = !DILocation(line: 159, column: 83, scope: !573)
!685 = !DILocation(line: 159, column: 99, scope: !573)
!686 = !DILocation(line: 159, column: 115, scope: !573)
!687 = !DILocation(line: 160, column: 32, scope: !573)
!688 = !DILocation(line: 160, column: 33, scope: !573)
!689 = !DILocation(line: 160, column: 49, scope: !573)
!690 = !DILocation(line: 160, column: 65, scope: !573)
!691 = !DILocation(line: 160, column: 82, scope: !573)
!692 = !DILocation(line: 160, column: 83, scope: !573)
!693 = !DILocation(line: 160, column: 99, scope: !573)
!694 = !DILocation(line: 160, column: 115, scope: !573)
!695 = !DILocation(line: 161, column: 32, scope: !573)
!696 = !DILocation(line: 161, column: 33, scope: !573)
!697 = !DILocation(line: 161, column: 49, scope: !573)
!698 = !DILocation(line: 161, column: 65, scope: !573)
!699 = !DILocation(line: 161, column: 82, scope: !573)
!700 = !DILocation(line: 161, column: 83, scope: !573)
!701 = !DILocation(line: 161, column: 99, scope: !573)
!702 = !DILocation(line: 161, column: 115, scope: !573)
!703 = !DILocation(line: 162, column: 32, scope: !573)
!704 = !DILocation(line: 162, column: 33, scope: !573)
!705 = !DILocation(line: 162, column: 49, scope: !573)
!706 = !DILocation(line: 162, column: 65, scope: !573)
!707 = !DILocation(line: 162, column: 82, scope: !573)
!708 = !DILocation(line: 162, column: 83, scope: !573)
!709 = !DILocation(line: 162, column: 99, scope: !573)
!710 = !DILocation(line: 162, column: 115, scope: !573)
!711 = !DILocation(line: 163, column: 32, scope: !573)
!712 = !DILocation(line: 163, column: 33, scope: !573)
!713 = !DILocation(line: 163, column: 49, scope: !573)
!714 = !DILocation(line: 163, column: 65, scope: !573)
!715 = !DILocalVariable(name: "microop", scope: !573, file: !3, line: 167, type: !716)
!716 = !DICompositeType(tag: DW_TAG_array_type, baseType: !222, size: 2880, elements: !30)
!717 = !DILocation(line: 167, column: 11, scope: !573)
!718 = !DILocation(line: 167, column: 24, scope: !573)
!719 = !DILocation(line: 167, column: 25, scope: !573)
!720 = !DILocation(line: 167, column: 32, scope: !573)
!721 = !DILocation(line: 167, column: 45, scope: !573)
!722 = !DILocation(line: 167, column: 52, scope: !573)
!723 = !DILocation(line: 167, column: 65, scope: !573)
!724 = !DILocation(line: 167, column: 72, scope: !573)
!725 = !DILocation(line: 167, column: 85, scope: !573)
!726 = !DILocation(line: 167, column: 92, scope: !573)
!727 = !DILocation(line: 168, column: 25, scope: !573)
!728 = !DILocation(line: 168, column: 32, scope: !573)
!729 = !DILocation(line: 168, column: 46, scope: !573)
!730 = !DILocation(line: 168, column: 53, scope: !573)
!731 = !DILocation(line: 168, column: 66, scope: !573)
!732 = !DILocation(line: 168, column: 73, scope: !573)
!733 = !DILocation(line: 168, column: 86, scope: !573)
!734 = !DILocation(line: 168, column: 93, scope: !573)
!735 = !DILocation(line: 168, column: 106, scope: !573)
!736 = !DILocation(line: 168, column: 113, scope: !573)
!737 = !DILocalVariable(name: "microop_val", scope: !573, file: !3, line: 170, type: !738)
!738 = !DICompositeType(tag: DW_TAG_array_type, baseType: !504, size: 1728, elements: !30)
!739 = !DILocation(line: 170, column: 15, scope: !573)
!740 = !DILocation(line: 170, column: 32, scope: !573)
!741 = !DILocation(line: 170, column: 33, scope: !573)
!742 = !DILocation(line: 170, column: 40, scope: !573)
!743 = !DILocation(line: 170, column: 49, scope: !573)
!744 = !DILocation(line: 170, column: 56, scope: !573)
!745 = !DILocation(line: 170, column: 65, scope: !573)
!746 = !DILocation(line: 170, column: 72, scope: !573)
!747 = !DILocation(line: 170, column: 81, scope: !573)
!748 = !DILocation(line: 170, column: 88, scope: !573)
!749 = !DILocation(line: 171, column: 33, scope: !573)
!750 = !DILocation(line: 171, column: 40, scope: !573)
!751 = !DILocation(line: 171, column: 50, scope: !573)
!752 = !DILocation(line: 171, column: 57, scope: !573)
!753 = !DILocation(line: 171, column: 66, scope: !573)
!754 = !DILocation(line: 171, column: 73, scope: !573)
!755 = !DILocation(line: 171, column: 82, scope: !573)
!756 = !DILocation(line: 171, column: 89, scope: !573)
!757 = !DILocation(line: 171, column: 98, scope: !573)
!758 = !DILocation(line: 171, column: 105, scope: !573)
!759 = !DILocation(line: 175, column: 9, scope: !760)
!760 = distinct !DILexicalBlock(scope: !573, file: !3, line: 175, column: 8)
!761 = !DILocation(line: 175, column: 16, scope: !760)
!762 = !DILocation(line: 175, column: 27, scope: !760)
!763 = !DILocation(line: 175, column: 35, scope: !760)
!764 = !DILocation(line: 175, column: 22, scope: !760)
!765 = !DILocation(line: 176, column: 35, scope: !766)
!766 = distinct !DILexicalBlock(scope: !760, file: !3, line: 175, column: 42)
!767 = !DILocation(line: 176, column: 25, scope: !766)
!768 = !DILocation(line: 176, column: 23, scope: !766)
!769 = !DILocalVariable(name: "i", scope: !770, file: !3, line: 177, type: !11)
!770 = distinct !DILexicalBlock(scope: !766, file: !3, line: 177, column: 9)
!771 = !DILocation(line: 177, column: 18, scope: !770)
!772 = !DILocation(line: 177, column: 14, scope: !770)
!773 = !DILocation(line: 177, column: 22, scope: !774)
!774 = distinct !DILexicalBlock(scope: !770, file: !3, line: 177, column: 9)
!775 = !DILocation(line: 177, column: 23, scope: !774)
!776 = !DILocation(line: 177, column: 9, scope: !770)
!777 = !DILocation(line: 178, column: 27, scope: !778)
!778 = distinct !DILexicalBlock(scope: !774, file: !3, line: 177, column: 30)
!779 = !DILocation(line: 178, column: 40, scope: !778)
!780 = !DILocation(line: 178, column: 24, scope: !778)
!781 = !DILocation(line: 178, column: 13, scope: !778)
!782 = !DILocation(line: 178, column: 26, scope: !778)
!783 = !DILocation(line: 177, column: 27, scope: !774)
!784 = !DILocation(line: 177, column: 9, scope: !774)
!785 = distinct !{!785, !776, !786}
!786 = !DILocation(line: 179, column: 10, scope: !770)
!787 = !DILocalVariable(name: "i", scope: !788, file: !3, line: 180, type: !11)
!788 = distinct !DILexicalBlock(scope: !766, file: !3, line: 180, column: 9)
!789 = !DILocation(line: 180, column: 18, scope: !788)
!790 = !DILocation(line: 180, column: 14, scope: !788)
!791 = !DILocation(line: 180, column: 22, scope: !792)
!792 = distinct !DILexicalBlock(scope: !788, file: !3, line: 180, column: 9)
!793 = !DILocation(line: 180, column: 23, scope: !792)
!794 = !DILocation(line: 180, column: 9, scope: !788)
!795 = !DILocation(line: 181, column: 49, scope: !796)
!796 = distinct !DILexicalBlock(scope: !792, file: !3, line: 180, column: 30)
!797 = !DILocation(line: 181, column: 41, scope: !796)
!798 = !DILocation(line: 181, column: 27, scope: !796)
!799 = !DILocation(line: 181, column: 25, scope: !796)
!800 = !DILocation(line: 182, column: 27, scope: !796)
!801 = !DILocation(line: 182, column: 39, scope: !796)
!802 = !DILocation(line: 182, column: 24, scope: !796)
!803 = !DILocation(line: 182, column: 13, scope: !796)
!804 = !DILocation(line: 182, column: 26, scope: !796)
!805 = !DILocation(line: 180, column: 27, scope: !792)
!806 = !DILocation(line: 180, column: 9, scope: !792)
!807 = distinct !{!807, !794, !808}
!808 = !DILocation(line: 183, column: 13, scope: !788)
!809 = !DILocalVariable(name: "i", scope: !810, file: !3, line: 184, type: !11)
!810 = distinct !DILexicalBlock(scope: !766, file: !3, line: 184, column: 9)
!811 = !DILocation(line: 184, column: 18, scope: !810)
!812 = !DILocation(line: 184, column: 14, scope: !810)
!813 = !DILocation(line: 184, column: 22, scope: !814)
!814 = distinct !DILexicalBlock(scope: !810, file: !3, line: 184, column: 9)
!815 = !DILocation(line: 184, column: 23, scope: !814)
!816 = !DILocation(line: 184, column: 9, scope: !810)
!817 = !DILocation(line: 185, column: 57, scope: !818)
!818 = distinct !DILexicalBlock(scope: !814, file: !3, line: 184, column: 30)
!819 = !DILocation(line: 185, column: 45, scope: !818)
!820 = !DILocation(line: 185, column: 27, scope: !818)
!821 = !DILocation(line: 185, column: 25, scope: !818)
!822 = !DILocation(line: 186, column: 27, scope: !818)
!823 = !DILocation(line: 186, column: 39, scope: !818)
!824 = !DILocation(line: 186, column: 24, scope: !818)
!825 = !DILocation(line: 186, column: 13, scope: !818)
!826 = !DILocation(line: 186, column: 26, scope: !818)
!827 = !DILocation(line: 184, column: 27, scope: !814)
!828 = !DILocation(line: 184, column: 9, scope: !814)
!829 = distinct !{!829, !816, !830}
!830 = !DILocation(line: 187, column: 13, scope: !810)
!831 = !DILocalVariable(name: "i", scope: !832, file: !3, line: 188, type: !11)
!832 = distinct !DILexicalBlock(scope: !766, file: !3, line: 188, column: 9)
!833 = !DILocation(line: 188, column: 18, scope: !832)
!834 = !DILocation(line: 188, column: 14, scope: !832)
!835 = !DILocation(line: 188, column: 25, scope: !836)
!836 = distinct !DILexicalBlock(scope: !832, file: !3, line: 188, column: 9)
!837 = !DILocation(line: 188, column: 27, scope: !836)
!838 = !DILocation(line: 188, column: 9, scope: !832)
!839 = !DILocation(line: 189, column: 10, scope: !840)
!840 = distinct !DILexicalBlock(scope: !836, file: !3, line: 188, column: 43)
!841 = !DILocation(line: 188, column: 39, scope: !836)
!842 = !DILocation(line: 188, column: 9, scope: !836)
!843 = distinct !{!843, !838, !844}
!844 = !DILocation(line: 190, column: 13, scope: !832)
!845 = !DILocation(line: 203, column: 1, scope: !573)
!846 = distinct !DISubprogram(name: "memcpy", scope: !847, file: !847, line: 12, type: !848, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !130, retainedNodes: !4)
!847 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!848 = !DISubroutineType(types: !849)
!849 = !{!41, !41, !42, !850}
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !851, line: 46, baseType: !46)
!851 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!852 = !DILocalVariable(name: "destaddr", arg: 1, scope: !846, file: !847, line: 12, type: !41)
!853 = !DILocation(line: 12, column: 20, scope: !846)
!854 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !846, file: !847, line: 12, type: !42)
!855 = !DILocation(line: 12, column: 42, scope: !846)
!856 = !DILocalVariable(name: "len", arg: 3, scope: !846, file: !847, line: 12, type: !850)
!857 = !DILocation(line: 12, column: 58, scope: !846)
!858 = !DILocalVariable(name: "dest", scope: !846, file: !847, line: 13, type: !70)
!859 = !DILocation(line: 13, column: 9, scope: !846)
!860 = !DILocation(line: 13, column: 16, scope: !846)
!861 = !DILocalVariable(name: "src", scope: !846, file: !847, line: 14, type: !74)
!862 = !DILocation(line: 14, column: 15, scope: !846)
!863 = !DILocation(line: 14, column: 21, scope: !846)
!864 = !DILocation(line: 16, column: 3, scope: !846)
!865 = !DILocation(line: 16, column: 13, scope: !846)
!866 = !DILocation(line: 16, column: 16, scope: !846)
!867 = !DILocation(line: 17, column: 19, scope: !846)
!868 = !DILocation(line: 17, column: 15, scope: !846)
!869 = !DILocation(line: 17, column: 10, scope: !846)
!870 = !DILocation(line: 17, column: 13, scope: !846)
!871 = distinct !{!871, !864, !867}
!872 = !DILocation(line: 18, column: 10, scope: !846)
!873 = !DILocation(line: 18, column: 3, scope: !846)
