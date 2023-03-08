; ModuleID = '.jacobi_1d_imper.cpp_mem2reg_constprop.ll'
source_filename = "src/jacobi_1d_imper.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z15jacobi_1d_imperPiS_(i32* %A, i32* %B) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc21, %entry
  %sum.05 = phi i32 [ 0, %entry ], [ %sum.1.lcssa, %for.inc21 ]
  %t.04 = phi i32 [ 0, %entry ], [ %inc22, %for.inc21 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %i.01 = phi i32 [ 1, %for.body ], [ %inc, %for.body3 ]
  %sub = sub nsw i32 %i.01, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i32, i32* %A, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %idxprom4 = sext i32 %i.01 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %A, i64 %idxprom4
  %1 = load i32, i32* %arrayidx5, align 4
  %add = add nsw i32 %0, %1
  %add6 = add nsw i32 %i.01, 1
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %A, i64 %idxprom7
  %2 = load i32, i32* %arrayidx8, align 4
  %add9 = add nsw i32 %add, %2
  %mul = mul nsw i32 3, %add9
  %idxprom10 = sext i32 %i.01 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %B, i64 %idxprom10
  store i32 %mul, i32* %arrayidx11, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp2 = icmp slt i32 %inc, 99
  br i1 %cmp2, label %for.body3, label %for.end

for.end:                                          ; preds = %for.body3
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.end
  %sum.13 = phi i32 [ %sum.05, %for.end ], [ %add17, %for.body14 ]
  %j.02 = phi i32 [ 1, %for.end ], [ %inc19, %for.body14 ]
  %idxprom15 = sext i32 %j.02 to i64
  %arrayidx16 = getelementptr inbounds i32, i32* %B, i64 %idxprom15
  %3 = load i32, i32* %arrayidx16, align 4
  %add17 = add nsw i32 %sum.13, %3
  %inc19 = add nsw i32 %j.02, 1
  %cmp13 = icmp slt i32 %inc19, 99
  br i1 %cmp13, label %for.body14, label %for.inc21

for.inc21:                                        ; preds = %for.body14
  %sum.1.lcssa = phi i32 [ %add17, %for.body14 ]
  %inc22 = add nsw i32 %t.04, 1
  %cmp = icmp slt i32 %inc22, 3
  br i1 %cmp, label %for.body, label %for.end23

for.end23:                                        ; preds = %for.inc21
  %sum.0.lcssa = phi i32 [ %sum.1.lcssa, %for.inc21 ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #1 {
entry:
  %A = alloca [1 x [100 x i32]], align 16
  %B = alloca [1 x [100 x i32]], align 16
  br label %for.body

for.body:                                         ; preds = %for.inc12, %entry
  %i.02 = phi i32 [ 0, %entry ], [ %inc13, %for.inc12 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %j.01 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ]
  %call = call i32 @rand() #3
  %rem = srem i32 %call, 100
  %idxprom = sext i32 %i.02 to i64
  %arrayidx = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %A, i64 0, i64 %idxprom
  %idxprom4 = sext i32 %j.01 to i64
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx, i64 0, i64 %idxprom4
  store i32 %rem, i32* %arrayidx5, align 4
  %call6 = call i32 @rand() #3
  %rem7 = srem i32 %call6, 100
  %idxprom8 = sext i32 %i.02 to i64
  %arrayidx9 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %B, i64 0, i64 %idxprom8
  %idxprom10 = sext i32 %j.01 to i64
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx9, i64 0, i64 %idxprom10
  store i32 %rem7, i32* %arrayidx11, align 4
  %inc = add nsw i32 %j.01, 1
  %cmp2 = icmp slt i32 %inc, 100
  br i1 %cmp2, label %for.body3, label %for.inc12

for.inc12:                                        ; preds = %for.body3
  %inc13 = add nsw i32 %i.02, 1
  %cmp = icmp slt i32 %inc13, 1
  br i1 %cmp, label %for.body, label %for.end14

for.end14:                                        ; preds = %for.inc12
  %arrayidx17 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %A, i64 0, i64 0
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx17, i32 0, i32 0
  %arrayidx19 = getelementptr inbounds [1 x [100 x i32]], [1 x [100 x i32]]* %B, i64 0, i64 0
  %arraydecay20 = getelementptr inbounds [100 x i32], [100 x i32]* %arrayidx19, i32 0, i32 0
  %call21 = call i32 @_Z15jacobi_1d_imperPiS_(i32* %arraydecay, i32* %arraydecay20)
  ret i32 0
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
