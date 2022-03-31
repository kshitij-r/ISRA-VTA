; ModuleID = 'klee_assume.bc'
source_filename = "klee_assume.cc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z6verifyii(i32, i32) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %5, metadata !15, metadata !DIExpression()), !dbg !16
  %6 = load i32, i32* %3, align 4, !dbg !17
  %7 = icmp sge i32 %6, 2, !dbg !19
  %8 = load i32, i32* %4, align 4, !dbg !20
  %9 = icmp sge i32 %8, 4, !dbg !21
  %or.cond = and i1 %7, %9, !dbg !22
  br i1 %or.cond, label %10, label %11, !dbg !22

10:                                               ; preds = %2
  store i32 0, i32* %5, align 4, !dbg !23
  br label %12, !dbg !25

11:                                               ; preds = %2
  store i32 1, i32* %5, align 4, !dbg !26
  br label %12

12:                                               ; preds = %11, %10
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main() #2 !dbg !29 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %3, metadata !34, metadata !DIExpression()), !dbg !35
  %4 = bitcast i32* %2 to i8*, !dbg !36
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !37
  %5 = bitcast i32* %3 to i8*, !dbg !38
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !39
  %6 = load i32, i32* %2, align 4, !dbg !40
  %7 = icmp eq i32 %6, 2, !dbg !41
  %8 = load i32, i32* %3, align 4, !dbg !42
  %9 = icmp eq i32 %8, 3, !dbg !42
  %10 = select i1 %7, i1 %9, i1 false, !dbg !42
  %11 = zext i1 %10 to i64, !dbg !43
  call void @klee_assume(i64 %11), !dbg !44
  %12 = load i32, i32* %2, align 4, !dbg !45
  %13 = load i32, i32* %3, align 4, !dbg !46
  call void @_Z6verifyii(i32 %12, i32 %13), !dbg !47
  ret i32 0, !dbg !48
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

declare dso_local void @klee_assume(i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "klee_assume.cc", directory: "/home/klee/klee_src/examples/isra")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!7 = distinct !DISubprogram(name: "verify", linkageName: "_Z6verifyii", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!12 = !DILocation(line: 6, column: 17, scope: !7)
!13 = !DILocalVariable(name: "y", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 6, column: 24, scope: !7)
!15 = !DILocalVariable(name: "temp", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 7, scope: !7)
!17 = !DILocation(line: 8, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!19 = !DILocation(line: 8, column: 8, scope: !18)
!20 = !DILocation(line: 8, column: 15, scope: !18)
!21 = !DILocation(line: 8, column: 16, scope: !18)
!22 = !DILocation(line: 8, column: 12, scope: !18)
!23 = !DILocation(line: 9, column: 7, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !1, line: 8, column: 21)
!25 = !DILocation(line: 10, column: 2, scope: !24)
!26 = !DILocation(line: 12, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !1, line: 11, column: 7)
!28 = !DILocation(line: 17, column: 1, scope: !7)
!29 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 19, type: !30, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!10}
!32 = !DILocalVariable(name: "c", scope: !29, file: !1, line: 20, type: !10)
!33 = !DILocation(line: 20, column: 7, scope: !29)
!34 = !DILocalVariable(name: "d", scope: !29, file: !1, line: 20, type: !10)
!35 = !DILocation(line: 20, column: 9, scope: !29)
!36 = !DILocation(line: 21, column: 22, scope: !29)
!37 = !DILocation(line: 21, column: 3, scope: !29)
!38 = !DILocation(line: 22, column: 22, scope: !29)
!39 = !DILocation(line: 22, column: 3, scope: !29)
!40 = !DILocation(line: 24, column: 16, scope: !29)
!41 = !DILocation(line: 24, column: 17, scope: !29)
!42 = !DILocation(line: 24, column: 22, scope: !29)
!43 = !DILocation(line: 24, column: 15, scope: !29)
!44 = !DILocation(line: 24, column: 3, scope: !29)
!45 = !DILocation(line: 25, column: 10, scope: !29)
!46 = !DILocation(line: 25, column: 12, scope: !29)
!47 = !DILocation(line: 25, column: 3, scope: !29)
!48 = !DILocation(line: 26, column: 3, scope: !29)
