	.text
	.file	"fir.cpp"
	.globl	_Z3firi                 # -- Begin function _Z3firi
	.p2align	4, 0x90
	.type	_Z3firi,@function
_Z3firi:                                # @_Z3firi
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%edi, -4(%rbp)          # 4-byte Spill
	movl	%ecx, -8(%rbp)          # 4-byte Spill
	movl	%eax, -12(%rbp)         # 4-byte Spill
	jmp	.LBB0_1
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax         # 4-byte Reload
	movl	-8(%rbp), %ecx          # 4-byte Reload
	movl	-4(%rbp), %edx          # 4-byte Reload
	addl	%edx, %eax
	addl	$1, %ecx
	cmpl	$5, %ecx
	movl	%eax, %esi
	movl	%eax, -16(%rbp)         # 4-byte Spill
	movl	%ecx, -8(%rbp)          # 4-byte Spill
	movl	%esi, -12(%rbp)         # 4-byte Spill
	jb	.LBB0_1
# %bb.2:                                # %for.end
	movl	-16(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_Z3firi, .Lfunc_end0-_Z3firi
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
	subq	$48, %rsp
	movl	$13, %edi
	callq	srand
	xorl	%edi, %edi
	movl	%edi, -8(%rbp)          # 4-byte Spill
.LBB1_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movl	-8(%rbp), %eax          # 4-byte Reload
	xorl	%ecx, %ecx
	movl	%eax, %edx
	addl	$5, %edx
	movl	%edx, -4(%rbp)
	movl	%eax, -12(%rbp)         # 4-byte Spill
	movl	%ecx, -16(%rbp)         # 4-byte Spill
.LBB1_2:                                # %for.body8
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax         # 4-byte Reload
	movl	%eax, -20(%rbp)         # 4-byte Spill
	callq	rand
	movl	%eax, -24(%rbp)         # 4-byte Spill
	callq	rand
	movl	%eax, -28(%rbp)         # 4-byte Spill
	callq	rand
	movl	-20(%rbp), %ecx         # 4-byte Reload
	addl	$1, %ecx
	cmpl	$30, %ecx
	movl	%eax, -32(%rbp)         # 4-byte Spill
	movl	%ecx, -16(%rbp)         # 4-byte Spill
	jb	.LBB1_2
# %bb.3:                                # %for.inc25
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movl	-12(%rbp), %eax         # 4-byte Reload
	addl	$1, %eax
	testb	$1, %cl
	movl	%eax, -8(%rbp)          # 4-byte Spill
	jne	.LBB1_1
# %bb.4:                                # %for.end27
	jmp	.LBB1_5
.LBB1_5:                                # %for.body31
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %edi
	callq	_Z3firi
	xorl	%edi, %edi
	movb	%dil, %cl
	testb	$1, %cl
	movl	%eax, -36(%rbp)         # 4-byte Spill
	jne	.LBB1_5
# %bb.6:                                # %for.end37
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"
	.section	".note.GNU-stack","",@progbits
