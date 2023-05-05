	.text
	.file	"fir.cpp"
	.globl	_Z3firiPi               # -- Begin function _Z3firiPi
	.p2align	4, 0x90
	.type	_Z3firiPi,@function
_Z3firiPi:                              # @_Z3firiPi
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$2, %eax
	movl	$1, %ecx
	movl	%eax, -4(%rbp)          # 4-byte Spill
	movq	%rsi, -16(%rbp)         # 8-byte Spill
	movl	%edi, -20(%rbp)         # 4-byte Spill
	movl	%ecx, -24(%rbp)         # 4-byte Spill
	jmp	.LBB0_1
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax         # 4-byte Reload
	movl	-4(%rbp), %ecx          # 4-byte Reload
	movl	-20(%rbp), %edx         # 4-byte Reload
	movl	%edx, %esi
	andl	$1, %esi
	cmpl	$0, %esi
	movl	%eax, -28(%rbp)         # 4-byte Spill
	movl	%ecx, -32(%rbp)         # 4-byte Spill
	movl	%edx, -36(%rbp)         # 4-byte Spill
	je	.LBB0_3
# %bb.2:                                # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-32(%rbp), %eax         # 4-byte Reload
	movl	%eax, %ecx
	movl	%ecx, %edx
	movl	-28(%rbp), %ecx         # 4-byte Reload
	movq	-16(%rbp), %rsi         # 8-byte Reload
	imull	(%rsi,%rdx,4), %ecx
	movl	-36(%rbp), %edi         # 4-byte Reload
	movl	%ecx, -40(%rbp)         # 4-byte Spill
	movl	%edi, -44(%rbp)         # 4-byte Spill
	jmp	.LBB0_4
.LBB0_3:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-32(%rbp), %eax         # 4-byte Reload
	addl	$-1, %eax
	movslq	%eax, %rcx
	movl	-28(%rbp), %eax         # 4-byte Reload
	movq	-16(%rbp), %rdx         # 8-byte Reload
	addl	(%rdx,%rcx,4), %eax
	movl	-36(%rbp), %esi         # 4-byte Reload
	addl	$1, %esi
	movl	%eax, -40(%rbp)         # 4-byte Spill
	movl	%esi, -44(%rbp)         # 4-byte Spill
.LBB0_4:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %eax         # 4-byte Reload
	movl	-40(%rbp), %ecx         # 4-byte Reload
	movl	-32(%rbp), %edx         # 4-byte Reload
	addl	$1, %edx
	cmpl	$10, %edx
	movl	%ecx, %esi
	movl	%eax, -20(%rbp)         # 4-byte Spill
	movl	%ecx, -48(%rbp)         # 4-byte Spill
	movl	%edx, -4(%rbp)          # 4-byte Spill
	movl	%esi, -24(%rbp)         # 4-byte Spill
	jb	.LBB0_1
# %bb.5:                                # %for.end
	movl	-48(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_Z3firiPi, .Lfunc_end0-_Z3firiPi
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%eax, %eax
	movl	%eax, -52(%rbp)         # 4-byte Spill
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rbp), %eax         # 4-byte Reload
	movl	%eax, %ecx
	movl	%ecx, %edx
	movl	%eax, -48(%rbp,%rdx,4)
	addl	$1, %eax
	cmpl	$10, %eax
	movl	%eax, -52(%rbp)         # 4-byte Spill
	jb	.LBB1_1
# %bb.2:                                # %for.end
	xorl	%eax, %eax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	jmp	.LBB1_3
.LBB1_3:                                # %for.body3
                                        # =>This Inner Loop Header: Depth=1
	movl	-56(%rbp), %eax         # 4-byte Reload
	leaq	-48(%rbp), %rsi
	movl	%eax, %edi
	movl	%eax, -60(%rbp)         # 4-byte Spill
	callq	_Z3firiPi
	movl	-60(%rbp), %edi         # 4-byte Reload
	addl	$1, %edi
	cmpl	$10, %edi
	movl	%eax, -64(%rbp)         # 4-byte Spill
	movl	%edi, -56(%rbp)         # 4-byte Spill
	jb	.LBB1_3
# %bb.4:                                # %for.end6
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"
	.section	".note.GNU-stack","",@progbits
