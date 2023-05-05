; ModuleID = '.fir.cpp_mem2reg_constprop.ll'
source_filename = "src/fir.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z3firiPi(i32 %arg_1, i32* %A) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %arg_1.addr.03 = phi i32 [ %arg_1, %entry ], [ %arg_1.addr.1, %for.inc ]
  %i.02 = phi i32 [ 2, %entry ], [ %inc3, %for.inc ]
  %acc.01 = phi i32 [ 1, %entry ], [ %acc.1, %for.inc ]
  %rem = srem i32 %arg_1.addr.03, 2
  %tobool = icmp ne i32 %rem, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %idxprom = sext i32 %i.02 to i64
  %arrayidx = getelementptr inbounds i32, i32* %A, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %mul = mul nsw i32 %acc.01, %0
  br label %for.inc

if.else:                                          ; preds = %for.body
  %sub = sub nsw i32 %i.02, 1
  %idxprom1 = sext i32 %sub to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %A, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4
  %add = add nsw i32 %acc.01, %1
  %inc = add nsw i32 %arg_1.addr.03, 1
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %acc.1 = phi i32 [ %mul, %if.then ], [ %add, %if.else ]
  %arg_1.addr.1 = phi i32 [ %arg_1.addr.03, %if.then ], [ %inc, %if.else ]
  %inc3 = add nsw i32 %i.02, 1
  %cmp = icmp slt i32 %inc3, 10
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %acc.0.lcssa = phi i32 [ %acc.1, %for.inc ]
  ret i32 %acc.0.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #1 {
entry:
  %A = alloca [10 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %j.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %idxprom = sext i32 %j.02 to i64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %A, i64 0, i64 %idxprom
  store i32 %j.02, i32* %arrayidx, align 4
  %inc = add nsw i32 %j.02, 1
  %cmp = icmp slt i32 %inc, 10
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.end
  %i.01 = phi i32 [ 0, %for.end ], [ %inc5, %for.body3 ]
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %A, i32 0, i32 0
  %call = call i32 @_Z3firiPi(i32 %i.01, i32* %arraydecay)
  %inc5 = add nsw i32 %i.01, 1
  %cmp2 = icmp slt i32 %inc5, 10
  br i1 %cmp2, label %for.body3, label %for.end6

for.end6:                                         ; preds = %for.body3
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"}
