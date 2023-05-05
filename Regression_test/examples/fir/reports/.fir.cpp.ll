; ModuleID = 'src/fir.cpp'
source_filename = "src/fir.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @_Z3firiPi(i32 %arg_1, i32* %A) #0 {
entry:
  %arg_1.addr = alloca i32, align 4
  %A.addr = alloca i32*, align 8
  %acc = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %arg_1, i32* %arg_1.addr, align 4
  store i32* %A, i32** %A.addr, align 8
  store i32 1, i32* %acc, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %arg_1.addr, align 4
  %rem = srem i32 %1, 2
  %tobool = icmp ne i32 %rem, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %2 = load i32*, i32** %A.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %acc, align 4
  %mul = mul nsw i32 %5, %4
  store i32 %mul, i32* %acc, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %6 = load i32*, i32** %A.addr, align 8
  %7 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %7, 1
  %idxprom1 = sext i32 %sub to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1
  %8 = load i32, i32* %arrayidx2, align 4
  %9 = load i32, i32* %acc, align 4
  %add = add nsw i32 %9, %8
  store i32 %add, i32* %acc, align 4
  %10 = load i32, i32* %arg_1.addr, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %arg_1.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc3 = add nsw i32 %11, 1
  store i32 %inc3, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %acc, align 4
  ret i32 %12
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %A = alloca [10 x i32], align 16
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4
  %2 = load i32, i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %A, i64 0, i64 %idxprom
  store i32 %1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %j, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc4, %for.end
  %4 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %4, 10
  br i1 %cmp2, label %for.body3, label %for.end6

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %i, align 4
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %A, i32 0, i32 0
  %call = call i32 @_Z3firiPi(i32 %5, i32* %arraydecay)
  br label %for.inc4

for.inc4:                                         ; preds = %for.body3
  %6 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %6, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond1

for.end6:                                         ; preds = %for.cond1
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"}
