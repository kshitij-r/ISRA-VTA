; ModuleID = 'gemm_klee.bc'
source_filename = "gemm_klee.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.GEMM_STRUCT_REF = type { i32*, i32*, i32* }
%struct.INSTR = type { i32, i32, i32, %struct.GEMM_STRUCT_REF }
%struct.INSTR_VAL = type { i32, i32, i32, %struct.GEMM_STRUCT_VAL }
%struct.GEMM_STRUCT_VAL = type { i32, i32, i32 }

@res_index = dso_local global i32 0, align 4, !dbg !0
@res_index_val = dso_local global i32 0, align 4, !dbg !8
@result = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !11
@result_val = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !17
@product = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !19
@inp_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 1, i32 2, i32 3]], align 16, !dbg !24
@wgt_mem = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 4, i32 5, i32 6]], align 16, !dbg !27
@acc_mem = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !29
@wgt_mem_prime = dso_local global [3 x [3 x i32]] zeroinitializer, align 16, !dbg !31
@out_mem = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !33
@acc_mem_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !35
@acc_mem_base_flat = dso_local global [9 x i32] zeroinitializer, align 16, !dbg !37
@.str = private unnamed_addr constant [8 x i8] c"op_type\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"opcode\00", align 1
@__const.main.gemm_base = private unnamed_addr constant %struct.GEMM_STRUCT_REF { i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i32 0, i32 0, i32 0), i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i32 0, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [31 x i8] c"acc_stage3[i] == acc_stage2[i]\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"gemm_klee.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [29 x i8] c"int main(int, const char **)\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"acc_stage1[i] == acc_stage2[i]\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"acc_stage4[i] == acc_stage3[i]\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z9transposePA3_jS0_([3 x i32]* %wgt_mem, [3 x i32]* %wgt_mem_prime) #0 !dbg !139 {
entry:
  %wgt_mem.addr = alloca [3 x i32]*, align 8
  %wgt_mem_prime.addr = alloca [3 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x i32]* %wgt_mem, [3 x i32]** %wgt_mem.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem.addr, metadata !145, metadata !DIExpression()), !dbg !146
  store [3 x i32]* %wgt_mem_prime, [3 x i32]** %wgt_mem_prime.addr, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]** %wgt_mem_prime.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %j, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !156
  %cmp = icmp slt i32 %0, 3, !dbg !158
  br i1 %cmp, label %for.body, label %for.end12, !dbg !159

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !160
  br label %for.cond1, !dbg !162

for.cond1:                                        ; preds = %for.body3, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !163
  %cmp2 = icmp slt i32 %1, 3, !dbg !165
  br i1 %cmp2, label %for.body3, label %for.inc10, !dbg !166

for.body3:                                        ; preds = %for.cond1
  %2 = load [3 x i32]*, [3 x i32]** %wgt_mem.addr, align 8, !dbg !167
  %3 = load i32, i32* %j, align 4, !dbg !168
  %idxprom = sext i32 %3 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %idxprom, !dbg !167
  %4 = load i32, i32* %i, align 4, !dbg !169
  %idxprom4 = sext i32 %4 to i64, !dbg !167
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !167
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !167
  %6 = load [3 x i32]*, [3 x i32]** %wgt_mem_prime.addr, align 8, !dbg !170
  %7 = load i32, i32* %i, align 4, !dbg !171
  %idxprom6 = sext i32 %7 to i64, !dbg !170
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 %idxprom6, !dbg !170
  %8 = load i32, i32* %j, align 4, !dbg !172
  %idxprom8 = sext i32 %8 to i64, !dbg !170
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx7, i64 0, i64 %idxprom8, !dbg !170
  store i32 %5, i32* %arrayidx9, align 4, !dbg !173
  %9 = load i32, i32* %j, align 4, !dbg !174
  %inc = add nsw i32 %9, 1, !dbg !174
  store i32 %inc, i32* %j, align 4, !dbg !174
  br label %for.cond1, !dbg !175, !llvm.loop !176

for.inc10:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !178
  %inc11 = add nsw i32 %10, 1, !dbg !178
  store i32 %inc11, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !182
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z14matrixMultiplyPjS_(i32* %mat1, i32* %mat2) #0 !dbg !183 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %res, metadata !191, metadata !DIExpression()), !dbg !192
  store i32 0, i32* %res, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !195
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !197
  %cmp = icmp slt i32 %0, 3, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !201
  %2 = load i32, i32* %i, align 4, !dbg !203
  %idxprom = sext i32 %2 to i64, !dbg !201
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !201
  %3 = load i32, i32* %arrayidx, align 4, !dbg !201
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !204
  %5 = load i32, i32* %i, align 4, !dbg !205
  %idxprom1 = sext i32 %5 to i64, !dbg !204
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !204
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !204
  %mul = mul i32 %3, %6, !dbg !206
  %7 = load i32, i32* %res, align 4, !dbg !207
  %add = add i32 %7, %mul, !dbg !207
  store i32 %add, i32* %res, align 4, !dbg !207
  %8 = load i32, i32* %i, align 4, !dbg !208
  %inc = add nsw i32 %8, 1, !dbg !208
  store i32 %inc, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !212
  %10 = load i32, i32* @res_index, align 4, !dbg !213
  %idxprom3 = sext i32 %10 to i64, !dbg !214
  %arrayidx4 = getelementptr inbounds [9 x i32], [9 x i32]* @result, i64 0, i64 %idxprom3, !dbg !214
  store i32 %9, i32* %arrayidx4, align 4, !dbg !215
  %11 = load i32, i32* @res_index, align 4, !dbg !216
  %inc5 = add nsw i32 %11, 1, !dbg !216
  store i32 %inc5, i32* @res_index, align 4, !dbg !216
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @result, i64 0, i64 0), !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17matrixMultiplyValPjS_(i32* %mat1, i32* %mat2) #0 !dbg !218 {
entry:
  %mat1.addr = alloca i32*, align 8
  %mat2.addr = alloca i32*, align 8
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %mat1, i32** %mat1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat1.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store i32* %mat2, i32** %mat2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %mat2.addr, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32* %res, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 0, i32* %res, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %i, metadata !225, metadata !DIExpression()), !dbg !227
  store i32 0, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !229
  %cmp = icmp slt i32 %0, 3, !dbg !231
  br i1 %cmp, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %mat1.addr, align 8, !dbg !233
  %2 = load i32, i32* %i, align 4, !dbg !235
  %idxprom = sext i32 %2 to i64, !dbg !233
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !233
  %3 = load i32, i32* %arrayidx, align 4, !dbg !233
  %4 = load i32*, i32** %mat2.addr, align 8, !dbg !236
  %5 = load i32, i32* %i, align 4, !dbg !237
  %idxprom1 = sext i32 %5 to i64, !dbg !236
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !236
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !236
  %mul = mul i32 %3, %6, !dbg !238
  %7 = load i32, i32* %res, align 4, !dbg !239
  %add = add i32 %7, %mul, !dbg !239
  store i32 %add, i32* %res, align 4, !dbg !239
  %8 = load i32, i32* %i, align 4, !dbg !240
  %inc = add nsw i32 %8, 1, !dbg !240
  store i32 %inc, i32* %i, align 4, !dbg !240
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %res, align 4, !dbg !244
  %10 = load i32, i32* @res_index_val, align 4, !dbg !245
  %idxprom3 = sext i32 %10 to i64, !dbg !246
  %arrayidx4 = getelementptr inbounds [9 x i32], [9 x i32]* @result_val, i64 0, i64 %idxprom3, !dbg !246
  store i32 %9, i32* %arrayidx4, align 4, !dbg !247
  %11 = load i32, i32* @res_index_val, align 4, !dbg !248
  %inc5 = add nsw i32 %11, 1, !dbg !248
  store i32 %inc5, i32* @res_index_val, align 4, !dbg !248
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @result_val, i64 0, i64 0), !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %instr) #0 !dbg !250 {
entry:
  %arr_ref = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instr, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata i32** %arr_ref, metadata !267, metadata !DIExpression()), !dbg !268
  store i32* null, i32** %arr_ref, align 8, !dbg !268
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !271, metadata !DIExpression()), !dbg !272
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 1, !dbg !273
  %0 = load i32, i32* %OPCODE, align 4, !dbg !273
  %cmp = icmp eq i32 %0, 2, !dbg !275
  br i1 %cmp, label %if.then, label %if.end, !dbg !276

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !277, metadata !DIExpression()), !dbg !280
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !281

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !282
  %cmp1 = icmp slt i32 %1, 3, !dbg !284
  br i1 %cmp1, label %for.body, label %for.end, !dbg !285

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !286
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS, i32 0, i32 0, !dbg !288
  %2 = load i32*, i32** %inp_mem, align 8, !dbg !288
  %3 = load i32, i32* %i, align 4, !dbg !289
  %idx.ext = sext i32 %3 to i64, !dbg !290
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %idx.ext, !dbg !290
  %4 = load i32, i32* %add.ptr, align 4, !dbg !291
  %5 = load i32, i32* %i, align 4, !dbg !292
  %idxprom = sext i32 %5 to i64, !dbg !293
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !293
  store i32 %4, i32* %arrayidx, align 4, !dbg !294
  %6 = load i32, i32* %i, align 4, !dbg !295
  %inc = add nsw i32 %6, 1, !dbg !295
  store i32 %inc, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !299, metadata !DIExpression()), !dbg !301
  store i32 0, i32* %i2, align 4, !dbg !301
  br label %for.cond3, !dbg !302

for.cond3:                                        ; preds = %for.body5, %for.end
  %7 = load i32, i32* %i2, align 4, !dbg !303
  %cmp4 = icmp slt i32 %7, 3, !dbg !305
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !306

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instr, i32 0, i32 3, !dbg !307
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %OPERANDS6, i32 0, i32 1, !dbg !309
  %8 = load i32*, i32** %wgt_mem, align 8, !dbg !309
  %9 = load i32, i32* %i2, align 4, !dbg !310
  %idx.ext7 = sext i32 %9 to i64, !dbg !311
  %add.ptr8 = getelementptr inbounds i32, i32* %8, i64 %idx.ext7, !dbg !311
  %10 = load i32, i32* %add.ptr8, align 4, !dbg !312
  %11 = load i32, i32* %i2, align 4, !dbg !313
  %idxprom9 = sext i32 %11 to i64, !dbg !314
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom9, !dbg !314
  store i32 %10, i32* %arrayidx10, align 4, !dbg !315
  %12 = load i32, i32* %i2, align 4, !dbg !316
  %inc12 = add nsw i32 %12, 1, !dbg !316
  store i32 %inc12, i32* %i2, align 4, !dbg !316
  br label %for.cond3, !dbg !317, !llvm.loop !318

for.end13:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !320
  %arraydecay14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !321
  %call = call i32* @_Z14matrixMultiplyPjS_(i32* %arraydecay, i32* %arraydecay14), !dbg !322
  store i32* %call, i32** %arr_ref, align 8, !dbg !323
  br label %if.end, !dbg !324

if.end:                                           ; preds = %for.end13, %entry
  %13 = load i32*, i32** %arr_ref, align 8, !dbg !325
  ret i32* %13, !dbg !326
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %instr) #0 !dbg !327 {
entry:
  %arr_val = alloca i32*, align 8
  %inp = alloca [3 x i32], align 4
  %wgt = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR_VAL* %instr, metadata !341, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata i32** %arr_val, metadata !343, metadata !DIExpression()), !dbg !344
  store i32* null, i32** %arr_val, align 8, !dbg !344
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt, metadata !347, metadata !DIExpression()), !dbg !348
  %OPCODE = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 1, !dbg !349
  %0 = load i32, i32* %OPCODE, align 4, !dbg !349
  %cmp = icmp eq i32 %0, 2, !dbg !351
  br i1 %cmp, label %if.then, label %if.end, !dbg !352

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !353, metadata !DIExpression()), !dbg !356
  store i32 0, i32* %i, align 4, !dbg !356
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.body, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !358
  %cmp1 = icmp slt i32 %1, 3, !dbg !360
  br i1 %cmp1, label %for.body, label %for.end, !dbg !361

for.body:                                         ; preds = %for.cond
  %OPERANDS = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !362
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS, i32 0, i32 0, !dbg !364
  %2 = load i32, i32* %inp_mem, align 4, !dbg !364
  %3 = load i32, i32* %i, align 4, !dbg !365
  %add = add i32 %2, %3, !dbg !366
  %4 = load i32, i32* %i, align 4, !dbg !367
  %idxprom = sext i32 %4 to i64, !dbg !368
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 %idxprom, !dbg !368
  store i32 %add, i32* %arrayidx, align 4, !dbg !369
  %5 = load i32, i32* %i, align 4, !dbg !370
  %inc = add nsw i32 %5, 1, !dbg !370
  store i32 %inc, i32* %i, align 4, !dbg !370
  br label %for.cond, !dbg !371, !llvm.loop !372

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !374, metadata !DIExpression()), !dbg !376
  store i32 0, i32* %i2, align 4, !dbg !376
  br label %for.cond3, !dbg !377

for.cond3:                                        ; preds = %for.body5, %for.end
  %6 = load i32, i32* %i2, align 4, !dbg !378
  %cmp4 = icmp slt i32 %6, 3, !dbg !380
  br i1 %cmp4, label %for.body5, label %for.end11, !dbg !381

for.body5:                                        ; preds = %for.cond3
  %OPERANDS6 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %instr, i32 0, i32 3, !dbg !382
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %OPERANDS6, i32 0, i32 1, !dbg !384
  %7 = load i32, i32* %wgt_mem, align 4, !dbg !384
  %8 = load i32, i32* %i2, align 4, !dbg !385
  %idxprom7 = sext i32 %8 to i64, !dbg !386
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 %idxprom7, !dbg !386
  store i32 %7, i32* %arrayidx8, align 4, !dbg !387
  %9 = load i32, i32* %i2, align 4, !dbg !388
  %inc10 = add nsw i32 %9, 1, !dbg !388
  store i32 %inc10, i32* %i2, align 4, !dbg !388
  br label %for.cond3, !dbg !389, !llvm.loop !390

for.end11:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp, i64 0, i64 0, !dbg !392
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt, i64 0, i64 0, !dbg !393
  %call = call i32* @_Z17matrixMultiplyValPjS_(i32* %arraydecay, i32* %arraydecay12), !dbg !394
  store i32* %call, i32** %arr_val, align 8, !dbg !395
  br label %if.end, !dbg !396

if.end:                                           ; preds = %for.end11, %entry
  %10 = load i32*, i32** %arr_val, align 8, !dbg !397
  ret i32* %10, !dbg !398
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %myinsn) #0 !dbg !399 {
entry:
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %i26 = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.INSTR* %myinsn, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %row, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32* %col, metadata !404, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata i32* %i, metadata !406, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !408, metadata !DIExpression()), !dbg !409
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %myinsn, i32 0, i32 1, !dbg !410
  %0 = load i32, i32* %OPCODE, align 4, !dbg !410
  %cmp = icmp eq i32 %0, 2, !dbg !412
  br i1 %cmp, label %if.then, label %if.end, !dbg !413

if.then:                                          ; preds = %entry
  store i32 0, i32* %row, align 4, !dbg !414
  br label %for.cond, !dbg !417

for.cond:                                         ; preds = %for.inc23, %if.then
  %1 = load i32, i32* %row, align 4, !dbg !418
  %cmp1 = icmp ult i32 %1, 3, !dbg !420
  br i1 %cmp1, label %for.body, label %for.end25, !dbg !421

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %col, align 4, !dbg !422
  br label %for.cond2, !dbg !425

for.cond2:                                        ; preds = %for.end, %for.body
  %2 = load i32, i32* %col, align 4, !dbg !426
  %cmp3 = icmp ult i32 %2, 3, !dbg !428
  br i1 %cmp3, label %for.body4, label %for.inc23, !dbg !429

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %sum, align 4, !dbg !430
  store i32 0, i32* %i, align 4, !dbg !432
  br label %for.cond5, !dbg !434

