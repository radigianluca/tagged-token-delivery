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
	movl	%edi, -4(%rbp)          # 4-byte Spill
	movl	%eax, -8(%rbp)          # 4-byte Spill
	jmp	.LBB0_1
.LBB0_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	-8(%rbp), %eax          # 4-byte Reload
	movl	-4(%rbp), %ecx          # 4-byte Reload
	xorl	%edx, %edx
	movl	%eax, -12(%rbp)         # 4-byte Spill
	movl	%ecx, -16(%rbp)         # 4-byte Spill
	movl	%edx, -20(%rbp)         # 4-byte Spill
.LBB0_2:                                # %for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%rbp), %eax         # 4-byte Reload
	movl	-16(%rbp), %ecx         # 4-byte Reload
	movl	-12(%rbp), %edx         # 4-byte Reload
	addl	%eax, %edx
	imull	%edx, %ecx
	addl	$1, %eax
	cmpl	$10, %eax
	movl	%ecx, %edx
	movl	%ecx, -24(%rbp)         # 4-byte Spill
	movl	%edx, -16(%rbp)         # 4-byte Spill
	movl	%eax, -20(%rbp)         # 4-byte Spill
	jb	.LBB0_2
# %bb.3:                                # %for.inc4
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax         # 4-byte Reload
	addl	$1, %eax
	cmpl	$10, %eax
	movl	-24(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, -4(%rbp)          # 4-byte Spill
	movl	%eax, -8(%rbp)          # 4-byte Spill
	jb	.LBB0_1
# %bb.4:                                # %for.end6
	movl	-24(%rbp), %eax         # 4-byte Reload
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
	subq	$16, %rsp
	xorl	%eax, %eax
	movl	%eax, -4(%rbp)          # 4-byte Spill
	jmp	.LBB1_1
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax          # 4-byte Reload
	movl	%eax, %edi
	movl	%eax, -8(%rbp)          # 4-byte Spill
	callq	_Z3firi
	movl	-8(%rbp), %edi          # 4-byte Reload
	addl	$1, %edi
	cmpl	$100, %edi
	movl	%eax, -12(%rbp)         # 4-byte Spill
	movl	%edi, -4(%rbp)          # 4-byte Spill
	jb	.LBB1_1
# %bb.2:                                # %for.end
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"
	.section	".note.GNU-stack","",@progbits
