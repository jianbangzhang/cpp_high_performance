	.file	"crtp_complete_guide.cpp"
	.text
	.section	.text._ZNK13CircleVirtual4areaEv,"axG",@progbits,_ZNK13CircleVirtual4areaEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNK13CircleVirtual4areaEv
	.type	_ZNK13CircleVirtual4areaEv, @function
_ZNK13CircleVirtual4areaEv:
.LFB4354:
	.cfi_startproc
	endbr64
	vmovsd	8(%rdi), %xmm1
	vmulsd	.LC0(%rip), %xmm1, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4354:
	.size	_ZNK13CircleVirtual4areaEv, .-_ZNK13CircleVirtual4areaEv
	.section	.text._ZNK13CircleVirtual9perimeterEv,"axG",@progbits,_ZNK13CircleVirtual9perimeterEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNK13CircleVirtual9perimeterEv
	.type	_ZNK13CircleVirtual9perimeterEv, @function
_ZNK13CircleVirtual9perimeterEv:
.LFB4355:
	.cfi_startproc
	endbr64
	vmovsd	.LC1(%rip), %xmm0
	vmulsd	8(%rdi), %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4355:
	.size	_ZNK13CircleVirtual9perimeterEv, .-_ZNK13CircleVirtual9perimeterEv
	.section	.text._ZNK16RectangleVirtual4areaEv,"axG",@progbits,_ZNK16RectangleVirtual4areaEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNK16RectangleVirtual4areaEv
	.type	_ZNK16RectangleVirtual4areaEv, @function
_ZNK16RectangleVirtual4areaEv:
.LFB4359:
	.cfi_startproc
	endbr64
	vmovsd	8(%rdi), %xmm0
	vmulsd	16(%rdi), %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4359:
	.size	_ZNK16RectangleVirtual4areaEv, .-_ZNK16RectangleVirtual4areaEv
	.section	.text._ZNK16RectangleVirtual9perimeterEv,"axG",@progbits,_ZNK16RectangleVirtual9perimeterEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNK16RectangleVirtual9perimeterEv
	.type	_ZNK16RectangleVirtual9perimeterEv, @function
_ZNK16RectangleVirtual9perimeterEv:
.LFB4360:
	.cfi_startproc
	endbr64
	vmovsd	8(%rdi), %xmm0
	vaddsd	16(%rdi), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4360:
	.size	_ZNK16RectangleVirtual9perimeterEv, .-_ZNK16RectangleVirtual9perimeterEv
	.section	.text._ZN13CircleVirtualD2Ev,"axG",@progbits,_ZN13CircleVirtualD5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN13CircleVirtualD2Ev
	.type	_ZN13CircleVirtualD2Ev, @function
_ZN13CircleVirtualD2Ev:
.LFB5269:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE5269:
	.size	_ZN13CircleVirtualD2Ev, .-_ZN13CircleVirtualD2Ev
	.weak	_ZN13CircleVirtualD1Ev
	.set	_ZN13CircleVirtualD1Ev,_ZN13CircleVirtualD2Ev
	.section	.text._ZN16RectangleVirtualD2Ev,"axG",@progbits,_ZN16RectangleVirtualD5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN16RectangleVirtualD2Ev
	.type	_ZN16RectangleVirtualD2Ev, @function
_ZN16RectangleVirtualD2Ev:
.LFB5301:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE5301:
	.size	_ZN16RectangleVirtualD2Ev, .-_ZN16RectangleVirtualD2Ev
	.weak	_ZN16RectangleVirtualD1Ev
	.set	_ZN16RectangleVirtualD1Ev,_ZN16RectangleVirtualD2Ev
	.section	.text._ZN13CircleVirtualD0Ev,"axG",@progbits,_ZN13CircleVirtualD5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN13CircleVirtualD0Ev
	.type	_ZN13CircleVirtualD0Ev, @function
_ZN13CircleVirtualD0Ev:
.LFB5271:
	.cfi_startproc
	endbr64
	movl	$16, %esi
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5271:
	.size	_ZN13CircleVirtualD0Ev, .-_ZN13CircleVirtualD0Ev
	.section	.text._ZN16RectangleVirtualD0Ev,"axG",@progbits,_ZN16RectangleVirtualD5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN16RectangleVirtualD0Ev
	.type	_ZN16RectangleVirtualD0Ev, @function
_ZN16RectangleVirtualD0Ev:
.LFB5303:
	.cfi_startproc
	endbr64
	movl	$24, %esi
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5303:
	.size	_ZN16RectangleVirtualD0Ev, .-_ZN16RectangleVirtualD0Ev
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"basic_string: construction from null is not valid"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0:
.LFB5923:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%r13, (%rdi)
	testq	%rsi, %rsi
	je	.L20
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	movq	%rsi, %r12
	call	strlen@PLT
	movq	%rax, %rbx
	cmpq	$15, %rax
	ja	.L21
	cmpq	$1, %rax
	je	.L22
	testq	%rax, %rax
	jne	.L13
.L15:
	movq	0(%rbp), %rax
	movq	%rbx, 8(%rbp)
	movb	$0, (%rax,%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	movzbl	(%r12), %eax
	movb	%al, 16(%rbp)
	jmp	.L15
.L21:
	leaq	1(%rax), %rdi
	call	_Znwm@PLT
	movq	%rbx, 16(%rbp)
	movq	%rax, 0(%rbp)
	movq	%rax, %r13
.L13:
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	memcpy@PLT
	jmp	.L15
.L20:
	leaq	.LC2(%rip), %rdi
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE5923:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5EOS4_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_:
.LFB4701:
	.cfi_startproc
	endbr64
	leaq	16(%rdi), %rcx
	leaq	16(%rsi), %r8
	movq	%rsi, %rax
	movq	%rcx, (%rdi)
	movq	(%rsi), %rdx
	movq	8(%rsi), %rsi
	cmpq	%r8, %rdx
	je	.L39
	movq	%rdx, (%rdi)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rdi)
.L31:
	movq	%rsi, 8(%rdi)
	movq	%r8, (%rax)
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	1(%rsi), %rdx
	cmpl	$8, %edx
	jnb	.L25
	testb	$4, %dl
	jne	.L40
	testl	%edx, %edx
	je	.L31
	movzbl	16(%rax), %esi
	movb	%sil, 16(%rdi)
	testb	$2, %dl
	je	.L38
	movl	%edx, %edx
	movzwl	-2(%r8,%rdx), %esi
	movw	%si, -2(%rcx,%rdx)
	movq	8(%rax), %rsi
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L25:
	movq	16(%rax), %rsi
	movq	%r8, %r11
	movq	%rsi, 16(%rdi)
	movl	%edx, %esi
	movq	-8(%r8,%rsi), %r9
	movq	%r9, -8(%rcx,%rsi)
	leaq	24(%rdi), %r9
	andq	$-8, %r9
	subq	%r9, %rcx
	addl	%ecx, %edx
	subq	%rcx, %r11
	andl	$-8, %edx
	cmpl	$8, %edx
	jb	.L38
	andl	$-8, %edx
	xorl	%ecx, %ecx
.L29:
	movl	%ecx, %esi
	addl	$8, %ecx
	movq	(%r11,%rsi), %r10
	movq	%r10, (%r9,%rsi)
	cmpl	%edx, %ecx
	jb	.L29
.L38:
	movq	8(%rax), %rsi
	jmp	.L31
.L40:
	movl	16(%rax), %esi
	movl	%edx, %edx
	movl	%esi, 16(%rdi)
	movl	-4(%r8,%rdx), %esi
	movl	%esi, -4(%rcx,%rdx)
	movq	8(%rax), %rsi
	jmp	.L31
	.cfi_endproc
.LFE4701:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_
	.section	.rodata._ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text._ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEEC5ESt16initializer_listIdERKS0_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_
	.type	_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_, @function