for.cond5:                                        ; preds = %for.body7, %for.body4
  %3 = load i32, i32* %i, align 4, !dbg !435
  %cmp6 = icmp ult i32 %3, 3, !dbg !437
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !438

for.body7:                                        ; preds = %for.cond5
  %4 = load i32, i32* %row, align 4, !dbg !439
  %idx.ext = zext i32 %4 to i64, !dbg !441
  %add.ptr = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 0), i64 %idx.ext, !dbg !441
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr, i64 0, i64 0, !dbg !442
  %5 = load i32, i32* %i, align 4, !dbg !443
  %idx.ext8 = zext i32 %5 to i64, !dbg !444
  %add.ptr9 = getelementptr inbounds i32, i32* %arraydecay, i64 %idx.ext8, !dbg !444
  %6 = load i32, i32* %add.ptr9, align 4, !dbg !445
  %7 = load i32, i32* %i, align 4, !dbg !446
  %idx.ext10 = zext i32 %7 to i64, !dbg !447
  %add.ptr11 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), i64 %idx.ext10, !dbg !447
  %arraydecay12 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr11, i64 0, i64 0, !dbg !448
  %8 = load i32, i32* %col, align 4, !dbg !449
  %idx.ext13 = zext i32 %8 to i64, !dbg !450
  %add.ptr14 = getelementptr inbounds i32, i32* %arraydecay12, i64 %idx.ext13, !dbg !450
  %9 = load i32, i32* %add.ptr14, align 4, !dbg !451
  %mul = mul i32 %6, %9, !dbg !452
  %10 = load i32, i32* %sum, align 4, !dbg !453
  %add = add i32 %10, %mul, !dbg !453
  store i32 %add, i32* %sum, align 4, !dbg !453
  %11 = load i32, i32* %i, align 4, !dbg !454
  %inc = add i32 %11, 1, !dbg !454
  store i32 %inc, i32* %i, align 4, !dbg !454
  br label %for.cond5, !dbg !455, !llvm.loop !456

for.end:                                          ; preds = %for.cond5
  %12 = load i32, i32* %sum, align 4, !dbg !458
  %13 = load i32, i32* %row, align 4, !dbg !459
  %idx.ext15 = zext i32 %13 to i64, !dbg !460
  %add.ptr16 = getelementptr inbounds [3 x i32], [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 0), i64 %idx.ext15, !dbg !460
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %add.ptr16, i64 0, i64 0, !dbg !461
  %14 = load i32, i32* %col, align 4, !dbg !462
  %idx.ext18 = zext i32 %14 to i64, !dbg !463
  %add.ptr19 = getelementptr inbounds i32, i32* %arraydecay17, i64 %idx.ext18, !dbg !463
  store i32 %12, i32* %add.ptr19, align 4, !dbg !464
  %15 = load i32, i32* %col, align 4, !dbg !465
  %inc21 = add i32 %15, 1, !dbg !465
  store i32 %inc21, i32* %col, align 4, !dbg !465
  br label %for.cond2, !dbg !466, !llvm.loop !467

for.inc23:                                        ; preds = %for.cond2
  %16 = load i32, i32* %row, align 4, !dbg !469
  %inc24 = add i32 %16, 1, !dbg !469
  store i32 %inc24, i32* %row, align 4, !dbg !469
  br label %for.cond, !dbg !470, !llvm.loop !471

for.end25:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !473, metadata !DIExpression()), !dbg !475
  store i32 0, i32* %i26, align 4, !dbg !475
  br label %for.cond27, !dbg !476

for.cond27:                                       ; preds = %for.inc42, %for.end25
  %17 = load i32, i32* %i26, align 4, !dbg !477
  %cmp28 = icmp slt i32 %17, 3, !dbg !479
  br i1 %cmp28, label %for.body29, label %if.end, !dbg !480

for.body29:                                       ; preds = %for.cond27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !481, metadata !DIExpression()), !dbg !484
  store i32 0, i32* %j, align 4, !dbg !484
  br label %for.cond30, !dbg !485

for.cond30:                                       ; preds = %for.body32, %for.body29
  %18 = load i32, i32* %j, align 4, !dbg !486
  %cmp31 = icmp slt i32 %18, 3, !dbg !488
  %19 = load i32, i32* %i26, align 4, !dbg !489
  br i1 %cmp31, label %for.body32, label %for.inc42, !dbg !490

for.body32:                                       ; preds = %for.cond30
  %idxprom = sext i32 %19 to i64, !dbg !491
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* @product, i64 0, i64 %idxprom, !dbg !491
  %20 = load i32, i32* %j, align 4, !dbg !493
  %idxprom33 = sext i32 %20 to i64, !dbg !491
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 %idxprom33, !dbg !491
  %21 = load i32, i32* %arrayidx34, align 4, !dbg !491
  %22 = load i32, i32* %i26, align 4, !dbg !494
  %mul35 = mul nsw i32 %22, 3, !dbg !495
  %23 = load i32, i32* %j, align 4, !dbg !496
  %add36 = add nsw i32 %mul35, %23, !dbg !497
  %idxprom37 = sext i32 %add36 to i64, !dbg !498
  %arrayidx38 = getelementptr inbounds [9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 %idxprom37, !dbg !498
  store i32 %21, i32* %arrayidx38, align 4, !dbg !499
  %24 = load i32, i32* %j, align 4, !dbg !500
  %inc40 = add nsw i32 %24, 1, !dbg !500
  store i32 %inc40, i32* %j, align 4, !dbg !500
  br label %for.cond30, !dbg !501, !llvm.loop !502

for.inc42:                                        ; preds = %for.cond30
  %inc43 = add nsw i32 %19, 1, !dbg !504
  store i32 %inc43, i32* %i26, align 4, !dbg !504
  br label %for.cond27, !dbg !505, !llvm.loop !506

if.end:                                           ; preds = %for.cond27, %entry
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @acc_mem_base_flat, i64 0, i64 0), !dbg !508
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @_Z12core_wrapperPj(i32* %acc) #0 !dbg !509 {
entry:
  %acc.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %acc, i32** %acc.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %acc.addr, metadata !512, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.declare(metadata i32* %i, metadata !514, metadata !DIExpression()), !dbg !516
  store i32 0, i32* %i, align 4, !dbg !516
  br label %for.cond, !dbg !517

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !518
  %cmp = icmp slt i32 %0, 9, !dbg !520
  br i1 %cmp, label %for.body, label %for.end, !dbg !521

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %acc.addr, align 8, !dbg !522
  %2 = load i32, i32* %i, align 4, !dbg !523
  %idxprom = sext i32 %2 to i64, !dbg !522
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !522
  %3 = load i32, i32* %arrayidx, align 4, !dbg !522
  %4 = load i32, i32* %i, align 4, !dbg !524
  %idxprom1 = sext i32 %4 to i64, !dbg !525
  %arrayidx2 = getelementptr inbounds [9 x i32], [9 x i32]* @out_mem, i64 0, i64 %idxprom1, !dbg !525
  store i32 %3, i32* %arrayidx2, align 4, !dbg !526
  %5 = load i32, i32* %i, align 4, !dbg !527
  %inc = add nsw i32 %5, 1, !dbg !527
  store i32 %inc, i32* %i, align 4, !dbg !527
  br label %for.cond, !dbg !528, !llvm.loop !529

