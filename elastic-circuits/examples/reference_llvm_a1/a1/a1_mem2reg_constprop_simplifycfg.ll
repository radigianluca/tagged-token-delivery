; ModuleID = '_build/a1/a1_mem2reg_constprop.ll'
source_filename = "a1.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @_Z3a_1PiS_S_iiiS_(i32* %a, i32* %out_1, i32* %out_2, i32 %val_1, i32 %val_2, i32 %flag, i32* %val_arr) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.04 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %val_1.addr.03 = phi i32 [ %val_1, %entry ], [ %add, %for.body ]
  %idxprom = sext i32 %i.04 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %val_1.addr.03, %0
  %inc = add nsw i32 %i.04, 1
  %cmp = icmp slt i32 %inc, 1000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %val_1.addr.0.lcssa = phi i32 [ %add, %for.body ]
  %arrayidx1 = getelementptr inbounds i32, i32* %val_arr, i64 0
  store i32 %val_1.addr.0.lcssa, i32* %arrayidx1, align 4
  %cmp2 = icmp eq i32 %flag, 1
  %arrayidx3 = getelementptr inbounds i32, i32* %out_1, i64 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i32 2, i32* %arrayidx3, align 4
  br label %if.end21

if.else:                                          ; preds = %for.end
  store i32 3, i32* %arrayidx3, align 4
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %if.else
  %i5.02 = phi i32 [ 0, %if.else ], [ %inc13, %for.body8 ]
  %val_2.addr.01 = phi i32 [ %val_2, %if.else ], [ %add11, %for.body8 ]
  %idxprom9 = sext i32 %i5.02 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i64 %idxprom9
  %1 = load i32, i32* %arrayidx10, align 4
  %add11 = add nsw i32 %val_2.addr.01, %1
  %inc13 = add nsw i32 %i5.02, 1
  %cmp7 = icmp slt i32 %inc13, 1000
  br i1 %cmp7, label %for.body8, label %for.end14

for.end14:                                        ; preds = %for.body8
  %cmp15 = icmp eq i32 %flag, 1
  br i1 %cmp15, label %if.then16, label %if.else18

if.then16:                                        ; preds = %for.end14
  %arrayidx17 = getelementptr inbounds i32, i32* %out_2, i64 0
  store i32 2, i32* %arrayidx17, align 4
  br label %if.end21

if.else18:                                        ; preds = %for.end14
  %arrayidx19 = getelementptr inbounds i32, i32* %val_arr, i64 0
  %2 = load i32, i32* %arrayidx19, align 4
  %mul = mul nsw i32 %2, 3
  %arrayidx20 = getelementptr inbounds i32, i32* %out_2, i64 0
  store i32 %mul, i32* %arrayidx20, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then16, %if.else18, %if.then
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"}