_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_:
.LFB4959:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4959
	endbr64
	movabsq	$9223372036854775800, %rax
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	vpxor	%xmm0, %xmm0, %xmm0
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	0(,%rdx,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	$0, 16(%rdi)
	vmovdqu	%xmm0, (%rdi)
	cmpq	%rbp, %rax
	jb	.L57
	testq	%rbp, %rbp
	je	.L58
	movq	%rbp, %rdi
	movq	%rsi, %r12
.LEHB0:
	call	_Znwm@PLT
	leaq	(%rax,%rbp), %r13
	movq	%rax, (%rbx)
	movq	%rax, %rdi
	movq	%r13, 16(%rbx)
	cmpq	$8, %rbp
	jle	.L45
	movq	%rbp, %rdx
	movq	%r12, %rsi
	call	memcpy@PLT
.L44:
	movq	%r13, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_restore_state
	xorl	%r13d, %r13d
	movq	$0, (%rdi)
	movq	$0, 16(%rdi)
	movq	%r13, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
	vmovsd	(%r12), %xmm0
	vmovsd	%xmm0, (%rax)
	jmp	.L44
.L57:
	leaq	.LC3(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE0:
.L49:
	endbr64
	movq	%rax, %rbp
.L47:
	movq	(%rbx), %rdi
	movq	16(%rbx), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L54
	vzeroupper
	call	_ZdlPvm@PLT
.L48:
	movq	%rbp, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
.L54:
	vzeroupper
	jmp	.L48
	.cfi_endproc
.LFE4959:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_,"aG",@progbits,_ZNSt6vectorIdSaIdEEC5ESt16initializer_listIdERKS0_,comdat
.LLSDA4959:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4959-.LLSDACSB4959
.LLSDACSB4959:
	.uleb128 .LEHB0-.LFB4959
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L49-.LFB4959
	.uleb128 0
	.uleb128 .LEHB1-.LFB4959
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE4959:
	.section	.text._ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEEC5ESt16initializer_listIdERKS0_,comdat
	.size	_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_, .-_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_
	.weak	_ZNSt6vectorIdSaIdEEC1ESt16initializer_listIdERKS0_
	.set	_ZNSt6vectorIdSaIdEEC1ESt16initializer_listIdERKS0_,_ZNSt6vectorIdSaIdEEC2ESt16initializer_listIdERKS0_
	.section	.text._ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev,"axG",@progbits,_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev
	.type	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev, @function
_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev:
.LFB4971:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	8(%rdi), %rbp
	movq	(%rdi), %rbx
	cmpq	%rbx, %rbp
	je	.L60
	.p2align 4,,10
	.p2align 3
.L64:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L61
	movq	(%rdi), %rax
	addq	$8, %rbx
	call	*8(%rax)
	cmpq	%rbx, %rbp
	jne	.L64
.L63:
	movq	(%r12), %rbx
.L60:
	testq	%rbx, %rbx
	je	.L66
	movq	16(%r12), %rsi
	movq	%rbx, %rdi
	subq	%rbx, %rsi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
	addq	$8, %rbx
	cmpq	%rbx, %rbp
	jne	.L64
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L66:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4971:
	.size	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev, .-_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev
	.weak	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED1Ev
	.set	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED1Ev,_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED2Ev
	.section	.text._ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E,"axG",@progbits,_ZN3VecC5I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E,comdat
	.align 2
	.p2align 4
	.weak	_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E
	.type	_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E, @function
_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E:
.LFB5053:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	(%rsi), %rax
	movq	(%rax), %rax
	movq	8(%rax), %r13
	subq	(%rax), %r13
	movabsq	$9223372036854775800, %rax
	movq	%r13, %r8
	sarq	$3, %r8
	cmpq	%r13, %rax
	jb	.L106
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rdi)
	movq	%rdi, %r12
	vmovdqu	%xmm0, (%rdi)
	testq	%r8, %r8
	je	.L107
	movq	%r13, %rdi
	movq	%r8, 24(%rsp)
	movq	%r8, %r14
	movq	%rsi, %r15
	call	_Znwm@PLT
	movq	24(%rsp), %r8
	leaq	(%rax,%r13), %rcx
	movq	%rax, (%r12)
	movq	%rax, %rbx
	leaq	8(%rax), %rdi
	movq	%rcx, 16(%r12)
	movq	$0x000000000, (%rax)
	cmpq	$1, %r8
	je	.L72
	cmpq	%rdi, %rcx
	je	.L73
	xorl	%esi, %esi
	leaq	-8(%r13), %rdx
	movq	%rcx, 16(%rsp)
	call	memset@PLT
	movq	16(%rsp), %rcx
	movq	24(%rsp), %r8
	cmpq	%rbx, %rcx
	movq	%rcx, 8(%r12)
	je	.L104
	movq	(%r15), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	movq	8(%r15), %rax
	movq	(%rdx), %rdx
	leaq	8(%rcx), %rdi
	movq	(%rax), %rsi
	movq	%rbx, %rax
	subq	%rdi, %rax
	leaq	8(%rdx), %r9
	cmpq	$16, %rax
	movq	%rbx, %rax
	seta	%dil
	subq	%r9, %rax
	cmpq	$16, %rax
	seta	%al
	testb	%al, %dil
	je	.L85
	leaq	8(%rsi), %rdi
	movq	%rbx, %rax
	subq	%rdi, %rax
	cmpq	$16, %rax
	jbe	.L85
	testq	%r8, %r8
	movl	$1, %edi
	cmovne	%r8, %rdi
	cmpq	$24, %r13
	jbe	.L88
	movq	%rdi, %r8
	xorl	%eax, %eax
	shrq	$2, %r8
	salq	$5, %r8
	.p2align 4,,10
	.p2align 3
.L76:
	vmovupd	(%rdx,%rax), %ymm1
	vaddpd	(%rcx,%rax), %ymm1, %ymm0
	vaddpd	(%rsi,%rax), %ymm0, %ymm0
	vmovupd	%ymm0, (%rbx,%rax)
	addq	$32, %rax
	cmpq	%rax, %r8
	jne	.L76
	movq	%rdi, %rax
	andq	$-4, %rax
	testb	$3, %dil
	je	.L108
	vzeroupper
.L75:
	subq	%rax, %rdi
	cmpq	$1, %rdi
	je	.L80
	vmovupd	(%rdx,%rax,8), %xmm2
	vaddpd	(%rcx,%rax,8), %xmm2, %xmm0
	vaddpd	(%rsi,%rax,8), %xmm0, %xmm0
	vmovupd	%xmm0, (%rbx,%rax,8)
	testb	$1, %dil
	je	.L104
	andq	$-2, %rdi
	addq	%rdi, %rax
.L80:
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	(%rcx,%rax,8), %xmm0, %xmm0
	vaddsd	(%rsi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
.L104:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L107:
	.cfi_restore_state
	movq	$0, 16(%rdi)
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore_state
	movq	(%r15), %rax
	movq	%rdi, 8(%r12)
	movq	(%rax), %rdx
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	movq	8(%r15), %rax
	movq	(%rdx), %rdx
	movq	(%rax), %rsi
.L85:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L82:
	vmovsd	(%rcx,%rax,8), %xmm0
	vaddsd	(%rdx,%rax,8), %xmm0, %xmm0
	vaddsd	(%rsi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpq	%r14, %rax
	jb	.L82
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L88:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L75
.L108:
	vzeroupper
	jmp	.L104
.L73:
	movq	(%r15), %rax
	movq	%rcx, 8(%r12)
	movl	$1, %r14d
	movq	(%rax), %rdx
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	movq	8(%r15), %rax
	movq	(%rdx), %rdx
	movq	(%rax), %rsi
	jmp	.L85
.L106:
	leaq	.LC3(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE5053:
	.size	_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E, .-_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E
	.weak	_ZN3VecC1I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E
	.set	_ZN3VecC1I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E,_ZN3VecC2I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv:
.LFB5090:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	leaq	16(%rdi), %rdx
	cmpq	%rdx, %rax
	je	.L111
	movq	16(%rdi), %rsi
	movq	%rax, %rdi
	addq	$1, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L111:
	ret
	.cfi_endproc
.LFE5090:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.section	.rodata._ZNK9PrintableI6PersonE5printEv.str1.1,"aMS",@progbits,1
.LC6:
	.string	"basic_string::_M_create"
.LC7:
	.string	"basic_string::append"
.LC8:
	.string	"basic_string::_M_replace"
.LC9:
	.string	"\n"
	.section	.text._ZNK9PrintableI6PersonE5printEv,"axG",@progbits,_ZNK9PrintableI6PersonE5printEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNK9PrintableI6PersonE5printEv
	.type	_ZNK9PrintableI6PersonE5printEv, @function
_ZNK9PrintableI6PersonE5printEv:
.LFB5034:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5034
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	movl	32(%rdi), %eax
	movl	%eax, %edi
	movl	%eax, %ecx
	shrl	$31, %edi
	negl	%ecx
	cmovs	%eax, %ecx
	movl	%edi, %edx
	cmpl	$9, %ecx
	jbe	.L341
	cmpl	$99, %ecx
	jbe	.L342
	cmpl	$999, %ecx
	jbe	.L343
	movl	%ecx, %eax
	cmpl	$9999, %ecx
	jbe	.L344
	cmpq	$99999, %rax
	jbe	.L345
	cmpq	$999999, %rax
	jbe	.L346
	cmpq	$9999999, %rax
	jbe	.L246
	cmpq	$99999999, %rax
	jbe	.L247
	cmpq	$999999999, %rax
	jbe	.L248
	movl	$5, %eax
	movl	$9, %esi
.L124:
	addl	$5, %eax
.L122:
	leaq	96(%rsp), %rbp
	addl	%edx, %eax
	movq	%rbp, 80(%rsp)
	movl	%eax, %eax
.L115:
	cmpq	$1, %rax
	jne	.L117
	movq	80(%rsp), %rbx
	movb	$45, 96(%rsp)
	leaq	1(%rbx), %rdx
	jmp	.L126
.L342:
	leaq	96(%rsp), %rbp
	leal	2(%rdi), %eax
	movl	$1, %esi
	movq	%rbp, 80(%rsp)
.L117:
	movabsq	$3255307777713450285, %r11
	movl	%eax, %r9d
	movq	%rbp, %rdx
	cmpl	$8, %eax
	jnb	.L347
.L127:
	testb	$4, %r9b
	jne	.L348
	testb	$2, %r9b
	jne	.L349
.L131:
	andl	$1, %r9d
	jne	.L350
.L132:
	movq	80(%rsp), %rdx
	addq	%rax, %rdx
.L126:
	movq	%rax, 88(%rsp)
	movzbl	%dil, %edi
	movb	$0, (%rdx)
	addq	80(%rsp), %rdi
	cmpl	$99, %ecx
	jbe	.L133
	leaq	_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits(%rip), %r9
	.p2align 4,,10
	.p2align 3
.L134:
	movl	%ecx, %edx
	movl	%ecx, %eax
	imulq	$1374389535, %rdx, %rdx
	shrq	$37, %rdx
	imull	$100, %edx, %r10d
	subl	%r10d, %eax
	movl	%ecx, %r10d
	movl	%edx, %ecx
	movl	%esi, %edx
	addl	%eax, %eax
	leal	1(%rax), %r11d
	movzbl	(%r9,%rax), %eax
	movzbl	(%r9,%r11), %r11d
	movb	%r11b, (%rdi,%rdx)
	leal	-1(%rsi), %edx
	subl	$2, %esi
	movb	%al, (%rdi,%rdx)
	cmpl	$9999, %r10d
	ja	.L134
.L133:
	leal	48(%rcx), %eax
	cmpl	$9, %ecx
	jbe	.L136
	addl	%ecx, %ecx
	leaq	_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits(%rip), %rax
	leal	1(%rcx), %edx
	movzbl	(%rax,%rdx), %edx
	movzbl	(%rax,%rcx), %eax
	movb	%dl, 1(%rdi)
.L136:
	movb	%al, (%rdi)
	movq	8(%r8), %r12
	leaq	64(%rsp), %rbx
	movq	%rbx, 48(%rsp)
	movq	(%r8), %r13
	cmpq	$15, %r12
	ja	.L351
	cmpq	$1, %r12
	je	.L352
	testq	%r12, %r12
	jne	.L353
.L143:
	movq	%rbx, %rax
.L142:
	movq	%r12, 56(%rsp)
	movb	$0, (%rax,%r12)
	movq	56(%rsp), %r12
	movabsq	$9223372036854775807, %rax
	subq	%r12, %rax
	cmpq	$1, %rax
	jbe	.L354
	movq	48(%rsp), %rax
	leaq	2(%r12), %r13
	cmpq	%rbx, %rax
	je	.L355
	movq	64(%rsp), %r15
	cmpq	%r13, %r15
	jb	.L148
.L146:
	movl	$10272, %edx
	movw	%dx, (%rax,%r12)
	movq	48(%rsp), %r14
.L149:
	movq	%r13, 56(%rsp)
	movb	$0, 2(%r14,%r12)
	movq	56(%rsp), %r14
	movq	88(%rsp), %r13
	movq	48(%rsp), %rcx
	movq	64(%rsp), %rax
	leaq	(%r14,%r13), %r12
	cmpq	%rbx, %rcx
	je	.L356
.L159:
	movq	80(%rsp), %r15
	cmpq	%r12, %rax
	jnb	.L163
	cmpq	%rbp, %r15
	je	.L252
	movq	96(%rsp), %rdx
.L164:
	cmpq	%r12, %rdx
	jnb	.L357
	movabsq	$9223372036854775807, %rdx
	subq	%r14, %rdx
	cmpq	%r13, %rdx
	jb	.L194
	testq	%r12, %r12
	js	.L358
	addq	%rax, %rax
	movq	%rax, (%rsp)
	cmpq	%rax, %r12
	jb	.L359
	movq	%r12, (%rsp)
.L200:
	movq	(%rsp), %rdi
	addq	$1, %rdi
	js	.L201
.LEHB2:
	call	_Znwm@PLT
.LEHE2:
	movq	%rax, %rcx
	testq	%r14, %r14
	je	.L203
	movq	48(%rsp), %rsi
	cmpq	$1, %r14
	je	.L360
	movq	%r14, %rdx
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	%rax, %rcx
.L203:
	testq	%r15, %r15
	je	.L205
	testq	%r13, %r13
	je	.L205
	leaq	(%rcx,%r14), %rdi
	cmpq	$1, %r13
	je	.L361
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rcx, 8(%rsp)
	call	memcpy@PLT
	movq	8(%rsp), %rcx
.L205:
	movq	48(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L207
	movq	64(%rsp), %rax
	movq	%rcx, 8(%rsp)
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	movq	8(%rsp), %rcx
.L207:
	movq	(%rsp), %rax
	movq	%rcx, 48(%rsp)
	movq	%rax, 64(%rsp)
.L197:
	movq	%r12, 56(%rsp)
	leaq	128(%rsp), %r13
	movb	$0, (%rcx,%r12)
	movq	48(%rsp), %rax
	movq	%r13, 112(%rsp)
	cmpq	%rbx, %rax
	je	.L362
	movq	56(%rsp), %r12
	movq	%rax, 112(%rsp)
	movq	64(%rsp), %rax
	movq	%rbx, 48(%rsp)
	movq	%r12, 120(%rsp)
	movq	%rax, 128(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 64(%rsp)
.L193:
	movabsq	$9223372036854775807, %rax
	subq	%r12, %rax
	cmpq	$10, %rax
	jbe	.L363
	movq	112(%rsp), %rax
	leaq	11(%r12), %r14
	cmpq	%r13, %rax
	je	.L364
	movq	128(%rsp), %r15
	cmpq	%r14, %r15
	jb	.L219
.L217:
	movabsq	$8007527072562247968, %rsi
	addq	%r12, %rax
	movq	%rsi, (%rax)
	movl	$694447215, 7(%rax)
	movq	112(%rsp), %rcx
.L220:
	movq	%r14, 120(%rsp)
	leaq	32(%rsp), %r12
	movb	$0, (%rcx,%r14)
	movq	112(%rsp), %rax
	movq	%r12, 16(%rsp)
	cmpq	%r13, %rax
	je	.L365
	movq	%rax, 16(%rsp)
	movq	128(%rsp), %rax
	movq	120(%rsp), %rcx
	movq	%rax, 32(%rsp)
.L236:
	movq	48(%rsp), %rdi
	movq	%rcx, 24(%rsp)
	cmpq	%rbx, %rdi
	je	.L237
	movq	64(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L237:
	movq	80(%rsp), %rdi
	cmpq	%rbp, %rdi
	je	.L238
	movq	96(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L238:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB3:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	leaq	.LC9(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE3:
	movq	16(%rsp), %rdi
	cmpq	%r12, %rdi
	je	.L112
	movq	32(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L112:
	movq	152(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L366
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L351:
	.cfi_restore_state
	testq	%r12, %r12
	js	.L367
	movq	%r12, %rdi
	addq	$1, %rdi
	js	.L368
.LEHB4:
	call	_Znwm@PLT
.LEHE4:
	movq	%rax, 48(%rsp)
	movq	%rax, %rdi
	movq	%r12, 64(%rsp)
.L140:
	movq	%r12, %rdx
	movq	%r13, %rsi
	call	memcpy@PLT
	movq	48(%rsp), %rax
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L352:
	movzbl	0(%r13), %eax
	movb	%al, 64(%rsp)
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L163:
	movabsq	$9223372036854775807, %rax
	subq	%r14, %rax
	cmpq	%r13, %rax
	jb	.L194
	testq	%r13, %r13
	je	.L197
	leaq	(%rcx,%r14), %rdi
	cmpq	$1, %r13
	je	.L369
	movq	%r13, %rdx
	movq	%r15, %rsi
	call	memcpy@PLT
	movq	48(%rsp), %rcx
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L148:
	testq	%r13, %r13
	js	.L370
	addq	%r15, %r15
	cmpq	%r15, %r13
	jb	.L371
	movq	%r13, %r15
.L152:
	movq	%r15, %rdi
	addq	$1, %rdi
	js	.L153
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	movq	%rax, %r14
	testq	%r12, %r12
	je	.L155
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L219:
	testq	%r14, %r14
	js	.L221
	addq	%r15, %r15
	cmpq	%r15, %r14
	jb	.L372
.L255:
	movq	%r14, %r15
.L223:
	movq	%r15, %rdi
	addq	$1, %rdi
	js	.L225
.L222:
.LEHB6:
	call	_Znwm@PLT
.LEHE6:
	movq	%rax, %rcx
	testq	%r12, %r12
	je	.L226
	movq	112(%rsp), %rsi
	cmpq	$1, %r12
	je	.L373
	movq	%r12, %rdx
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	%rax, %rcx
.L226:
	movabsq	$8007527072562247968, %rax
	addq	%rcx, %r12
	movq	%rax, (%r12)
	movl	$694447215, 7(%r12)
	movq	112(%rsp), %rdi
	cmpq	%r13, %rdi
	je	.L228
	movq	128(%rsp), %rax
	movq	%rcx, (%rsp)
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	movq	(%rsp), %rcx
.L228:
	movq	%rcx, 112(%rsp)
	movq	%r15, 128(%rsp)
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L246:
	movl	$6, %esi
	movl	$7, %eax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L247:
	movl	$7, %esi
	movl	$8, %eax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L248:
	movl	$9, %eax
.L123:
	leal	-1(%rax), %esi
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L350:
	movb	$45, (%rdx)
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L349:
	movl	$11565, %r10d
	addq	$2, %rdx
	movw	%r10w, -2(%rdx)
	andl	$1, %r9d
	je	.L132
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L348:
	movl	$757935405, (%rdx)
	addq	$4, %rdx
	testb	$2, %r9b
	je	.L131
	jmp	.L349
	.p2align 4,,10
	.p2align 3
.L347:
	movl	%eax, %ebx
	xorl	%edx, %edx
	andl	$-8, %ebx
.L128:
	movl	%edx, %r10d
	addl	$8, %edx
	movq	%r11, 0(%rbp,%r10)
	cmpl	%ebx, %edx
	jb	.L128
	addq	%rbp, %rdx
	jmp	.L127
.L369:
	movzbl	(%r15), %eax
	movb	%al, (%rdi)
	movq	48(%rsp), %rcx
	jmp	.L197
.L359:
	testq	%rax, %rax
	jns	.L200
.L201:
.LEHB7:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE7:
	.p2align 4,,10
	.p2align 3
.L357:
	movabsq	$9223372036854775807, %rax
	subq	%r13, %rax
	cmpq	%r14, %rax
	jb	.L374
	testq	%r13, %r13
	setne	%al
	testq	%r14, %r14
	setne	%dl
	andl	%edx, %eax
	cmpq	%r15, %rcx
	jb	.L167
	leaq	(%r15,%r13), %rdx
	cmpq	%rcx, %rdx
	jb	.L167
	testb	%al, %al
	je	.L375
	leaq	(%r15,%r14), %rdi
	cmpq	$1, %r13
	je	.L376
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rcx, (%rsp)
	call	memmove@PLT
	movq	(%rsp), %rcx
.L176:
	leaq	(%rcx,%r14), %rax
	cmpq	%rax, %r15
	jb	.L177
	cmpq	$1, %r14
	je	.L338
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rcx, %rsi
	call	memmove@PLT
	movq	80(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L173:
	movq	%r12, 88(%rsp)
	leaq	128(%rsp), %r13
	movb	$0, (%r15,%r12)
	movq	80(%rsp), %rax
	movq	%r13, 112(%rsp)
	cmpq	%rbp, %rax
	je	.L377
	movq	88(%rsp), %r12
	movq	%rax, 112(%rsp)
	movq	96(%rsp), %rax
	movq	%rbp, 80(%rsp)
	movq	%r12, 120(%rsp)
	movq	%rax, 128(%rsp)
	movq	$0, 88(%rsp)
	movb	$0, 96(%rsp)
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L167:
	testb	%al, %al
	je	.L170
	leaq	(%r15,%r14), %rdi
	cmpq	$1, %r13
	je	.L378
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rcx, (%rsp)
	call	memmove@PLT
	movq	(%rsp), %rcx
.L172:
	cmpq	$1, %r14
	je	.L338
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rcx, %rsi
	call	memcpy@PLT
	movq	80(%rsp), %r15
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L355:
	cmpq	$15, %r13
	jbe	.L146
	movl	$31, %edi
.LEHB8:
	call	_Znwm@PLT
	movq	%rax, %r14
	movl	$30, %r15d
.L150:
	movq	48(%rsp), %rsi
	cmpq	$1, %r12
	je	.L379
	movq	%r12, %rdx
	movq	%r14, %rdi
	call	memcpy@PLT
.L155:
	movl	$10272, %eax
	movw	%ax, (%r14,%r12)
	movq	48(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L158
	movq	64(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L158:
	movq	%r14, 48(%rsp)
	movq	%r15, 64(%rsp)
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L356:
	movl	$15, %eax
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L365:
	movq	120(%rsp), %rcx
	movq	%r12, %rdi
	movq	%r13, %rax
	leaq	1(%rcx), %rsi
	cmpl	$8, %esi
	jnb	.L380
.L230:
	xorl	%edx, %edx
	testb	$4, %sil
	je	.L233
	movl	(%rax), %edx
	movl	%edx, (%rdi)
	movl	$4, %edx
.L233:
	testb	$2, %sil
	je	.L234
	movzwl	(%rax,%rdx), %r8d
	movw	%r8w, (%rdi,%rdx)
	addq	$2, %rdx
.L234:
	andl	$1, %esi
	je	.L236
	movzbl	(%rax,%rdx), %eax
	movb	%al, (%rdi,%rdx)
	jmp	.L236
	.p2align 4,,10
	.p2align 3
.L362:
	movq	56(%rsp), %r12
	movq	%r13, %rsi
	movq	%rbx, %rax
	leaq	1(%r12), %rdx
	cmpl	$8, %edx
	jnb	.L381
.L209:
	xorl	%ecx, %ecx
	testb	$4, %dl
	je	.L212
	movl	(%rax), %ecx
	movl	%ecx, (%rsi)
	movl	$4, %ecx
.L212:
	testb	$2, %dl
	je	.L213
	movzwl	(%rax,%rcx), %edi
	movw	%di, (%rsi,%rcx)
	addq	$2, %rcx
.L213:
	andl	$1, %edx
	je	.L214
	movzbl	(%rax,%rcx), %eax
	movb	%al, (%rsi,%rcx)
.L214:
	movq	%r12, 120(%rsp)
	movq	%rbx, 48(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 64(%rsp)
.L192:
	leaq	11(%r12), %r14
	movq	112(%rsp), %rax
	cmpq	$15, %r14
	jbe	.L217
.L244:
	cmpq	$29, %r14
	ja	.L255
	movl	$30, %r15d
	movl	$31, %edi
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L252:
	movl	$15, %edx
	jmp	.L164
.L380:
	movl	%esi, %r8d
	xorl	%eax, %eax
	andl	$-8, %r8d
.L231:
	movl	%eax, %edx
	addl	$8, %eax
	movq	0(%r13,%rdx), %rdi
	movq	%rdi, (%r12,%rdx)
	cmpl	%r8d, %eax
	jb	.L231
	leaq	(%r12,%rax), %rdi
	addq	%r13, %rax
	jmp	.L230
.L170:
	testq	%r14, %r14
	je	.L173
	jmp	.L172
	.p2align 4,,10
	.p2align 3
.L371:
	testq	%r15, %r15
	jns	.L152
.L153:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE8:
.L372:
	testq	%r15, %r15
	jns	.L223
.L225:
.LEHB9:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE9:
.L338:
	movzbl	(%rcx), %eax
	movb	%al, (%r15)
	movq	80(%rsp), %r15
	jmp	.L173
.L378:
	movzbl	(%r15), %eax
	movb	%al, (%rdi)
	jmp	.L172
.L381:
	movl	%edx, %edi
	xorl	%eax, %eax
	andl	$-8, %edi
.L210:
	movl	%eax, %ecx
	addl	$8, %eax
	movq	(%rbx,%rcx), %rsi
	movq	%rsi, 0(%r13,%rcx)
	cmpl	%edi, %eax
	jb	.L210
	leaq	0(%r13,%rax), %rsi
	addq	%rbx, %rax
	jmp	.L209
.L379:
	movzbl	(%rsi), %eax
	movb	%al, (%r14)
	jmp	.L155
.L373:
	movzbl	(%rsi), %eax
	movb	%al, (%rcx)
	jmp	.L226
.L361:
	movzbl	(%r15), %eax
	movb	%al, (%rdi)
	jmp	.L205
.L360:
	movzbl	(%rsi), %eax
	movb	%al, (%rcx)
	jmp	.L203
.L377:
	movq	88(%rsp), %r12
	movq	%r13, %rsi
	movq	%rbp, %rax
	leaq	1(%r12), %rdx
	cmpl	$8, %edx
	jnb	.L382
.L186:
	xorl	%ecx, %ecx
	testb	$4, %dl
	je	.L189
	movl	(%rax), %ecx
	movl	%ecx, (%rsi)
	movl	$4, %ecx
.L189:
	testb	$2, %dl
	je	.L190
	movzwl	(%rax,%rcx), %edi
	movw	%di, (%rsi,%rcx)
	addq	$2, %rcx
.L190:
	andl	$1, %edx
	je	.L191
	movzbl	(%rax,%rcx), %eax
	movb	%al, (%rsi,%rcx)
.L191:
	movq	%r12, 120(%rsp)
	movq	%rbp, 80(%rsp)
	movq	$0, 88(%rsp)
	movb	$0, 96(%rsp)
	jmp	.L192
.L353:
	movq	%rbx, %rdi
	jmp	.L140
.L368:
.LEHB10:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE10:
.L341:
	leaq	96(%rsp), %rbp
	leal	1(%rdi), %eax
	xorl	%esi, %esi
	movq	%rbp, 80(%rsp)
	jmp	.L115
.L344:
	leaq	96(%rsp), %rbp
	leal	4(%rdi), %eax
	movl	$3, %esi
	movq	%rbp, 80(%rsp)
	jmp	.L117
.L343:
	leaq	96(%rsp), %rbp
	leal	3(%rdi), %eax
	movl	$2, %esi
	movq	%rbp, 80(%rsp)
	jmp	.L117
.L345:
	movl	$5, %eax
	jmp	.L123
.L375:
	testq	%r14, %r14
	je	.L173
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L382:
	movl	%edx, %edi
	xorl	%eax, %eax
	andl	$-8, %edi
.L187:
	movl	%eax, %ecx
	addl	$8, %eax
	movq	0(%rbp,%rcx), %rsi
	movq	%rsi, 0(%r13,%rcx)
	cmpl	%edi, %eax
	jb	.L187
	leaq	0(%r13,%rax), %rsi
	addq	%rbp, %rax
	jmp	.L186
.L177:
	cmpq	%r15, %rcx
	jb	.L179
	leaq	(%rcx,%r14), %rsi
	cmpq	$1, %r14
	je	.L383
	movq	%r15, %rdi
	movq	%r14, %rdx
	call	memcpy@PLT
	movq	80(%rsp), %r15
	jmp	.L173
.L376:
	movzbl	(%r15), %eax
	movb	%al, (%rdi)
	jmp	.L176
.L346:
	movl	$1, %eax
	movl	$5, %esi
	jmp	.L124
.L179:
	movq	%r15, %r13
	subq	%rcx, %r13
	cmpq	$1, %r13
	je	.L384
	movq	%r13, %rdx
	movq	%rcx, %rsi
	movq	%r15, %rdi
	call	memmove@PLT
.L182:
	movq	%r14, %rdx
	leaq	(%r15,%r14), %rsi
	leaq	(%r15,%r13), %rdi
	subq	%r13, %rdx
	cmpq	$1, %rdx
	je	.L385
	testq	%rdx, %rdx
	je	.L339
	call	memcpy@PLT
.L339:
	movq	80(%rsp), %r15
	jmp	.L173
.L385:
	movzbl	(%rsi), %eax
	movb	%al, (%rdi)
	movq	80(%rsp), %r15
	jmp	.L173
.L384:
	movzbl	(%rcx), %eax
	movb	%al, (%r15)
	jmp	.L182
.L383:
	movzbl	(%rsi), %eax
	movb	%al, (%r15)
	movq	80(%rsp), %r15
	jmp	.L173
.L370:
	leaq	.LC6(%rip), %rdi
.LEHB11:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE11:
.L374:
	leaq	.LC8(%rip), %rdi
.LEHB12:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE12:
.L367:
	leaq	.LC6(%rip), %rdi
.LEHB13:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE13:
.L354:
	leaq	.LC7(%rip), %rdi
.LEHB14:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE14:
.L366:
	call	__stack_chk_fail@PLT
.L194:
	leaq	.LC7(%rip), %rdi
.LEHB15:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE15:
.L363:
	leaq	.LC7(%rip), %rdi
.LEHB16:
	call	_ZSt20__throw_length_errorPKc@PLT
.L364:
	cmpq	$15, %r14
	jbe	.L217
	testq	%r14, %r14
	jns	.L244
.L221:
	leaq	.LC6(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE16:
.L358:
	leaq	.LC6(%rip), %rdi
.LEHB17:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE17:
.L258:
	endbr64
.L340:
	movq	%rax, %rbx
	jmp	.L241
.L256:
	endbr64
	movq	%rax, %rbx
	jmp	.L243
.L260:
	endbr64
	jmp	.L340
.L257:
	endbr64
	movq	%rax, %rbx
	jmp	.L162
.L240:
	leaq	112(%rsp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L241:
	leaq	48(%rsp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L162:
	leaq	80(%rsp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rdi
.LEHB18:
	call	_Unwind_Resume@PLT
.L259:
	endbr64
	movq	%rax, %rbx
	jmp	.L240
.L243:
	leaq	16(%rsp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE18:
	.cfi_endproc
.LFE5034:
	.section	.gcc_except_table._ZNK9PrintableI6PersonE5printEv,"aG",@progbits,_ZNK9PrintableI6PersonE5printEv,comdat
.LLSDA5034:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5034-.LLSDACSB5034
.LLSDACSB5034:
	.uleb128 .LEHB2-.LFB5034
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L258-.LFB5034
	.uleb128 0
	.uleb128 .LEHB3-.LFB5034
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L256-.LFB5034
	.uleb128 0
	.uleb128 .LEHB4-.LFB5034
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L257-.LFB5034
	.uleb128 0
	.uleb128 .LEHB5-.LFB5034
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L260-.LFB5034
	.uleb128 0
	.uleb128 .LEHB6-.LFB5034
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L259-.LFB5034
	.uleb128 0
	.uleb128 .LEHB7-.LFB5034
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L258-.LFB5034
	.uleb128 0
	.uleb128 .LEHB8-.LFB5034
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L260-.LFB5034
	.uleb128 0
	.uleb128 .LEHB9-.LFB5034
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L259-.LFB5034
	.uleb128 0
	.uleb128 .LEHB10-.LFB5034
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L257-.LFB5034
	.uleb128 0
	.uleb128 .LEHB11-.LFB5034
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L260-.LFB5034
	.uleb128 0
	.uleb128 .LEHB12-.LFB5034
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L258-.LFB5034
	.uleb128 0
	.uleb128 .LEHB13-.LFB5034
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L257-.LFB5034
	.uleb128 0
	.uleb128 .LEHB14-.LFB5034
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L260-.LFB5034
	.uleb128 0
	.uleb128 .LEHB15-.LFB5034
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L258-.LFB5034
	.uleb128 0
	.uleb128 .LEHB16-.LFB5034
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L259-.LFB5034
	.uleb128 0
	.uleb128 .LEHB17-.LFB5034
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L258-.LFB5034
	.uleb128 0
	.uleb128 .LEHB18-.LFB5034
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE5034:
	.section	.text._ZNK9PrintableI6PersonE5printEv,"axG",@progbits,_ZNK9PrintableI6PersonE5printEv,comdat
	.size	_ZNK9PrintableI6PersonE5printEv, .-_ZNK9PrintableI6PersonE5printEv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	"Yes"
.LC11:
	.string	"No"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"================================================\n"
	.section	.rodata.str1.1
.LC13:
	.string	"  CRTP Complete Guide\n"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"================================================\n\n"
	.align 8
.LC15:
	.string	"Test 1: Virtual Function vs CRTP Performance\n"
	.align 8
.LC16:
	.string	"------------------------------------------------\n"
	.section	.rodata.str1.1
.LC18:
	.string	"vector::_M_realloc_insert"
.LC20:
	.string	"Virtual Function"
.LC21:
	.string	": "
.LC22:
	.string	" ns per call\n"
.LC23:
	.string	"CRTP (monomorphic)"
.LC26:
	.string	"\nSpeedup: "
.LC27:
	.string	"x\n\n"
.LC28:
	.string	"Test 2: CRTP Mixin Pattern\n"
.LC29:
	.string	"Alice"
.LC30:
	.string	"Bob"
.LC31:
	.string	"Charlie"
.LC32:
	.string	"Total persons created: "
.LC33:
	.string	"Alice > Bob? "
.LC34:
	.string	"Bob < Charlie? "
.LC35:
	.string	"\n\n"
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Test 3: Concept-based Interface Checking\n"
	.section	.rodata.str1.1
.LC39:
	.string	"Total area of circles: "
.LC40:
	.string	"Test 4: CRTP Builder Pattern\n"
.LC41:
	.string	"Timeout"
.LC42:
	.string	"Config: "
.LC43:
	.string	" = "
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"Test 5: Expression Templates (Preview)\n"
	.section	.rodata.str1.1
.LC48:
	.string	"a + b + c = "
.LC49:
	.string	" "
.LC50:
	.string	"Memory Footprint Analysis\n"
.LC51:
	.string	"ShapeVirtual:    "
.LC52:
	.string	" bytes (vtable pointer)\n"
.LC53:
	.string	"CircleVirtual:   "
.LC54:
	.string	" bytes\n"
.LC55:
	.string	"ShapeCRTP:       "
.LC56:
	.string	" bytes (empty)\n"
.LC57:
	.string	"CircleCRTP:      "
.LC58:
	.string	" bytes (no overhead!)\n\n"
.LC59:
	.string	"Summary\n"
.LC60:
	.string	"\342\234\223 CRTP \344\274\230\345\212\277:\n"
	.section	.rodata.str1.8
	.align 8
.LC61:
	.string	"  1. \351\233\266\350\277\220\350\241\214\346\227\266\345\274\200\351\224\200\357\274\210\345\256\214\345\205\250\345\206\205\350\201\224\357\274\211\n"
	.section	.rodata.str1.1
.LC62:
	.string	"  2. \347\274\226\350\257\221\346\234\237\345\244\232\346\200\201\n"
.LC63:
	.string	"  3. \346\227\240\350\231\232\350\241\250\346\214\207\351\222\210\345\274\200\351\224\200\n"
	.section	.rodata.str1.8
	.align 8
.LC64:
	.string	"  4. \346\233\264\345\245\275\347\232\204\347\274\223\345\255\230\345\261\200\351\203\250\346\200\247\n\n"
	.section	.rodata.str1.1
.LC65:
	.string	"\342\234\223 \350\231\232\345\207\275\346\225\260\344\274\230\345\212\277:\n"
	.section	.rodata.str1.8
	.align 8
.LC66:
	.string	"  1. \347\234\237\346\255\243\347\232\204\350\277\220\350\241\214\346\227\266\345\244\232\346\200\201\n"
	.align 8
.LC67:
	.string	"  2. \345\274\202\346\236\204\345\256\271\345\231\250\357\274\210std::vector<Base*>\357\274\211\n"
	.section	.rodata.str1.1
.LC68:
	.string	"  3. \345\212\250\346\200\201\345\212\240\350\275\275\n\n"
.LC69:
	.string	"\342\234\223 \351\200\211\346\213\251\345\273\272\350\256\256:\n"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"  - \346\200\247\350\203\275\345\205\263\351\224\256\350\267\257\345\276\204 + \347\274\226\350\257\221\346\234\237\345\267\262\347\237\245\347\261\273\345\236\213 \342\206\222 CRTP\n"
	.align 8
.LC71:
	.string	"  - \351\234\200\350\246\201\347\234\237\346\255\243\350\277\220\350\241\214\346\227\266\345\244\232\346\200\201 \342\206\222 Virtual Function\n"
	.align 8
.LC72:
	.string	"  - \345\272\223/\346\241\206\346\236\266\350\256\276\350\256\241 \342\206\222 \346\267\267\345\220\210\344\275\277\347\224\250\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB74:
	.section	.text.startup,"ax",@progbits
.LHOTB74:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4408:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4408
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	.LC12(%rip), %rsi
	pushq	-8(%r10)
	leaq	_ZSt4cout(%rip), %rdi
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	$100, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$576, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LEHB19:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC13(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC15(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE19:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, -416(%rbp)
	vmovdqa	%xmm0, -432(%rbp)
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L612:
	movq	%r15, (%rbx)
	addq	$8, %rbx
	movq	%rbx, -424(%rbp)
.L388:
	movl	$24, %edi
.LEHB20:
	call	_Znwm@PLT
	vmovapd	.LC19(%rip), %xmm4
	movq	%rax, %r14
	leaq	16+_ZTV16RectangleVirtual(%rip), %rax
	movq	%rax, (%r14)
	vmovupd	%xmm4, 8(%r14)
	cmpq	%r12, %rbx
	je	.L398
	movq	%r14, (%rbx)
	addq	$8, %rbx
	movq	%rbx, -424(%rbp)
	subl	$1, %r13d
	je	.L611
.L409:
	movl	$16, %edi
	call	_Znwm@PLT
	movq	%rax, %r15
	leaq	16+_ZTV13CircleVirtual(%rip), %rax
	movq	-424(%rbp), %rbx
	movq	-416(%rbp), %r12
	movq	%rax, (%r15)
	movq	.LC17(%rip), %rax
	movq	%rax, 8(%r15)
	cmpq	%r12, %rbx
	jne	.L612
	movq	-432(%rbp), %r14
	movq	%rbx, %rax
	movabsq	$1152921504606846975, %rsi
	subq	%r14, %rax
	movq	%rax, -488(%rbp)
	sarq	$3, %rax
	cmpq	%rsi, %rax
	je	.L613
	cmpq	%r14, %rbx
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L392
	testq	%rax, %rax
	jne	.L614
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
.L394:
	movq	-488(%rbp), %rax
	movq	%r15, (%r8,%rax)
	cmpq	%r14, %rbx
	je	.L501
	subq	%r14, %rbx
	movq	%r14, %rdx
	movq	%r8, %rax
	addq	%r8, %rbx
	.p2align 4,,10
	.p2align 3
.L396:
	movq	(%rdx), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rax)
	cmpq	%rbx, %rax
	jne	.L396
.L395:
	addq	$8, %rbx
	testq	%r14, %r14
	je	.L397
	movq	%r12, %rsi
	movq	%r14, %rdi
	movq	%r9, -496(%rbp)
	subq	%r14, %rsi
	movq	%r8, -488(%rbp)
	call	_ZdlPvm@PLT
	movq	-496(%rbp), %r9
	movq	-488(%rbp), %r8
.L397:
	movq	%r8, -432(%rbp)
	movq	%r9, %r12
	movq	%rbx, -424(%rbp)
	movq	%r9, -416(%rbp)
	jmp	.L388
	.p2align 4,,10
	.p2align 3
.L398:
	movq	-432(%rbp), %r15
	movabsq	$1152921504606846975, %rsi
	subq	%r15, %rbx
	movq	%rbx, %rax
	sarq	$3, %rax
	cmpq	%rsi, %rax
	je	.L615
	cmpq	%r12, %r15
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L403
	testq	%rax, %rax
	jne	.L616
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
.L405:
	movq	%r14, (%rcx,%rbx)
	cmpq	%r12, %r15
	je	.L406
	subq	%r15, %r12
	movq	%r15, %rdx
	movq	%rcx, %rax
	addq	%rcx, %r12
	.p2align 4,,10
	.p2align 3
.L407:
	movq	(%rdx), %rsi
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rsi, -8(%rax)
	cmpq	%r12, %rax
	jne	.L407
	leaq	8(%rax), %r12
	testq	%r15, %r15
	je	.L408
.L496:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movq	%r8, -496(%rbp)
	movq	%rcx, -488(%rbp)
	call	_ZdlPvm@PLT
	movq	-496(%rbp), %r8
	movq	-488(%rbp), %rcx
.L408:
	movq	%rcx, -432(%rbp)
	movq	%r12, -424(%rbp)
	movq	%r8, -416(%rbp)
	subl	$1, %r13d
	jne	.L409
.L611:
	movq	-424(%rbp), %r12
	movq	-432(%rbp), %r14
	leaq	.LC20(%rip), %rsi
	movq	%r12, %rax
	subq	%r14, %rax
	sarq	$3, %rax
	imull	$1000000, %eax, %eax
	movl	%eax, -496(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -584(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE20:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$1000000, %r13d
	movq	$0x000000000, -488(%rbp)
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L410:
	movq	%r14, %rbx
	cmpq	%r12, %r14
	je	.L414
	.p2align 4,,10
	.p2align 3
.L411:
	movq	(%rbx), %rdi
	movq	(%rdi), %rax
.LEHB21:
	call	*16(%rax)
	vaddsd	-488(%rbp), %xmm0, %xmm7
	addq	$8, %rbx
	vmovsd	%xmm7, -488(%rbp)
	cmpq	%rbx, %r12
	jne	.L411
.L414:
	subl	$1, %r13d
	jne	.L410
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rsi
	subq	%r15, %rax
	leaq	_ZSt4cout(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vcvtsi2sdl	-496(%rbp), %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm3
	vmovsd	%xmm3, -592(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$2, %edx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-592(%rbp), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC22(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE21:
	movq	-584(%rbp), %rdi
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movl	$100, %r14d
	xorl	%r13d, %r13d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movq	%rcx, -504(%rbp)
	movq	%rsi, -496(%rbp)
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L618:
	movq	.LC17(%rip), %rax
	addq	$8, %r12
	movq	%rax, -8(%r12)
	movq	-504(%rbp), %rax
	cmpq	%rax, %rbx
	je	.L426
.L621:
	vmovapd	.LC19(%rip), %xmm3
	addq	$16, %rbx
	vmovupd	%xmm3, -16(%rbx)
	subl	$1, %r14d
	je	.L617
.L437:
	cmpq	%r12, -496(%rbp)
	jne	.L618
	movq	-496(%rbp), %rax
	movabsq	$1152921504606846975, %rsi
	subq	%r13, %rax
	movq	%rax, -488(%rbp)
	sarq	$3, %rax
	cmpq	%rsi, %rax
	je	.L619
	cmpq	%r13, -496(%rbp)
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L420
	testq	%rax, %rax
	jne	.L620
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.L422:
	movq	-488(%rbp), %rsi
	movq	.LC17(%rip), %rcx
	movq	%rcx, (%rax,%rsi)
	cmpq	%r13, %r12
	je	.L508
	movq	%rax, %rcx
	movq	%r13, %rdx
	.p2align 4,,10
	.p2align 3
.L424:
	vmovsd	(%rdx), %xmm0
	addq	$8, %rdx
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r12, %rdx
	jne	.L424
	subq	%r13, %rdx
	addq	%rax, %rdx
.L423:
	leaq	8(%rdx), %r12
	testq	%r13, %r13
	je	.L425
	movq	-496(%rbp), %rsi
	movq	%r13, %rdi
	movq	%r8, -512(%rbp)
	movq	%rax, -488(%rbp)
	subq	%r13, %rsi
	call	_ZdlPvm@PLT
	movq	-512(%rbp), %r8
	movq	-488(%rbp), %rax
.L425:
	movq	%rax, %r13
	movq	-504(%rbp), %rax
	movq	%r8, -496(%rbp)
	cmpq	%rax, %rbx
	jne	.L621
.L426:
	movabsq	$576460752303423487, %rsi
	subq	%r15, %rax
	movq	%rax, -488(%rbp)
	sarq	$4, %rax
	cmpq	%rsi, %rax
	je	.L622
	cmpq	%r15, %rbx
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L431
	testq	%rax, %rax
	jne	.L623
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.L433:
	movq	-488(%rbp), %rsi
	vmovapd	.LC19(%rip), %xmm3
	vmovupd	%xmm3, (%rax,%rsi)
	cmpq	%r15, %rbx
	je	.L512
	movq	%rax, %rcx
	movq	%r15, %rdx
	.p2align 4,,10
	.p2align 3
.L435:
	vmovdqu	(%rdx), %xmm3
	addq	$16, %rdx
	addq	$16, %rcx
	vmovdqu	%xmm3, -16(%rcx)
	cmpq	%rdx, %rbx
	jne	.L435
	subq	%r15, %rbx
	addq	%rax, %rbx
.L434:
	addq	$16, %rbx
	testq	%r15, %r15
	je	.L436
	movq	-504(%rbp), %rsi
	movq	%r15, %rdi
	movq	%r8, -512(%rbp)
	movq	%rax, -488(%rbp)
	subq	%r15, %rsi
	call	_ZdlPvm@PLT
	movq	-512(%rbp), %r8
	movq	-488(%rbp), %rax
.L436:
	movq	%r8, -504(%rbp)
	movq	%rax, %r15
	subl	$1, %r14d
	jne	.L437
.L617:
	movq	%rbx, %rax
	movq	%r12, %rdx
	movq	-584(%rbp), %rdi
	leaq	.LC23(%rip), %rsi
	subq	%r15, %rax
	subq	%r13, %rdx
	sarq	$4, %rax
	sarq	$3, %rdx
	addq	%rdx, %rax
	imull	$1000000, %eax, %eax
	movl	%eax, -596(%rbp)
.LEHB22:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE22:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$1000000, %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LC0(%rip), %xmm4
	movq	%rax, %rsi
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	movq	%rsi, -608(%rbp)
	vmovddup	%xmm4, %xmm5
	vbroadcastsd	%xmm4, %ymm3
	movq	%rax, -512(%rbp)
	shrq	$3, %rax
	movq	%rax, -528(%rbp)
	addq	$1, %rax
	movq	%rax, %r11
	movq	%rax, %rcx
	movq	%rax, -544(%rbp)
	andq	$-4, %rax
	movq	%rax, -576(%rbp)
	leaq	0(%r13,%rax,8), %rax
	shrq	$2, %rcx
	movq	%rax, -568(%rbp)
	leaq	-16(%rbx), %rax
	salq	$5, %rcx
	subq	%r15, %rax
	addq	%r13, %rcx
	movq	%rax, %r14
	shrq	$4, %rax
	leaq	1(%rax), %r10
	movq	%r10, %rdx
	movq	%r10, %rdi
	shrq	$2, %rdx
	andq	$-4, %rdi
	salq	$6, %rdx
	salq	$4, %rdi
	addq	%r15, %rdi
	addq	%r15, %rdx
	cmpq	$32, %r14
	cmovbe	%r15, %rdi
	andl	$3, %r11d
	andl	$3, %r10d
	leaq	16(%rdi), %rax
	movq	%rax, -520(%rbp)
	leaq	32(%rdi), %rax
	movq	%rax, -560(%rbp)
	.p2align 4,,10
	.p2align 3
.L438:
	cmpq	%r12, %r13
	je	.L450
	cmpq	$16, -512(%rbp)
	movq	%r13, %rax
	jbe	.L513
	.p2align 4,,10
	.p2align 3
.L440:
	vmulpd	(%rax), %ymm3, %ymm1
	addq	$32, %rax
	vmulpd	-32(%rax), %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rax, %rcx
	jne	.L440
	testq	%r11, %r11
	je	.L450
	movq	-576(%rbp), %r8
	movq	-568(%rbp), %rax
.L439:
	movq	-544(%rbp), %rsi
	subq	%r8, %rsi
	movq	%rsi, -488(%rbp)
	movq	-528(%rbp), %rsi
	cmpq	%rsi, %r8
	je	.L442
	vmovupd	0(%r13,%r8,8), %xmm2
	movq	-488(%rbp), %rsi
	vmulpd	%xmm5, %xmm2, %xmm1
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	testb	$1, %sil
	je	.L450
	andq	$-2, %rsi
	leaq	(%rax,%rsi,8), %rax
.L442:
	vmovsd	(%rax), %xmm1
	vmulsd	%xmm4, %xmm1, %xmm2
	vfmadd231sd	%xmm1, %xmm2, %xmm0
.L450:
	cmpq	%r15, %rbx
	je	.L444
	cmpq	$32, %r14
	jbe	.L445
	movq	%r15, %rax
	.p2align 4,,10
	.p2align 3
.L446:
	vmovupd	(%rax), %ymm6
	vunpckhpd	32(%rax), %ymm6, %ymm1
	addq	$64, %rax
	vunpcklpd	-32(%rax), %ymm6, %ymm2
	vpermpd	$216, %ymm1, %ymm1
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm2, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rax, %rdx
	jne	.L446
	testq	%r10, %r10
	je	.L444
.L445:
	movq	-520(%rbp), %rax
	vmovsd	8(%rdi), %xmm6
	vfmadd231sd	(%rdi), %xmm6, %xmm0
	cmpq	%rax, %rbx
	je	.L444
	movq	-560(%rbp), %rax
	vmovsd	16(%rdi), %xmm6
	vfmadd231sd	24(%rdi), %xmm6, %xmm0
	cmpq	%rax, %rbx
	je	.L444
	vmovsd	40(%rdi), %xmm6
	vfmadd231sd	32(%rdi), %xmm6, %xmm0
.L444:
	subl	$1, %r9d
	jne	.L438
	movq	-608(%rbp), %rsi
	vmovq	%xmm0, %rax
	movq	%rsi, -488(%rbp)
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	-488(%rbp), %rsi
	movq	-88(%rbp), %rdx
	leaq	_ZSt4cout(%rip), %rdi
	subq	%rsi, %rax
	movq	-96(%rbp), %rsi
	vcvtsi2sdq	%rax, %xmm3, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vcvtsi2sdl	-596(%rbp), %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm3
	vmovsd	%xmm3, -488(%rbp)
.LEHB23:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$2, %edx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-488(%rbp), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC22(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE23:
	movq	-584(%rbp), %rbx
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movl	$10, %edx
	leaq	.LC26(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB24:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	vmovsd	-592(%rbp), %xmm4
	vdivsd	-488(%rbp), %xmm4, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC27(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC28(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC29(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE24:
	leaq	-240(%rbp), %r14
	movq	%rbx, %rsi
	addq	$1, _ZN9CountableI6PersonE5countE(%rip)
	movq	%r14, %rdi
	movq	%r14, -520(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	%rbx, %rdi
	movl	$30, -208(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	.LC30(%rip), %rsi
	movq	%rbx, %rdi
.LEHB25:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE25:
	leaq	-192(%rbp), %r12
	movq	%rbx, %rsi
	addq	$1, _ZN9CountableI6PersonE5countE(%rip)
	movq	%r12, %rdi
	movq	%r12, -528(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	%rbx, %rdi
	movl	$25, -160(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	.LC31(%rip), %rsi
	movq	%rbx, %rdi
.LEHB26:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE26:
	leaq	-144(%rbp), %rax
	movq	%rbx, %rsi
	addq	$1, _ZN9CountableI6PersonE5countE(%rip)
	movq	%rax, %rdi
	movq	%rax, -512(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	%rbx, %rdi
	movl	$35, -112(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movl	$23, %edx
	leaq	.LC32(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB27:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZN9CountableI6PersonE5countE(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC9(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r14, %rdi
	call	_ZNK9PrintableI6PersonE5printEv
	movq	%r12, %rdi
	call	_ZNK9PrintableI6PersonE5printEv
	movq	-512(%rbp), %rdi
	call	_ZNK9PrintableI6PersonE5printEv
	movl	$13, %edx
	leaq	.LC33(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	-160(%rbp), %eax
	leaq	.LC11(%rip), %rsi
	cmpl	%eax, -208(%rbp)
	leaq	.LC10(%rip), %rax
	cmovg	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC9(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$15, %edx
	leaq	.LC34(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	-112(%rbp), %eax
	leaq	.LC11(%rip), %rsi
	cmpl	%eax, -160(%rbp)
	leaq	.LC10(%rip), %rax
	cmovl	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	leaq	.LC35(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC36(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	vmovapd	.LC37(%rip), %xmm0
	movq	.LC38(%rip), %rax
	movl	$24, %edi
	movq	%rax, -80(%rbp)
	vmovapd	%xmm0, -96(%rbp)
	call	_Znwm@PLT
.LEHE27:
	vmovdqa	-96(%rbp), %xmm3
	movq	%rax, %r14
	movl	$23, %edx
	leaq	.LC39(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	vmovdqu	%xmm3, (%rax)
	movq	-80(%rbp), %rax
	movq	%rax, 16(%r14)
.LEHB28:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovddup	.LC0(%rip), %xmm0
	vmulpd	(%r14), %xmm0, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	_ZSt4cout(%rip), %rdi
	vmulpd	(%r14), %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	16(%r14), %xmm1
	vmulsd	.LC0(%rip), %xmm1, %xmm2
	vfmadd231sd	%xmm2, %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC35(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC40(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE28:
	xorl	%eax, %eax
	leaq	-80(%rbp), %r12
	xorl	%edx, %edx
	movb	$0, -80(%rbp)
	movq	%rax, -88(%rbp)
	leaq	-272(%rbp), %rax
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	movq	%r12, -544(%rbp)
	movq	%r12, -96(%rbp)
	movl	%edx, -64(%rbp)
	movq	%rax, -488(%rbp)
.LEHB29:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE29:
	movq	-264(%rbp), %rbx
	cmpq	%r12, -96(%rbp)
	je	.L516
	movq	-80(%rbp), %rax
.L453:
	cmpq	%rbx, %rax
	jb	.L624
	testq	%rbx, %rbx
	jne	.L460
.L461:
	movq	-96(%rbp), %rax
	movq	%rbx, -88(%rbp)
	movl	$8, %edx
	leaq	.LC42(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$0, (%rax,%rbx)
	movl	$3000, -64(%rbp)
.LEHB30:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	-64(%rbp), %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	-464(%rbp), %rax
	movl	$1, %edx
	vmovq	%rax, %xmm3
	leaq	-400(%rbp), %rax
	leaq	-336(%rbp), %r12
	leaq	-368(%rbp), %rbx
	vmovq	%rax, %xmm4
	vpinsrq	$1, %r12, %xmm3, %xmm3
	movq	%rax, -568(%rbp)
	vpinsrq	$1, %rbx, %xmm4, %xmm4
	leaq	.LC9(%rip), %rsi
	vmovdqa	%xmm3, -544(%rbp)
	vmovdqa	%xmm4, -560(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE30:
	movq	-488(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	.LC9(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB31:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC44(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	vmovapd	.LC45(%rip), %ymm0
	movq	-488(%rbp), %rsi
	leaq	-466(%rbp), %rcx
	movl	$4, %edx
	movq	-568(%rbp), %rdi
	vmovapd	%ymm0, -272(%rbp)
	vzeroupper
	call	_ZNSt6vectorIdSaIdEEC1ESt16initializer_listIdERKS0_
.LEHE31:
	vmovapd	.LC46(%rip), %ymm0
	movq	-488(%rbp), %rsi
	movl	$4, %edx
	movq	%rbx, %rdi
	leaq	-465(%rbp), %rcx
	vmovapd	%ymm0, -272(%rbp)
	vzeroupper
.LEHB32:
	call	_ZNSt6vectorIdSaIdEEC1ESt16initializer_listIdERKS0_
.LEHE32:
	vmovapd	.LC47(%rip), %ymm0
	leaq	-448(%rbp), %rbx
	movl	$4, %edx
	movq	%r12, %rdi
	movq	-488(%rbp), %rsi
	movq	%rbx, %rcx
	vmovapd	%ymm0, -272(%rbp)
	vzeroupper
.LEHB33:
	call	_ZNSt6vectorIdSaIdEEC1ESt16initializer_listIdERKS0_
.LEHE33:
	vmovdqa	-560(%rbp), %xmm4
	vmovdqa	-544(%rbp), %xmm3
	leaq	-304(%rbp), %rdi
	movq	%rbx, %rsi
	vmovdqa	%xmm4, -464(%rbp)
	vmovdqa	%xmm3, -448(%rbp)
.LEHB34:
	call	_ZN3VecC1I6VecSumIS1_IS_S_ES_EEERK13VecExpressionIT_E
.LEHE34:
	leaq	.LC48(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB35:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE35:
	movq	-296(%rbp), %rax
	movq	-304(%rbp), %r12
	movq	%rax, %rdx
	subq	%r12, %rdx
	sarq	$3, %rdx
	movq	%rdx, -488(%rbp)
	cmpq	%rax, %r12
	je	.L463
	xorl	%ebx, %ebx
.L464:
	vmovsd	(%r12,%rbx,8), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
.LEHB36:
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	leaq	.LC49(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE36:
	movq	-488(%rbp), %rax
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jb	.L464
.L463:
	leaq	.LC35(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB37:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC50(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$17, %edx
	leaq	.LC51(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$8, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC52(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$17, %edx
	leaq	.LC53(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$16, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC54(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$17, %edx
	leaq	.LC55(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC56(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$17, %edx
	leaq	.LC57(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$8, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC58(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC12(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC59(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC12(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC60(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC61(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC62(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC63(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC64(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC65(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC66(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC67(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC68(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC69(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC70(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC71(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC72(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC12(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE37:
	testq	%r12, %r12
	je	.L465
	movq	-288(%rbp), %rsi
	movq	%r12, %rdi
	subq	%r12, %rsi
	call	_ZdlPvm@PLT
.L465:
	movq	-336(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L466
	movq	-320(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L466:
	movq	-368(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L467
	movq	-352(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L467:
	movq	-400(%rbp), %rdi
	movq	-384(%rbp), %rsi
	testq	%rdi, %rdi
	je	.L468
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
	movq	-584(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L469:
	movl	$24, %esi
	movq	%r14, %rdi
	call	_ZdlPvm@PLT
	movq	-512(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	-528(%rbp), %rdi
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	-520(%rbp), %rdi
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
	testq	%r15, %r15
	je	.L470
	movq	-504(%rbp), %rsi
	movq	%r15, %rdi
	subq	%r15, %rsi
	call	_ZdlPvm@PLT
.L470:
	testq	%r13, %r13
	je	.L471
	movq	-496(%rbp), %rsi
	movq	%r13, %rdi
	subq	%r13, %rsi
	call	_ZdlPvm@PLT
.L471:
	leaq	-432(%rbp), %rdi
	call	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED1Ev
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L625
	addq	$576, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L406:
	.cfi_restore_state
	leaq	8(%rcx), %r12
	jmp	.L496
.L501:
	movq	%r8, %rbx
	jmp	.L395
.L512:
	movq	%rax, %rbx
	jmp	.L434
.L508:
	movq	%rax, %rdx
	jmp	.L423
.L513:
	xorl	%r8d, %r8d
	jmp	.L439
.L468:
	movq	-584(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L469
.L624:
	testq	%rbx, %rbx
	js	.L626
	leaq	(%rax,%rax), %r12
	cmpq	%r12, %rbx
	jnb	.L517
	testq	%r12, %r12
	js	.L457
.L456:
	movq	%r12, %rdi
	addq	$1, %rdi
	js	.L457
.LEHB38:
	call	_Znwm@PLT
.LEHE38:
	movq	-96(%rbp), %rdi
	movq	-544(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L459
	movq	%rax, -544(%rbp)
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	movq	-544(%rbp), %rax
.L459:
	movq	%rax, -96(%rbp)
	movq	%r12, -80(%rbp)
.L460:
	movq	-272(%rbp), %rsi
	movq	-96(%rbp), %rdi
	cmpq	$1, %rbx
	je	.L627
	movq	%rbx, %rdx
	call	memcpy@PLT
	jmp	.L461
.L614:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$3, %rax
	movq	%rax, -496(%rbp)
	movq	%rax, %rdi
.L393:
.LEHB39:
	call	_Znwm@PLT
.LEHE39:
	movq	-496(%rbp), %r9
	movq	%rax, %r8
	addq	%rax, %r9
	jmp	.L394
.L616:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$3, %rax
	movq	%rax, -488(%rbp)
	movq	%rax, %rdi
.L404:
.LEHB40:
	call	_Znwm@PLT
.LEHE40:
	movq	-488(%rbp), %r8
	movq	%rax, %rcx
	addq	%rax, %r8
	jmp	.L405
.L627:
	movzbl	(%rsi), %eax
	movb	%al, (%rdi)
	jmp	.L461
.L516:
	movl	$15, %eax
	jmp	.L453
.L620:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$3, %rax
	movq	%rax, -512(%rbp)
	movq	%rax, %rdi
.L421:
.LEHB41:
	call	_Znwm@PLT
	movq	-512(%rbp), %r8
	addq	%rax, %r8
	jmp	.L422
.L623:
	movabsq	$576460752303423487, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$4, %rax
	movq	%rax, -512(%rbp)
	movq	%rax, %rdi
.L432:
	call	_Znwm@PLT
.LEHE41:
	movq	-512(%rbp), %r8
	addq	%rax, %r8
	jmp	.L433
.L457:
.LEHB42:
	call	_ZSt17__throw_bad_allocv@PLT
.L517:
	movq	%rbx, %r12
	jmp	.L456
.L626:
	leaq	.LC6(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE42:
.L625:
	call	__stack_chk_fail@PLT
.L619:
	leaq	.LC18(%rip), %rdi
.LEHB43:
	call	_ZSt20__throw_length_errorPKc@PLT
.L420:
	movabsq	$9223372036854775800, %rax
	movq	%rax, -512(%rbp)
	movq	%rax, %rdi
	jmp	.L421
.L622:
	leaq	.LC18(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE43:
.L431:
	movabsq	$9223372036854775792, %rax
	movq	%rax, -512(%rbp)
	movq	%rax, %rdi
	jmp	.L432
.L615:
	leaq	.LC18(%rip), %rdi
.LEHB44:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE44:
.L403:
	movabsq	$9223372036854775800, %rax
	movq	%rax, -488(%rbp)
	movq	%rax, %rdi
	jmp	.L404
.L392:
	movabsq	$9223372036854775800, %rax
	movq	%rax, -496(%rbp)
	movq	%rax, %rdi
	jmp	.L393
.L613:
	leaq	.LC18(%rip), %rdi
.LEHB45:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE45:
.L535:
	endbr64
	movq	%rax, %rbx
	jmp	.L494
.L529:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L479
.L527:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L488
.L523:
	endbr64
	movq	%rax, %rbx
	jmp	.L476
.L533:
	endbr64
	movq	%rax, %rbx
	jmp	.L480
.L521:
	endbr64
	movq	%rax, %rbx
	jmp	.L474
.L525:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L490
.L520:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L473
.L531:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L484
.L528:
	endbr64
	movq	%rax, %rbx
	jmp	.L478
.L526:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L489
.L534:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L477
.L532:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L482
.L519:
	endbr64
	movq	%rax, %rbx
	jmp	.L472
.L524:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L491
.L522:
	endbr64
	movq	%rax, %rbx
	jmp	.L475
.L530:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L486
	.section	.gcc_except_table,"a",@progbits
.LLSDA4408:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4408-.LLSDACSB4408
.LLSDACSB4408:
	.uleb128 .LEHB19-.LFB4408
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB20-.LFB4408
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L520-.LFB4408
	.uleb128 0
	.uleb128 .LEHB21-.LFB4408
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L522-.LFB4408
	.uleb128 0
	.uleb128 .LEHB22-.LFB4408
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L534-.LFB4408
	.uleb128 0
	.uleb128 .LEHB23-.LFB4408
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L523-.LFB4408
	.uleb128 0
	.uleb128 .LEHB24-.LFB4408
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L534-.LFB4408
	.uleb128 0
	.uleb128 .LEHB25-.LFB4408
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L524-.LFB4408
	.uleb128 0
	.uleb128 .LEHB26-.LFB4408
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L525-.LFB4408
	.uleb128 0
	.uleb128 .LEHB27-.LFB4408
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L526-.LFB4408
	.uleb128 0
	.uleb128 .LEHB28-.LFB4408
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L527-.LFB4408
	.uleb128 0
	.uleb128 .LEHB29-.LFB4408
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L529-.LFB4408
	.uleb128 0
	.uleb128 .LEHB30-.LFB4408
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L528-.LFB4408
	.uleb128 0
	.uleb128 .LEHB31-.LFB4408
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L529-.LFB4408
	.uleb128 0
	.uleb128 .LEHB32-.LFB4408
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L530-.LFB4408
	.uleb128 0
	.uleb128 .LEHB33-.LFB4408
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L531-.LFB4408
	.uleb128 0
	.uleb128 .LEHB34-.LFB4408
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L532-.LFB4408
	.uleb128 0
	.uleb128 .LEHB35-.LFB4408
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L533-.LFB4408
	.uleb128 0
	.uleb128 .LEHB36-.LFB4408
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L535-.LFB4408
	.uleb128 0
	.uleb128 .LEHB37-.LFB4408
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L533-.LFB4408
	.uleb128 0
	.uleb128 .LEHB38-.LFB4408
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L528-.LFB4408
	.uleb128 0
	.uleb128 .LEHB39-.LFB4408
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L519-.LFB4408
	.uleb128 0
	.uleb128 .LEHB40-.LFB4408
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L521-.LFB4408
	.uleb128 0
	.uleb128 .LEHB41-.LFB4408
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L534-.LFB4408
	.uleb128 0
	.uleb128 .LEHB42-.LFB4408
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L528-.LFB4408
	.uleb128 0
	.uleb128 .LEHB43-.LFB4408
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L534-.LFB4408
	.uleb128 0
	.uleb128 .LEHB44-.LFB4408
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L521-.LFB4408
	.uleb128 0
	.uleb128 .LEHB45-.LFB4408
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L519-.LFB4408
	.uleb128 0
.LLSDACSE4408:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC4408
	.type	main.cold, @function
main.cold:
.LFSB4408:
.L494:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	-304(%rbp), %rdi
	movq	-288(%rbp), %rsi
	subq	%rdi, %rsi
.L495:
	vzeroupper
	call	_ZdlPvm@PLT
.L482:
	movq	-336(%rbp), %rdi
	movq	-320(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L484
	call	_ZdlPvm@PLT
.L484:
	movq	-368(%rbp), %rdi
	movq	-352(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L486
	call	_ZdlPvm@PLT
.L486:
	movq	-400(%rbp), %rdi
	movq	-384(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	jne	.L628
.L479:
	movq	-584(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L488:
	movl	$24, %esi
	movq	%r14, %rdi
	call	_ZdlPvm@PLT
.L489:
	movq	-512(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
.L490:
	movq	-528(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
.L491:
	movq	-520(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	subq	$1, _ZN9CountableI6PersonE5countE(%rip)
	jmp	.L477
.L480:
	movq	-304(%rbp), %rdi
	movq	-288(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	jne	.L495
	vzeroupper
	jmp	.L482
.L628:
	call	_ZdlPvm@PLT
	jmp	.L479
.L476:
	movq	-584(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L477:
	movq	-504(%rbp), %rsi
	subq	%r15, %rsi
	testq	%r15, %r15
	je	.L492
	movq	%r15, %rdi
	call	_ZdlPvm@PLT
.L492:
	movq	-496(%rbp), %rsi
	subq	%r13, %rsi
	testq	%r13, %r13
	je	.L473
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L473:
	leaq	-432(%rbp), %rdi
	call	_ZNSt6vectorISt10unique_ptrI12ShapeVirtualSt14default_deleteIS1_EESaIS4_EED1Ev
	movq	%rbx, %rdi
.LEHB46:
	call	_Unwind_Resume@PLT
.LEHE46:
.L475:
	movq	-584(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L473
.L474:
	movq	(%r14), %rax
	movq	%r14, %rdi
	vzeroupper
	call	*8(%rax)
	jmp	.L473
.L472:
	movq	(%r15), %rax
	movq	%r15, %rdi
	vzeroupper
	call	*8(%rax)
	jmp	.L473
.L478:
	movq	-488(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L479
	.cfi_endproc
.LFE4408:
	.section	.gcc_except_table
.LLSDAC4408:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC4408-.LLSDACSBC4408
.LLSDACSBC4408:
	.uleb128 .LEHB46-.LCOLDB74
	.uleb128 .LEHE46-.LEHB46
	.uleb128 0
	.uleb128 0
.LLSDACSEC4408:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE74:
	.section	.text.startup
.LHOTE74:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB5920:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE5920:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.weak	_ZTS12ShapeVirtual
	.section	.rodata._ZTS12ShapeVirtual,"aG",@progbits,_ZTS12ShapeVirtual,comdat
	.align 8
	.type	_ZTS12ShapeVirtual, @object
	.size	_ZTS12ShapeVirtual, 15
_ZTS12ShapeVirtual:
	.string	"12ShapeVirtual"
	.weak	_ZTI12ShapeVirtual
	.section	.data.rel.ro._ZTI12ShapeVirtual,"awG",@progbits,_ZTI12ShapeVirtual,comdat
	.align 8
	.type	_ZTI12ShapeVirtual, @object
	.size	_ZTI12ShapeVirtual, 16
_ZTI12ShapeVirtual:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS12ShapeVirtual
	.weak	_ZTS13CircleVirtual
	.section	.rodata._ZTS13CircleVirtual,"aG",@progbits,_ZTS13CircleVirtual,comdat
	.align 16
	.type	_ZTS13CircleVirtual, @object
	.size	_ZTS13CircleVirtual, 16
_ZTS13CircleVirtual:
	.string	"13CircleVirtual"
	.weak	_ZTI13CircleVirtual
	.section	.data.rel.ro._ZTI13CircleVirtual,"awG",@progbits,_ZTI13CircleVirtual,comdat
	.align 8
	.type	_ZTI13CircleVirtual, @object
	.size	_ZTI13CircleVirtual, 24
_ZTI13CircleVirtual:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTS13CircleVirtual
	.quad	_ZTI12ShapeVirtual
	.weak	_ZTS16RectangleVirtual
	.section	.rodata._ZTS16RectangleVirtual,"aG",@progbits,_ZTS16RectangleVirtual,comdat
	.align 16
	.type	_ZTS16RectangleVirtual, @object
	.size	_ZTS16RectangleVirtual, 19
_ZTS16RectangleVirtual:
	.string	"16RectangleVirtual"
	.weak	_ZTI16RectangleVirtual
	.section	.data.rel.ro._ZTI16RectangleVirtual,"awG",@progbits,_ZTI16RectangleVirtual,comdat
	.align 8
	.type	_ZTI16RectangleVirtual, @object
	.size	_ZTI16RectangleVirtual, 24
_ZTI16RectangleVirtual:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTS16RectangleVirtual
	.quad	_ZTI12ShapeVirtual
	.weak	_ZTV13CircleVirtual
	.section	.data.rel.ro.local._ZTV13CircleVirtual,"awG",@progbits,_ZTV13CircleVirtual,comdat
	.align 8
	.type	_ZTV13CircleVirtual, @object
	.size	_ZTV13CircleVirtual, 48
_ZTV13CircleVirtual:
	.quad	0
	.quad	_ZTI13CircleVirtual
	.quad	_ZN13CircleVirtualD1Ev
	.quad	_ZN13CircleVirtualD0Ev
	.quad	_ZNK13CircleVirtual4areaEv
	.quad	_ZNK13CircleVirtual9perimeterEv
	.weak	_ZTV16RectangleVirtual
	.section	.data.rel.ro.local._ZTV16RectangleVirtual,"awG",@progbits,_ZTV16RectangleVirtual,comdat
	.align 8
	.type	_ZTV16RectangleVirtual, @object
	.size	_ZTV16RectangleVirtual, 48
_ZTV16RectangleVirtual:
	.quad	0
	.quad	_ZTI16RectangleVirtual
	.quad	_ZN16RectangleVirtualD1Ev
	.quad	_ZN16RectangleVirtualD0Ev
	.quad	_ZNK16RectangleVirtual4areaEv
	.quad	_ZNK16RectangleVirtual9perimeterEv
	.weak	_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits
	.section	.rodata._ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits,"aG",@progbits,_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits,comdat
	.align 32
	.type	_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits, @gnu_unique_object
	.size	_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits, 201
_ZZNSt8__detail18__to_chars_10_implIjEEvPcjT_E8__digits:
	.string	"00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899"
	.weak	_ZN9CountableI6PersonE5countE
	.section	.bss._ZN9CountableI6PersonE5countE,"awG",@nobits,_ZN9CountableI6PersonE5countE,comdat
	.align 8
	.type	_ZN9CountableI6PersonE5countE, @gnu_unique_object
	.size	_ZN9CountableI6PersonE5countE, 8
_ZN9CountableI6PersonE5countE:
	.zero	8
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-266631570
	.long	1074340345
	.align 8
.LC1:
	.long	-266631570
	.long	1075388921
	.set	.LC17,.LC46
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC19:
	.long	0
	.long	1074790400
	.long	0
	.long	1075314688
	.set	.LC37,.LC45
	.set	.LC38,.LC45+16
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC45:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.long	0
	.long	1074266112
	.long	0
	.long	1074790400
	.align 32
.LC46:
	.long	0
	.long	1075052544
	.long	0
	.long	1075314688
	.long	0
	.long	1075576832
	.long	0
	.long	1075838976
	.align 32
.LC47:
	.long	0
	.long	1075970048
	.long	0
	.long	1076101120
	.long	0
	.long	1076232192
	.long	0
	.long	1076363264
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 12.4.0-2ubuntu1~24.04) 12.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