for.end:                                          ; preds = %for.cond
  ret i32* getelementptr inbounds ([9 x i32], [9 x i32]* @out_mem, i64 0, i64 0), !dbg !531
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !532 {
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
  %acc_stage1 = alloca [9 x i32], align 16
  %acc_stage2 = alloca [9 x i32], align 16
  %acc_stage3 = alloca [9 x i32], align 16
  %acc_stage4 = alloca [9 x i32], align 16
  %acc_mem_ref = alloca i32*, align 8
  %acc_mem_val = alloca i32*, align 8
  %acc_mem_gemm = alloca i32*, align 8
  %out_mem_core = alloca i32*, align 8
  %opcode = alloca i32, align 4
  %op_type = alloca i32, align 4
  %gemm_base = alloca %struct.GEMM_STRUCT_REF, align 8
  %instruction = alloca %struct.INSTR, align 8
  %gemm_uop = alloca [9 x %struct.GEMM_STRUCT_REF], align 16
  %gemm = alloca [9 x %struct.GEMM_STRUCT_VAL], align 16
  %microop = alloca [9 x %struct.INSTR], align 16
  %microop_val = alloca [9 x %struct.INSTR_VAL], align 16
  %agg.tmp = alloca %struct.INSTR, align 8
  %i = alloca i32, align 4
  %i244 = alloca i32, align 4
  %agg.tmp248 = alloca %struct.INSTR, align 8
  %i259 = alloca i32, align 4
  %agg.tmp263 = alloca %struct.INSTR_VAL, align 8
  %i276 = alloca i32, align 4
  %i287 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !536, metadata !DIExpression()), !dbg !537
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !538, metadata !DIExpression()), !dbg !539
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row0, metadata !540, metadata !DIExpression()), !dbg !541
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row1, metadata !542, metadata !DIExpression()), !dbg !543
  call void @llvm.dbg.declare(metadata [3 x i32]* %inp_mem_row2, metadata !544, metadata !DIExpression()), !dbg !545
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row0, metadata !546, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row1, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata [3 x i32]* %wgt_mem_row2, metadata !550, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row0, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row1, metadata !554, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.declare(metadata [3 x i32]* %acc_mem_row2, metadata !556, metadata !DIExpression()), !dbg !557
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage1, metadata !558, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage2, metadata !560, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage3, metadata !562, metadata !DIExpression()), !dbg !563
  call void @llvm.dbg.declare(metadata [9 x i32]* %acc_stage4, metadata !564, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata i32** %acc_mem_ref, metadata !566, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.declare(metadata i32** %acc_mem_val, metadata !568, metadata !DIExpression()), !dbg !569
  call void @llvm.dbg.declare(metadata i32** %acc_mem_gemm, metadata !570, metadata !DIExpression()), !dbg !571
  call void @llvm.dbg.declare(metadata i32** %out_mem_core, metadata !572, metadata !DIExpression()), !dbg !573
  call void @llvm.dbg.declare(metadata i32* %opcode, metadata !574, metadata !DIExpression()), !dbg !575
  call void @llvm.dbg.declare(metadata i32* %op_type, metadata !576, metadata !DIExpression()), !dbg !577
  call void @_Z9transposePA3_jS0_([3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 0)), !dbg !578
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !579
  %0 = bitcast i32* %arraydecay to i8*, !dbg !579
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([3 x [3 x i32]]* @inp_mem to i8*), i64 12), !dbg !579
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !580
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !580
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !580
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !581
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !581
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @inp_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !581
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !582
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !582
  %7 = call i8* @memcpy(i8* %6, i8* bitcast ([3 x [3 x i32]]* @wgt_mem_prime to i8*), i64 12), !dbg !582
  %arraydecay4 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !583
  %8 = bitcast i32* %arraydecay4 to i8*, !dbg !583
  %9 = call i8* @memcpy(i8* %8, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !583
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !584
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !584
  %11 = call i8* @memcpy(i8* %10, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @wgt_mem_prime, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !584
  %arraydecay6 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !585
  %12 = bitcast i32* %arraydecay6 to i8*, !dbg !585
  %13 = call i8* @memcpy(i8* %12, i8* bitcast ([3 x [3 x i32]]* @acc_mem to i8*), i64 12), !dbg !585
  %arraydecay7 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !586
  %14 = bitcast i32* %arraydecay7 to i8*, !dbg !586
  %15 = call i8* @memcpy(i8* %14, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 1, i64 0) to i8*), i64 12), !dbg !586
  %arraydecay8 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !587
  %16 = bitcast i32* %arraydecay8 to i8*, !dbg !587
  %17 = call i8* @memcpy(i8* %16, i8* bitcast (i32* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]]* @acc_mem, i64 0, i64 2, i64 0) to i8*), i64 12), !dbg !587
  %18 = bitcast i32* %op_type to i8*, !dbg !588
  call void @klee_make_symbolic(i8* %18, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !589
  %19 = bitcast i32* %opcode to i8*, !dbg !590
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !591
  call void @llvm.dbg.declare(metadata %struct.GEMM_STRUCT_REF* %gemm_base, metadata !592, metadata !DIExpression()), !dbg !593
  %20 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !593
  %21 = call i8* @memcpy(i8* %20, i8* bitcast (%struct.GEMM_STRUCT_REF* @__const.main.gemm_base to i8*), i64 24), !dbg !593
  call void @llvm.dbg.declare(metadata %struct.INSTR* %instruction, metadata !594, metadata !DIExpression()), !dbg !595
  %ID = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 0, !dbg !596
  store i32 0, i32* %ID, align 8, !dbg !596
  %OPCODE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 1, !dbg !596
  store i32 2, i32* %OPCODE, align 4, !dbg !596
  %OPTYPE = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 2, !dbg !596
  store i32 0, i32* %OPTYPE, align 8, !dbg !596
  %OPERANDS = getelementptr inbounds %struct.INSTR, %struct.INSTR* %instruction, i32 0, i32 3, !dbg !596
  %22 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS to i8*, !dbg !597
  %23 = bitcast %struct.GEMM_STRUCT_REF* %gemm_base to i8*, !dbg !597
  %24 = call i8* @memcpy(i8* %22, i8* %23, i64 24), !dbg !597
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, metadata !598, metadata !DIExpression()), !dbg !600
  %arrayinit.begin = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !601
  %inp_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 0, !dbg !602
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !603
  store i32* %arrayidx, i32** %inp_mem, align 8, !dbg !602
  %wgt_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 1, !dbg !602
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !604
  store i32* %arrayidx9, i32** %wgt_mem, align 8, !dbg !602
  %acc_mem = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i32 0, i32 2, !dbg !602
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !605
  store i32* %arrayidx10, i32** %acc_mem, align 8, !dbg !602
  %arrayinit.element = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.begin, i64 1, !dbg !601
  %inp_mem11 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 0, !dbg !606
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !607
  store i32* %arrayidx12, i32** %inp_mem11, align 8, !dbg !606
  %wgt_mem13 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 1, !dbg !606
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !608
  store i32* %arrayidx14, i32** %wgt_mem13, align 8, !dbg !606
  %acc_mem15 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i32 0, i32 2, !dbg !606
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !609
  store i32* %arrayidx16, i32** %acc_mem15, align 8, !dbg !606
  %arrayinit.element17 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element, i64 1, !dbg !601
  %inp_mem18 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 0, !dbg !610
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !611
  store i32* %arrayidx19, i32** %inp_mem18, align 8, !dbg !610
  %wgt_mem20 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 1, !dbg !610
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !612
  store i32* %arrayidx21, i32** %wgt_mem20, align 8, !dbg !610
  %acc_mem22 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i32 0, i32 2, !dbg !610
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !613
  store i32* %arrayidx23, i32** %acc_mem22, align 8, !dbg !610
  %arrayinit.element24 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element17, i64 1, !dbg !601
  %inp_mem25 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 0, !dbg !614
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !615
  store i32* %arrayidx26, i32** %inp_mem25, align 8, !dbg !614
  %wgt_mem27 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 1, !dbg !614
  %arrayidx28 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !616
  store i32* %arrayidx28, i32** %wgt_mem27, align 8, !dbg !614
  %acc_mem29 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i32 0, i32 2, !dbg !614
  %arrayidx30 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !617
  store i32* %arrayidx30, i32** %acc_mem29, align 8, !dbg !614
  %arrayinit.element31 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element24, i64 1, !dbg !601
  %inp_mem32 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 0, !dbg !618
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !619
  store i32* %arrayidx33, i32** %inp_mem32, align 8, !dbg !618
  %wgt_mem34 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 1, !dbg !618
  %arrayidx35 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !620
  store i32* %arrayidx35, i32** %wgt_mem34, align 8, !dbg !618
  %acc_mem36 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i32 0, i32 2, !dbg !618
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !621
  store i32* %arrayidx37, i32** %acc_mem36, align 8, !dbg !618
  %arrayinit.element38 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element31, i64 1, !dbg !601
  %inp_mem39 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 0, !dbg !622
  %arrayidx40 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !623
  store i32* %arrayidx40, i32** %inp_mem39, align 8, !dbg !622
  %wgt_mem41 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 1, !dbg !622
  %arrayidx42 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !624
  store i32* %arrayidx42, i32** %wgt_mem41, align 8, !dbg !622
  %acc_mem43 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i32 0, i32 2, !dbg !622
  %arrayidx44 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !625
  store i32* %arrayidx44, i32** %acc_mem43, align 8, !dbg !622
  %arrayinit.element45 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element38, i64 1, !dbg !601
  %inp_mem46 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 0, !dbg !626
  %arrayidx47 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !627
  store i32* %arrayidx47, i32** %inp_mem46, align 8, !dbg !626
  %wgt_mem48 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 1, !dbg !626
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !628
  store i32* %arrayidx49, i32** %wgt_mem48, align 8, !dbg !626
  %acc_mem50 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i32 0, i32 2, !dbg !626
  %arrayidx51 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !629
  store i32* %arrayidx51, i32** %acc_mem50, align 8, !dbg !626
  %arrayinit.element52 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element45, i64 1, !dbg !601
  %inp_mem53 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 0, !dbg !630
  %arrayidx54 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !631
  store i32* %arrayidx54, i32** %inp_mem53, align 8, !dbg !630
  %wgt_mem55 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 1, !dbg !630
  %arrayidx56 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !632
  store i32* %arrayidx56, i32** %wgt_mem55, align 8, !dbg !630
  %acc_mem57 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i32 0, i32 2, !dbg !630
  %arrayidx58 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !633
  store i32* %arrayidx58, i32** %acc_mem57, align 8, !dbg !630
  %arrayinit.element59 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element52, i64 1, !dbg !601
  %inp_mem60 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 0, !dbg !634
  %arrayidx61 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !635
  store i32* %arrayidx61, i32** %inp_mem60, align 8, !dbg !634
  %wgt_mem62 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 1, !dbg !634
  %arrayidx63 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !636
  store i32* %arrayidx63, i32** %wgt_mem62, align 8, !dbg !634
  %acc_mem64 = getelementptr inbounds %struct.GEMM_STRUCT_REF, %struct.GEMM_STRUCT_REF* %arrayinit.element59, i32 0, i32 2, !dbg !634
  %arrayidx65 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !637
  store i32* %arrayidx65, i32** %acc_mem64, align 8, !dbg !634
  call void @llvm.dbg.declare(metadata [9 x %struct.GEMM_STRUCT_VAL]* %gemm, metadata !638, metadata !DIExpression()), !dbg !640
  %arrayinit.begin66 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !641
  %inp_mem67 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 0, !dbg !642
  %arrayidx68 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !643
  %25 = load i32, i32* %arrayidx68, align 4, !dbg !643
  store i32 %25, i32* %inp_mem67, align 4, !dbg !642
  %wgt_mem69 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 1, !dbg !642
  %arrayidx70 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !644
  %26 = load i32, i32* %arrayidx70, align 4, !dbg !644
  store i32 %26, i32* %wgt_mem69, align 4, !dbg !642
  %acc_mem71 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i32 0, i32 2, !dbg !642
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 0, !dbg !645
  %27 = load i32, i32* %arrayidx72, align 4, !dbg !645
  store i32 %27, i32* %acc_mem71, align 4, !dbg !642
  %arrayinit.element73 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.begin66, i64 1, !dbg !641
  %inp_mem74 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 0, !dbg !646
  %arrayidx75 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !647
  %28 = load i32, i32* %arrayidx75, align 4, !dbg !647
  store i32 %28, i32* %inp_mem74, align 4, !dbg !646
  %wgt_mem76 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 1, !dbg !646
  %arrayidx77 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !648
  %29 = load i32, i32* %arrayidx77, align 4, !dbg !648
  store i32 %29, i32* %wgt_mem76, align 4, !dbg !646
  %acc_mem78 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i32 0, i32 2, !dbg !646
  %arrayidx79 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 1, !dbg !649
  %30 = load i32, i32* %arrayidx79, align 4, !dbg !649
  store i32 %30, i32* %acc_mem78, align 4, !dbg !646
  %arrayinit.element80 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element73, i64 1, !dbg !641
  %inp_mem81 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 0, !dbg !650
  %arrayidx82 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row0, i64 0, i64 0, !dbg !651
  %31 = load i32, i32* %arrayidx82, align 4, !dbg !651
  store i32 %31, i32* %inp_mem81, align 4, !dbg !650
  %wgt_mem83 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 1, !dbg !650
  %arrayidx84 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !652
  %32 = load i32, i32* %arrayidx84, align 4, !dbg !652
  store i32 %32, i32* %wgt_mem83, align 4, !dbg !650
  %acc_mem85 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i32 0, i32 2, !dbg !650
  %arrayidx86 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row0, i64 0, i64 2, !dbg !653
  %33 = load i32, i32* %arrayidx86, align 4, !dbg !653
  store i32 %33, i32* %acc_mem85, align 4, !dbg !650
  %arrayinit.element87 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element80, i64 1, !dbg !641
  %inp_mem88 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 0, !dbg !654
  %arrayidx89 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !655
  %34 = load i32, i32* %arrayidx89, align 4, !dbg !655
  store i32 %34, i32* %inp_mem88, align 4, !dbg !654
  %wgt_mem90 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 1, !dbg !654
  %arrayidx91 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !656
  %35 = load i32, i32* %arrayidx91, align 4, !dbg !656
  store i32 %35, i32* %wgt_mem90, align 4, !dbg !654
  %acc_mem92 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i32 0, i32 2, !dbg !654
  %arrayidx93 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 0, !dbg !657
  %36 = load i32, i32* %arrayidx93, align 4, !dbg !657
  store i32 %36, i32* %acc_mem92, align 4, !dbg !654
  %arrayinit.element94 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element87, i64 1, !dbg !641
  %inp_mem95 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 0, !dbg !658
  %arrayidx96 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !659
  %37 = load i32, i32* %arrayidx96, align 4, !dbg !659
  store i32 %37, i32* %inp_mem95, align 4, !dbg !658
  %wgt_mem97 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 1, !dbg !658
  %arrayidx98 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !660
  %38 = load i32, i32* %arrayidx98, align 4, !dbg !660
  store i32 %38, i32* %wgt_mem97, align 4, !dbg !658
  %acc_mem99 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i32 0, i32 2, !dbg !658
  %arrayidx100 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 1, !dbg !661
  %39 = load i32, i32* %arrayidx100, align 4, !dbg !661
  store i32 %39, i32* %acc_mem99, align 4, !dbg !658
  %arrayinit.element101 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element94, i64 1, !dbg !641
  %inp_mem102 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 0, !dbg !662
  %arrayidx103 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row1, i64 0, i64 0, !dbg !663
  %40 = load i32, i32* %arrayidx103, align 4, !dbg !663
  store i32 %40, i32* %inp_mem102, align 4, !dbg !662
  %wgt_mem104 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 1, !dbg !662
  %arrayidx105 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !664
  %41 = load i32, i32* %arrayidx105, align 4, !dbg !664
  store i32 %41, i32* %wgt_mem104, align 4, !dbg !662
  %acc_mem106 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i32 0, i32 2, !dbg !662
  %arrayidx107 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row1, i64 0, i64 2, !dbg !665
  %42 = load i32, i32* %arrayidx107, align 4, !dbg !665
  store i32 %42, i32* %acc_mem106, align 4, !dbg !662
  %arrayinit.element108 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element101, i64 1, !dbg !641
  %inp_mem109 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 0, !dbg !666
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !667
  %43 = load i32, i32* %arrayidx110, align 4, !dbg !667
  store i32 %43, i32* %inp_mem109, align 4, !dbg !666
  %wgt_mem111 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 1, !dbg !666
  %arrayidx112 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row0, i64 0, i64 0, !dbg !668
  %44 = load i32, i32* %arrayidx112, align 4, !dbg !668
  store i32 %44, i32* %wgt_mem111, align 4, !dbg !666
  %acc_mem113 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i32 0, i32 2, !dbg !666
  %arrayidx114 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 0, !dbg !669
  %45 = load i32, i32* %arrayidx114, align 4, !dbg !669
  store i32 %45, i32* %acc_mem113, align 4, !dbg !666
  %arrayinit.element115 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element108, i64 1, !dbg !641
  %inp_mem116 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 0, !dbg !670
  %arrayidx117 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !671
  %46 = load i32, i32* %arrayidx117, align 4, !dbg !671
  store i32 %46, i32* %inp_mem116, align 4, !dbg !670
  %wgt_mem118 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 1, !dbg !670
  %arrayidx119 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row1, i64 0, i64 0, !dbg !672
  %47 = load i32, i32* %arrayidx119, align 4, !dbg !672
  store i32 %47, i32* %wgt_mem118, align 4, !dbg !670
  %acc_mem120 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i32 0, i32 2, !dbg !670
  %arrayidx121 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 1, !dbg !673
  %48 = load i32, i32* %arrayidx121, align 4, !dbg !673
  store i32 %48, i32* %acc_mem120, align 4, !dbg !670
  %arrayinit.element122 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element115, i64 1, !dbg !641
  %inp_mem123 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 0, !dbg !674
  %arrayidx124 = getelementptr inbounds [3 x i32], [3 x i32]* %inp_mem_row2, i64 0, i64 0, !dbg !675
  %49 = load i32, i32* %arrayidx124, align 4, !dbg !675
  store i32 %49, i32* %inp_mem123, align 4, !dbg !674
  %wgt_mem125 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 1, !dbg !674
  %arrayidx126 = getelementptr inbounds [3 x i32], [3 x i32]* %wgt_mem_row2, i64 0, i64 0, !dbg !676
  %50 = load i32, i32* %arrayidx126, align 4, !dbg !676
  store i32 %50, i32* %wgt_mem125, align 4, !dbg !674
  %acc_mem127 = getelementptr inbounds %struct.GEMM_STRUCT_VAL, %struct.GEMM_STRUCT_VAL* %arrayinit.element122, i32 0, i32 2, !dbg !674
  %arrayidx128 = getelementptr inbounds [3 x i32], [3 x i32]* %acc_mem_row2, i64 0, i64 2, !dbg !677
  %51 = load i32, i32* %arrayidx128, align 4, !dbg !677
  store i32 %51, i32* %acc_mem127, align 4, !dbg !674
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR]* %microop, metadata !678, metadata !DIExpression()), !dbg !680
  %arrayinit.begin129 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 0, !dbg !681
  %ID130 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 0, !dbg !682
  store i32 0, i32* %ID130, align 8, !dbg !682
  %OPCODE131 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 1, !dbg !682
  store i32 2, i32* %OPCODE131, align 4, !dbg !682
  %OPTYPE132 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 2, !dbg !682
  store i32 0, i32* %OPTYPE132, align 8, !dbg !682
  %OPERANDS133 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i32 0, i32 3, !dbg !682
  %arrayidx134 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 0, !dbg !683
  %52 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS133 to i8*, !dbg !683
  %53 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx134 to i8*, !dbg !683
  %54 = call i8* @memcpy(i8* %52, i8* %53, i64 24), !dbg !683
  %arrayinit.element135 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.begin129, i64 1, !dbg !681
  %ID136 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 0, !dbg !684
  store i32 1, i32* %ID136, align 8, !dbg !684
  %OPCODE137 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 1, !dbg !684
  store i32 2, i32* %OPCODE137, align 4, !dbg !684
  %OPTYPE138 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 2, !dbg !684
  store i32 0, i32* %OPTYPE138, align 8, !dbg !684
  %OPERANDS139 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i32 0, i32 3, !dbg !684
  %arrayidx140 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 1, !dbg !685
  %55 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS139 to i8*, !dbg !685
  %56 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx140 to i8*, !dbg !685
  %57 = call i8* @memcpy(i8* %55, i8* %56, i64 24), !dbg !685
  %arrayinit.element141 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element135, i64 1, !dbg !681
  %ID142 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 0, !dbg !686
  store i32 2, i32* %ID142, align 8, !dbg !686
  %OPCODE143 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 1, !dbg !686
  store i32 2, i32* %OPCODE143, align 4, !dbg !686
  %OPTYPE144 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 2, !dbg !686
  store i32 0, i32* %OPTYPE144, align 8, !dbg !686
  %OPERANDS145 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i32 0, i32 3, !dbg !686
  %arrayidx146 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 2, !dbg !687
  %58 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS145 to i8*, !dbg !687
  %59 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx146 to i8*, !dbg !687
  %60 = call i8* @memcpy(i8* %58, i8* %59, i64 24), !dbg !687
  %arrayinit.element147 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element141, i64 1, !dbg !681
  %ID148 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 0, !dbg !688
  store i32 3, i32* %ID148, align 8, !dbg !688
  %OPCODE149 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 1, !dbg !688
  store i32 2, i32* %OPCODE149, align 4, !dbg !688
  %OPTYPE150 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 2, !dbg !688
  store i32 0, i32* %OPTYPE150, align 8, !dbg !688
  %OPERANDS151 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i32 0, i32 3, !dbg !688
  %arrayidx152 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 3, !dbg !689
  %61 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS151 to i8*, !dbg !689
  %62 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx152 to i8*, !dbg !689
  %63 = call i8* @memcpy(i8* %61, i8* %62, i64 24), !dbg !689
  %arrayinit.element153 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element147, i64 1, !dbg !681
  %ID154 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 0, !dbg !690
  store i32 4, i32* %ID154, align 8, !dbg !690
  %OPCODE155 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 1, !dbg !690
  store i32 2, i32* %OPCODE155, align 4, !dbg !690
  %OPTYPE156 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 2, !dbg !690
  store i32 0, i32* %OPTYPE156, align 8, !dbg !690
  %OPERANDS157 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i32 0, i32 3, !dbg !690
  %arrayidx158 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 4, !dbg !691
  %64 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS157 to i8*, !dbg !691
  %65 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx158 to i8*, !dbg !691
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 24), !dbg !691
  %arrayinit.element159 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element153, i64 1, !dbg !681
  %ID160 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 0, !dbg !692
  store i32 5, i32* %ID160, align 8, !dbg !692
  %OPCODE161 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 1, !dbg !692
  store i32 2, i32* %OPCODE161, align 4, !dbg !692
  %OPTYPE162 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 2, !dbg !692
  store i32 0, i32* %OPTYPE162, align 8, !dbg !692
  %OPERANDS163 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i32 0, i32 3, !dbg !692
  %arrayidx164 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 5, !dbg !693
  %67 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS163 to i8*, !dbg !693
  %68 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx164 to i8*, !dbg !693
  %69 = call i8* @memcpy(i8* %67, i8* %68, i64 24), !dbg !693
  %arrayinit.element165 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element159, i64 1, !dbg !681
  %ID166 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 0, !dbg !694
  store i32 6, i32* %ID166, align 8, !dbg !694
  %OPCODE167 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 1, !dbg !694
  store i32 2, i32* %OPCODE167, align 4, !dbg !694
  %OPTYPE168 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 2, !dbg !694
  store i32 0, i32* %OPTYPE168, align 8, !dbg !694
  %OPERANDS169 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i32 0, i32 3, !dbg !694
  %arrayidx170 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 6, !dbg !695
  %70 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS169 to i8*, !dbg !695
  %71 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx170 to i8*, !dbg !695
  %72 = call i8* @memcpy(i8* %70, i8* %71, i64 24), !dbg !695
  %arrayinit.element171 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element165, i64 1, !dbg !681
  %ID172 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 0, !dbg !696
  store i32 7, i32* %ID172, align 8, !dbg !696
  %OPCODE173 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 1, !dbg !696
  store i32 2, i32* %OPCODE173, align 4, !dbg !696
  %OPTYPE174 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 2, !dbg !696
  store i32 0, i32* %OPTYPE174, align 8, !dbg !696
  %OPERANDS175 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i32 0, i32 3, !dbg !696
  %arrayidx176 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 7, !dbg !697
  %73 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS175 to i8*, !dbg !697
  %74 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx176 to i8*, !dbg !697
  %75 = call i8* @memcpy(i8* %73, i8* %74, i64 24), !dbg !697
  %arrayinit.element177 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element171, i64 1, !dbg !681
  %ID178 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 0, !dbg !698
  store i32 8, i32* %ID178, align 8, !dbg !698
  %OPCODE179 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 1, !dbg !698
  store i32 2, i32* %OPCODE179, align 4, !dbg !698
  %OPTYPE180 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 2, !dbg !698
  store i32 0, i32* %OPTYPE180, align 8, !dbg !698
  %OPERANDS181 = getelementptr inbounds %struct.INSTR, %struct.INSTR* %arrayinit.element177, i32 0, i32 3, !dbg !698
  %arrayidx182 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_REF], [9 x %struct.GEMM_STRUCT_REF]* %gemm_uop, i64 0, i64 8, !dbg !699
  %76 = bitcast %struct.GEMM_STRUCT_REF* %OPERANDS181 to i8*, !dbg !699
  %77 = bitcast %struct.GEMM_STRUCT_REF* %arrayidx182 to i8*, !dbg !699
  %78 = call i8* @memcpy(i8* %76, i8* %77, i64 24), !dbg !699
  call void @llvm.dbg.declare(metadata [9 x %struct.INSTR_VAL]* %microop_val, metadata !700, metadata !DIExpression()), !dbg !702
  %arrayinit.begin183 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 0, !dbg !703
  %ID184 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 0, !dbg !704
  store i32 0, i32* %ID184, align 8, !dbg !704
  %OPCODE185 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 1, !dbg !704
  store i32 2, i32* %OPCODE185, align 4, !dbg !704
  %OPTYPE186 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 2, !dbg !704
  store i32 0, i32* %OPTYPE186, align 8, !dbg !704
  %OPERANDS187 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i32 0, i32 3, !dbg !704
  %arrayidx188 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 0, !dbg !705
  %79 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS187 to i8*, !dbg !705
  %80 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx188 to i8*, !dbg !705
  %81 = call i8* @memcpy(i8* %79, i8* %80, i64 12), !dbg !705
  %arrayinit.element189 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.begin183, i64 1, !dbg !703
  %ID190 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 0, !dbg !706
  store i32 1, i32* %ID190, align 8, !dbg !706
  %OPCODE191 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 1, !dbg !706
  store i32 2, i32* %OPCODE191, align 4, !dbg !706
  %OPTYPE192 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 2, !dbg !706
  store i32 0, i32* %OPTYPE192, align 8, !dbg !706
  %OPERANDS193 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i32 0, i32 3, !dbg !706
  %arrayidx194 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 1, !dbg !707
  %82 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS193 to i8*, !dbg !707
  %83 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx194 to i8*, !dbg !707
  %84 = call i8* @memcpy(i8* %82, i8* %83, i64 12), !dbg !707
  %arrayinit.element195 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element189, i64 1, !dbg !703
  %ID196 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 0, !dbg !708
  store i32 2, i32* %ID196, align 8, !dbg !708
  %OPCODE197 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 1, !dbg !708
  store i32 2, i32* %OPCODE197, align 4, !dbg !708
  %OPTYPE198 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 2, !dbg !708
  store i32 0, i32* %OPTYPE198, align 8, !dbg !708
  %OPERANDS199 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i32 0, i32 3, !dbg !708
  %arrayidx200 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 2, !dbg !709
  %85 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS199 to i8*, !dbg !709
  %86 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx200 to i8*, !dbg !709
  %87 = call i8* @memcpy(i8* %85, i8* %86, i64 12), !dbg !709
  %arrayinit.element201 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element195, i64 1, !dbg !703
  %ID202 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 0, !dbg !710
  store i32 3, i32* %ID202, align 8, !dbg !710
  %OPCODE203 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 1, !dbg !710
  store i32 2, i32* %OPCODE203, align 4, !dbg !710
  %OPTYPE204 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 2, !dbg !710
  store i32 0, i32* %OPTYPE204, align 8, !dbg !710
  %OPERANDS205 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i32 0, i32 3, !dbg !710
  %arrayidx206 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 3, !dbg !711
  %88 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS205 to i8*, !dbg !711
  %89 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx206 to i8*, !dbg !711
  %90 = call i8* @memcpy(i8* %88, i8* %89, i64 12), !dbg !711
  %arrayinit.element207 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element201, i64 1, !dbg !703
  %ID208 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 0, !dbg !712
  store i32 4, i32* %ID208, align 8, !dbg !712
  %OPCODE209 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 1, !dbg !712
  store i32 2, i32* %OPCODE209, align 4, !dbg !712
  %OPTYPE210 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 2, !dbg !712
  store i32 0, i32* %OPTYPE210, align 8, !dbg !712
  %OPERANDS211 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i32 0, i32 3, !dbg !712
  %arrayidx212 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 4, !dbg !713
  %91 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS211 to i8*, !dbg !713
  %92 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx212 to i8*, !dbg !713
  %93 = call i8* @memcpy(i8* %91, i8* %92, i64 12), !dbg !713
  %arrayinit.element213 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element207, i64 1, !dbg !703
  %ID214 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 0, !dbg !714
  store i32 5, i32* %ID214, align 8, !dbg !714
  %OPCODE215 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 1, !dbg !714
  store i32 2, i32* %OPCODE215, align 4, !dbg !714
  %OPTYPE216 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 2, !dbg !714
  store i32 0, i32* %OPTYPE216, align 8, !dbg !714
  %OPERANDS217 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i32 0, i32 3, !dbg !714
  %arrayidx218 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 5, !dbg !715
  %94 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS217 to i8*, !dbg !715
  %95 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx218 to i8*, !dbg !715
  %96 = call i8* @memcpy(i8* %94, i8* %95, i64 12), !dbg !715
  %arrayinit.element219 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element213, i64 1, !dbg !703
  %ID220 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 0, !dbg !716
  store i32 6, i32* %ID220, align 8, !dbg !716
  %OPCODE221 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 1, !dbg !716
  store i32 2, i32* %OPCODE221, align 4, !dbg !716
  %OPTYPE222 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 2, !dbg !716
  store i32 0, i32* %OPTYPE222, align 8, !dbg !716
  %OPERANDS223 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i32 0, i32 3, !dbg !716
  %arrayidx224 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 6, !dbg !717
  %97 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS223 to i8*, !dbg !717
  %98 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx224 to i8*, !dbg !717
  %99 = call i8* @memcpy(i8* %97, i8* %98, i64 12), !dbg !717
  %arrayinit.element225 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element219, i64 1, !dbg !703
  %ID226 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 0, !dbg !718
  store i32 7, i32* %ID226, align 8, !dbg !718
  %OPCODE227 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 1, !dbg !718
  store i32 2, i32* %OPCODE227, align 4, !dbg !718
  %OPTYPE228 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 2, !dbg !718
  store i32 0, i32* %OPTYPE228, align 8, !dbg !718
  %OPERANDS229 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i32 0, i32 3, !dbg !718
  %arrayidx230 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 7, !dbg !719
  %100 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS229 to i8*, !dbg !719
  %101 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx230 to i8*, !dbg !719
  %102 = call i8* @memcpy(i8* %100, i8* %101, i64 12), !dbg !719
  %arrayinit.element231 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element225, i64 1, !dbg !703
  %ID232 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 0, !dbg !720
  store i32 8, i32* %ID232, align 8, !dbg !720
  %OPCODE233 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 1, !dbg !720
  store i32 2, i32* %OPCODE233, align 4, !dbg !720
  %OPTYPE234 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 2, !dbg !720
  store i32 0, i32* %OPTYPE234, align 8, !dbg !720
  %OPERANDS235 = getelementptr inbounds %struct.INSTR_VAL, %struct.INSTR_VAL* %arrayinit.element231, i32 0, i32 3, !dbg !720
  %arrayidx236 = getelementptr inbounds [9 x %struct.GEMM_STRUCT_VAL], [9 x %struct.GEMM_STRUCT_VAL]* %gemm, i64 0, i64 8, !dbg !721
  %103 = bitcast %struct.GEMM_STRUCT_VAL* %OPERANDS235 to i8*, !dbg !721
  %104 = bitcast %struct.GEMM_STRUCT_VAL* %arrayidx236 to i8*, !dbg !721
  %105 = call i8* @memcpy(i8* %103, i8* %104, i64 12), !dbg !721
  %106 = load i32, i32* %opcode, align 4, !dbg !722
  %cmp = icmp eq i32 %106, 2, !dbg !724
  %107 = load i32, i32* %op_type, align 4, !dbg !725
  %cmp237 = icmp uge i32 %107, 0, !dbg !726
  %or.cond = and i1 %cmp, %cmp237, !dbg !727
  %108 = load i32, i32* %op_type, align 4, !dbg !728
  %cmp239 = icmp ule i32 %108, 3, !dbg !729
  %or.cond1 = and i1 %or.cond, %cmp239, !dbg !727
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !727

