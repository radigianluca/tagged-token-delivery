; ModuleID = '.fir.cpp_mem2reg_constprop.ll'
source_filename = "src/fir.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z3firi(i32 %arg_1) #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %fact.0 = phi i32 [ 1, %entry ], [ %mul, %do.body ]
  %arg_1.addr.0 = phi i32 [ %arg_1, %entry ], [ %dec, %do.body ]
  %mul = mul nsw i32 %fact.0, %arg_1.addr.0
  %dec = add nsw i32 %arg_1.addr.0, -1
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %mul.lcssa = phi i32 [ %mul, %do.body ]
  ret i32 %mul.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #1 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.01 = phi i32 [ 10, %entry ], [ %inc, %for.body ]
  %call = call i32 @_Z3firi(i32 %i.01)
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 110
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"}
