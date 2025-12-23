	.file	"expression_templates_complete.cpp"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0, @function
_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0:
.LFB6441:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	shrq	$60, %rax
	jne	.L15
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rdi)
	movq	%rdi, %r12
	vmovdqu	%xmm0, (%rdi)
	testq	%rsi, %rsi
	je	.L16
	leaq	0(,%rsi,8), %rbx
	movq	%rdx, %r13
	movq	%rbx, %rdi
	call	_Znwm@PLT
	leaq	-8(%rbx), %rsi
	vmovsd	0(%r13), %xmm1
	movq	%rsi, %rdi
	leaq	(%rax,%rbx), %r8
	movq	%rax, (%r12)
	movq	%rax, %rcx
	shrq	$3, %rdi
	movq	%r8, 16(%r12)
	addq	$1, %rdi
	cmpq	$16, %rsi
	jbe	.L5
	movq	%rdi, %rdx
	vbroadcastsd	%xmm1, %ymm0
	shrq	$2, %rdx
	salq	$5, %rdx
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L6
	testb	$3, %dil
	je	.L12
	andq	$-4, %rdi
	leaq	(%rcx,%rdi,8), %rcx
	vzeroupper
.L5:
	leaq	8(%rcx), %rax
	vmovsd	%xmm1, (%rcx)
	cmpq	%rax, %r8
	je	.L4
	leaq	16(%rcx), %rax
	vmovsd	%xmm1, 8(%rcx)
	cmpq	%rax, %r8
	je	.L4
	vmovsd	%xmm1, 16(%rcx)
.L4:
	movq	%r8, 8(%r12)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L16:
	.cfi_restore_state
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	movq	%rax, (%rdi)
	movq	%rax, 16(%rdi)
	jmp	.L4
.L12:
	vzeroupper
	jmp	.L4
.L15:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE6441:
	.size	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0, .-_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB6443:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %rbp
	testq	%rbp, %rbp
	je	.L22
	cmpb	$0, 56(%rbp)
	movq	%rdi, %rbx
	je	.L19
	movsbl	67(%rbp), %esi
.L20:
	movq	%rbx, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L19:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%rbp), %rax
	movl	$10, %esi
	movq	%rbp, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L20
.L22:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE6443:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"basic_string: construction from null is not valid"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0:
.LFB6445:
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
	je	.L33
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	movq	%rsi, %r12
	call	strlen@PLT
	movq	%rax, %rbx
	cmpq	$15, %rax
	ja	.L34
	cmpq	$1, %rax
	je	.L35
	testq	%rax, %rax
	jne	.L26
.L28:
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
.L35:
	.cfi_restore_state
	movzbl	(%r12), %eax
	movb	%al, 16(%rbp)
	jmp	.L28
.L34:
	leaq	1(%rax), %rdi
	call	_Znwm@PLT
	movq	%rbx, 16(%rbp)
	movq	%rax, 0(%rbp)
	movq	%rax, %r13
.L26:
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	memcpy@PLT
	jmp	.L28
.L33:
	leaq	.LC1(%rip), %rdi
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE6445:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
	.p2align 4
	.type	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, @function
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0:
.LFB6449:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rsi, %rsi
	je	.L39
	movq	%rsi, %rdi
	movq	%rsi, %rbx
	call	strlen@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdx
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L39:
	.cfi_restore_state
	movq	(%rdi), %rax
	movq	-24(%rax), %rdi
	addq	%rbp, %rdi
	movl	32(%rdi), %esi
	popq	%rax
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	orl	$1, %esi
	jmp	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	.cfi_endproc
.LFE6449:
	.size	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, .-_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.align 2
	.p2align 4
	.type	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0, @function
_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0:
.LFB6450:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %rax
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
	shrq	$60, %rax
	jne	.L49
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rdi)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	vmovdqu	%xmm0, (%rdi)
	testq	%rsi, %rsi
	je	.L50
	leaq	0(,%rsi,8), %r12
	movq	%r12, %rdi
	call	_Znwm@PLT
	subq	$1, %rbp
	vmovq	%rax, %xmm1
	leaq	(%rax,%r12), %r13
	movq	$0x000000000, (%rax)
	leaq	8(%rax), %rdi
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movq	%r13, 16(%rbx)
	vmovdqu	%xmm0, (%rbx)
	je	.L43
	cmpq	%r13, %rdi
	je	.L44
	leaq	-8(%r12), %rdx
	xorl	%esi, %esi
	call	memset@PLT
.L44:
	movq	%r13, %rdi
.L43:
	movq	%rdi, 8(%rbx)
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
.L50:
	.cfi_restore_state
	xorl	%eax, %eax
	movq	%rax, (%rdi)
	movq	%rax, 16(%rdi)
	xorl	%edi, %edi
	jmp	.L43
.L49:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE6450:
	.size	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0, .-_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB7:
	.text
.LHOTB7:
	.align 2
	.p2align 4
	.type	_ZZ4mainENKUlvE1_clEv, @function
_ZZ4mainENKUlvE1_clEv:
.LFB5251:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5251
	movabsq	$9223372036854775800, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	16(%rax), %r13
	movq	%rdi, 80(%rsp)
	movq	24(%rdi), %rdi
	movq	8(%r13), %rax
	movq	0(%r13), %r12
	movq	%rdi, 48(%rsp)
	movq	%rax, %rdi
	subq	%r12, %rdi
	movq	%rdi, %r14
	movq	%rdi, 64(%rsp)
	sarq	$3, %r14
	cmpq	%rdi, %rdx
	jb	.L210
	testq	%r14, %r14
	je	.L211
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	movq	$0x000000000, (%rax)
	movq	%rax, %rbx
	cmpq	$1, %r14
	je	.L212
	leaq	8(%rax), %rdi
	movq	64(%rsp), %rax
	movq	8(%r13), %r14
	movq	0(%r13), %r12
	addq	%rbx, %rax
	cmpq	%rax, %rdi
	je	.L59
	movq	64(%rsp), %rax
	xorl	%esi, %esi
	leaq	-8(%rax), %rdx
	call	memset@PLT
.L59:
	movq	%r14, %rdx
	subq	%r12, %rdx
	sarq	$3, %rdx
	.p2align 4,,10
	.p2align 3