if.then:                                          ; preds = %entry
  %109 = bitcast %struct.INSTR* %agg.tmp to i8*, !dbg !730
  %110 = bitcast %struct.INSTR* %instruction to i8*, !dbg !730
  %111 = call i8* @memcpy(i8* %109, i8* %110, i64 40), !dbg !730
  %call = call i32* @_Z9base_gemm5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp), !dbg !732
  store i32* %call, i32** %acc_mem_gemm, align 8, !dbg !733
  call void @llvm.dbg.declare(metadata i32* %i, metadata !734, metadata !DIExpression()), !dbg !736
  store i32 0, i32* %i, align 4, !dbg !736
  br label %for.cond, !dbg !737

for.cond:                                         ; preds = %for.body, %if.then
  %112 = load i32, i32* %i, align 4, !dbg !738
  %cmp240 = icmp slt i32 %112, 9, !dbg !740
  br i1 %cmp240, label %for.body, label %for.end, !dbg !741

for.body:                                         ; preds = %for.cond
  %113 = load i32*, i32** %acc_mem_gemm, align 8, !dbg !742
  %114 = load i32, i32* %i, align 4, !dbg !744
  %idxprom = sext i32 %114 to i64, !dbg !742
  %arrayidx241 = getelementptr inbounds i32, i32* %113, i64 %idxprom, !dbg !742
  %115 = load i32, i32* %arrayidx241, align 4, !dbg !742
  %116 = load i32, i32* %i, align 4, !dbg !745
  %idxprom242 = sext i32 %116 to i64, !dbg !746
  %arrayidx243 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom242, !dbg !746
  store i32 %115, i32* %arrayidx243, align 4, !dbg !747
  %117 = load i32, i32* %i, align 4, !dbg !748
  %inc = add nsw i32 %117, 1, !dbg !748
  store i32 %inc, i32* %i, align 4, !dbg !748
  br label %for.cond, !dbg !749, !llvm.loop !750

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i244, metadata !752, metadata !DIExpression()), !dbg !754
  store i32 0, i32* %i244, align 4, !dbg !754
  br label %for.cond245, !dbg !755

for.cond245:                                      ; preds = %for.body247, %for.end
  %118 = load i32, i32* %i244, align 4, !dbg !756
  %cmp246 = icmp slt i32 %118, 9, !dbg !758
  br i1 %cmp246, label %for.body247, label %for.end258, !dbg !759

for.body247:                                      ; preds = %for.cond245
  %119 = load i32, i32* %i244, align 4, !dbg !760
  %idxprom249 = sext i32 %119 to i64, !dbg !762
  %arrayidx250 = getelementptr inbounds [9 x %struct.INSTR], [9 x %struct.INSTR]* %microop, i64 0, i64 %idxprom249, !dbg !762
  %120 = bitcast %struct.INSTR* %agg.tmp248 to i8*, !dbg !762
  %121 = bitcast %struct.INSTR* %arrayidx250 to i8*, !dbg !762
  %122 = call i8* @memcpy(i8* %120, i8* %121, i64 40), !dbg !762
  %call251 = call i32* @_Z13micro_decoder5INSTR(%struct.INSTR* byval(%struct.INSTR) align 8 %agg.tmp248), !dbg !763
  store i32* %call251, i32** %acc_mem_ref, align 8, !dbg !764
  %123 = load i32*, i32** %acc_mem_ref, align 8, !dbg !765
  %124 = load i32, i32* %i244, align 4, !dbg !766
  %idxprom252 = sext i32 %124 to i64, !dbg !765
  %arrayidx253 = getelementptr inbounds i32, i32* %123, i64 %idxprom252, !dbg !765
  %125 = load i32, i32* %arrayidx253, align 4, !dbg !765
  %126 = load i32, i32* %i244, align 4, !dbg !767
  %idxprom254 = sext i32 %126 to i64, !dbg !768
  %arrayidx255 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom254, !dbg !768
  store i32 %125, i32* %arrayidx255, align 4, !dbg !769
  %127 = load i32, i32* %i244, align 4, !dbg !770
  %inc257 = add nsw i32 %127, 1, !dbg !770
  store i32 %inc257, i32* %i244, align 4, !dbg !770
  br label %for.cond245, !dbg !771, !llvm.loop !772

for.end258:                                       ; preds = %for.cond245
  call void @llvm.dbg.declare(metadata i32* %i259, metadata !774, metadata !DIExpression()), !dbg !776
  store i32 0, i32* %i259, align 4, !dbg !776
  br label %for.cond260, !dbg !777

for.cond260:                                      ; preds = %for.body262, %for.end258
  %128 = load i32, i32* %i259, align 4, !dbg !778
  %cmp261 = icmp slt i32 %128, 9, !dbg !780
  br i1 %cmp261, label %for.body262, label %for.end273, !dbg !781

for.body262:                                      ; preds = %for.cond260
  %129 = load i32, i32* %i259, align 4, !dbg !782
  %idxprom264 = sext i32 %129 to i64, !dbg !784
  %arrayidx265 = getelementptr inbounds [9 x %struct.INSTR_VAL], [9 x %struct.INSTR_VAL]* %microop_val, i64 0, i64 %idxprom264, !dbg !784
  %130 = bitcast %struct.INSTR_VAL* %agg.tmp263 to i8*, !dbg !784
  %131 = bitcast %struct.INSTR_VAL* %arrayidx265 to i8*, !dbg !784
  %132 = call i8* @memcpy(i8* %130, i8* %131, i64 24), !dbg !784
  %call266 = call i32* @_Z17micro_decoder_val9INSTR_VAL(%struct.INSTR_VAL* byval(%struct.INSTR_VAL) align 8 %agg.tmp263), !dbg !785
  store i32* %call266, i32** %acc_mem_val, align 8, !dbg !786
  %133 = load i32*, i32** %acc_mem_val, align 8, !dbg !787
  %134 = load i32, i32* %i259, align 4, !dbg !788
  %idxprom267 = sext i32 %134 to i64, !dbg !787
  %arrayidx268 = getelementptr inbounds i32, i32* %133, i64 %idxprom267, !dbg !787
  %135 = load i32, i32* %arrayidx268, align 4, !dbg !787
  %136 = load i32, i32* %i259, align 4, !dbg !789
  %idxprom269 = sext i32 %136 to i64, !dbg !790
  %arrayidx270 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom269, !dbg !790
  store i32 %135, i32* %arrayidx270, align 4, !dbg !791
  %137 = load i32, i32* %i259, align 4, !dbg !792
  %inc272 = add nsw i32 %137, 1, !dbg !792
  store i32 %inc272, i32* %i259, align 4, !dbg !792
  br label %for.cond260, !dbg !793, !llvm.loop !794

for.end273:                                       ; preds = %for.cond260
  %arraydecay274 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 0, !dbg !796
  %call275 = call i32* @_Z12core_wrapperPj(i32* %arraydecay274), !dbg !797
  store i32* %call275, i32** %out_mem_core, align 8, !dbg !798
  call void @llvm.dbg.declare(metadata i32* %i276, metadata !799, metadata !DIExpression()), !dbg !801
  store i32 0, i32* %i276, align 4, !dbg !801
  br label %for.cond277, !dbg !802

