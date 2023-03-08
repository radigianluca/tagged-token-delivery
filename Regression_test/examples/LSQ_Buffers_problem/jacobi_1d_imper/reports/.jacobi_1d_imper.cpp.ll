; ModuleID = 'src/jacobi_1d_imper.cpp'
source_filename = "src/jacobi_1d_imper.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z15jacobi_1d_imperPiS_(i32* %A, i32* %B) #0 {
entry:
  %A.addr = alloca i32*, align 8
  %B.addr = alloca i32*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32* %A, i32** %A.addr, align 8
  store i32* %B, i32** %B.addr, align 8
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %0 = load i32, i32* %t, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 99
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32*, i32** %A.addr, align 8
  %3 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %3, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32*, i32** %A.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %idxprom4
  %7 = load i32, i32* %arrayidx5, align 4
  %add = add nsw i32 %4, %7
  %8 = load i32*, i32** %A.addr, align 8
  %9 = load i32, i32* %i, align 4
  %add6 = add nsw i32 %9, 1
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %idxprom7
  %10 = load i32, i32* %arrayidx8, align 4
  %add9 = add nsw i32 %add, %10
  %mul = mul nsw i32 3, %add9
  %11 = load i32*, i32** %B.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %12 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10
  store i32 %mul, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 1, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc18, %for.end
  %14 = load i32, i32* %j, align 4
  %cmp13 = icmp slt i32 %14, 99
  br i1 %cmp13, label %for.body14, label %for.end20

for.body14:                                       ; preds = %for.cond12
  %15 = load i32*, i32** %B.addr, align 8
  %16 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %16 to i64
  %arrayidx16 = getelementptr inbounds i32, i32* %15, i64 %idxprom15
  %17 = load i32, i32* %arrayidx16, align 4
  %18 = load i32, i32* %sum, align 4
  %add17 = add nsw i32 %18, %17
  store i32 %add17, i32* %sum, align 4
  br label %for.inc18

for.inc18:                                        ; preds = %for.body14
  %19 = load i32, i32* %j, align 4
  %inc19 = add nsw i32 %19, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond12

for.end20:                                        ; preds = %for.cond12
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %20 = load i32, i32* %t, align 4
  %inc22 = add nsw i32 %20, 1
  store i32 %inc22, i32* %t, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  %21 = load i32, i32* %sum, align 4
  ret i32 %21
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %A = alloca [1 x [100 x i32]], align 16
  %B = alloca [1 x [100 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i15 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 100
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rand() #3
  %rem = srem i32 %call, 100
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %A, i64 0, i64 %idxprom
  %3 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx, i64 0, i64 %idxprom4
  store i32 %rem, i32* %arrayidx5, align 4
  %call6 = call i32 @rand() #3
  %rem7 = srem i32 %call6, 100
  %4 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %4 to i64
  %arrayidx9 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %B, i64 0, i64 %idxprom8
  %5 = load i32, i32* %j, align 4
  %idxprom10 = sext i32 %5 to i64
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx9, i64 0, i64 %idxprom10
  store i32 %rem7, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %7, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i15, align 4
  %8 = load i32, i32* %i15, align 4
  %idxprom16 = sext i32 %8 to i64
  %arrayidx17 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %A, i64 0, i64 %idxprom16
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx17, i32 0, i32 0
  %9 = load i32, i32* %i15, align 4
  %idxprom18 = sext i32 %9 to i64
  %arrayidx19 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %B, i64 0, i64 %idxprom18
  %arraydecay20 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx19, i32 0, i32 0
  %call21 = call i32 @_Z15jacobi_1d_imperPiS_(i32* %arraydecay, i32* %arraydecay20)
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"}