.L57:
	cmpq	%r12, %r14
	je	.L55
	cmpq	$1, %rdx
	jbe	.L54
	leaq	8(%r12), %rcx
	movq	%rbx, %rax
	subq	%rcx, %rax
	cmpq	$16, %rax
	ja	.L213
	vmovsd	.LC5(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L63:
	vmulsd	(%r12,%rax,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jb	.L63
	.p2align 4,,10
	.p2align 3
.L55:
	movabsq	$9223372036854775800, %rdx
	movq	80(%rsp), %rax
	movq	8(%rax), %r13
	movq	8(%r13), %rax
	movq	0(%r13), %r14
	movq	%rax, %rsi
	subq	%r14, %rsi
	movq	%rsi, %r15
	movq	%rsi, 72(%rsp)
	sarq	$3, %r15
	movq	%rsi, 40(%rsp)
	movq	%r15, 88(%rsp)
	cmpq	%rsi, %rdx
	jb	.L214
	testq	%r15, %r15
	je	.L71
	movq	%rsi, %rdi
.LEHB1:
	call	_Znwm@PLT
.LEHE1:
	movq	8(%r13), %r8
	movq	0(%r13), %r14
	movq	$0x000000000, (%rax)
	movq	%rax, %r12
	movq	%r8, %rcx
	subq	%r14, %rcx
	movq	%rcx, %r13
	sarq	$3, %r13
	movq	%r13, %r9
	cmpq	$1, %r15
	je	.L123
	leaq	8(%rax), %rdi
	movq	72(%rsp), %rax
	addq	%r12, %rax
	cmpq	%rax, %rdi
	je	.L74
	movq	72(%rsp), %rax
	xorl	%esi, %esi
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	leaq	-8(%rax), %rdx
	movq	%r13, 56(%rsp)
	call	memset@PLT
	movq	56(%rsp), %r9
	movq	32(%rsp), %r8
	movq	24(%rsp), %rcx
.L74:
	movq	72(%rsp), %rax
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L72:
	cmpq	%r14, %r8
	je	.L76
	cmpq	$8, %rcx
	jbe	.L77
	leaq	8(%r14), %rdx
	movq	%r12, %rax
	subq	%rdx, %rax
	cmpq	$16, %rax
	ja	.L215
.L77:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L84:
	vmovsd	(%r14,%rax,8), %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
	addq	$1, %rax
	cmpq	%r9, %rax
	jb	.L84
	testq	%r15, %r15
	je	.L208
	.p2align 4,,10
	.p2align 3
.L76:
	movq	56(%rsp), %rdi
.LEHB2:
	call	_Znwm@PLT
.LEHE2:
	movq	$0x000000000, (%rax)
	movq	%rax, %r13
	cmpq	$1, %r15
	je	.L126
	leaq	8(%rax), %rdi
	movq	56(%rsp), %rax
	addq	%r13, %rax
	cmpq	%rax, %rdi
	je	.L216
	movq	56(%rsp), %r14
	xorl	%esi, %esi
	leaq	-8(%r14), %rdx
	call	memset@PLT
	movq	%r14, 24(%rsp)
	movq	%r14, %rax
	sarq	$3, %r14
	cmpq	$0, 72(%rsp)
	je	.L128
	movq	%rax, 32(%rsp)
.L89:
	leaq	-1(%r15), %rax
	cmpq	$2, %rax
	jbe	.L129
	movq	%r15, %rdx
	xorl	%eax, %eax
	shrq	$2, %rdx
	salq	$5, %rdx
	.p2align 4,,10
	.p2align 3
.L93:
	vmovupd	(%rbx,%rax), %ymm2
	vaddpd	(%r12,%rax), %ymm2, %ymm0
	vmovupd	%ymm0, 0(%r13,%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L93
	movq	%r15, %rax
	andq	$-4, %rax
	testb	$3, %r15b
	je	.L201
	subq	%rax, %r15
	movq	%r15, 88(%rsp)
	cmpq	$1, %r15
	je	.L217
	vzeroupper
.L92:
	vmovupd	(%r12,%rax,8), %xmm5
	vaddpd	(%rbx,%rax,8), %xmm5, %xmm0
	movq	88(%rsp), %rcx
	vmovupd	%xmm0, 0(%r13,%rax,8)
	testb	$1, %cl
	je	.L91
	andq	$-2, %rcx
	addq	%rcx, %rax
.L87:
	vmovsd	(%r12,%rax,8), %xmm0
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
.L91:
	testq	%r14, %r14
	je	.L130
.L90:
	movq	32(%rsp), %r15
	movq	%r15, %rdi
.LEHB3:
	call	_Znwm@PLT
.LEHE3:
	movq	$0x000000000, (%rax)
	movq	%rax, %rcx
	addq	%rax, %r15
	leaq	8(%rax), %r9
	cmpq	$1, %r14
	je	.L218
	cmpq	%r15, %r9
	je	.L219
	movq	32(%rsp), %rdx
	xorl	%esi, %esi
	movq	%r9, %rdi
	movq	%rax, 88(%rsp)
	subq	$8, %rdx
	call	memset@PLT
	cmpq	$0, 24(%rsp)
	movq	88(%rsp), %rcx
	je	.L112
.L104:
	movq	48(%rsp), %rax
	movq	%rcx, %rsi
	movq	(%rax), %rdx
	leaq	8(%rdx), %rax
	subq	%rax, %rsi
	xorl	%eax, %eax
	cmpq	$16, %rsi
	ja	.L220
	.p2align 4,,10
	.p2align 3
.L106:
	vmovsd	0(%r13,%rax,8), %xmm0
	vsubsd	(%rdx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	addq	$1, %rax
	cmpq	%r14, %rax
	jne	.L106
	.p2align 4,,10
	.p2align 3
.L112:
	movq	%r15, %r9
.L103:
	movq	80(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	movq	16(%rax), %rsi
	movq	%rcx, (%rax)
	movq	%r9, 8(%rax)
	movq	%r15, 16(%rax)
	testq	%rdi, %rdi
	je	.L113
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L113:
	testq	%r13, %r13
	je	.L114
	movq	56(%rsp), %rsi
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L114:
	testq	%r12, %r12
	je	.L115
	movq	40(%rsp), %rsi
	movq	%r12, %rdi
	call	_ZdlPvm@PLT
.L115:
	testq	%rbx, %rbx
	je	.L205
	movq	64(%rsp), %rsi
	leaq	-40(%rbp), %rsp
	movq	%rbx, %rdi
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L215:
	.cfi_restore_state
	testq	%r13, %r13
	movl	$1, %eax
	cmove	%rax, %r13
	cmpq	$24, %rcx
	jbe	.L124
	movq	%r13, %rdx
	xorl	%eax, %eax
	shrq	$2, %rdx
	salq	$5, %rdx
	.p2align 4,,10
	.p2align 3
.L79:
	vmovupd	(%r14,%rax), %ymm3
	vaddpd	%ymm3, %ymm3, %ymm0
	vmovupd	%ymm0, (%r12,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L79
	movq	%r13, %rax
	andq	$-4, %rax
	testb	$3, %r13b
	je	.L221
	vzeroupper
.L78:
	subq	%rax, %r13
	cmpq	$1, %r13
	je	.L82
	vmovupd	(%r14,%rax,8), %xmm6
	vaddpd	%xmm6, %xmm6, %xmm0
	vmovupd	%xmm0, (%r12,%rax,8)
	testb	$1, %r13b
	je	.L76
	andq	$-2, %r13
	addq	%r13, %rax
.L82:
	vmovsd	(%r14,%rax,8), %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L211:
	xorl	%ebx, %ebx
	cmpq	%r12, %rax
	je	.L55
.L54:
	vmovsd	.LC5(%rip), %xmm0
	vmulsd	(%r12), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx)
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L71:
	movq	$0, 56(%rsp)
	cmpq	%r14, %rax
	je	.L222
	movq	$0, 72(%rsp)
	xorl	%r9d, %r9d
	xorl	%r12d, %r12d
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L213:
	testq	%rdx, %rdx
	movl	$1, %ecx
	cmovne	%rdx, %rcx
	cmpq	$3, %rdx
	jbe	.L122
	vbroadcastsd	.LC5(%rip), %ymm1
	movq	%rcx, %rdx
	xorl	%eax, %eax
	shrq	$2, %rdx
	salq	$5, %rdx
	.p2align 4,,10
	.p2align 3
.L65:
	vmulpd	(%r12,%rax), %ymm1, %ymm0
	vmovupd	%ymm0, (%rbx,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L65
	movq	%rcx, %rax
	andq	$-4, %rax
	testb	$3, %cl
	je	.L223
	vzeroupper
.L64:
	subq	%rax, %rcx
	cmpq	$1, %rcx
	je	.L68
	vmovddup	.LC5(%rip), %xmm0
	vmulpd	(%r12,%rax,8), %xmm0, %xmm0
	vmovupd	%xmm0, (%rbx,%rax,8)
	testb	$1, %cl
	je	.L55
	andq	$-2, %rcx
	addq	%rcx, %rax
.L68:
	vmovsd	.LC5(%rip), %xmm0
	vmulsd	(%r12,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L205:
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
.L222:
	.cfi_restore_state
	xorl	%r12d, %r12d
.L208:
	xorl	%r13d, %r13d
.L85:
	movq	88(%rsp), %r15
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L220:
	leaq	-1(%r14), %rax
	cmpq	$2, %rax
	jbe	.L132
	movq	%r14, %rsi
	xorl	%eax, %eax
	shrq	$2, %rsi
	salq	$5, %rsi
	.p2align 4,,10
	.p2align 3
.L108:
	vmovupd	0(%r13,%rax), %ymm4
	vsubpd	(%rdx,%rax), %ymm4, %ymm0
	vmovupd	%ymm0, (%rcx,%rax)
	addq	$32, %rax
	cmpq	%rax, %rsi
	jne	.L108
	testb	$3, %r14b
	je	.L203
	movq	%r14, %rax
	andq	$-4, %rax
	subq	%rax, %r14
	cmpq	$1, %r14
	je	.L224
	vzeroupper
.L107:
	vmovupd	0(%r13,%rax,8), %xmm7
	vsubpd	(%rdx,%rax,8), %xmm7, %xmm0
	vmovupd	%xmm0, (%rcx,%rax,8)
	testb	$1, %r14b
	je	.L112
	andq	$-2, %r14
	addq	%r14, %rax
.L110:
	vmovsd	0(%r13,%rax,8), %xmm0
	vsubsd	(%rdx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rax,8)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L212:
	movq	8(%r13), %r14
	movq	0(%r13), %r12
	movq	%r14, %rdx
	subq	%r12, %rdx
	sarq	$3, %rdx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L201:
	vzeroupper
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L123:
	movq	$8, 56(%rsp)
	movq	$8, 72(%rsp)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L126:
	movq	$8, 32(%rsp)
	movl	$1, %r14d
	xorl	%eax, %eax
	movq	$8, 24(%rsp)
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L218:
	movq	48(%rsp), %rax
	vmovsd	0(%r13), %xmm0
	movq	(%rax), %rax
	vsubsd	(%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	jmp	.L103
.L223:
	vzeroupper
	jmp	.L55
.L221:
	vzeroupper
	jmp	.L76
.L203:
	vzeroupper
	jmp	.L112
.L224:
	vzeroupper
	jmp	.L110
.L122:
	xorl	%eax, %eax
	jmp	.L64
.L124:
	xorl	%eax, %eax
	jmp	.L78
.L216:
	cmpq	$0, 72(%rsp)
	movl	$1, %r14d
	movq	$8, 32(%rsp)
	movq	$8, 24(%rsp)
	jne	.L89
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L132:
	xorl	%eax, %eax
	jmp	.L107
.L219:
	cmpq	$0, 24(%rsp)
	jne	.L104
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L128:
	movq	56(%rsp), %rax
	movq	%rax, 32(%rsp)
	jmp	.L91
.L129:
	xorl	%eax, %eax
	jmp	.L92
.L214:
	leaq	.LC0(%rip), %rdi
.LEHB4:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE4:
.L217:
	vzeroupper
	jmp	.L87
.L130:
	movq	32(%rsp), %rax
	movq	%rax, 88(%rsp)
	jmp	.L85
.L210:
	leaq	.LC0(%rip), %rdi
.LEHB5:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE5:
.L134:
	endbr64
	movq	%rax, %r14
	vzeroupper
	jmp	.L117
.L136:
	endbr64
	movq	%rax, %r14
	vzeroupper
	jmp	.L98
.L135:
	endbr64
	movq	%rax, %r14
	jmp	.L97
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA5251:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5251-.LLSDACSB5251
.LLSDACSB5251:
	.uleb128 .LEHB0-.LFB5251
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB5251
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L134-.LFB5251
	.uleb128 0
	.uleb128 .LEHB2-.LFB5251
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L136-.LFB5251
	.uleb128 0
	.uleb128 .LEHB3-.LFB5251
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L135-.LFB5251
	.uleb128 0
	.uleb128 .LEHB4-.LFB5251
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L134-.LFB5251
	.uleb128 0
	.uleb128 .LEHB5-.LFB5251
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE5251:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC5251
	.type	_ZZ4mainENKUlvE1_clEv.cold, @function
_ZZ4mainENKUlvE1_clEv.cold:
.LFSB5251:
.L97:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	movq	56(%rsp), %rsi
	movq	%r13, %rdi
	vzeroupper
	call	_ZdlPvm@PLT
.L98:
	movq	40(%rsp), %rsi
	movq	%r12, %rdi
	call	_ZdlPvm@PLT
.L117:
	testq	%rbx, %rbx
	je	.L118
	movq	64(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZdlPvm@PLT
.L118:
	movq	%r14, %rdi
.LEHB6:
	call	_Unwind_Resume@PLT
.LEHE6:
	.cfi_endproc
.LFE5251:
	.section	.gcc_except_table
.LLSDAC5251:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC5251-.LLSDACSBC5251
.LLSDACSBC5251:
	.uleb128 .LEHB6-.LCOLDB7
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSEC5251:
	.section	.text.unlikely
	.text
	.size	_ZZ4mainENKUlvE1_clEv, .-_ZZ4mainENKUlvE1_clEv
	.section	.text.unlikely
	.size	_ZZ4mainENKUlvE1_clEv.cold, .-_ZZ4mainENKUlvE1_clEv.cold
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv:
.LFB5804:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	leaq	16(%rdi), %rdx
	cmpq	%rdx, %rax
	je	.L227
	movq	16(%rdi), %rsi
	movq	%rax, %rdi
	addq	$1, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L227:
	ret
	.cfi_endproc
.LFE5804:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv:
.LFB6409:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rdi, %rdx
	vpxor	%xmm6, %xmm6, %xmm6
	movl	$2567483615, %esi
	leaq	1792(%rdi), %rcx
	movq	$-2147483648, %rdi
	vmovq	%rsi, %xmm5
	vmovq	%rdi, %xmm0
	movl	$2147483647, %edi
	vpbroadcastq	%xmm5, %ymm5
	vmovq	%rdi, %xmm1
	movl	$1, %edi
	vpbroadcastq	%xmm0, %ymm9
	vmovq	%rdi, %xmm3
	vpbroadcastq	%xmm1, %ymm8
	vpbroadcastq	%xmm3, %ymm7
	.p2align 4,,10
	.p2align 3
.L229:
	vpand	8(%rdx), %ymm8, %ymm4
	vpand	(%rdx), %ymm9, %ymm2
	addq	$32, %rdx
	vpor	%ymm4, %ymm2, %ymm2
	vpsrlq	$1, %ymm2, %ymm4
	vpand	%ymm7, %ymm2, %ymm2
	vpxor	3144(%rdx), %ymm4, %ymm4
	vpcmpeqq	%ymm6, %ymm2, %ymm2
	vpxor	%ymm5, %ymm4, %ymm10
	vpblendvb	%ymm2, %ymm4, %ymm10, %ymm2
	vmovdqu	%ymm2, -32(%rdx)
	cmpq	%rdx, %rcx
	jne	.L229
	movq	1808(%rax), %rcx
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vpunpcklqdq	%xmm1, %xmm1, %xmm1
	vpxor	%xmm6, %xmm6, %xmm6
	vpand	1800(%rax), %xmm1, %xmm1
	vpand	1792(%rax), %xmm0, %xmm0
	vmovq	%rsi, %xmm7
	movq	1816(%rax), %rdx
	andq	$-2147483648, %rcx
	vpor	%xmm1, %xmm0, %xmm0
	vpunpcklqdq	%xmm3, %xmm3, %xmm1
	vpxor	%xmm3, %xmm3, %xmm3
	andl	$2147483647, %edx
	vpsrlq	$1, %xmm0, %xmm2
	vpand	%xmm1, %xmm0, %xmm0
	orq	%rdx, %rcx
	vpxor	4968(%rax), %xmm2, %xmm2
	vpunpcklqdq	%xmm7, %xmm7, %xmm1
	movq	%rcx, %rdx
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	shrq	%rdx
	xorq	4984(%rax), %rdx
	vpxor	%xmm1, %xmm2, %xmm1
	xorq	%rdx, %rsi
	andl	$1, %ecx
	movl	$2567483615, %ecx
	vpblendvb	%xmm0, %xmm2, %xmm1, %xmm0
	cmovne	%rsi, %rdx
	vmovq	%rcx, %xmm5
	vpbroadcastq	.LC16(%rip), %ymm2
	vmovdqu	%xmm0, 1792(%rax)
	leaq	4984(%rax), %rsi
	vpbroadcastq	%xmm5, %ymm5
	vpbroadcastq	.LC17(%rip), %ymm1
	vpbroadcastq	.LC18(%rip), %ymm0
	movq	%rdx, 1808(%rax)
	leaq	1816(%rax), %rdx
.L231:
	vpand	8(%rdx), %ymm1, %ymm4
	vpand	(%rdx), %ymm2, %ymm3
	addq	$32, %rdx
	vpor	%ymm4, %ymm3, %ymm3
	vpsrlq	$1, %ymm3, %ymm4
	vpand	%ymm0, %ymm3, %ymm3
	vpxor	-1848(%rdx), %ymm4, %ymm4
	vpcmpeqq	%ymm6, %ymm3, %ymm3
	vpxor	%ymm5, %ymm4, %ymm7
	vpblendvb	%ymm3, %ymm4, %ymm7, %ymm3
	vmovdqu	%ymm3, -32(%rdx)
	cmpq	%rdx, %rsi
	jne	.L231
	movq	4984(%rax), %rsi
	movq	(%rax), %rdx
	movq	$0, 4992(%rax)
	andl	$2147483647, %edx
	andq	$-2147483648, %rsi
	orq	%rdx, %rsi
	movq	%rsi, %rdx
	shrq	%rdx
	xorq	3168(%rax), %rdx
	xorq	%rdx, %rcx
	andl	$1, %esi
	cmovne	%rcx, %rdx
	movq	%rdx, 4984(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE6409:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"================================================\n"
	.align 8
.LC21:
	.string	"  Expression Templates: Complete Guide\n"
	.align 8
.LC22:
	.string	"================================================\n\n"
	.align 8
.LC23:
	.string	"Test 1: Vector Operations (size = "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC24:
	.string	")\n"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"------------------------------------------------\n"
	.section	.rodata.str1.1
.LC29:
	.string	"Naive: d = a + b + c"
.LC32:
	.string	" ms"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Expression Template: d = a + b + c"
	.section	.rodata.str1.1
.LC34:
	.string	"\nSpeedup: "
.LC35:
	.string	"x\n\n"
.LC36:
	.string	"Test 2: Complex Expression\n"
.LC37:
	.string	"Naive: result = a*2 + b*3 - c"
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"Expr Template: result = a*2 + b*3 - c"
	.align 8
.LC42:
	.string	"Test 3: Matrix Operations (1000x1000)\n"
	.section	.rodata.str1.1
.LC44:
	.string	"Matrix: D = A + B*2 + C"
.LC46:
	.string	"\n"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"Test 4: Matrix Transpose (zero-copy)\n"
	.align 8
.LC48:
	.string	"Transpose + Add: E = A + transpose(B)"
	.section	.rodata.str1.1
.LC49:
	.string	"Memory Allocation Analysis\n"
.LC50:
	.string	"Expression: d = a + b + c\n"
.LC51:
	.string	"Naive implementation:\n"
.LC52:
	.string	"  - Temporary objects: 2\n"
.LC53:
	.string	"  - Memory allocations: 2\n"
.LC54:
	.string	"  - Full array traversals: 3\n"
	.section	.rodata.str1.8
	.align 8
.LC55:
	.string	"  - Cache efficiency: Poor (3 separate loops)\n\n"
	.section	.rodata.str1.1
.LC56:
	.string	"Expression Template:\n"
.LC57:
	.string	"  - Temporary objects: 0\n"
.LC58:
	.string	"  - Memory allocations: 0\n"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"  - Full array traversals: 1 (fused loop)\n"
	.align 8
.LC60:
	.string	"  - Cache efficiency: Excellent (single pass)\n\n"
	.align 8
.LC61:
	.string	"Compiler Optimization Analysis\n"
	.align 8
.LC62:
	.string	"Expression Template benefits:\n"
	.align 8
.LC63:
	.string	"  1. Loop fusion: All operations in ONE loop\n"
	.section	.rodata.str1.1
.LC64:
	.string	"  2. Zero temporary objects\n"
.LC65:
	.string	"  3. Better cache locality\n"
	.section	.rodata.str1.8
	.align 8
.LC66:
	.string	"  4. Easier for compiler to vectorize\n"
	.align 8
.LC67:
	.string	"  5. Reduced memory bandwidth usage\n\n"
	.section	.rodata.str1.1
.LC68:
	.string	"Typical speedup:\n"
.LC69:
	.string	"  Simple expressions:  5-15x\n"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"  Complex expressions: 10-50x\n"
	.align 8
.LC71:
	.string	"  Matrix operations:   3-20x\n\n"
	.align 8
.LC72:
	.string	"When to Use Expression Templates\n"
	.section	.rodata.str1.1
.LC73:
	.string	"\342\234\223 Use when:\n"
	.section	.rodata.str1.8
	.align 8
.LC74:
	.string	"  - Numerical computing (vectors, matrices)\n"
	.align 8
.LC75:
	.string	"  - Complex mathematical expressions\n"
	.section	.rodata.str1.1
.LC76:
	.string	"  - Performance is critical\n"
	.section	.rodata.str1.8
	.align 8
.LC77:
	.string	"  - Working with large datasets\n\n"
	.section	.rodata.str1.1
.LC78:
	.string	"\342\234\227 Avoid when:\n"
	.section	.rodata.str1.8
	.align 8
.LC79:
	.string	"  - Simple operations (overkill)\n"
	.align 8
.LC80:
	.string	"  - Small data sizes (overhead not worth it)\n"
	.align 8
.LC81:
	.string	"  - Code simplicity is more important\n"
	.align 8
.LC82:
	.string	"  - Compilation time is critical\n\n"
	.align 8
.LC83:
	.string	"Famous libraries using Expression Templates:\n"
	.section	.rodata.str1.1
.LC84:
	.string	"  - Eigen (linear algebra)\n"
.LC85:
	.string	"  - Blaze (linear algebra)\n"
	.section	.rodata.str1.8
	.align 8
.LC86:
	.string	"  - Boost.uBLAS (linear algebra)\n"
	.align 8
.LC87:
	.string	"  - Armadillo (scientific computing)\n\n"
	.section	.rodata.str1.1
.LC88:
	.string	"Key Takeaways\n"
	.section	.rodata.str1.8
	.align 8
.LC89:
	.string	"1. Expression Templates = Zero-cost abstractions\n"
	.align 8
.LC90:
	.string	"2. Eliminate temporary objects at compile time\n"
	.align 8
.LC91:
	.string	"3. Enable aggressive compiler optimizations\n"
	.align 8
.LC92:
	.string	"4. Essential for high-performance numerical code\n"
	.align 8
.LC93:
	.string	"5. Used by all modern C++ math libraries\n\n"
	.section	.text.unlikely
.LCOLDB94:
	.section	.text.startup,"ax",@progbits
.LHOTB94:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5241:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5241
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1792, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	.LC20(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movl	$1, %ebx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-5056(%rbp), %r12
.LEHB7:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC21(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$42, %eax
	movq	$42, -5056(%rbp)
	movq	%rax, %rdx
.L239:
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	$1812433253, %rax, %rax
	leal	(%rax,%rbx), %edx
	movq	%rdx, (%r12,%rbx,8)
	addq	$1, %rbx
	cmpq	$624, %rbx
	jne	.L239
	movl	$34, %edx
	leaq	.LC23(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	$624, -64(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1000000, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC25(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	-5680(%rbp), %rax
	movl	$1000000, %esi
	movq	%rax, %rdi
	movq	%rax, -5856(%rbp)
	call	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
.LEHE7:
	leaq	-5648(%rbp), %rax
	movl	$1000000, %esi
	movq	%rax, %rdi
	movq	%rax, -5880(%rbp)
.LEHB8:
	call	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
.LEHE8:
	leaq	-5616(%rbp), %rax
	movl	$1000000, %esi
	movq	%rax, %rdi
	movq	%rax, -5888(%rbp)
.LEHB9:
	call	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
.LEHE9:
	leaq	-5584(%rbp), %rdi
	movl	$1000000, %esi
.LEHB10:
	call	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
.LEHE10:
	movq	-5680(%rbp), %rax
	movq	-5616(%rbp), %r15
	xorl	%r13d, %r13d
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	-5648(%rbp), %r14
	movq	%rax, -5808(%rbp)
	jmp	.L240
.L856:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L262:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L517
	vaddsd	%xmm1, %xmm0, %xmm0
.L263:
	movq	-5808(%rbp), %rax
	vmovsd	%xmm0, (%rax,%r13,8)
	cmpq	$623, %rdx
	ja	.L850
.L241:
	movq	-5056(%rbp,%rdx,8), %rax
	leaq	1(%rdx), %rsi
	movq	%rsi, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L242
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	ja	.L851
.L244:
	movq	-5056(%rbp,%rsi,8), %rax
	leaq	1(%rsi), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L245
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L246:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L516
	vaddsd	%xmm1, %xmm0, %xmm0
.L247:
	vmovsd	%xmm0, (%r14,%r13,8)
	cmpq	$623, %rcx
	ja	.L852
.L248:
	movq	-5056(%rbp,%rcx,8), %rax
	leaq	1(%rcx), %rdx
	movq	%rdx, -64(%rbp)
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$7, %rcx
	andl	$2636928640, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$15, %rcx
	andl	$4022730752, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$18, %rcx
	xorq	%rcx, %rax
	js	.L249
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rdx
	ja	.L853
.L251:
	movq	-5056(%rbp,%rdx,8), %rax
	leaq	1(%rdx), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L252
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L253:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L254
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%r13,8)
	addq	$1, %r13
	cmpq	$1000000, %r13
	je	.L256
.L240:
	cmpq	$623, %rbx
	ja	.L854
.L257:
	movq	-5056(%rbp,%rbx,8), %rax
	leaq	1(%rbx), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L258
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rcx
	ja	.L855
.L260:
	movq	-5056(%rbp,%rcx,8), %rax
	leaq	1(%rcx), %rdx
	movq	%rdx, -64(%rbp)
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$7, %rcx
	andl	$2636928640, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$15, %rcx
	andl	$4022730752, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$18, %rcx
	xorq	%rcx, %rax
	jns	.L856
	movq	%rax, %rcx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rcx
	orq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L262
.L258:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm5, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rcx
	jbe	.L260
.L855:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5768(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5768(%rbp), %xmm2
	jmp	.L260
.L252:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L253
.L249:
	movq	%rax, %rcx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rcx
	orq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm5, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rdx
	jbe	.L251
.L853:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5768(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5768(%rbp), %xmm2
	jmp	.L251
.L245:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L246
.L242:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm5, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	jbe	.L244
.L851:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5768(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5768(%rbp), %xmm2
	jmp	.L244
.L852:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L248
.L850:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L241
.L854:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L257
.L516:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L247
.L517:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L263
.L254:
	movq	.LC19(%rip), %rax
	movq	%rax, (%r15,%r13,8)
	addq	$1, %r13
	cmpq	$1000000, %r13
	jne	.L240
.L256:
	leaq	-5088(%rbp), %rax
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, -5824(%rbp)
.LEHB11:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE11:
	movq	-5672(%rbp), %rax
	movabsq	$9223372036854775800, %rdx
	movq	%rax, %rdi
	subq	-5680(%rbp), %rdi
	movq	%rdi, %r15
	movq	%rdi, -5776(%rbp)
	sarq	$3, %r15
	cmpq	%rdi, %rdx
	jb	.L857
	testq	%r15, %r15
	je	.L518
	movq	-5776(%rbp), %rdi
.LEHB12:
	call	_Znwm@PLT
.LEHE12:
	subq	$1, %r15
	movq	$0x000000000, (%rax)
	movq	%rax, %r13
	leaq	8(%rax), %r14
	je	.L847
	movq	-5776(%rbp), %rax
	leaq	0(%r13,%rax), %r15
	cmpq	%r15, %r14
	je	.L266
	leaq	-8(%rax), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	memset@PLT
.L266:
	movq	%r15, %r14
.L847:
	movq	-5672(%rbp), %rax
.L265:
	movq	-5680(%rbp), %rcx
	movq	%rax, %rdx
	subq	%rcx, %rdx
	movq	%rdx, %rdi
	sarq	$3, %rdi
	cmpq	%rcx, %rax
	je	.L274
	movq	-5648(%rbp), %rsi
	cmpq	$8, %rdx
	jbe	.L520
	leaq	8(%rcx), %r8
	movq	%r13, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L520
	leaq	8(%rsi), %r8
	movq	%r13, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L520
	testq	%rdx, %rdx
	movl	$1, %eax
	cmovne	%rdi, %rax
	cmpq	$24, %rdx
	jbe	.L521
	movq	%rax, %rdi
	xorl	%edx, %edx
	shrq	$2, %rdi
	salq	$5, %rdi
.L272:
	vmovupd	(%rsi,%rdx), %ymm6
	vaddpd	(%rcx,%rdx), %ymm6, %ymm0
	vmovupd	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdi, %rdx
	jne	.L272
	movq	%rax, %rdx
	andq	$-4, %rdx
	testb	$3, %al
	je	.L858
	vzeroupper
.L271:
	subq	%rdx, %rax
	cmpq	$1, %rax
	je	.L275
	vmovupd	(%rsi,%rdx,8), %xmm6
	vaddpd	(%rcx,%rdx,8), %xmm6, %xmm0
	vmovupd	%xmm0, 0(%r13,%rdx,8)
	testb	$1, %al
	je	.L274
	andq	$-2, %rax
	addq	%rax, %rdx
.L275:
	vmovsd	(%rsi,%rdx,8), %xmm0
	vaddsd	(%rcx,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rdx,8)
.L274:
	subq	%r13, %r14
	movq	%r14, %rax
	sarq	$3, %rax
	movq	%rax, -5768(%rbp)
	movq	%rax, -5808(%rbp)
	movabsq	$9223372036854775800, %rax
	cmpq	%r14, %rax
	jb	.L859
.L269:
	cmpq	$0, -5808(%rbp)
	je	.L278
	movq	%r14, %rdi
.LEHB13:
	call	_Znwm@PLT
.LEHE13:
	cmpq	$1, -5808(%rbp)
	leaq	(%rax,%r14), %rcx
	leaq	8(%rax), %rdi
	movq	%rax, %r15
	movq	$0x000000000, (%rax)
	je	.L860
	cmpq	%rdi, %rcx
	je	.L282
	leaq	-8(%r14), %rdx
	xorl	%esi, %esi
	movq	%rcx, -5816(%rbp)
	call	memset@PLT
	movq	-5816(%rbp), %rcx
.L282:
	testq	%r14, %r14
	je	.L522
	cmpq	$1, -5768(%rbp)
	movq	-5616(%rbp), %rdx
	je	.L523
	leaq	8(%rdx), %rax
	movq	%r15, %rsi
	subq	%rax, %rsi
	xorl	%eax, %eax
	cmpq	$16, %rsi
	ja	.L861
.L290:
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	0(%r13,%rax,8), %xmm0, %xmm0
	movq	-5808(%rbp), %rdi
	vmovsd	%xmm0, (%r15,%rax,8)
	addq	$1, %rax
	cmpq	%rdi, %rax
	jne	.L290
.L291:
	movq	%rcx, %rdi
.L280:
	movq	%rcx, -5768(%rbp)
	movq	%rdi, %rcx
	jmp	.L283
.L520:
	xorl	%eax, %eax
.L277:
	vmovsd	(%rsi,%rax,8), %xmm0
	vaddsd	(%rcx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpq	%rdi, %rax
	jb	.L277
	subq	%r13, %r14
	movq	%r14, %rax
	sarq	$3, %rax
	movq	%rax, -5768(%rbp)
	movq	%rax, -5808(%rbp)
	movabsq	$9223372036854775800, %rax
	cmpq	%r14, %rax
	jnb	.L269
	leaq	.LC0(%rip), %rdi
.LEHB14:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE14:
.L278:
	movq	%r14, -5768(%rbp)
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
.L283:
	movq	-5584(%rbp), %rdi
	movq	-5768(%rbp), %rax
	movq	%r15, -5584(%rbp)
	movq	-5568(%rbp), %rsi
	movq	%rcx, -5576(%rbp)
	movq	%rax, -5568(%rbp)
	testq	%rdi, %rdi
	je	.L292
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L292:
	testq	%r13, %r13
	je	.L293
	movq	-5776(%rbp), %rsi
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L293:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$100, -5816(%rbp)
	movq	%rax, -5840(%rbp)
.L294:
	movq	-5672(%rbp), %rax
	movq	-5680(%rbp), %rcx
	movq	%rax, %rdi
	subq	%rcx, %rdi
	movq	%rdi, %rsi
	movq	%rdi, -5832(%rbp)
	sarq	$3, %rsi
	movq	%rdi, -5776(%rbp)
	movq	%rsi, -5808(%rbp)
	movq	%rsi, %r14
	movabsq	$9223372036854775800, %rsi
	cmpq	%rdi, %rsi
	jb	.L862
	cmpq	$0, -5808(%rbp)
	je	.L300
.LEHB15:
	call	_Znwm@PLT
.LEHE15:
	movq	-5672(%rbp), %r11
	movq	-5680(%rbp), %rcx
	movq	$0x000000000, (%rax)
	movq	%rax, %r13
	movq	%r11, %r9
	subq	%rcx, %r9
	movq	%r9, %r8
	sarq	$3, %r8
	cmpq	$1, -5808(%rbp)
	movq	%r8, %r10
	je	.L526
	movq	-5832(%rbp), %rsi
	leaq	8(%rax), %rdi
	leaq	(%rax,%rsi), %rax
	cmpq	%rax, %rdi
	je	.L527
	leaq	-8(%rsi), %rdx
	xorl	%esi, %esi
	movq	%r8, -5912(%rbp)
	movq	%r9, -5904(%rbp)
	movq	%r11, -5896(%rbp)
	movq	%r8, -5872(%rbp)
	movq	%rcx, -5848(%rbp)
	call	memset@PLT
	movq	-5832(%rbp), %rsi
	movq	-5848(%rbp), %rcx
	movq	-5872(%rbp), %r10
	movq	-5896(%rbp), %r11
	movq	%rsi, -5808(%rbp)
	movq	-5904(%rbp), %r9
	movq	-5912(%rbp), %r8
.L301:
	cmpq	%rcx, %r11
	je	.L308
	movq	-5648(%rbp), %rsi
	cmpq	$8, %r9
	jbe	.L304
	leaq	8(%rcx), %rdx
	movq	%r13, %rax
	subq	%rdx, %rax
	cmpq	$16, %rax
	jbe	.L304
	leaq	8(%rsi), %rdx
	movq	%r13, %rax
	subq	%rdx, %rax
	cmpq	$16, %rax
	jbe	.L304
	testq	%r8, %r8
	movl	$1, %eax
	cmovne	%r8, %rax
	cmpq	$24, %r9
	jbe	.L528
	movq	%rax, %rdi
	xorl	%edx, %edx
	shrq	$2, %rdi
	salq	$5, %rdi
.L306:
	vmovupd	(%rsi,%rdx), %ymm5
	vaddpd	(%rcx,%rdx), %ymm5, %ymm0
	vmovupd	%ymm0, 0(%r13,%rdx)
	addq	$32, %rdx
	cmpq	%rdi, %rdx
	jne	.L306
	movq	%rax, %rdx
	andq	$-4, %rdx
	testb	$3, %al
	je	.L863
	vzeroupper
.L305:
	subq	%rdx, %rax
	cmpq	$1, %rax
	je	.L311
	vmovupd	(%rsi,%rdx,8), %xmm6
	vaddpd	(%rcx,%rdx,8), %xmm6, %xmm0
	vmovupd	%xmm0, 0(%r13,%rdx,8)
	testb	$1, %al
	je	.L308
	andq	$-2, %rax
	addq	%rax, %rdx
.L311:
	vmovsd	(%rsi,%rdx,8), %xmm0
	vaddsd	(%rcx,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rdx,8)
.L308:
	movq	-5808(%rbp), %rdi
.LEHB16:
	call	_Znwm@PLT
.LEHE16:
	movq	-5808(%rbp), %rdi
	movq	%rax, -5848(%rbp)
	movq	$0x000000000, (%rax)
	leaq	(%rax,%rdi), %rcx
	leaq	8(%rax), %rdi
	cmpq	$1, %r14
	je	.L864
	cmpq	%rcx, %rdi
	je	.L865
	movq	-5808(%rbp), %rdx
	xorl	%esi, %esi
	movq	%rcx, -5872(%rbp)
	subq	$8, %rdx
	call	memset@PLT
	cmpq	$0, -5832(%rbp)
	movq	-5616(%rbp), %rdx
	movq	-5872(%rbp), %rcx
	je	.L319
.L320:
	movq	-5848(%rbp), %rsi
	leaq	8(%rdx), %rax
	subq	%rax, %rsi
	xorl	%eax, %eax
	cmpq	$16, %rsi
	ja	.L866
.L324:
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	0(%r13,%rax,8), %xmm0, %xmm0
	movq	-5848(%rbp), %rdi
	vmovsd	%xmm0, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%r14, %rax
	jne	.L324
.L330:
	movq	%rcx, %rdi
.L321:
	movq	-5848(%rbp), %rax
	movq	%rdi, -5576(%rbp)
	movq	%rcx, -5568(%rbp)
	movq	%rax, -5584(%rbp)
	testq	%r15, %r15
	je	.L331
	movq	-5768(%rbp), %rsi
	movq	%r15, %rdi
	movq	%rcx, -5808(%rbp)
	subq	%r15, %rsi
	call	_ZdlPvm@PLT
	movq	-5808(%rbp), %rcx
.L331:
	testq	%r13, %r13
	je	.L332
	movq	-5776(%rbp), %rsi
	movq	%r13, %rdi
	movq	%rcx, -5808(%rbp)
	call	_ZdlPvm@PLT
	subl	$1, -5816(%rbp)
	movq	-5808(%rbp), %rcx
	je	.L334
.L333:
	movq	%rcx, -5768(%rbp)
	movq	-5848(%rbp), %r15
	jmp	.L294
.L300:
	cmpq	%rcx, %rax
	je	.L867
	movq	-5648(%rbp), %rsi
	xorl	%r10d, %r10d
	xorl	%r13d, %r13d
	movq	$0, -5808(%rbp)
	movq	$0, -5832(%rbp)
.L304:
	xorl	%eax, %eax
.L313:
	vmovsd	(%rsi,%rax,8), %xmm0
	vaddsd	(%rcx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpq	%r10, %rax
	jb	.L313
	testq	%r14, %r14
	jne	.L308
.L309:
	movq	$0, -5848(%rbp)
	movq	-5832(%rbp), %rcx
	xorl	%edi, %edi
	jmp	.L321
.L866:
	leaq	-1(%r14), %rax
	cmpq	$2, %rax
	jbe	.L530
	movq	%r14, %rsi
	xorl	%eax, %eax
	shrq	$2, %rsi
	salq	$5, %rsi
.L326:
	vmovupd	(%rdx,%rax), %ymm5
	vaddpd	0(%r13,%rax), %ymm5, %ymm0
	movq	-5848(%rbp), %rdi
	vmovupd	%ymm0, (%rdi,%rax)
	addq	$32, %rax
	cmpq	%rsi, %rax
	jne	.L326
	movq	%r14, %rax
	andq	$-4, %rax
	testb	$3, %r14b
	je	.L842
	subq	%rax, %r14
	cmpq	$1, %r14
	je	.L868
	vzeroupper
.L325:
	vmovupd	(%rdx,%rax,8), %xmm6
	vaddpd	0(%r13,%rax,8), %xmm6, %xmm0
	movq	-5848(%rbp), %rdi
	vmovupd	%xmm0, (%rdi,%rax,8)
	testb	$1, %r14b
	je	.L330
	movq	%r14, %rsi
	andq	$-2, %rsi
	addq	%rsi, %rax
.L328:
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi,%rax,8)
	jmp	.L330
.L332:
	subl	$1, -5816(%rbp)
	jne	.L333
.L334:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	-5840(%rbp), %rdi
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	_ZSt4cout(%rip), %rdx
	movq	-5088(%rbp), %rsi
	subq	%rdi, %rax
	leaq	_ZSt4cout(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC31(%rip), %xmm0, %xmm5
	vmovsd	%xmm5, -5808(%rbp)
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
.LEHB17:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovsd	-5808(%rbp), %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r13, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE17:
	movq	-5824(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	-5760(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5552(%rbp), %rdi
	movq	$0x000000000, -5760(%rbp)
.LEHB18:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE18:
	leaq	-5752(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5520(%rbp), %rdi
	movq	$0x000000000, -5752(%rbp)
.LEHB19:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE19:
	leaq	-5744(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5488(%rbp), %rdi
	movq	$0x000000000, -5744(%rbp)
.LEHB20:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE20:
	leaq	-5736(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5456(%rbp), %rdi
	movq	$0x000000000, -5736(%rbp)
.LEHB21:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE21:
	movq	-5520(%rbp), %rax
	movq	-5488(%rbp), %r14
	xorl	%r13d, %r13d
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rax, -5768(%rbp)
	movq	-5552(%rbp), %rax
	movq	%r14, -5776(%rbp)
	movq	%rax, -5816(%rbp)
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L875:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rcx
	ja	.L869
.L355:
	movq	-5056(%rbp,%rcx,8), %rax
	leaq	1(%rcx), %rdx
	movq	%rdx, -64(%rbp)
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$7, %rcx
	andl	$2636928640, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$15, %rcx
	andl	$4022730752, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$18, %rcx
	xorq	%rcx, %rax
	js	.L356
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L357:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L532
	vaddsd	%xmm1, %xmm0, %xmm0
.L358:
	movq	-5816(%rbp), %rax
	vmovsd	%xmm0, (%rax,%r13,8)
	cmpq	$623, %rdx
	ja	.L870
.L336:
	movq	-5056(%rbp,%rdx,8), %rax
	leaq	1(%rdx), %rsi
	movq	%rsi, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L337
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	ja	.L871
.L339:
	movq	-5056(%rbp,%rsi,8), %rax
	leaq	1(%rsi), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L340
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L341:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L531
	vaddsd	%xmm1, %xmm0, %xmm0
.L342:
	movq	-5768(%rbp), %rax
	vmovsd	%xmm0, (%rax,%r13,8)
	cmpq	$623, %rcx
	ja	.L872
.L343:
	movq	-5056(%rbp,%rcx,8), %rax
	leaq	1(%rcx), %rdx
	movq	%rdx, -64(%rbp)
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$7, %rcx
	andl	$2636928640, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	salq	$15, %rcx
	andl	$4022730752, %ecx
	xorq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$18, %rcx
	xorq	%rcx, %rax
	js	.L344
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rdx
	ja	.L873
.L346:
	movq	-5056(%rbp,%rdx,8), %rax
	leaq	1(%rdx), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	js	.L347
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
.L348:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L349
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%r13,8)
	addq	$1, %r13
	cmpq	$1000000, %r13
	je	.L351
.L335:
	cmpq	$623, %rbx
	ja	.L874
.L352:
	movq	-5056(%rbp,%rbx,8), %rax
	leaq	1(%rbx), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rdx, %rax
	jns	.L875
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rcx
	jbe	.L355
.L869:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5840(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5840(%rbp), %xmm2
	jmp	.L355
.L518:
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	jmp	.L265
.L863:
	vzeroupper
	jmp	.L308
.L526:
	movq	$8, -5808(%rbp)
	movq	$8, -5832(%rbp)
	jmp	.L301
.L861:
	movq	-5808(%rbp), %rdi
	leaq	-1(%rdi), %rax
	cmpq	$2, %rax
	jbe	.L525
	shrq	$2, %rdi
	xorl	%eax, %eax
	movq	%rdi, %rsi
	salq	$5, %rsi
.L286:
	vmovupd	(%rdx,%rax), %ymm5
	vaddpd	0(%r13,%rax), %ymm5, %ymm0
	vmovupd	%ymm0, (%r15,%rax)
	addq	$32, %rax
	cmpq	%rsi, %rax
	jne	.L286
	movq	-5808(%rbp), %rdi
	movq	%rdi, %rax
	andq	$-4, %rax
	testb	$3, %dil
	je	.L839
	subq	%rax, %rdi
	movq	%rdi, -5808(%rbp)
	subq	$1, %rdi
	je	.L876
	vzeroupper
.L285:
	vmovupd	(%rdx,%rax,8), %xmm6
	vaddpd	0(%r13,%rax,8), %xmm6, %xmm0
	movq	-5808(%rbp), %rdi
	vmovupd	%xmm0, (%r15,%rax,8)
	testb	$1, %dil
	je	.L291
	andq	$-2, %rdi
	addq	%rdi, %rax
.L288:
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	jmp	.L291
.L864:
	movq	-5616(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	movq	-5848(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	jmp	.L321
.L347:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L348
.L344:
	movq	%rax, %rcx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rcx
	orq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rdx
	jbe	.L346
.L873:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5840(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5840(%rbp), %xmm2
	jmp	.L346
.L340:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L341
.L337:
	movq	%rax, %rdx
	andl	$1, %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rdx
	orq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	jbe	.L339
.L871:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5840(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5840(%rbp), %xmm2
	jmp	.L339
.L356:
	movq	%rax, %rcx
	andl	$1, %eax
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rcx
	orq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm5, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L357
.L872:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L343
.L870:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L336
.L874:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L352
.L531:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L342
.L532:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L358
.L349:
	movq	.LC19(%rip), %rax
	movq	%rax, (%r14,%r13,8)
	addq	$1, %r13
	cmpq	$1000000, %r13
	jne	.L335
.L351:
	movq	-5824(%rbp), %rdi
	leaq	.LC33(%rip), %rsi
.LEHB22:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE22:
	movq	-5448(%rbp), %rax
	movq	-5456(%rbp), %rdi
	movq	%rax, %r15
	movq	%rdi, -5840(%rbp)
	subq	%rdi, %r15
	movq	%r15, %r13
	sarq	$3, %r13
	cmpq	%rdi, %rax
	je	.L368
	cmpq	$8, %r15
	jbe	.L534
	movq	-5768(%rbp), %rax
	movq	-5840(%rbp), %rdi
	leaq	8(%rax), %rsi
	movq	%rdi, %rax
	subq	%rsi, %rax
	cmpq	$16, %rax
	movq	-5776(%rbp), %rax
	seta	%dl
	leaq	8(%rax), %r14
	movq	%rdi, %rax
	subq	%r14, %rax
	cmpq	$16, %rax
	seta	%al
	testb	%al, %dl
	je	.L534
	movq	-5816(%rbp), %rcx
	movq	%rdi, %rax
	leaq	8(%rcx), %rdx
	subq	%rdx, %rax
	cmpq	$16, %rax
	jbe	.L534
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%r13, %rax
	cmpq	$24, %r15
	jbe	.L535
	movq	%rax, %rdi
	xorl	%edx, %edx
	shrq	$2, %rdi
	salq	$5, %rdi
.L366:
	movq	-5768(%rbp), %r11
	movq	-5840(%rbp), %r10
	vmovupd	(%r11,%rdx), %ymm6
	movq	-5776(%rbp), %r11
	vaddpd	(%rcx,%rdx), %ymm6, %ymm0
	vaddpd	(%r11,%rdx), %ymm0, %ymm0
	vmovupd	%ymm0, (%r10,%rdx)
	addq	$32, %rdx
	cmpq	%rdi, %rdx
	jne	.L366
	movq	%rax, %rdx
	andq	$-4, %rdx
	testb	$3, %al
	je	.L877
	vzeroupper
.L365:
	subq	%rdx, %rax
	cmpq	$1, %rax
	je	.L370
	movq	-5816(%rbp), %rdi
	vmovupd	(%rdi,%rdx,8), %xmm5
	movq	-5768(%rbp), %rdi
	vaddpd	(%rdi,%rdx,8), %xmm5, %xmm0
	movq	-5776(%rbp), %rdi
	vmovapd	%xmm5, -5872(%rbp)
	vaddpd	(%rdi,%rdx,8), %xmm0, %xmm0
	movq	-5840(%rbp), %rdi
	vmovupd	%xmm0, (%rdi,%rdx,8)
	testb	$1, %al
	je	.L368
	andq	$-2, %rax
	addq	%rax, %rdx
.L370:
	movq	-5768(%rbp), %rax
	vmovsd	(%rax,%rdx,8), %xmm0
	movq	-5816(%rbp), %rax
	vaddsd	(%rax,%rdx,8), %xmm0, %xmm0
	movq	-5776(%rbp), %rax
	vaddsd	(%rax,%rdx,8), %xmm0, %xmm0
	movq	-5840(%rbp), %rax
	vmovsd	%xmm0, (%rax,%rdx,8)
.L368:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rdx
	testq	%r13, %r13
	je	.L360
	cmpq	$8, %r15
	je	.L361
	movq	-5768(%rbp), %rax
	leaq	8(%rax), %rsi
	movq	-5776(%rbp), %rax
	leaq	8(%rax), %r14
.L369:
	movq	-5840(%rbp), %rdi
	movq	%rdi, %rax
	subq	%rsi, %rax
	cmpq	$16, %rax
	movq	%rdi, %rax
	seta	%sil
	subq	%r14, %rax
	cmpq	$16, %rax
	seta	%al
	testb	%al, %sil
	je	.L361
	movq	-5816(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	%rdi, %rax
	subq	%rcx, %rax
	cmpq	$16, %rax
	jbe	.L361
	movq	%r13, %rdi
	movq	%r13, %rsi
	movq	%r13, %r8
	movq	-5776(%rbp), %r11
	shrq	$2, %rdi
	leaq	-1(%r13), %r9
	andq	$-4, %rsi
	andl	$3, %r8d
	salq	$5, %rdi
	movq	-5768(%rbp), %r14
	movl	$100, %ecx
	movq	-5816(%rbp), %r15
	movq	%rdi, -5872(%rbp)
.L379:
	movq	-5872(%rbp), %rdi
	cmpq	$2, %r9
	jbe	.L878
.L376:
	xorl	%eax, %eax
.L374:
	vmovupd	(%r14,%rax), %ymm5
	vaddpd	(%r15,%rax), %ymm5, %ymm0
	vaddpd	(%r11,%rax), %ymm0, %ymm0
	movq	-5840(%rbp), %r10
	vmovupd	%ymm0, (%r10,%rax)
	addq	$32, %rax
	cmpq	%rdi, %rax
	jne	.L374
	cmpq	%rsi, %r13
	je	.L879
	movq	%rdi, -5872(%rbp)
	movq	%r8, %rax
	cmpq	$1, %r8
	je	.L536
	movq	%rsi, %r10
.L382:
	vmovupd	(%r14,%r10,8), %xmm6
	vaddpd	(%r15,%r10,8), %xmm6, %xmm0
	vaddpd	(%r11,%r10,8), %xmm0, %xmm0
	movq	-5840(%rbp), %rdi
	vmovupd	%xmm0, (%rdi,%r10,8)
	testb	$1, %al
	je	.L378
	andq	$-2, %rax
	addq	%r10, %rax
.L377:
	vmovsd	(%r14,%rax,8), %xmm0
	vaddsd	(%r15,%rax,8), %xmm0, %xmm0
	vaddsd	(%r11,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdi,%rax,8)
.L378:
	subl	$1, %ecx
	jne	.L379
.L848:
	vzeroupper
.L360:
	movq	%rdx, -5872(%rbp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	-5872(%rbp), %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	-5088(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	subq	%rdx, %rax
	leaq	_ZSt4cout(%rip), %rdx
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC31(%rip), %xmm0, %xmm6
	vmovsd	%xmm6, -5872(%rbp)
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
.LEHB23:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovsd	-5872(%rbp), %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r13, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE23:
	movq	-5824(%rbp), %r14
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB24:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	vmovsd	-5808(%rbp), %xmm5
	vdivsd	-5872(%rbp), %xmm5, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	-5424(%rbp), %r13
	vmovq	-5880(%rbp), %xmm6
	vpinsrq	$1, -5888(%rbp), %xmm6, %xmm0
	movq	%rax, %rdi
	vmovq	%r13, %xmm6
	leaq	.LC35(%rip), %rsi
	vpinsrq	$1, -5856(%rbp), %xmm6, %xmm1
	vinserti128	$0x1, %xmm0, %ymm1, %ymm5
	vmovdqa	%ymm5, -5808(%rbp)
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC36(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC25(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$1000000, %esi
	movq	%r13, %rdi
	call	_ZNSt6vectorIdSaIdEEC2EmRKS0_.constprop.0
.LEHE24:
	leaq	.LC37(%rip), %rsi
	movq	%r14, %rdi
.LEHB25:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE25:
	vmovdqa	-5808(%rbp), %ymm5
	leaq	-5360(%rbp), %r14
	movq	%r14, %rdi
	vmovdqa	%ymm5, -5360(%rbp)
	vzeroupper
.LEHB26:
	call	_ZZ4mainENKUlvE1_clEv
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$100, %r13d
	movq	%rax, %r15
.L383:
	movq	%r14, %rdi
	call	_ZZ4mainENKUlvE1_clEv
	subl	$1, %r13d
	jne	.L383
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	leaq	_ZSt4cout(%rip), %rdx
	movq	-5088(%rbp), %rsi
	subq	%r15, %rax
	leaq	_ZSt4cout(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC31(%rip), %xmm0, %xmm5
	vmovsd	%xmm5, -5808(%rbp)
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovsd	-5808(%rbp), %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r13, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE26:
	movq	-5824(%rbp), %r14
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	-5728(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5392(%rbp), %rdi
	movq	$0x000000000, -5728(%rbp)
.LEHB27:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE27:
	leaq	.LC38(%rip), %rsi
	movq	%r14, %rdi
.LEHB28:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE28:
	movq	-5384(%rbp), %rax
	movq	-5392(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rax, -5872(%rbp)
	subq	%rdx, %rdi
	movq	%rdi, %r13
	sarq	$3, %r13
	cmpq	%rax, %rdx
	je	.L384
	cmpq	$8, %rdi
	jbe	.L539
	movq	-5768(%rbp), %rax
	leaq	8(%rax), %rsi
	movq	%rdx, %rax
	subq	%rsi, %rax
	cmpq	$16, %rax
	movq	-5776(%rbp), %rax
	seta	%r8b
	leaq	8(%rax), %r14
	movq	%rdx, %rax
	subq	%r14, %rax
	cmpq	$16, %rax
	seta	%al
	testb	%al, %r8b
	je	.L539
	movq	-5816(%rbp), %rax
	leaq	8(%rax), %r8
	movq	%rdx, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L539
	testq	%rdi, %rdi
	movl	$1, %r8d
	cmovne	%r13, %r8
	cmpq	$24, %rdi
	jbe	.L540
	vbroadcastsd	.LC5(%rip), %ymm2
	movq	%r8, %r9
	xorl	%eax, %eax
	vbroadcastsd	.LC40(%rip), %ymm1
	shrq	$2, %r9
	salq	$5, %r9
.L387:
	movq	-5768(%rbp), %rcx
	vmulpd	(%rcx,%rax), %ymm2, %ymm0
	movq	-5816(%rbp), %rcx
	vfmadd231pd	(%rcx,%rax), %ymm1, %ymm0
	movq	-5776(%rbp), %rcx
	vsubpd	(%rcx,%rax), %ymm0, %ymm0
	vmovupd	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%r9, %rax
	jne	.L387
	movq	%r8, %rax
	andq	$-4, %rax
	testb	$3, %r8b
	je	.L880
	vzeroupper
.L386:
	movq	%r8, %rcx
	subq	%rax, %rcx
	cmpq	$1, %rcx
	je	.L390
	movq	-5768(%rbp), %r11
	vmovddup	.LC5(%rip), %xmm1
	movq	-5776(%rbp), %r10
	leaq	0(,%rax,8), %rsi
	vmovddup	.LC40(%rip), %xmm0
	vmulpd	(%r11,%rax,8), %xmm1, %xmm1
	movq	-5816(%rbp), %r11
	vfmadd132pd	(%r11,%rax,8), %xmm1, %xmm0
	vsubpd	(%r10,%rsi), %xmm0, %xmm0
	vmovupd	%xmm0, (%rdx,%rsi)
	testb	$1, %cl
	je	.L393
	andq	$-2, %rcx
	addq	%rcx, %rax
.L390:
	movq	-5768(%rbp), %rsi
	vmovsd	.LC5(%rip), %xmm0
	vmulsd	(%rsi,%rax,8), %xmm0, %xmm0
	movq	-5816(%rbp), %rsi
	vmovsd	(%rsi,%rax,8), %xmm6
	movq	-5776(%rbp), %rsi
	vfmadd231sd	.LC40(%rip), %xmm6, %xmm0
	vsubsd	(%rsi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
.L393:
	movq	%rdx, -5872(%rbp)
.L384:
	movq	%rdi, -5856(%rbp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r8
	testq	%r13, %r13
	je	.L389
	movq	-5856(%rbp), %rdi
	cmpq	$8, %rdi
	je	.L394
	movq	-5768(%rbp), %rax
	leaq	8(%rax), %rsi
	movq	-5776(%rbp), %rax
	leaq	8(%rax), %r14
.L388:
	movq	-5872(%rbp), %rdi
	movq	%rdi, %rax
	subq	%rsi, %rax
	cmpq	$16, %rax
	movq	%rdi, %rax
	seta	%dl
	subq	%r14, %rax
	cmpq	$16, %rax
	seta	%al
	testb	%al, %dl
	je	.L394
	movq	-5816(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	cmpq	$16, %rax
	jbe	.L394
	movq	%r13, %rax
	movq	%r13, %rsi
	movq	%r13, %rdi
	movq	-5816(%rbp), %r11
	shrq	$2, %rax
	leaq	-1(%r13), %r9
	andq	$-4, %rsi
	andl	$3, %edi
	vmovsd	.LC5(%rip), %xmm4
	salq	$5, %rax
	vmovsd	.LC40(%rip), %xmm3
	movl	$100, %edx
	vbroadcastsd	.LC5(%rip), %ymm6
	movq	%rax, %r10
	vbroadcastsd	.LC40(%rip), %ymm5
	vmovddup	%xmm4, %xmm2
	vmovddup	%xmm3, %xmm1
.L403:
	cmpq	$2, %r9
	jbe	.L881
.L399:
	xorl	%eax, %eax
.L397:
	movq	-5768(%rbp), %rcx
	vmulpd	(%rcx,%rax), %ymm6, %ymm0
	movq	-5776(%rbp), %rcx
	vfmadd231pd	(%r11,%rax), %ymm5, %ymm0
	vsubpd	(%rcx,%rax), %ymm0, %ymm0
	movq	-5872(%rbp), %rcx
	vmovupd	%ymm0, (%rcx,%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L397
	cmpq	%rsi, %r13
	je	.L882
	movq	%rdi, %rax
	cmpq	$1, %rdi
	je	.L542
	movq	%rsi, %rcx
.L406:
	movq	-5768(%rbp), %r15
	leaq	0(,%rcx,8), %r14
	vmulpd	(%r15,%rcx,8), %xmm2, %xmm0
	movq	-5776(%rbp), %r15
	vfmadd231pd	(%r11,%rcx,8), %xmm1, %xmm0
	vsubpd	(%r15,%r14), %xmm0, %xmm0
	movq	-5872(%rbp), %r15
	vmovupd	%xmm0, (%r15,%r14)
	testb	$1, %al
	je	.L402
	andq	$-2, %rax
	addq	%rcx, %rax
.L401:
	movq	-5768(%rbp), %rcx
	vmulsd	(%rcx,%rax,8), %xmm4, %xmm0
	movq	-5776(%rbp), %rcx
	vfmadd231sd	(%r11,%rax,8), %xmm3, %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	movq	-5872(%rbp), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
.L402:
	subl	$1, %edx
	jne	.L403
.L849:
	vzeroupper
.L389:
	movq	%r8, -5856(%rbp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	-5856(%rbp), %r8
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	_ZSt4cout(%rip), %rdx
	movq	-5088(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	subq	%r8, %rax
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC31(%rip), %xmm0, %xmm5
	vmovsd	%xmm5, -5856(%rbp)
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
.LEHB29:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovsd	-5856(%rbp), %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r13, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE29:
	movq	-5824(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movl	$10, %edx
	leaq	.LC34(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB30:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	vmovsd	-5808(%rbp), %xmm6
	vdivsd	-5856(%rbp), %xmm6, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC35(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC42(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC25(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	-5720(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5328(%rbp), %rdi
	movq	$0x000000000, -5720(%rbp)
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE30:
	movl	$1000, %eax
	leaq	-5712(%rbp), %rdx
	movl	$1000000, %esi
	movq	$0x000000000, -5712(%rbp)
	vmovq	%rax, %xmm0
	leaq	-5280(%rbp), %rdi
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, -5304(%rbp)
.LEHB31:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE31:
	movl	$1000, %eax
	leaq	-5704(%rbp), %rdx
	movl	$1000000, %esi
	movq	$0x000000000, -5704(%rbp)
	vmovq	%rax, %xmm0
	leaq	-5232(%rbp), %rdi
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, -5256(%rbp)
.LEHB32:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE32:
	movl	$1000, %eax
	leaq	-5696(%rbp), %rdx
	movl	$1000000, %esi
	movq	$0x000000000, -5696(%rbp)
	vmovq	%rax, %xmm0
	leaq	-5184(%rbp), %rdi
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, -5208(%rbp)
.LEHB33:
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE33:
	movq	-5232(%rbp), %r13
	movl	$1000, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rbx, %rcx
	vmovq	%rax, %xmm0
	movq	-5328(%rbp), %r15
	movq	-5280(%rbp), %rax
	leaq	8000000(%r13), %rdi
	movq	%r13, -5888(%rbp)
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	movq	%rax, -5880(%rbp)
	movq	%rax, %r14
	movq	%r15, -5856(%rbp)
	movq	%rdi, -5896(%rbp)
	vmovdqu	%xmm0, -5160(%rbp)
.L407:
	xorl	%ebx, %ebx
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L889:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rdx, %xmm6, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	ja	.L883
.L427:
	movq	-5056(%rbp,%rsi,8), %rdx
	leaq	1(%rsi), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rdx, %rax
	shrq	$11, %rax
	movl	%eax, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	salq	$15, %rax
	andl	$4022730752, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	js	.L428
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rdx, %xmm7, %xmm0
.L429:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L545
	vaddsd	%xmm1, %xmm0, %xmm0
.L430:
	vmovsd	%xmm0, (%r15,%rbx,8)
	cmpq	$623, %rcx
	ja	.L884
.L408:
	movq	-5056(%rbp,%rcx,8), %rax
	leaq	1(%rcx), %rsi
	movq	%rsi, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	js	.L409
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rdx, %xmm7, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	ja	.L885
.L411:
	movq	-5056(%rbp,%rsi,8), %rax
	leaq	1(%rsi), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rax, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	js	.L412
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%rdx, %xmm3, %xmm0
.L413:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L544
	vaddsd	%xmm1, %xmm0, %xmm0
.L414:
	vmovsd	%xmm0, (%r14,%rbx,8)
	cmpq	$623, %rcx
	ja	.L886
.L415:
	movq	-5056(%rbp,%rcx,8), %rdx
	leaq	1(%rcx), %rsi
	movq	%rsi, -64(%rbp)
	movq	%rdx, %rax
	shrq	$11, %rax
	movl	%eax, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	salq	$15, %rax
	andl	$4022730752, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	js	.L416
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rdx, %xmm4, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	ja	.L887
.L418:
	movq	-5056(%rbp,%rsi,8), %rdx
	leaq	1(%rsi), %rcx
	movq	%rcx, -64(%rbp)
	movq	%rdx, %rax
	shrq	$11, %rax
	movl	%eax, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	js	.L419
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%rdx, %xmm5, %xmm0
.L420:
	vfmadd132sd	.LC26(%rip), %xmm2, %xmm0
	vmulsd	.LC27(%rip), %xmm0, %xmm0
	vcomisd	.LC28(%rip), %xmm0
	jnb	.L421
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rbx,8)
	addq	$1, %rbx
	cmpq	$1000, %rbx
	je	.L423
.L432:
	cmpq	$623, %rcx
	ja	.L888
.L424:
	movq	-5056(%rbp,%rcx,8), %rdx
	leaq	1(%rcx), %rsi
	movq	%rsi, -64(%rbp)
	movq	%rdx, %rax
	shrq	$11, %rax
	movl	%eax, %eax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$7, %rdx
	andl	$2636928640, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$15, %rdx
	andl	$4022730752, %edx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$18, %rdx
	xorq	%rax, %rdx
	jns	.L889
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm3, %xmm3, %xmm3
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	jbe	.L427
.L883:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5808(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5808(%rbp), %xmm2
	jmp	.L427
.L842:
	vzeroupper
	jmp	.L330
.L867:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	movq	%rax, -5832(%rbp)
	jmp	.L309
.L534:
	movq	-5768(%rbp), %rdx
	xorl	%eax, %eax
.L372:
	movq	-5816(%rbp), %rdi
	vmovsd	(%rdx,%rax,8), %xmm0
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0
	movq	-5776(%rbp), %rdi
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0
	movq	-5840(%rbp), %rdi
	vmovsd	%xmm0, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%r13, %rax
	jb	.L372
	jmp	.L368
.L361:
	movq	-5768(%rbp), %rsi
	movl	$100, %ecx
.L381:
	xorl	%eax, %eax
.L380:
	movq	-5816(%rbp), %rdi
	vmovsd	(%rsi,%rax,8), %xmm0
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0
	movq	-5776(%rbp), %rdi
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0
	movq	-5840(%rbp), %rdi
	vmovsd	%xmm0, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L380
	subl	$1, %ecx
	jne	.L381
	jmp	.L360
.L539:
	vmovsd	.LC5(%rip), %xmm0
	vmovsd	.LC40(%rip), %xmm2
	xorl	%eax, %eax
.L392:
	movq	-5768(%rbp), %rsi
	vmulsd	(%rsi,%rax,8), %xmm0, %xmm1
	movq	-5816(%rbp), %rsi
	vfmadd231sd	(%rsi,%rax,8), %xmm2, %xmm1
	movq	-5776(%rbp), %rsi
	vsubsd	(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%r13, %rax
	jb	.L392
	jmp	.L393
.L394:
	vmovsd	.LC5(%rip), %xmm0
	vmovsd	.LC40(%rip), %xmm2
	movl	$100, %edx
.L405:
	xorl	%eax, %eax
.L404:
	movq	-5768(%rbp), %rdi
	vmulsd	(%rdi,%rax,8), %xmm0, %xmm1
	movq	-5816(%rbp), %rdi
	vfmadd231sd	(%rdi,%rax,8), %xmm2, %xmm1
	movq	-5776(%rbp), %rdi
	vsubsd	(%rdi,%rax,8), %xmm1, %xmm1
	movq	-5872(%rbp), %rdi
	vmovsd	%xmm1, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L404
	subl	$1, %edx
	jne	.L405
	jmp	.L389
	.p2align 4,,10
	.p2align 3
.L419:
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm6, %xmm6, %xmm6
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L416:
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm5, %xmm5, %xmm5
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm5, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	jbe	.L418
.L887:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5808(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5808(%rbp), %xmm2
	jmp	.L418
	.p2align 4,,10
	.p2align 3
.L412:
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm4, %xmm4, %xmm4
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L409:
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm3, %xmm3, %xmm3
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	cmpq	$623, %rsi
	jbe	.L411
.L885:
	movq	%r12, %rdi
	vmovsd	%xmm2, -5808(%rbp)
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	-5808(%rbp), %xmm2
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L428:
	movq	%rdx, %rax
	andl	$1, %edx
	vxorpd	%xmm4, %xmm4, %xmm4
	shrq	%rax
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L429
	.p2align 4,,10
	.p2align 3
.L884:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L888:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L886:
	movq	%r12, %rdi
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	movq	-64(%rbp), %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L545:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L430
	.p2align 4,,10
	.p2align 3
.L544:
	vmovsd	.LC19(%rip), %xmm0
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L421:
	movq	.LC19(%rip), %rax
	movq	%rax, 0(%r13,%rbx,8)
	addq	$1, %rbx
	cmpq	$1000, %rbx
	jne	.L432
.L423:
	movq	-5896(%rbp), %rax
	addq	$8000, %r13
	addq	$8000, %r14
	addq	$8000, %r15
	cmpq	%rax, %r13
	jne	.L407
	movq	-5824(%rbp), %rdi
	leaq	.LC44(%rip), %rsi
.LEHB34:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE34:
	movq	-5888(%rbp), %rsi
	movq	-5880(%rbp), %rdi
	xorl	%eax, %eax
	movq	-5856(%rbp), %r8
	vmovsd	.LC40(%rip), %xmm2
	movq	-5184(%rbp), %r12
	leaq	8(%rsi), %rbx
	leaq	8(%rdi), %r13
	leaq	8(%r8), %r14
	vbroadcastsd	%xmm2, %ymm1
.L433:
	movq	%r12, %rdx
	leaq	(%rax,%r12), %rcx
	subq	%r13, %rdx
	cmpq	$16, %rdx
	movq	%r12, %rdx
	seta	%r9b
	subq	%rbx, %rdx
	cmpq	$16, %rdx
	seta	%dl
	testb	%dl, %r9b
	je	.L570
	leaq	(%r14,%rax), %r9
	movq	%rcx, %rdx
	subq	%r9, %rdx
	cmpq	$16, %rdx
	jbe	.L570
	leaq	(%r8,%rax), %r11
	leaq	(%rdi,%rax), %r10
	xorl	%edx, %edx
	leaq	(%rsi,%rax), %r9
.L436:
	vmovupd	(%r10,%rdx), %ymm0
	vfmadd213pd	(%r11,%rdx), %ymm1, %ymm0
	vaddpd	(%r9,%rdx), %ymm0, %ymm0
	vmovupd	%ymm0, (%rcx,%rdx)
	addq	$32, %rdx
	cmpq	$8000, %rdx
	jne	.L436
	leaq	8000(%rax), %rdx
.L435:
	movq	%rdx, %rax
	cmpq	$8000000, %rdx
	jne	.L433
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vmovsd	.LC40(%rip), %xmm2
	movq	-5880(%rbp), %r10
	movq	-5856(%rbp), %r11
	movq	%rax, %r15
	movl	$10, %eax
	vbroadcastsd	%xmm2, %ymm1
.L447:
	xorl	%ecx, %ecx
.L440:
	movq	%r12, %rdx
	leaq	(%r12,%rcx), %rsi
	subq	%r13, %rdx
	cmpq	$16, %rdx
	movq	%r12, %rdx
	seta	%dil
	subq	%rbx, %rdx
	cmpq	$16, %rdx
	seta	%dl
	testb	%dl, %dil
	je	.L571
	leaq	(%r14,%rcx), %rdi
	movq	%rsi, %rdx
	subq	%rdi, %rdx
	cmpq	$16, %rdx
	jbe	.L571
	movq	-5888(%rbp), %rdi
	leaq	(%r11,%rcx), %r9
	leaq	(%r10,%rcx), %r8
	xorl	%edx, %edx
	addq	%rcx, %rdi
	.p2align 4,,10
	.p2align 3
.L443:
	vmovupd	(%r8,%rdx), %ymm0
	vfmadd213pd	(%r9,%rdx), %ymm1, %ymm0
	vaddpd	(%rdi,%rdx), %ymm0, %ymm0
	vmovupd	%ymm0, (%rsi,%rdx)
	addq	$32, %rdx
	cmpq	$8000, %rdx
	jne	.L443
	addq	$8000, %rcx
.L442:
	cmpq	$8000000, %rcx
	jne	.L440
	subl	$1, %eax
	jne	.L447
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	_ZSt4cout(%rip), %rdx
	subq	%r15, %rax
	movq	-5088(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC45(%rip), %xmm0, %xmm6
	vmovq	%xmm6, %rbx
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
.LEHB35:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovq	%rbx, %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE35:
	movq	-5824(%rbp), %rbx
	leaq	.LC46(%rip), %r14
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB36:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC47(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC25(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	-5688(%rbp), %rdx
	movl	$1000000, %esi
	leaq	-5136(%rbp), %rdi
	movq	$0x000000000, -5688(%rbp)
	call	_ZNSt6vectorIdSaIdEEC2EmRKdRKS0_.constprop.0
.LEHE36:
	movl	$1000, %eax
	leaq	.LC48(%rip), %rsi
	movq	%rbx, %rdi
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, -5112(%rbp)
.LEHB37:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.constprop.0
.LEHE37:
	movq	-5136(%rbp), %r13
	movq	-5856(%rbp), %rdi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	-5880(%rbp), %rax
	movq	%r13, %rsi
.L448:
	movq	%rsi, %r10
	leaq	7992008(%rax), %rdx
	addq	$1, %r8
	addq	$8000, %rsi
	cmpq	%rdx, %r10
	setnb	%dl
	cmpq	%rsi, %rax
	setnb	%cl
	orb	%cl, %dl
	je	.L455
	leaq	8(%rdi), %rdx
	movq	%r10, %r11
	xorl	%ecx, %ecx
	subq	%rdx, %r11
	movq	%rax, %rdx
	cmpq	$16, %r11
	jbe	.L455
.L451:
	vmovsd	16000(%rdx), %xmm1
	vmovsd	(%rdx), %xmm0
	addq	$32000, %rdx
	vmovhpd	-8000(%rdx), %xmm1, %xmm1
	vmovhpd	-24000(%rdx), %xmm0, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vaddpd	(%rdi,%rcx), %ymm0, %ymm0
	vmovupd	%ymm0, (%r10,%rcx)
	addq	$32, %rcx
	cmpq	$8000, %rcx
	jne	.L451
.L450:
	addq	$8, %rax
	addq	$8000, %rdi
	addq	$1000, %r9
	cmpq	$1000, %r8
	jne	.L448
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	movl	$10, %eax
.L456:
	movq	-5856(%rbp), %rsi
	movq	%r13, %r9
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	movq	-5880(%rbp), %r8
.L465:
	movq	%r9, %rdi
	leaq	7992008(%r8), %rdx
	addq	$1, %r10
	addq	$8000, %r9
	cmpq	%rdx, %rdi
	setnb	%dl
	cmpq	%r9, %r8
	setnb	%cl
	orb	%cl, %dl
	je	.L463
	leaq	8(%rsi), %rdx
	movq	%rdi, %r15
	xorl	%ecx, %ecx
	subq	%rdx, %r15
	movq	%r8, %rdx
	cmpq	$16, %r15
	jbe	.L463
	.p2align 4,,10
	.p2align 3
.L459:
	vmovsd	16000(%rdx), %xmm1
	vmovsd	(%rdx), %xmm0
	addq	$32000, %rdx
	vmovhpd	-8000(%rdx), %xmm1, %xmm1
	vmovhpd	-24000(%rdx), %xmm0, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vaddpd	(%rsi,%rcx), %ymm0, %ymm0
	vmovupd	%ymm0, (%rdi,%rcx)
	addq	$32, %rcx
	cmpq	$8000, %rcx
	jne	.L459
.L458:
	addq	$8, %r8
	addq	$8000, %rsi
	addq	$1000, %r11
	cmpq	$1000, %r10
	jne	.L465
	subl	$1, %eax
	jne	.L456
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	_ZSt4cout(%rip), %rdx
	subq	%rbx, %rax
	movq	-5088(%rbp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	movq	_ZSt4cout(%rip), %rax
	vdivsd	.LC30(%rip), %xmm0, %xmm0
	vdivsd	.LC45(%rip), %xmm0, %xmm6
	vmovq	%xmm6, %rbx
	addq	-24(%rax), %rdx
	movl	24(%rdx), %eax
	movq	$40, 16(%rdx)
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, 24(%rdx)
	movq	-5080(%rbp), %rdx
.LEHB38:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%rax), %rcx
	movq	%rax, %rdi
	vmovq	%rbx, %xmm0
	movq	-24(%rcx), %rdx
	addq	%rax, %rdx
	movl	24(%rdx), %eax
	movq	$10, 16(%rdx)
	andb	$79, %al
	orb	$-128, %al
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE38:
	movq	-5824(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB39:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC20(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC49(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC50(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC25(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC51(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC52(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC53(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC54(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC55(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC56(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC57(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC58(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC59(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC60(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC20(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC61(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC62(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC63(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC64(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC65(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC66(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC67(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC68(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC69(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC70(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC71(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC20(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC72(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC73(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC74(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC75(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC76(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC77(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC78(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC79(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC80(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC81(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC82(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC83(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC84(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC85(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC86(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC87(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC20(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC88(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC89(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC90(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC91(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC92(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC93(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
.LEHE39:
	testq	%r13, %r13
	je	.L466
	movq	-5120(%rbp), %rsi
	movq	%r13, %rdi
	subq	%r13, %rsi
	call	_ZdlPvm@PLT
.L466:
	testq	%r12, %r12
	je	.L467
	movq	-5168(%rbp), %rsi
	movq	%r12, %rdi
	subq	%r12, %rsi
	call	_ZdlPvm@PLT
.L467:
	movq	-5888(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L468
	movq	-5216(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L468:
	movq	-5880(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L469
	movq	-5264(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L469:
	movq	-5856(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L470
	movq	-5312(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L470:
	movq	-5872(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L471
	movq	-5376(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L471:
	movq	-5424(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L472
	movq	-5408(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L472:
	movq	-5840(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L473
	movq	-5440(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L473:
	movq	-5776(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L474
	movq	-5472(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L474:
	movq	-5768(%rbp), %rdi
	movq	-5504(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
	movq	-5536(%rbp), %rsi
	movq	-5816(%rbp), %rdi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
	movq	-5848(%rbp), %rax
	testq	%rax, %rax
	je	.L475
	movq	-5832(%rbp), %rsi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
.L475:
	movq	-5616(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L476
	movq	-5600(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L476:
	movq	-5648(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L477
	movq	-5632(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L477:
	movq	-5680(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L478
	movq	-5664(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L478:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L890
	addq	$5888, %rsp
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
.L570:
	.cfi_restore_state
	leaq	8000(%rax), %rdx
.L434:
	vmovsd	(%rdi,%rax), %xmm0
	vfmadd213sd	(%r8,%rax), %xmm2, %xmm0
	vaddsd	(%rsi,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L434
	jmp	.L435
.L571:
	movq	-5888(%rbp), %rsi
	movq	%rcx, %rdx
	leaq	8000(%rcx), %rcx
.L441:
	vmovsd	(%r10,%rdx), %xmm0
	vfmadd213sd	(%r11,%rdx), %xmm2, %xmm0
	vaddsd	(%rsi,%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rdx)
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.L441
	jmp	.L442
.L455:
	leaq	0(,%r9,8), %rcx
	movq	%rax, %rdx
	leaq	8000000(%rax), %r10
.L449:
	movq	-5856(%rbp), %rbx
	vmovsd	(%rdx), %xmm0
	addq	$8000, %rdx
	vaddsd	(%rbx,%rcx), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx)
	addq	$8, %rcx
	cmpq	%rdx, %r10
	jne	.L449
	jmp	.L450
.L463:
	movq	-5856(%rbp), %r15
	leaq	0(,%r11,8), %rcx
	movq	%r8, %rdx
	leaq	8000000(%r8), %rdi
.L457:
	vmovsd	(%rdx), %xmm0
	vaddsd	(%r15,%rcx), %xmm0, %xmm0
	addq	$8000, %rdx
	vmovsd	%xmm0, 0(%r13,%rcx)
	addq	$8, %rcx
	cmpq	%rdi, %rdx
	jne	.L457
	jmp	.L458
.L542:
	movq	%rsi, %rax
	jmp	.L401
.L882:
	subl	$1, %edx
	jne	.L399
	jmp	.L849
.L881:
	movq	%r13, %rax
	xorl	%ecx, %ecx
	jmp	.L406
.L536:
	movq	%rsi, %rax
	movq	%r10, %rdi
	jmp	.L377
.L879:
	subl	$1, %ecx
	jne	.L376
	jmp	.L848
.L878:
	movq	%r13, %rax
	xorl	%r10d, %r10d
	jmp	.L382
.L839:
	vzeroupper
	jmp	.L291
.L858:
	subq	%r13, %r14
	movq	%r14, %rax
	sarq	$3, %rax
	movq	%rax, -5768(%rbp)
	movq	%rax, -5808(%rbp)
	movabsq	$9223372036854775800, %rax
	cmpq	%r14, %rax
	jb	.L891
	vzeroupper
	jmp	.L269
.L868:
	vzeroupper
	movq	-5848(%rbp), %rdi
	jmp	.L328
.L530:
	xorl	%eax, %eax
	jmp	.L325
.L865:
	cmpq	$0, -5832(%rbp)
	je	.L319
	movq	-5616(%rbp), %rdx
	jmp	.L320
.L528:
	xorl	%edx, %edx
	jmp	.L305
.L527:
	movq	$8, -5808(%rbp)
	movl	$1, %r14d
	movq	$8, -5832(%rbp)
	jmp	.L301
.L523:
	xorl	%eax, %eax
	jmp	.L290
.L860:
	movq	-5616(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vaddsd	0(%r13), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15)
	jmp	.L280
.L857:
	leaq	.LC0(%rip), %rdi
.LEHB40:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE40:
.L521:
	xorl	%edx, %edx
	jmp	.L271
.L859:
	leaq	.LC0(%rip), %rdi
.LEHB41:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE41:
.L522:
	movq	%rcx, -5768(%rbp)
	jmp	.L283
.L862:
	leaq	.LC0(%rip), %rdi
.LEHB42:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE42:
.L319:
	xorl	%edx, %edx
	movq	%rcx, %rdi
	movq	%rdx, -5832(%rbp)
	jmp	.L321
.L891:
	leaq	.LC0(%rip), %rdi
	vzeroupper
.LEHB43:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE43:
.L876:
	vzeroupper
	jmp	.L288
.L880:
	movq	%rsi, -5856(%rbp)
	movq	%rdx, -5872(%rbp)
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	testq	%r13, %r13
	movq	-5856(%rbp), %rsi
	movq	%rax, %r8
	jne	.L388
	jmp	.L389
.L540:
	xorl	%eax, %eax
	jmp	.L386
.L890:
	call	__stack_chk_fail@PLT
.L525:
	xorl	%eax, %eax
	jmp	.L285
.L535:
	xorl	%edx, %edx
	jmp	.L365
.L877:
	movq	%rsi, -5872(%rbp)
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	testq	%r13, %r13
	movq	-5872(%rbp), %rsi
	movq	%rax, %rdx
	jne	.L369
	jmp	.L360
.L550:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L298
.L569:
	endbr64
	movq	%rax, %rbx
	jmp	.L297
.L551:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L505
.L567:
	endbr64
	movq	%rax, %rbx
	jmp	.L295
.L549:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L479
.L548:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L508
.L547:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L510
.L557:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L483
.L556:
	endbr64
	movq	%rax, %rbx
	jmp	.L482
.L566:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L489
.L561:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L494
.L553:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L501
.L559:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L485
.L546:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L512
.L563:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L487
.L564:
	endbr64
	movq	%rax, %rbx
	jmp	.L486
.L562:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L492
.L558:
	endbr64
	movq	%rax, %rbx
	jmp	.L484
.L560:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L496
.L555:
	endbr64
	movq	%rax, %rbx
	jmp	.L480
.L554:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L481
.L568:
	endbr64
	movq	%rax, %rbx
	jmp	.L316
.L565:
	endbr64
	movq	%rax, %rbx
	jmp	.L488
.L552:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L503
	.section	.gcc_except_table
.LLSDA5241:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5241-.LLSDACSB5241
.LLSDACSB5241:
	.uleb128 .LEHB7-.LFB5241
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB5241
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L546-.LFB5241
	.uleb128 0
	.uleb128 .LEHB9-.LFB5241
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L547-.LFB5241
	.uleb128 0
	.uleb128 .LEHB10-.LFB5241
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L548-.LFB5241
	.uleb128 0
	.uleb128 .LEHB11-.LFB5241
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L549-.LFB5241
	.uleb128 0
	.uleb128 .LEHB12-.LFB5241
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L550-.LFB5241
	.uleb128 0
	.uleb128 .LEHB13-.LFB5241
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L567-.LFB5241
	.uleb128 0
	.uleb128 .LEHB14-.LFB5241
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L569-.LFB5241
	.uleb128 0
	.uleb128 .LEHB15-.LFB5241
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L550-.LFB5241
	.uleb128 0
	.uleb128 .LEHB16-.LFB5241
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L568-.LFB5241
	.uleb128 0
	.uleb128 .LEHB17-.LFB5241
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L550-.LFB5241
	.uleb128 0
	.uleb128 .LEHB18-.LFB5241
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L549-.LFB5241
	.uleb128 0
	.uleb128 .LEHB19-.LFB5241
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L551-.LFB5241
	.uleb128 0
	.uleb128 .LEHB20-.LFB5241
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L552-.LFB5241
	.uleb128 0
	.uleb128 .LEHB21-.LFB5241
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L553-.LFB5241
	.uleb128 0
	.uleb128 .LEHB22-.LFB5241
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L554-.LFB5241
	.uleb128 0
	.uleb128 .LEHB23-.LFB5241
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L555-.LFB5241
	.uleb128 0
	.uleb128 .LEHB24-.LFB5241
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L554-.LFB5241
	.uleb128 0
	.uleb128 .LEHB25-.LFB5241
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L557-.LFB5241
	.uleb128 0
	.uleb128 .LEHB26-.LFB5241
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L556-.LFB5241
	.uleb128 0
	.uleb128 .LEHB27-.LFB5241
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L557-.LFB5241
	.uleb128 0
	.uleb128 .LEHB28-.LFB5241
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L559-.LFB5241
	.uleb128 0
	.uleb128 .LEHB29-.LFB5241
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L558-.LFB5241
	.uleb128 0
	.uleb128 .LEHB30-.LFB5241
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L559-.LFB5241
	.uleb128 0
	.uleb128 .LEHB31-.LFB5241
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L560-.LFB5241
	.uleb128 0
	.uleb128 .LEHB32-.LFB5241
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L561-.LFB5241
	.uleb128 0
	.uleb128 .LEHB33-.LFB5241
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L562-.LFB5241
	.uleb128 0
	.uleb128 .LEHB34-.LFB5241
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L563-.LFB5241
	.uleb128 0
	.uleb128 .LEHB35-.LFB5241
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L564-.LFB5241
	.uleb128 0
	.uleb128 .LEHB36-.LFB5241
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L563-.LFB5241
	.uleb128 0
	.uleb128 .LEHB37-.LFB5241
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L566-.LFB5241
	.uleb128 0
	.uleb128 .LEHB38-.LFB5241
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L565-.LFB5241
	.uleb128 0
	.uleb128 .LEHB39-.LFB5241
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L566-.LFB5241
	.uleb128 0
	.uleb128 .LEHB40-.LFB5241
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L550-.LFB5241
	.uleb128 0
	.uleb128 .LEHB41-.LFB5241
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L567-.LFB5241
	.uleb128 0
	.uleb128 .LEHB42-.LFB5241
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L550-.LFB5241
	.uleb128 0
	.uleb128 .LEHB43-.LFB5241
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L569-.LFB5241
	.uleb128 0
.LLSDACSE5241:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC5241
	.type	main.cold, @function
main.cold:
.LFSB5241:
.L295:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	testq	%r13, %r13
	je	.L892
.L297:
	movq	-5776(%rbp), %rsi
	movq	%r13, %rdi
	vzeroupper
	call	_ZdlPvm@PLT
.L298:
	movq	-5824(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L479:
	movq	-5584(%rbp), %rdi
	movq	-5568(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L508
	call	_ZdlPvm@PLT
.L508:
	movq	-5616(%rbp), %rdi
	movq	-5600(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L510
	call	_ZdlPvm@PLT
.L510:
	movq	-5648(%rbp), %rdi
	movq	-5632(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L512
	call	_ZdlPvm@PLT
.L512:
	movq	-5680(%rbp), %rdi
	movq	-5664(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L513
	call	_ZdlPvm@PLT
.L513:
	movq	%rbx, %rdi
.LEHB44:
	call	_Unwind_Resume@PLT
.LEHE44:
.L480:
	movq	-5824(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L481:
	movq	-5456(%rbp), %rdi
	movq	-5440(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L501
	call	_ZdlPvm@PLT
.L501:
	movq	-5488(%rbp), %rdi
	movq	-5472(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L503
	call	_ZdlPvm@PLT
.L503:
	movq	-5520(%rbp), %rdi
	movq	-5504(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L505
	call	_ZdlPvm@PLT
.L505:
	movq	-5552(%rbp), %rdi
	movq	-5536(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L479
	call	_ZdlPvm@PLT
	jmp	.L479
.L892:
	vzeroupper
	jmp	.L298
.L486:
	movq	-5824(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L487:
	movq	-5184(%rbp), %rdi
	movq	-5168(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L492
	call	_ZdlPvm@PLT
.L492:
	movq	-5232(%rbp), %rdi
	movq	-5216(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L494
	call	_ZdlPvm@PLT
.L494:
	movq	-5280(%rbp), %rdi
	movq	-5264(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L496
	call	_ZdlPvm@PLT
.L496:
	movq	-5328(%rbp), %rdi
	movq	-5312(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L485
	call	_ZdlPvm@PLT
.L485:
	movq	-5392(%rbp), %rdi
	movq	-5376(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L483
	call	_ZdlPvm@PLT
.L483:
	movq	-5424(%rbp), %rdi
	movq	-5408(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L481
	call	_ZdlPvm@PLT
	jmp	.L481
.L488:
	movq	-5824(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L489:
	movq	-5136(%rbp), %rdi
	movq	-5120(%rbp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L487
	call	_ZdlPvm@PLT
	jmp	.L487
.L484:
	movq	-5824(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L485
.L316:
	movq	-5776(%rbp), %rsi
	movq	%r13, %rdi
	vzeroupper
	call	_ZdlPvm@PLT
	jmp	.L298
.L482:
	movq	-5824(%rbp), %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L483
	.cfi_endproc
.LFE5241:
	.section	.gcc_except_table
.LLSDAC5241:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC5241-.LLSDACSBC5241
.LLSDACSBC5241:
	.uleb128 .LEHB44-.LCOLDB94
	.uleb128 .LEHE44-.LEHB44
	.uleb128 0
	.uleb128 0
.LLSDACSEC5241:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE94:
	.section	.text.startup
.LHOTE94:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB6437:
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
.LFE6437:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1074266112
	.align 8
.LC16:
	.quad	-2147483648
	.align 8
.LC17:
	.quad	2147483647
	.align 8
.LC18:
	.quad	1
	.align 8
.LC19:
	.long	-1
	.long	1072693247
	.align 8
.LC26:
	.long	0
	.long	1106247680
	.align 8
.LC27:
	.long	0
	.long	1005584384
	.align 8
.LC28:
	.long	0
	.long	1072693248
	.align 8
.LC30:
	.long	0
	.long	1093567616
	.align 8
.LC31:
	.long	0
	.long	1079574528
	.align 8
.LC40:
	.long	0
	.long	1073741824
	.align 8
.LC45:
	.long	0
	.long	1076101120
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