for.cond277:                                      ; preds = %for.body279, %for.end273
  %138 = load i32, i32* %i276, align 4, !dbg !803
  %cmp278 = icmp slt i32 %138, 9, !dbg !805
  br i1 %cmp278, label %for.body279, label %for.end286, !dbg !806

for.body279:                                      ; preds = %for.cond277
  %139 = load i32*, i32** %out_mem_core, align 8, !dbg !807
  %140 = load i32, i32* %i276, align 4, !dbg !809
  %idxprom280 = sext i32 %140 to i64, !dbg !807
  %arrayidx281 = getelementptr inbounds i32, i32* %139, i64 %idxprom280, !dbg !807
  %141 = load i32, i32* %arrayidx281, align 4, !dbg !807
  %142 = load i32, i32* %i276, align 4, !dbg !810
  %idxprom282 = sext i32 %142 to i64, !dbg !811
  %arrayidx283 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage4, i64 0, i64 %idxprom282, !dbg !811
  store i32 %141, i32* %arrayidx283, align 4, !dbg !812
  %143 = load i32, i32* %i276, align 4, !dbg !813
  %inc285 = add nsw i32 %143, 1, !dbg !813
  store i32 %inc285, i32* %i276, align 4, !dbg !813
  br label %for.cond277, !dbg !814, !llvm.loop !815

for.end286:                                       ; preds = %for.cond277
  call void @llvm.dbg.declare(metadata i32* %i287, metadata !817, metadata !DIExpression()), !dbg !819
  store i32 0, i32* %i287, align 4, !dbg !819
  br label %for.cond288, !dbg !820

for.cond288:                                      ; preds = %for.inc312, %for.end286
  %144 = load i32, i32* %i287, align 4, !dbg !821
  %cmp289 = icmp slt i32 %144, 9, !dbg !823
  br i1 %cmp289, label %for.body290, label %if.end, !dbg !824

for.body290:                                      ; preds = %for.cond288
  %145 = load i32, i32* %i287, align 4, !dbg !825
  %idxprom291 = sext i32 %145 to i64, !dbg !825
  %arrayidx292 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom291, !dbg !825
  %146 = load i32, i32* %arrayidx292, align 4, !dbg !825
  %147 = load i32, i32* %i287, align 4, !dbg !825
  %idxprom293 = sext i32 %147 to i64, !dbg !825
  %arrayidx294 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom293, !dbg !825
  %148 = load i32, i32* %arrayidx294, align 4, !dbg !825
  %cmp295 = icmp eq i32 %146, %148, !dbg !825
  br i1 %cmp295, label %cond.end, label %cond.false, !dbg !825

cond.false:                                       ; preds = %for.body290
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 190, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !825
  unreachable, !dbg !825

cond.end:                                         ; preds = %for.body290
  %149 = load i32, i32* %i287, align 4, !dbg !827
  %idxprom296 = sext i32 %149 to i64, !dbg !827
  %arrayidx297 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage1, i64 0, i64 %idxprom296, !dbg !827
  %150 = load i32, i32* %arrayidx297, align 4, !dbg !827
  %151 = load i32, i32* %i287, align 4, !dbg !827
  %idxprom298 = sext i32 %151 to i64, !dbg !827
  %arrayidx299 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage2, i64 0, i64 %idxprom298, !dbg !827
  %152 = load i32, i32* %arrayidx299, align 4, !dbg !827
  %cmp300 = icmp eq i32 %150, %152, !dbg !827
  br i1 %cmp300, label %cond.end303, label %cond.false302, !dbg !827

cond.false302:                                    ; preds = %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 191, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !827
  unreachable, !dbg !827

cond.end303:                                      ; preds = %cond.end
  %153 = load i32, i32* %i287, align 4, !dbg !828
  %idxprom304 = sext i32 %153 to i64, !dbg !828
  %arrayidx305 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage4, i64 0, i64 %idxprom304, !dbg !828
  %154 = load i32, i32* %arrayidx305, align 4, !dbg !828
  %155 = load i32, i32* %i287, align 4, !dbg !828
  %idxprom306 = sext i32 %155 to i64, !dbg !828
  %arrayidx307 = getelementptr inbounds [9 x i32], [9 x i32]* %acc_stage3, i64 0, i64 %idxprom306, !dbg !828
  %156 = load i32, i32* %arrayidx307, align 4, !dbg !828
  %cmp308 = icmp eq i32 %154, %156, !dbg !828
  br i1 %cmp308, label %for.inc312, label %cond.false310, !dbg !828

cond.false310:                                    ; preds = %cond.end303
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 192, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !828
  unreachable, !dbg !828

for.inc312:                                       ; preds = %cond.end303
  %157 = load i32, i32* %i287, align 4, !dbg !829
  %inc313 = add nsw i32 %157, 1, !dbg !829
  store i32 %inc313, i32* %i287, align 4, !dbg !829
  br label %for.cond288, !dbg !830, !llvm.loop !831

