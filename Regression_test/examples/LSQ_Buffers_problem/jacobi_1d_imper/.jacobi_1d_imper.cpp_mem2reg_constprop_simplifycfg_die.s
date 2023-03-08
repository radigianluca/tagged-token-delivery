	.text
	.file	"jacobi_1d_imper.cpp"
	.globl	_Z15jacobi_1d_imperPiS_ # -- Begin function _Z15jacobi_1d_imperPiS_
	.p2align	4, 0x90
	.type	_Z15jacobi_1d_imperPiS_,@function
_Z15jacobi_1d_imperPiS_:                # @_Z15jacobi_1d_imperPiS_
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)          # 8-byte Spill
	movq	%rsi, -16(%rbp)         # 8-byte Spill
	movl	%ecx, -20(%rbp)         # 4-byte Spill
	movl	%eax, -24(%rbp)         # 4-byte Spill
	jmp	.LBB0_1
.LBB0_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #     Child Loop BB0_4 Depth 2
	movl	-24(%rbp), %eax         # 4-byte Reload
	movl	-20(%rbp), %ecx         # 4-byte Reload
	movl	$1, %edx
	movl	%eax, -28(%rbp)         # 4-byte Spill
	movl	%ecx, -32(%rbp)         # 4-byte Spill
	movl	%edx, -36(%rbp)         # 4-byte Spill
.LBB0_2:                                # %for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-36(%rbp), %eax         # 4-byte Reload
	movl	%eax, %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rdx
	movq	-8(%rbp), %rsi          # 8-byte Reload
	movl	(%rsi,%rdx,4), %ecx
	movl	%eax, %edi
	movl	%edi, %edx
	addl	(%rsi,%rdx,4), %ecx
	movl	%eax, %edi
	addl	$1, %edi
	movl	%edi, %edi
	movl	%edi, %edx
	addl	(%rsi,%rdx,4), %ecx
	imull	$3, %ecx, %ecx
	movl	%eax, %edi
	movl	%edi, %edx
	movq	-16(%rbp), %r8          # 8-byte Reload
	movl	%ecx, (%r8,%rdx,4)
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, -36(%rbp)         # 4-byte Spill
	jb	.LBB0_2
# %bb.3:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$1, %eax
	movl	-32(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, -40(%rbp)         # 4-byte Spill
	movl	%eax, -44(%rbp)         # 4-byte Spill
	jmp	.LBB0_4
.LBB0_4:                                # %for.body14
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax         # 4-byte Reload
	movl	-40(%rbp), %ecx         # 4-byte Reload
	movl	%eax, %edx
	movl	%edx, %esi
	movq	-16(%rbp), %rdi         # 8-byte Reload
	addl	(%rdi,%rsi,4), %ecx
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%ecx, %edx
	movl	%ecx, -48(%rbp)         # 4-byte Spill
	movl	%edx, -40(%rbp)         # 4-byte Spill
	movl	%eax, -44(%rbp)         # 4-byte Spill
	jb	.LBB0_4
# %bb.5:                                # %for.inc21
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax         # 4-byte Reload
	addl	$1, %eax
	cmpl	$3, %eax
	movl	-48(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, -20(%rbp)         # 4-byte Spill
	movl	%eax, -24(%rbp)         # 4-byte Spill
	jb	.LBB0_1
# %bb.6:                                # %for.end23
	movl	-48(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_Z15jacobi_1d_imperPiS_, .Lfunc_end0-_Z15jacobi_1d_imperPiS_
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
	subq	$816, %rsp              # imm = 0x330
.LBB1_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%eax, %eax
	movl	%eax, -804(%rbp)        # 4-byte Spill
	jmp	.LBB1_2
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-804(%rbp), %eax        # 4-byte Reload
	movl	%eax, -808(%rbp)        # 4-byte Spill
	callq	rand
	movl	$100, %ecx
	cltd
	idivl	%ecx
	movl	-808(%rbp), %ecx        # 4-byte Reload
	movl	%ecx, %esi
	movl	%esi, %edi
	movl	%edx, -400(%rbp,%rdi,4)
	callq	rand
	movl	$100, %ecx
	cltd
	idivl	%ecx
	movl	-808(%rbp), %ecx        # 4-byte Reload
	movl	%ecx, %esi
	movl	%esi, %edi
	movl	%edx, -800(%rbp,%rdi,4)
	addl	$1, %ecx
	cmpl	$100, %ecx
	movl	%ecx, -804(%rbp)        # 4-byte Spill
	jb	.LBB1_2
# %bb.3:                                # %for.inc12
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	testb	$1, %cl
	jne	.LBB1_1
	jmp	.LBB1_4
.LBB1_4:                                # %for.end14
	leaq	-800(%rbp), %rsi
	leaq	-400(%rbp), %rdi
	callq	_Z15jacobi_1d_imperPiS_
	xorl	%ecx, %ecx
	movl	%eax, -812(%rbp)        # 4-byte Spill
	movl	%ecx, %eax
	addq	$816, %rsp              # imm = 0x330
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 6.0.1 (http://llvm.org/git/clang.git 2f27999df400d17b33cdd412fdd606a88208dfcc) (http://llvm.org/git/llvm.git 5136df4d089a086b70d452160ad5451861269498)"
	.section	".note.GNU-stack","",@progbits