if.end:                                           ; preds = %for.cond288, %entry
  ret i32 0, !dbg !833
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8*, i8*, i64) #0 !dbg !834 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !840, metadata !DIExpression()), !dbg !841
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !842, metadata !DIExpression()), !dbg !843
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !844, metadata !DIExpression()), !dbg !845
  call void @llvm.dbg.declare(metadata i8** %7, metadata !846, metadata !DIExpression()), !dbg !847
  %9 = load i8*, i8** %4, align 8, !dbg !848
  store i8* %9, i8** %7, align 8, !dbg !847
  call void @llvm.dbg.declare(metadata i8** %8, metadata !849, metadata !DIExpression()), !dbg !850
  %10 = load i8*, i8** %5, align 8, !dbg !851
  store i8* %10, i8** %8, align 8, !dbg !850
  br label %11, !dbg !852

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !853
  %13 = add i64 %12, -1, !dbg !853
  store i64 %13, i64* %6, align 8, !dbg !853
  %14 = icmp ugt i64 %12, 0, !dbg !854
  br i1 %14, label %15, label %21, !dbg !852

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !855
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !855
  store i8* %17, i8** %8, align 8, !dbg !855
  %18 = load i8, i8* %16, align 1, !dbg !856
  %19 = load i8*, i8** %7, align 8, !dbg !857
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !857
  store i8* %20, i8** %7, align 8, !dbg !857
  store i8 %18, i8* %19, align 1, !dbg !858
  br label %11, !dbg !852, !llvm.loop !859

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !860
  ret i8* %22, !dbg !861
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !132}
!llvm.module.flags = !{!134, !135, !136}
!llvm.ident = !{!137, !138}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "res_index", scope: !2, file: !3, line: 10, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !39, nameTableKind: None)
!3 = !DIFile(filename: "gemm_klee.cpp", directory: "/home/klee/klee_src/examples/isra")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!0, !8, !11, !17, !19, !24, !27, !29, !31, !33, !35, !37}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "res_index_val", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 12, type: !13, isLocal: false, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 288, elements: !15)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!16}
!16 = !DISubrange(count: 9)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "result_val", scope: !2, file: !3, line: 13, type: !13, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "product", scope: !2, file: !3, line: 14, type: !21, isLocal: false, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 288, elements: !22)
!22 = !{!23, !23}
!23 = !DISubrange(count: 3)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "inp_mem", scope: !2, file: !3, line: 16, type: !26, isLocal: false, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 288, elements: !22)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "wgt_mem", scope: !2, file: !3, line: 17, type: !26, isLocal: false, isDefinition: true)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "acc_mem", scope: !2, file: !3, line: 18, type: !26, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "wgt_mem_prime", scope: !2, file: !3, line: 19, type: !26, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "out_mem", scope: !2, file: !3, line: 19, type: !13, isLocal: false, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "acc_mem_flat", scope: !2, file: !3, line: 20, type: !13, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "acc_mem_base_flat", scope: !2, file: !3, line: 20, type: !13, isLocal: false, isDefinition: true)
!39 = !{!40, !53, !57, !63, !67, !71, !81, !85, !87, !89, !93, !97, !101, !105, !109, !111, !113, !115, !119, !123, !127, !129, !131}
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !42, file: !52, line: 75)
!41 = !DINamespace(name: "std", scope: null)
!42 = !DISubprogram(name: "memchr", scope: !43, file: !43, line: 90, type: !44, flags: DIFlagPrototyped, spFlags: 0)
!43 = !DIFile(filename: "/usr/include/string.h", directory: "")
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !47, !10, !49}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "/tmp/llvm-90-install_O_D_A/lib/clang/9.0.1/include/stddef.h", directory: "")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstring", directory: "")
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !54, file: !52, line: 76)
!54 = !DISubprogram(name: "memcmp", scope: !43, file: !43, line: 63, type: !55, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DISubroutineType(types: !56)
!56 = !{!10, !47, !47, !49}
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !58, file: !52, line: 77)
!58 = !DISubprogram(name: "memcpy", scope: !43, file: !43, line: 42, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!46, !61, !62, !49}
!61 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !46)
!62 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !47)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !64, file: !52, line: 78)
!64 = !DISubprogram(name: "memmove", scope: !43, file: !43, line: 46, type: !65, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DISubroutineType(types: !66)
!66 = !{!46, !46, !47, !49}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !68, file: !52, line: 79)
!68 = !DISubprogram(name: "memset", scope: !43, file: !43, line: 60, type: !69, flags: DIFlagPrototyped, spFlags: 0)
!69 = !DISubroutineType(types: !70)
!70 = !{!46, !46, !10, !49}
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !72, file: !52, line: 80)
!72 = !DISubprogram(name: "strcat", scope: !43, file: !43, line: 129, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !77, !78}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !75)
!78 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !82, file: !52, line: 81)
!82 = !DISubprogram(name: "strcmp", scope: !43, file: !43, line: 136, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DISubroutineType(types: !84)
!84 = !{!10, !79, !79}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !86, file: !52, line: 82)
!86 = !DISubprogram(name: "strcoll", scope: !43, file: !43, line: 143, type: !83, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !88, file: !52, line: 83)
!88 = !DISubprogram(name: "strcpy", scope: !43, file: !43, line: 121, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !90, file: !52, line: 84)
!90 = !DISubprogram(name: "strcspn", scope: !43, file: !43, line: 272, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!91 = !DISubroutineType(types: !92)
!92 = !{!49, !79, !79}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !94, file: !52, line: 85)
!94 = !DISubprogram(name: "strerror", scope: !43, file: !43, line: 396, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!75, !10}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !98, file: !52, line: 86)
!98 = !DISubprogram(name: "strlen", scope: !43, file: !43, line: 384, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DISubroutineType(types: !100)
!100 = !{!49, !79}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !102, file: !52, line: 87)
!102 = !DISubprogram(name: "strncat", scope: !43, file: !43, line: 132, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DISubroutineType(types: !104)
!104 = !{!75, !77, !78, !49}
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !106, file: !52, line: 88)
!106 = !DISubprogram(name: "strncmp", scope: !43, file: !43, line: 139, type: !107, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DISubroutineType(types: !108)
!108 = !{!10, !79, !79, !49}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !110, file: !52, line: 89)
!110 = !DISubprogram(name: "strncpy", scope: !43, file: !43, line: 124, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !112, file: !52, line: 90)
!112 = !DISubprogram(name: "strspn", scope: !43, file: !43, line: 276, type: !91, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !114, file: !52, line: 91)
!114 = !DISubprogram(name: "strtok", scope: !43, file: !43, line: 335, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !116, file: !52, line: 92)
!116 = !DISubprogram(name: "strxfrm", scope: !43, file: !43, line: 146, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DISubroutineType(types: !118)
!118 = !{!49, !77, !78, !49}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !120, file: !52, line: 93)
!120 = !DISubprogram(name: "strchr", scope: !43, file: !43, line: 225, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DISubroutineType(types: !122)
!122 = !{!75, !79, !10}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !124, file: !52, line: 94)
!124 = !DISubprogram(name: "strpbrk", scope: !43, file: !43, line: 302, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!75, !79, !79}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !128, file: !52, line: 95)
!128 = !DISubprogram(name: "strrchr", scope: !43, file: !43, line: 252, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !130, file: !52, line: 96)
!130 = !DISubprogram(name: "strstr", scope: !43, file: !43, line: 329, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!131 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !41, file: !3, line: 7)
!132 = distinct !DICompileUnit(language: DW_LANG_C99, file: !133, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, nameTableKind: None)
!133 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build90stp_z3/runtime/Freestanding")
!134 = !{i32 2, !"Dwarf Version", i32 4}
!135 = !{i32 2, !"Debug Info Version", i32 3}
!136 = !{i32 1, !"wchar_size", i32 4}
!137 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!138 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!139 = distinct !DISubprogram(name: "transpose", linkageName: "_Z9transposePA3_jS0_", scope: !3, file: !3, line: 24, type: !140, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !142, !142}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 96, elements: !144)
!144 = !{!23}
!145 = !DILocalVariable(name: "wgt_mem", arg: 1, scope: !139, file: !3, line: 24, type: !142)
!146 = !DILocation(line: 24, column: 29, scope: !139)
!147 = !DILocalVariable(name: "wgt_mem_prime", arg: 2, scope: !139, file: !3, line: 24, type: !142)
!148 = !DILocation(line: 24, column: 58, scope: !139)
!149 = !DILocalVariable(name: "i", scope: !139, file: !3, line: 26, type: !10)
!150 = !DILocation(line: 26, column: 9, scope: !139)
!151 = !DILocalVariable(name: "j", scope: !139, file: !3, line: 26, type: !10)
!152 = !DILocation(line: 26, column: 12, scope: !139)
!153 = !DILocation(line: 27, column: 12, scope: !154)
!154 = distinct !DILexicalBlock(scope: !139, file: !3, line: 27, column: 5)
!155 = !DILocation(line: 27, column: 10, scope: !154)
!156 = !DILocation(line: 27, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 27, column: 5)
!158 = !DILocation(line: 27, column: 19, scope: !157)
!159 = !DILocation(line: 27, column: 5, scope: !154)
!160 = !DILocation(line: 28, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 28, column: 9)
!162 = !DILocation(line: 28, column: 14, scope: !161)
!163 = !DILocation(line: 28, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !3, line: 28, column: 9)
!165 = !DILocation(line: 28, column: 23, scope: !164)
!166 = !DILocation(line: 28, column: 9, scope: !161)
!167 = !DILocation(line: 29, column: 35, scope: !164)
!168 = !DILocation(line: 29, column: 43, scope: !164)
!169 = !DILocation(line: 29, column: 46, scope: !164)
!170 = !DILocation(line: 29, column: 13, scope: !164)
!171 = !DILocation(line: 29, column: 27, scope: !164)
!172 = !DILocation(line: 29, column: 30, scope: !164)
!173 = !DILocation(line: 29, column: 33, scope: !164)
!174 = !DILocation(line: 28, column: 31, scope: !164)
!175 = !DILocation(line: 28, column: 9, scope: !164)
!176 = distinct !{!176, !166, !177}
!177 = !DILocation(line: 29, column: 47, scope: !161)
!178 = !DILocation(line: 27, column: 27, scope: !157)
!179 = !DILocation(line: 27, column: 5, scope: !157)
!180 = distinct !{!180, !159, !181}
!181 = !DILocation(line: 29, column: 47, scope: !154)
!182 = !DILocation(line: 30, column: 1, scope: !139)
!183 = distinct !DISubprogram(name: "matrixMultiply", linkageName: "_Z14matrixMultiplyPjS_", scope: !3, file: !3, line: 32, type: !184, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!184 = !DISubroutineType(types: !185)
!185 = !{!186, !186, !186}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!187 = !DILocalVariable(name: "mat1", arg: 1, scope: !183, file: !3, line: 32, type: !186)
!188 = !DILocation(line: 32, column: 43, scope: !183)
!189 = !DILocalVariable(name: "mat2", arg: 2, scope: !183, file: !3, line: 32, type: !186)
!190 = !DILocation(line: 32, column: 64, scope: !183)
!191 = !DILocalVariable(name: "res", scope: !183, file: !3, line: 34, type: !14)
!192 = !DILocation(line: 34, column: 18, scope: !183)
!193 = !DILocalVariable(name: "i", scope: !194, file: !3, line: 35, type: !10)
!194 = distinct !DILexicalBlock(scope: !183, file: !3, line: 35, column: 5)
!195 = !DILocation(line: 35, column: 13, scope: !194)
!196 = !DILocation(line: 35, column: 9, scope: !194)
!197 = !DILocation(line: 35, column: 20, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !3, line: 35, column: 5)
!199 = !DILocation(line: 35, column: 22, scope: !198)
!200 = !DILocation(line: 35, column: 5, scope: !194)
!201 = !DILocation(line: 37, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !3, line: 36, column: 5)
!203 = !DILocation(line: 37, column: 21, scope: !202)
!204 = !DILocation(line: 37, column: 26, scope: !202)
!205 = !DILocation(line: 37, column: 31, scope: !202)
!206 = !DILocation(line: 37, column: 24, scope: !202)
!207 = !DILocation(line: 37, column: 13, scope: !202)
!208 = !DILocation(line: 35, column: 28, scope: !198)
!209 = !DILocation(line: 35, column: 5, scope: !198)
!210 = distinct !{!210, !200, !211}
!211 = !DILocation(line: 38, column: 5, scope: !194)
!212 = !DILocation(line: 39, column: 25, scope: !183)
!213 = !DILocation(line: 39, column: 12, scope: !183)
!214 = !DILocation(line: 39, column: 5, scope: !183)
!215 = !DILocation(line: 39, column: 23, scope: !183)
!216 = !DILocation(line: 40, column: 14, scope: !183)
!217 = !DILocation(line: 41, column: 5, scope: !183)
!218 = distinct !DISubprogram(name: "matrixMultiplyVal", linkageName: "_Z17matrixMultiplyValPjS_", scope: !3, file: !3, line: 44, type: !184, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!219 = !DILocalVariable(name: "mat1", arg: 1, scope: !218, file: !3, line: 44, type: !186)
!220 = !DILocation(line: 44, column: 46, scope: !218)
!221 = !DILocalVariable(name: "mat2", arg: 2, scope: !218, file: !3, line: 44, type: !186)
!222 = !DILocation(line: 44, column: 67, scope: !218)
!223 = !DILocalVariable(name: "res", scope: !218, file: !3, line: 46, type: !14)
!224 = !DILocation(line: 46, column: 18, scope: !218)
!225 = !DILocalVariable(name: "i", scope: !226, file: !3, line: 47, type: !10)
!226 = distinct !DILexicalBlock(scope: !218, file: !3, line: 47, column: 5)
!227 = !DILocation(line: 47, column: 13, scope: !226)
!228 = !DILocation(line: 47, column: 9, scope: !226)
!229 = !DILocation(line: 47, column: 20, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !3, line: 47, column: 5)
!231 = !DILocation(line: 47, column: 22, scope: !230)
!232 = !DILocation(line: 47, column: 5, scope: !226)
!233 = !DILocation(line: 49, column: 16, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !3, line: 48, column: 5)
!235 = !DILocation(line: 49, column: 21, scope: !234)
!236 = !DILocation(line: 49, column: 26, scope: !234)
!237 = !DILocation(line: 49, column: 31, scope: !234)
!238 = !DILocation(line: 49, column: 24, scope: !234)
!239 = !DILocation(line: 49, column: 13, scope: !234)
!240 = !DILocation(line: 47, column: 28, scope: !230)
!241 = !DILocation(line: 47, column: 5, scope: !230)
!242 = distinct !{!242, !232, !243}
!243 = !DILocation(line: 50, column: 5, scope: !226)
!244 = !DILocation(line: 51, column: 33, scope: !218)
!245 = !DILocation(line: 51, column: 16, scope: !218)
!246 = !DILocation(line: 51, column: 5, scope: !218)
!247 = !DILocation(line: 51, column: 31, scope: !218)
!248 = !DILocation(line: 52, column: 18, scope: !218)
!249 = !DILocation(line: 53, column: 5, scope: !218)
!250 = distinct !DISubprogram(name: "micro_decoder", linkageName: "_Z13micro_decoder5INSTR", scope: !3, file: !3, line: 56, type: !251, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!251 = !DISubroutineType(types: !252)
!252 = !{!186, !253}
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR", file: !254, line: 23, size: 320, flags: DIFlagTypePassByValue, elements: !255, identifier: "_ZTS5INSTR")
!254 = !DIFile(filename: "./gemm_var.h", directory: "/home/klee/klee_src/examples/isra")
!255 = !{!256, !257, !258, !259}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !253, file: !254, line: 24, baseType: !14, size: 32)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !253, file: !254, line: 25, baseType: !14, size: 32, offset: 32)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !253, file: !254, line: 26, baseType: !14, size: 32, offset: 64)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !253, file: !254, line: 27, baseType: !260, size: 192, offset: 128)
!260 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_REF", file: !254, line: 5, size: 192, flags: DIFlagTypePassByValue, elements: !261, identifier: "_ZTS15GEMM_STRUCT_REF")
!261 = !{!262, !263, !264}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !260, file: !254, line: 6, baseType: !186, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !260, file: !254, line: 7, baseType: !186, size: 64, offset: 64)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !260, file: !254, line: 8, baseType: !186, size: 64, offset: 128)
!265 = !DILocalVariable(name: "instr", arg: 1, scope: !250, file: !3, line: 56, type: !253)
!266 = !DILocation(line: 56, column: 35, scope: !250)
!267 = !DILocalVariable(name: "arr_ref", scope: !250, file: !3, line: 58, type: !186)
!268 = !DILocation(line: 58, column: 20, scope: !250)
!269 = !DILocalVariable(name: "inp", scope: !250, file: !3, line: 59, type: !143)
!270 = !DILocation(line: 59, column: 18, scope: !250)
!271 = !DILocalVariable(name: "wgt", scope: !250, file: !3, line: 59, type: !143)
!272 = !DILocation(line: 59, column: 26, scope: !250)
!273 = !DILocation(line: 60, column: 14, scope: !274)
!274 = distinct !DILexicalBlock(scope: !250, file: !3, line: 60, column: 8)
!275 = !DILocation(line: 60, column: 20, scope: !274)
!276 = !DILocation(line: 60, column: 8, scope: !250)
!277 = !DILocalVariable(name: "i", scope: !278, file: !3, line: 61, type: !10)
!278 = distinct !DILexicalBlock(scope: !279, file: !3, line: 61, column: 9)
!279 = distinct !DILexicalBlock(scope: !274, file: !3, line: 60, column: 25)
!280 = !DILocation(line: 61, column: 18, scope: !278)
!281 = !DILocation(line: 61, column: 14, scope: !278)
!282 = !DILocation(line: 61, column: 25, scope: !283)
!283 = distinct !DILexicalBlock(scope: !278, file: !3, line: 61, column: 9)
!284 = !DILocation(line: 61, column: 27, scope: !283)
!285 = !DILocation(line: 61, column: 9, scope: !278)
!286 = !DILocation(line: 62, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !3, line: 61, column: 37)
!288 = !DILocation(line: 62, column: 39, scope: !287)
!289 = !DILocation(line: 62, column: 49, scope: !287)
!290 = !DILocation(line: 62, column: 47, scope: !287)
!291 = !DILocation(line: 62, column: 22, scope: !287)
!292 = !DILocation(line: 62, column: 17, scope: !287)
!293 = !DILocation(line: 62, column: 13, scope: !287)
!294 = !DILocation(line: 62, column: 20, scope: !287)
!295 = !DILocation(line: 61, column: 33, scope: !283)
!296 = !DILocation(line: 61, column: 9, scope: !283)
!297 = distinct !{!297, !285, !298}
!298 = !DILocation(line: 63, column: 9, scope: !278)
!299 = !DILocalVariable(name: "i", scope: !300, file: !3, line: 64, type: !10)
!300 = distinct !DILexicalBlock(scope: !279, file: !3, line: 64, column: 9)
!301 = !DILocation(line: 64, column: 18, scope: !300)
!302 = !DILocation(line: 64, column: 14, scope: !300)
!303 = !DILocation(line: 64, column: 25, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !3, line: 64, column: 9)
!305 = !DILocation(line: 64, column: 27, scope: !304)
!306 = !DILocation(line: 64, column: 9, scope: !300)
!307 = !DILocation(line: 65, column: 30, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !3, line: 64, column: 37)
!309 = !DILocation(line: 65, column: 39, scope: !308)
!310 = !DILocation(line: 65, column: 49, scope: !308)
!311 = !DILocation(line: 65, column: 47, scope: !308)
!312 = !DILocation(line: 65, column: 22, scope: !308)
!313 = !DILocation(line: 65, column: 17, scope: !308)
!314 = !DILocation(line: 65, column: 13, scope: !308)
!315 = !DILocation(line: 65, column: 20, scope: !308)
!316 = !DILocation(line: 64, column: 33, scope: !304)
!317 = !DILocation(line: 64, column: 9, scope: !304)
!318 = distinct !{!318, !306, !319}
!319 = !DILocation(line: 66, column: 9, scope: !300)
!320 = !DILocation(line: 67, column: 34, scope: !279)
!321 = !DILocation(line: 67, column: 39, scope: !279)
!322 = !DILocation(line: 67, column: 19, scope: !279)
!323 = !DILocation(line: 67, column: 17, scope: !279)
!324 = !DILocation(line: 68, column: 5, scope: !279)
!325 = !DILocation(line: 69, column: 16, scope: !250)
!326 = !DILocation(line: 69, column: 9, scope: !250)
!327 = distinct !DISubprogram(name: "micro_decoder_val", linkageName: "_Z17micro_decoder_val9INSTR_VAL", scope: !3, file: !3, line: 72, type: !328, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!328 = !DISubroutineType(types: !329)
!329 = !{!186, !330}
!330 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "INSTR_VAL", file: !254, line: 37, size: 192, flags: DIFlagTypePassByValue, elements: !331, identifier: "_ZTS9INSTR_VAL")
!331 = !{!332, !333, !334, !335}
!332 = !DIDerivedType(tag: DW_TAG_member, name: "ID", scope: !330, file: !254, line: 38, baseType: !14, size: 32)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "OPCODE", scope: !330, file: !254, line: 39, baseType: !14, size: 32, offset: 32)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "OPTYPE", scope: !330, file: !254, line: 40, baseType: !14, size: 32, offset: 64)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "OPERANDS", scope: !330, file: !254, line: 41, baseType: !336, size: 96, offset: 96)
!336 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GEMM_STRUCT_VAL", file: !254, line: 17, size: 96, flags: DIFlagTypePassByValue, elements: !337, identifier: "_ZTS15GEMM_STRUCT_VAL")
!337 = !{!338, !339, !340}
!338 = !DIDerivedType(tag: DW_TAG_member, name: "inp_mem", scope: !336, file: !254, line: 18, baseType: !14, size: 32)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "wgt_mem", scope: !336, file: !254, line: 19, baseType: !14, size: 32, offset: 32)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "acc_mem", scope: !336, file: !254, line: 20, baseType: !14, size: 32, offset: 64)
!341 = !DILocalVariable(name: "instr", arg: 1, scope: !327, file: !3, line: 72, type: !330)
!342 = !DILocation(line: 72, column: 43, scope: !327)
!343 = !DILocalVariable(name: "arr_val", scope: !327, file: !3, line: 74, type: !186)
!344 = !DILocation(line: 74, column: 20, scope: !327)
!345 = !DILocalVariable(name: "inp", scope: !327, file: !3, line: 75, type: !143)
!346 = !DILocation(line: 75, column: 18, scope: !327)
!347 = !DILocalVariable(name: "wgt", scope: !327, file: !3, line: 75, type: !143)
!348 = !DILocation(line: 75, column: 26, scope: !327)
!349 = !DILocation(line: 76, column: 14, scope: !350)
!350 = distinct !DILexicalBlock(scope: !327, file: !3, line: 76, column: 8)
!351 = !DILocation(line: 76, column: 20, scope: !350)
!352 = !DILocation(line: 76, column: 8, scope: !327)
!353 = !DILocalVariable(name: "i", scope: !354, file: !3, line: 77, type: !10)
!354 = distinct !DILexicalBlock(scope: !355, file: !3, line: 77, column: 9)
!355 = distinct !DILexicalBlock(scope: !350, file: !3, line: 76, column: 25)
!356 = !DILocation(line: 77, column: 18, scope: !354)
!357 = !DILocation(line: 77, column: 14, scope: !354)
!358 = !DILocation(line: 77, column: 25, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !3, line: 77, column: 9)
!360 = !DILocation(line: 77, column: 27, scope: !359)
!361 = !DILocation(line: 77, column: 9, scope: !354)
!362 = !DILocation(line: 78, column: 28, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !3, line: 77, column: 37)
!364 = !DILocation(line: 78, column: 37, scope: !363)
!365 = !DILocation(line: 78, column: 47, scope: !363)
!366 = !DILocation(line: 78, column: 45, scope: !363)
!367 = !DILocation(line: 78, column: 17, scope: !363)
!368 = !DILocation(line: 78, column: 13, scope: !363)
!369 = !DILocation(line: 78, column: 20, scope: !363)
!370 = !DILocation(line: 77, column: 33, scope: !359)
!371 = !DILocation(line: 77, column: 9, scope: !359)
!372 = distinct !{!372, !361, !373}
!373 = !DILocation(line: 79, column: 9, scope: !354)
!374 = !DILocalVariable(name: "i", scope: !375, file: !3, line: 80, type: !10)
!375 = distinct !DILexicalBlock(scope: !355, file: !3, line: 80, column: 9)
!376 = !DILocation(line: 80, column: 18, scope: !375)
!377 = !DILocation(line: 80, column: 14, scope: !375)
!378 = !DILocation(line: 80, column: 25, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !3, line: 80, column: 9)
!380 = !DILocation(line: 80, column: 27, scope: !379)
!381 = !DILocation(line: 80, column: 9, scope: !375)
!382 = !DILocation(line: 81, column: 28, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !3, line: 80, column: 37)
!384 = !DILocation(line: 81, column: 37, scope: !383)
!385 = !DILocation(line: 81, column: 17, scope: !383)
!386 = !DILocation(line: 81, column: 13, scope: !383)
!387 = !DILocation(line: 81, column: 20, scope: !383)
!388 = !DILocation(line: 80, column: 33, scope: !379)
!389 = !DILocation(line: 80, column: 9, scope: !379)
!390 = distinct !{!390, !381, !391}
!391 = !DILocation(line: 82, column: 9, scope: !375)
!392 = !DILocation(line: 83, column: 37, scope: !355)
!393 = !DILocation(line: 83, column: 42, scope: !355)
!394 = !DILocation(line: 83, column: 19, scope: !355)
!395 = !DILocation(line: 83, column: 17, scope: !355)
!396 = !DILocation(line: 84, column: 5, scope: !355)
!397 = !DILocation(line: 85, column: 12, scope: !327)
!398 = !DILocation(line: 85, column: 5, scope: !327)
!399 = distinct !DISubprogram(name: "base_gemm", linkageName: "_Z9base_gemm5INSTR", scope: !3, file: !3, line: 88, type: !251, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!400 = !DILocalVariable(name: "myinsn", arg: 1, scope: !399, file: !3, line: 88, type: !253)
!401 = !DILocation(line: 88, column: 32, scope: !399)
!402 = !DILocalVariable(name: "row", scope: !399, file: !3, line: 89, type: !14)
!403 = !DILocation(line: 89, column: 18, scope: !399)
!404 = !DILocalVariable(name: "col", scope: !399, file: !3, line: 89, type: !14)
!405 = !DILocation(line: 89, column: 23, scope: !399)
!406 = !DILocalVariable(name: "i", scope: !399, file: !3, line: 89, type: !14)
!407 = !DILocation(line: 89, column: 28, scope: !399)
!408 = !DILocalVariable(name: "sum", scope: !399, file: !3, line: 90, type: !14)
!409 = !DILocation(line: 90, column: 18, scope: !399)
!410 = !DILocation(line: 91, column: 15, scope: !411)
!411 = distinct !DILexicalBlock(scope: !399, file: !3, line: 91, column: 8)
!412 = !DILocation(line: 91, column: 21, scope: !411)
!413 = !DILocation(line: 91, column: 8, scope: !399)
!414 = !DILocation(line: 92, column: 18, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 92, column: 9)
!416 = distinct !DILexicalBlock(scope: !411, file: !3, line: 91, column: 26)
!417 = !DILocation(line: 92, column: 14, scope: !415)
!418 = !DILocation(line: 92, column: 23, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 92, column: 9)
!420 = !DILocation(line: 92, column: 27, scope: !419)
!421 = !DILocation(line: 92, column: 9, scope: !415)
!422 = !DILocation(line: 93, column: 22, scope: !423)
!423 = distinct !DILexicalBlock(scope: !424, file: !3, line: 93, column: 13)
!424 = distinct !DILexicalBlock(scope: !419, file: !3, line: 92, column: 41)
!425 = !DILocation(line: 93, column: 18, scope: !423)
!426 = !DILocation(line: 93, column: 27, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !3, line: 93, column: 13)
!428 = !DILocation(line: 93, column: 31, scope: !427)
!429 = !DILocation(line: 93, column: 13, scope: !423)
!430 = !DILocation(line: 94, column: 21, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !3, line: 93, column: 45)
!432 = !DILocation(line: 95, column: 24, scope: !433)
!433 = distinct !DILexicalBlock(scope: !431, file: !3, line: 95, column: 17)
!434 = !DILocation(line: 95, column: 22, scope: !433)
!435 = !DILocation(line: 95, column: 29, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !3, line: 95, column: 17)
!437 = !DILocation(line: 95, column: 31, scope: !436)
!438 = !DILocation(line: 95, column: 17, scope: !433)
!439 = !DILocation(line: 96, column: 43, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !3, line: 95, column: 43)
!441 = !DILocation(line: 96, column: 41, scope: !440)
!442 = !DILocation(line: 96, column: 31, scope: !440)
!443 = !DILocation(line: 96, column: 50, scope: !440)
!444 = !DILocation(line: 96, column: 48, scope: !440)
!445 = !DILocation(line: 96, column: 29, scope: !440)
!446 = !DILocation(line: 96, column: 71, scope: !440)
!447 = !DILocation(line: 96, column: 69, scope: !440)
!448 = !DILocation(line: 96, column: 59, scope: !440)
!449 = !DILocation(line: 96, column: 76, scope: !440)
!450 = !DILocation(line: 96, column: 74, scope: !440)
!451 = !DILocation(line: 96, column: 57, scope: !440)
!452 = !DILocation(line: 96, column: 54, scope: !440)
!453 = !DILocation(line: 96, column: 25, scope: !440)
!454 = !DILocation(line: 95, column: 39, scope: !436)
!455 = !DILocation(line: 95, column: 17, scope: !436)
!456 = distinct !{!456, !438, !457}
!457 = !DILocation(line: 97, column: 17, scope: !433)
!458 = !DILocation(line: 98, column: 45, scope: !431)
!459 = !DILocation(line: 98, column: 31, scope: !431)
!460 = !DILocation(line: 98, column: 29, scope: !431)
!461 = !DILocation(line: 98, column: 19, scope: !431)
!462 = !DILocation(line: 98, column: 38, scope: !431)
!463 = !DILocation(line: 98, column: 36, scope: !431)
!464 = !DILocation(line: 98, column: 43, scope: !431)
!465 = !DILocation(line: 93, column: 41, scope: !427)
!466 = !DILocation(line: 93, column: 13, scope: !427)
!467 = distinct !{!467, !429, !468}
!468 = !DILocation(line: 99, column: 13, scope: !423)
!469 = !DILocation(line: 92, column: 37, scope: !419)
!470 = !DILocation(line: 92, column: 9, scope: !419)
!471 = distinct !{!471, !421, !472}
!472 = !DILocation(line: 100, column: 9, scope: !415)
!473 = !DILocalVariable(name: "i", scope: !474, file: !3, line: 101, type: !10)
!474 = distinct !DILexicalBlock(scope: !416, file: !3, line: 101, column: 9)
!475 = !DILocation(line: 101, column: 18, scope: !474)
!476 = !DILocation(line: 101, column: 14, scope: !474)
!477 = !DILocation(line: 101, column: 25, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 101, column: 9)
!479 = !DILocation(line: 101, column: 27, scope: !478)
!480 = !DILocation(line: 101, column: 9, scope: !474)
!481 = !DILocalVariable(name: "j", scope: !482, file: !3, line: 102, type: !10)
!482 = distinct !DILexicalBlock(scope: !483, file: !3, line: 102, column: 13)
!483 = distinct !DILexicalBlock(scope: !478, file: !3, line: 101, column: 39)
!484 = !DILocation(line: 102, column: 22, scope: !482)
!485 = !DILocation(line: 102, column: 18, scope: !482)
!486 = !DILocation(line: 102, column: 29, scope: !487)
!487 = distinct !DILexicalBlock(scope: !482, file: !3, line: 102, column: 13)
!488 = !DILocation(line: 102, column: 31, scope: !487)
!489 = !DILocation(line: 0, scope: !478)
!490 = !DILocation(line: 102, column: 13, scope: !482)
!491 = !DILocation(line: 103, column: 50, scope: !492)
!492 = distinct !DILexicalBlock(scope: !487, file: !3, line: 102, column: 43)
!493 = !DILocation(line: 103, column: 61, scope: !492)
!494 = !DILocation(line: 103, column: 35, scope: !492)
!495 = !DILocation(line: 103, column: 37, scope: !492)
!496 = !DILocation(line: 103, column: 45, scope: !492)
!497 = !DILocation(line: 103, column: 43, scope: !492)
!498 = !DILocation(line: 103, column: 17, scope: !492)
!499 = !DILocation(line: 103, column: 48, scope: !492)
!500 = !DILocation(line: 102, column: 39, scope: !487)
!501 = !DILocation(line: 102, column: 13, scope: !487)
!502 = distinct !{!502, !490, !503}
!503 = !DILocation(line: 104, column: 13, scope: !482)
!504 = !DILocation(line: 101, column: 35, scope: !478)
!505 = !DILocation(line: 101, column: 9, scope: !478)
!506 = distinct !{!506, !480, !507}
!507 = !DILocation(line: 105, column: 9, scope: !474)
!508 = !DILocation(line: 107, column: 5, scope: !399)
!509 = distinct !DISubprogram(name: "core_wrapper", linkageName: "_Z12core_wrapperPj", scope: !3, file: !3, line: 110, type: !510, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!510 = !DISubroutineType(types: !511)
!511 = !{!186, !186}
!512 = !DILocalVariable(name: "acc", arg: 1, scope: !509, file: !3, line: 110, type: !186)
!513 = !DILocation(line: 110, column: 42, scope: !509)
!514 = !DILocalVariable(name: "i", scope: !515, file: !3, line: 111, type: !10)
!515 = distinct !DILexicalBlock(scope: !509, file: !3, line: 111, column: 5)
!516 = !DILocation(line: 111, column: 13, scope: !515)
!517 = !DILocation(line: 111, column: 9, scope: !515)
!518 = !DILocation(line: 111, column: 18, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !3, line: 111, column: 5)
!520 = !DILocation(line: 111, column: 19, scope: !519)
!521 = !DILocation(line: 111, column: 5, scope: !515)
!522 = !DILocation(line: 112, column: 22, scope: !519)
!523 = !DILocation(line: 112, column: 26, scope: !519)
!524 = !DILocation(line: 112, column: 17, scope: !519)
!525 = !DILocation(line: 112, column: 9, scope: !519)
!526 = !DILocation(line: 112, column: 20, scope: !519)
!527 = !DILocation(line: 111, column: 29, scope: !519)
!528 = !DILocation(line: 111, column: 5, scope: !519)
!529 = distinct !{!529, !521, !530}
!530 = !DILocation(line: 112, column: 27, scope: !515)
!531 = !DILocation(line: 113, column: 1, scope: !509)
!532 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 116, type: !533, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!533 = !DISubroutineType(types: !534)
!534 = !{!10, !10, !535}
!535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!536 = !DILocalVariable(name: "argc", arg: 1, scope: !532, file: !3, line: 116, type: !10)
!537 = !DILocation(line: 116, column: 14, scope: !532)
!538 = !DILocalVariable(name: "argv", arg: 2, scope: !532, file: !3, line: 116, type: !535)
!539 = !DILocation(line: 116, column: 32, scope: !532)
!540 = !DILocalVariable(name: "inp_mem_row0", scope: !532, file: !3, line: 118, type: !143)
!541 = !DILocation(line: 118, column: 18, scope: !532)
!542 = !DILocalVariable(name: "inp_mem_row1", scope: !532, file: !3, line: 118, type: !143)
!543 = !DILocation(line: 118, column: 37, scope: !532)
!544 = !DILocalVariable(name: "inp_mem_row2", scope: !532, file: !3, line: 118, type: !143)
!545 = !DILocation(line: 118, column: 56, scope: !532)
!546 = !DILocalVariable(name: "wgt_mem_row0", scope: !532, file: !3, line: 119, type: !143)
!547 = !DILocation(line: 119, column: 18, scope: !532)
!548 = !DILocalVariable(name: "wgt_mem_row1", scope: !532, file: !3, line: 119, type: !143)
!549 = !DILocation(line: 119, column: 37, scope: !532)
!550 = !DILocalVariable(name: "wgt_mem_row2", scope: !532, file: !3, line: 119, type: !143)
!551 = !DILocation(line: 119, column: 56, scope: !532)
!552 = !DILocalVariable(name: "acc_mem_row0", scope: !532, file: !3, line: 120, type: !143)
!553 = !DILocation(line: 120, column: 18, scope: !532)
!554 = !DILocalVariable(name: "acc_mem_row1", scope: !532, file: !3, line: 120, type: !143)
!555 = !DILocation(line: 120, column: 37, scope: !532)
!556 = !DILocalVariable(name: "acc_mem_row2", scope: !532, file: !3, line: 120, type: !143)
!557 = !DILocation(line: 120, column: 56, scope: !532)
!558 = !DILocalVariable(name: "acc_stage1", scope: !532, file: !3, line: 121, type: !13)
!559 = !DILocation(line: 121, column: 18, scope: !532)
!560 = !DILocalVariable(name: "acc_stage2", scope: !532, file: !3, line: 121, type: !13)
!561 = !DILocation(line: 121, column: 39, scope: !532)
!562 = !DILocalVariable(name: "acc_stage3", scope: !532, file: !3, line: 121, type: !13)
!563 = !DILocation(line: 121, column: 60, scope: !532)
!564 = !DILocalVariable(name: "acc_stage4", scope: !532, file: !3, line: 121, type: !13)
!565 = !DILocation(line: 121, column: 81, scope: !532)
!566 = !DILocalVariable(name: "acc_mem_ref", scope: !532, file: !3, line: 125, type: !186)
!567 = !DILocation(line: 125, column: 20, scope: !532)
!568 = !DILocalVariable(name: "acc_mem_val", scope: !532, file: !3, line: 126, type: !186)
!569 = !DILocation(line: 126, column: 20, scope: !532)
!570 = !DILocalVariable(name: "acc_mem_gemm", scope: !532, file: !3, line: 127, type: !186)
!571 = !DILocation(line: 127, column: 20, scope: !532)
!572 = !DILocalVariable(name: "out_mem_core", scope: !532, file: !3, line: 128, type: !186)
!573 = !DILocation(line: 128, column: 20, scope: !532)
!574 = !DILocalVariable(name: "opcode", scope: !532, file: !3, line: 129, type: !14)
!575 = !DILocation(line: 129, column: 18, scope: !532)
!576 = !DILocalVariable(name: "op_type", scope: !532, file: !3, line: 129, type: !14)
!577 = !DILocation(line: 129, column: 26, scope: !532)
!578 = !DILocation(line: 130, column: 5, scope: !532)
!579 = !DILocation(line: 133, column: 5, scope: !532)
!580 = !DILocation(line: 134, column: 5, scope: !532)
!581 = !DILocation(line: 135, column: 5, scope: !532)
!582 = !DILocation(line: 136, column: 5, scope: !532)
!583 = !DILocation(line: 137, column: 5, scope: !532)
!584 = !DILocation(line: 138, column: 5, scope: !532)
!585 = !DILocation(line: 139, column: 5, scope: !532)
!586 = !DILocation(line: 140, column: 5, scope: !532)
!587 = !DILocation(line: 141, column: 5, scope: !532)
!588 = !DILocation(line: 142, column: 24, scope: !532)
!589 = !DILocation(line: 142, column: 5, scope: !532)
!590 = !DILocation(line: 143, column: 24, scope: !532)
!591 = !DILocation(line: 143, column: 5, scope: !532)
!592 = !DILocalVariable(name: "gemm_base", scope: !532, file: !3, line: 145, type: !260)
!593 = !DILocation(line: 145, column: 21, scope: !532)
!594 = !DILocalVariable(name: "instruction", scope: !532, file: !3, line: 146, type: !253)
!595 = !DILocation(line: 146, column: 11, scope: !532)
!596 = !DILocation(line: 146, column: 25, scope: !532)
!597 = !DILocation(line: 146, column: 33, scope: !532)
!598 = !DILocalVariable(name: "gemm_uop", scope: !532, file: !3, line: 150, type: !599)
!599 = !DICompositeType(tag: DW_TAG_array_type, baseType: !260, size: 1728, elements: !15)
!600 = !DILocation(line: 150, column: 21, scope: !532)
!601 = !DILocation(line: 150, column: 35, scope: !532)
!602 = !DILocation(line: 150, column: 36, scope: !532)
!603 = !DILocation(line: 150, column: 38, scope: !532)
!604 = !DILocation(line: 150, column: 55, scope: !532)
!605 = !DILocation(line: 150, column: 72, scope: !532)
!606 = !DILocation(line: 150, column: 89, scope: !532)
!607 = !DILocation(line: 150, column: 91, scope: !532)
!608 = !DILocation(line: 150, column: 108, scope: !532)
!609 = !DILocation(line: 150, column: 125, scope: !532)
!610 = !DILocation(line: 151, column: 36, scope: !532)
!611 = !DILocation(line: 151, column: 38, scope: !532)
!612 = !DILocation(line: 151, column: 55, scope: !532)
!613 = !DILocation(line: 151, column: 72, scope: !532)
!614 = !DILocation(line: 151, column: 89, scope: !532)
!615 = !DILocation(line: 151, column: 91, scope: !532)
!616 = !DILocation(line: 151, column: 108, scope: !532)
!617 = !DILocation(line: 151, column: 125, scope: !532)
!618 = !DILocation(line: 152, column: 36, scope: !532)
!619 = !DILocation(line: 152, column: 38, scope: !532)
!620 = !DILocation(line: 152, column: 55, scope: !532)
!621 = !DILocation(line: 152, column: 72, scope: !532)
!622 = !DILocation(line: 152, column: 89, scope: !532)
!623 = !DILocation(line: 152, column: 91, scope: !532)
!624 = !DILocation(line: 152, column: 108, scope: !532)
!625 = !DILocation(line: 152, column: 125, scope: !532)
!626 = !DILocation(line: 153, column: 36, scope: !532)
!627 = !DILocation(line: 153, column: 38, scope: !532)
!628 = !DILocation(line: 153, column: 55, scope: !532)
!629 = !DILocation(line: 153, column: 72, scope: !532)
!630 = !DILocation(line: 153, column: 89, scope: !532)
!631 = !DILocation(line: 153, column: 91, scope: !532)
!632 = !DILocation(line: 153, column: 108, scope: !532)
!633 = !DILocation(line: 153, column: 125, scope: !532)
!634 = !DILocation(line: 154, column: 36, scope: !532)
!635 = !DILocation(line: 154, column: 38, scope: !532)
!636 = !DILocation(line: 154, column: 55, scope: !532)
!637 = !DILocation(line: 154, column: 72, scope: !532)
!638 = !DILocalVariable(name: "gemm", scope: !532, file: !3, line: 157, type: !639)
!639 = !DICompositeType(tag: DW_TAG_array_type, baseType: !336, size: 864, elements: !15)
!640 = !DILocation(line: 157, column: 21, scope: !532)
!641 = !DILocation(line: 157, column: 31, scope: !532)
!642 = !DILocation(line: 157, column: 32, scope: !532)
!643 = !DILocation(line: 157, column: 33, scope: !532)
!644 = !DILocation(line: 157, column: 49, scope: !532)
!645 = !DILocation(line: 157, column: 65, scope: !532)
!646 = !DILocation(line: 157, column: 82, scope: !532)
!647 = !DILocation(line: 157, column: 83, scope: !532)
!648 = !DILocation(line: 157, column: 99, scope: !532)
!649 = !DILocation(line: 157, column: 115, scope: !532)
!650 = !DILocation(line: 158, column: 32, scope: !532)
!651 = !DILocation(line: 158, column: 33, scope: !532)
!652 = !DILocation(line: 158, column: 49, scope: !532)
!653 = !DILocation(line: 158, column: 65, scope: !532)
!654 = !DILocation(line: 158, column: 82, scope: !532)
!655 = !DILocation(line: 158, column: 83, scope: !532)
!656 = !DILocation(line: 158, column: 99, scope: !532)
!657 = !DILocation(line: 158, column: 115, scope: !532)
!658 = !DILocation(line: 159, column: 32, scope: !532)
!659 = !DILocation(line: 159, column: 33, scope: !532)
!660 = !DILocation(line: 159, column: 49, scope: !532)
!661 = !DILocation(line: 159, column: 65, scope: !532)
!662 = !DILocation(line: 159, column: 82, scope: !532)
!663 = !DILocation(line: 159, column: 83, scope: !532)
!664 = !DILocation(line: 159, column: 99, scope: !532)
!665 = !DILocation(line: 159, column: 115, scope: !532)
!666 = !DILocation(line: 160, column: 32, scope: !532)
!667 = !DILocation(line: 160, column: 33, scope: !532)
!668 = !DILocation(line: 160, column: 49, scope: !532)
!669 = !DILocation(line: 160, column: 65, scope: !532)
!670 = !DILocation(line: 160, column: 82, scope: !532)
!671 = !DILocation(line: 160, column: 83, scope: !532)
!672 = !DILocation(line: 160, column: 99, scope: !532)
!673 = !DILocation(line: 160, column: 115, scope: !532)
!674 = !DILocation(line: 161, column: 32, scope: !532)
!675 = !DILocation(line: 161, column: 33, scope: !532)
!676 = !DILocation(line: 161, column: 49, scope: !532)
!677 = !DILocation(line: 161, column: 65, scope: !532)
!678 = !DILocalVariable(name: "microop", scope: !532, file: !3, line: 163, type: !679)
!679 = !DICompositeType(tag: DW_TAG_array_type, baseType: !253, size: 2880, elements: !15)
!680 = !DILocation(line: 163, column: 11, scope: !532)
!681 = !DILocation(line: 163, column: 24, scope: !532)
!682 = !DILocation(line: 163, column: 25, scope: !532)
!683 = !DILocation(line: 163, column: 32, scope: !532)
!684 = !DILocation(line: 163, column: 45, scope: !532)
!685 = !DILocation(line: 163, column: 52, scope: !532)
!686 = !DILocation(line: 163, column: 65, scope: !532)
!687 = !DILocation(line: 163, column: 72, scope: !532)
!688 = !DILocation(line: 163, column: 85, scope: !532)
!689 = !DILocation(line: 163, column: 92, scope: !532)
!690 = !DILocation(line: 164, column: 25, scope: !532)
!691 = !DILocation(line: 164, column: 32, scope: !532)
!692 = !DILocation(line: 164, column: 46, scope: !532)
!693 = !DILocation(line: 164, column: 53, scope: !532)
!694 = !DILocation(line: 164, column: 66, scope: !532)
!695 = !DILocation(line: 164, column: 73, scope: !532)
!696 = !DILocation(line: 164, column: 86, scope: !532)
!697 = !DILocation(line: 164, column: 93, scope: !532)
!698 = !DILocation(line: 164, column: 106, scope: !532)
!699 = !DILocation(line: 164, column: 113, scope: !532)
!700 = !DILocalVariable(name: "microop_val", scope: !532, file: !3, line: 166, type: !701)
!701 = !DICompositeType(tag: DW_TAG_array_type, baseType: !330, size: 1728, elements: !15)
!702 = !DILocation(line: 166, column: 15, scope: !532)
!703 = !DILocation(line: 166, column: 32, scope: !532)
!704 = !DILocation(line: 166, column: 33, scope: !532)
!705 = !DILocation(line: 166, column: 40, scope: !532)
!706 = !DILocation(line: 166, column: 49, scope: !532)
!707 = !DILocation(line: 166, column: 56, scope: !532)
!708 = !DILocation(line: 166, column: 65, scope: !532)
!709 = !DILocation(line: 166, column: 72, scope: !532)
!710 = !DILocation(line: 166, column: 81, scope: !532)
!711 = !DILocation(line: 166, column: 88, scope: !532)
!712 = !DILocation(line: 167, column: 33, scope: !532)
!713 = !DILocation(line: 167, column: 40, scope: !532)
!714 = !DILocation(line: 167, column: 50, scope: !532)
!715 = !DILocation(line: 167, column: 57, scope: !532)
!716 = !DILocation(line: 167, column: 66, scope: !532)
!717 = !DILocation(line: 167, column: 73, scope: !532)
!718 = !DILocation(line: 167, column: 82, scope: !532)
!719 = !DILocation(line: 167, column: 89, scope: !532)
!720 = !DILocation(line: 167, column: 98, scope: !532)
!721 = !DILocation(line: 167, column: 105, scope: !532)
!722 = !DILocation(line: 169, column: 9, scope: !723)
!723 = distinct !DILexicalBlock(scope: !532, file: !3, line: 169, column: 8)
!724 = !DILocation(line: 169, column: 16, scope: !723)
!725 = !DILocation(line: 169, column: 27, scope: !723)
!726 = !DILocation(line: 169, column: 35, scope: !723)
!727 = !DILocation(line: 169, column: 22, scope: !723)
!728 = !DILocation(line: 169, column: 44, scope: !723)
!729 = !DILocation(line: 169, column: 52, scope: !723)
!730 = !DILocation(line: 170, column: 34, scope: !731)
!731 = distinct !DILexicalBlock(scope: !723, file: !3, line: 169, column: 59)
!732 = !DILocation(line: 170, column: 24, scope: !731)
!733 = !DILocation(line: 170, column: 22, scope: !731)
!734 = !DILocalVariable(name: "i", scope: !735, file: !3, line: 172, type: !10)
!735 = distinct !DILexicalBlock(scope: !731, file: !3, line: 172, column: 9)
!736 = !DILocation(line: 172, column: 18, scope: !735)
!737 = !DILocation(line: 172, column: 14, scope: !735)
!738 = !DILocation(line: 172, column: 22, scope: !739)
!739 = distinct !DILexicalBlock(scope: !735, file: !3, line: 172, column: 9)
!740 = !DILocation(line: 172, column: 23, scope: !739)
!741 = !DILocation(line: 172, column: 9, scope: !735)
!742 = !DILocation(line: 173, column: 27, scope: !743)
!743 = distinct !DILexicalBlock(scope: !739, file: !3, line: 172, column: 30)
!744 = !DILocation(line: 173, column: 40, scope: !743)
!745 = !DILocation(line: 173, column: 24, scope: !743)
!746 = !DILocation(line: 173, column: 13, scope: !743)
!747 = !DILocation(line: 173, column: 26, scope: !743)
!748 = !DILocation(line: 172, column: 27, scope: !739)
!749 = !DILocation(line: 172, column: 9, scope: !739)
!750 = distinct !{!750, !741, !751}
!751 = !DILocation(line: 174, column: 9, scope: !735)
!752 = !DILocalVariable(name: "i", scope: !753, file: !3, line: 176, type: !10)
!753 = distinct !DILexicalBlock(scope: !731, file: !3, line: 176, column: 9)
!754 = !DILocation(line: 176, column: 18, scope: !753)
!755 = !DILocation(line: 176, column: 14, scope: !753)
!756 = !DILocation(line: 176, column: 22, scope: !757)
!757 = distinct !DILexicalBlock(scope: !753, file: !3, line: 176, column: 9)
!758 = !DILocation(line: 176, column: 23, scope: !757)
!759 = !DILocation(line: 176, column: 9, scope: !753)
!760 = !DILocation(line: 177, column: 49, scope: !761)
!761 = distinct !DILexicalBlock(scope: !757, file: !3, line: 176, column: 30)
!762 = !DILocation(line: 177, column: 41, scope: !761)
!763 = !DILocation(line: 177, column: 27, scope: !761)
!764 = !DILocation(line: 177, column: 25, scope: !761)
!765 = !DILocation(line: 178, column: 27, scope: !761)
!766 = !DILocation(line: 178, column: 39, scope: !761)
!767 = !DILocation(line: 178, column: 24, scope: !761)
!768 = !DILocation(line: 178, column: 13, scope: !761)
!769 = !DILocation(line: 178, column: 26, scope: !761)
!770 = !DILocation(line: 176, column: 27, scope: !757)
!771 = !DILocation(line: 176, column: 9, scope: !757)
!772 = distinct !{!772, !759, !773}
!773 = !DILocation(line: 179, column: 9, scope: !753)
!774 = !DILocalVariable(name: "i", scope: !775, file: !3, line: 181, type: !10)
!775 = distinct !DILexicalBlock(scope: !731, file: !3, line: 181, column: 9)
!776 = !DILocation(line: 181, column: 18, scope: !775)
!777 = !DILocation(line: 181, column: 14, scope: !775)
!778 = !DILocation(line: 181, column: 22, scope: !779)
!779 = distinct !DILexicalBlock(scope: !775, file: !3, line: 181, column: 9)
!780 = !DILocation(line: 181, column: 23, scope: !779)
!781 = !DILocation(line: 181, column: 9, scope: !775)
!782 = !DILocation(line: 182, column: 57, scope: !783)
!783 = distinct !DILexicalBlock(scope: !779, file: !3, line: 181, column: 30)
!784 = !DILocation(line: 182, column: 45, scope: !783)
!785 = !DILocation(line: 182, column: 27, scope: !783)
!786 = !DILocation(line: 182, column: 25, scope: !783)
!787 = !DILocation(line: 183, column: 27, scope: !783)
!788 = !DILocation(line: 183, column: 39, scope: !783)
!789 = !DILocation(line: 183, column: 24, scope: !783)
!790 = !DILocation(line: 183, column: 13, scope: !783)
!791 = !DILocation(line: 183, column: 26, scope: !783)
!792 = !DILocation(line: 181, column: 27, scope: !779)
!793 = !DILocation(line: 181, column: 9, scope: !779)
!794 = distinct !{!794, !781, !795}
!795 = !DILocation(line: 184, column: 9, scope: !775)
!796 = !DILocation(line: 185, column: 37, scope: !731)
!797 = !DILocation(line: 185, column: 24, scope: !731)
!798 = !DILocation(line: 185, column: 22, scope: !731)
!799 = !DILocalVariable(name: "i", scope: !800, file: !3, line: 186, type: !10)
!800 = distinct !DILexicalBlock(scope: !731, file: !3, line: 186, column: 9)
!801 = !DILocation(line: 186, column: 18, scope: !800)
!802 = !DILocation(line: 186, column: 14, scope: !800)
!803 = !DILocation(line: 186, column: 22, scope: !804)
!804 = distinct !DILexicalBlock(scope: !800, file: !3, line: 186, column: 9)
!805 = !DILocation(line: 186, column: 23, scope: !804)
!806 = !DILocation(line: 186, column: 9, scope: !800)
!807 = !DILocation(line: 187, column: 27, scope: !808)
!808 = distinct !DILexicalBlock(scope: !804, file: !3, line: 186, column: 30)
!809 = !DILocation(line: 187, column: 40, scope: !808)
!810 = !DILocation(line: 187, column: 24, scope: !808)
!811 = !DILocation(line: 187, column: 13, scope: !808)
!812 = !DILocation(line: 187, column: 26, scope: !808)
!813 = !DILocation(line: 186, column: 27, scope: !804)
!814 = !DILocation(line: 186, column: 9, scope: !804)
!815 = distinct !{!815, !806, !816}
!816 = !DILocation(line: 188, column: 9, scope: !800)
!817 = !DILocalVariable(name: "i", scope: !818, file: !3, line: 189, type: !10)
!818 = distinct !DILexicalBlock(scope: !731, file: !3, line: 189, column: 10)
!819 = !DILocation(line: 189, column: 19, scope: !818)
!820 = !DILocation(line: 189, column: 15, scope: !818)
!821 = !DILocation(line: 189, column: 26, scope: !822)
!822 = distinct !DILexicalBlock(scope: !818, file: !3, line: 189, column: 10)
!823 = !DILocation(line: 189, column: 28, scope: !822)
!824 = !DILocation(line: 189, column: 10, scope: !818)
!825 = !DILocation(line: 190, column: 14, scope: !826)
!826 = distinct !DILexicalBlock(scope: !822, file: !3, line: 189, column: 44)
!827 = !DILocation(line: 191, column: 14, scope: !826)
!828 = !DILocation(line: 192, column: 14, scope: !826)
!829 = !DILocation(line: 189, column: 40, scope: !822)
!830 = !DILocation(line: 189, column: 10, scope: !822)
!831 = distinct !{!831, !824, !832}
!832 = !DILocation(line: 193, column: 14, scope: !818)
!833 = !DILocation(line: 196, column: 5, scope: !532)
!834 = distinct !DISubprogram(name: "memcpy", scope: !835, file: !835, line: 12, type: !836, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !132, retainedNodes: !4)
!835 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!836 = !DISubroutineType(types: !837)
!837 = !{!46, !46, !47, !838}
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !839, line: 46, baseType: !51)
!839 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.0/include/stddef.h", directory: "")
!840 = !DILocalVariable(name: "destaddr", arg: 1, scope: !834, file: !835, line: 12, type: !46)
!841 = !DILocation(line: 12, column: 20, scope: !834)
!842 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !834, file: !835, line: 12, type: !47)
!843 = !DILocation(line: 12, column: 42, scope: !834)
!844 = !DILocalVariable(name: "len", arg: 3, scope: !834, file: !835, line: 12, type: !838)
!845 = !DILocation(line: 12, column: 58, scope: !834)
!846 = !DILocalVariable(name: "dest", scope: !834, file: !835, line: 13, type: !75)
!847 = !DILocation(line: 13, column: 9, scope: !834)
!848 = !DILocation(line: 13, column: 16, scope: !834)
!849 = !DILocalVariable(name: "src", scope: !834, file: !835, line: 14, type: !79)
!850 = !DILocation(line: 14, column: 15, scope: !834)
!851 = !DILocation(line: 14, column: 21, scope: !834)
!852 = !DILocation(line: 16, column: 3, scope: !834)
!853 = !DILocation(line: 16, column: 13, scope: !834)
!854 = !DILocation(line: 16, column: 16, scope: !834)
!855 = !DILocation(line: 17, column: 19, scope: !834)
!856 = !DILocation(line: 17, column: 15, scope: !834)
!857 = !DILocation(line: 17, column: 10, scope: !834)
!858 = !DILocation(line: 17, column: 13, scope: !834)
!859 = distinct !{!859, !852, !855}
!860 = !DILocation(line: 18, column: 10, scope: !834)
!861 = !DILocation(line: 18, column: 3, scope: !834)
