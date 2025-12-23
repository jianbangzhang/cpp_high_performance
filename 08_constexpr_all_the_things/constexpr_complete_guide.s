	.file	"constexpr_complete_guide.cpp"
	.text
	.p2align 4
	.type	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, @function
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0:
.LFB4247:
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
	je	.L5
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
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	movq	(%rdi), %rax
	movq	-24(%rax), %rdi
	addq	%rbp, %rdi
	movl	32(%rdi), %esi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	orl	$1, %esi
	jmp	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	.cfi_endproc
.LFE4247:
	.size	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, .-_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"================================================\n"
	.align 8
.LC1:
	.string	"  Constexpr & Compile-Time Computation Guide\n"
	.align 8
.LC2:
	.string	"================================================\n\n"
	.align 8
.LC3:
	.string	"Demo 1: Basic Compile-Time Computation\n"
	.align 8
.LC4:
	.string	"------------------------------------------------\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"factorial(5) = "
.LC6:
	.string	" (computed at compile time)\n"
.LC7:
	.string	"fibonacci(10) = "
.LC8:
	.string	"is_prime(17) = "
.LC9:
	.string	"\n\n"
.LC13:
	.string	"First 10 primes: "
.LC14:
	.string	" "
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Demo 2: Compile-Time String Processing\n"
	.section	.rodata.str1.1
.LC16:
	.string	"string_length(\"Hello\") = "
.LC17:
	.string	"\n"
.LC18:
	.string	"\"Hello\" == \"Hello\": "
.LC19:
	.string	"\"Hello\" == \"World\": "
.LC20:
	.string	"hash(\"compile_time_hash\") = "
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Demo 3: Compile-Time JSON Parsing\n"
	.section	.rodata.str1.1
.LC22:
	.string	"JSON \"8080\" parsed as int: "
.LC23:
	.string	"JSON \"true\" parsed as bool: "
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Demo 4: Compile-Time Unit System\n"
	.section	.rodata.str1.1
.LC25:
	.string	"Distance: "
.LC27:
	.string	" m\n"
.LC28:
	.string	"Time: "
.LC30:
	.string	" s\n"
.LC31:
	.string	"Velocity: "
.LC32:
	.string	" m/s\n"
.LC33:
	.string	"Force: "
.LC35:
	.string	" N (Newton)\n\n"
.LC36:
	.string	"Demo 5: Compile-Time Sorting\n"
.LC41:
	.string	"Unsorted: "
.LC42:
	.string	"\nSorted:   "
.LC43:
	.string	"Demo 6: Static Reflection\n"
.LC44:
	.string	"type_name<int>() = "
.LC45:
	.string	"int"
.LC46:
	.string	"type_name<float>() = "
.LC47:
	.string	"float"
.LC48:
	.string	"type_name<double>() = "
.LC49:
	.string	"double"
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Demo 7: Compile-Time State Machine\n"
	.section	.rodata.str1.1
.LC51:
	.string	"Can start from Idle? "
.LC52:
	.string	"Can stop from Running? "
.LC53:
	.string	"Can start from Stopped? "
.LC54:
	.string	"Performance Comparison\n"
.LC55:
	.string	"Compile-time vs Runtime:\n"
.LC57:
	.string	"Runtime factorial(10):      "
.LC58:
	.string	" ns/call\n"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"Compile-time factorial(10): 0 ns/call (no runtime cost!)\n\n"
	.section	.rodata.str1.1
.LC60:
	.string	"Benefits of constexpr:\n"
.LC61:
	.string	"  1. Zero runtime overhead\n"
	.section	.rodata.str1.8
	.align 8
.LC62:
	.string	"  2. Type safety at compile time\n"
	.align 8
.LC63:
	.string	"  3. Catch errors before runtime\n"
	.align 8
.LC64:
	.string	"  4. Enable template metaprogramming\n"
	.align 8
.LC65:
	.string	"  5. Smaller binary size (no runtime code)\n\n"
	.section	.rodata.str1.1
.LC66:
	.string	"When to Use Constexpr\n"
.LC67:
	.string	"\342\234\223 Perfect for:\n"
.LC68:
	.string	"  - Configuration constants\n"
.LC69:
	.string	"  - Lookup tables\n"
.LC70:
	.string	"  - Mathematical constants\n"
	.section	.rodata.str1.8
	.align 8
.LC71:
	.string	"  - Type traits and metaprogramming\n"
	.section	.rodata.str1.1
.LC72:
	.string	"  - Static assertions\n"
.LC73:
	.string	"  - Compile-time validation\n\n"
.LC74:
	.string	"\342\234\227 Not suitable for:\n"
.LC75:
	.string	"  - I/O operations\n"
	.section	.rodata.str1.8
	.align 8
.LC76:
	.string	"  - Dynamic memory allocation (before C++20)\n"
	.section	.rodata.str1.1
.LC77:
	.string	"  - Runtime-only values\n"
	.section	.rodata.str1.8
	.align 8
.LC78:
	.string	"  - Very complex computations (compilation time)\n\n"
	.section	.rodata.str1.1
.LC79:
	.string	"Real-World Examples\n"
.LC80:
	.string	"1. Embedded Systems:\n"
	.section	.rodata.str1.8
	.align 8
.LC81:
	.string	"   - Lookup tables computed at compile time\n"
	.align 8
.LC82:
	.string	"   - Zero runtime initialization cost\n\n"
	.section	.rodata.str1.1
.LC83:
	.string	"2. Game Engines:\n"
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"   - String hashing for fast lookups\n"
	.section	.rodata.str1.1
.LC85:
	.string	"   - Physics constants\n\n"
.LC86:
	.string	"3. Cryptography:\n"
	.section	.rodata.str1.8
	.align 8
.LC87:
	.string	"   - S-boxes and permutation tables\n"
	.align 8
.LC88:
	.string	"   - Compile-time key expansion\n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3440:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rsi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC14(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	.LC6(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	_ZSt4cout(%rip), %rbx
	movq	%rbx, %rdi
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	leaq	96(%rsp), %r13
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC1(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r13, %r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC3(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$15, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$120, %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi@PLT
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$16, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$55, %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi@PLT
	movq	%rbp, %rsi
	leaq	136(%rsp), %rbp
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$15, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZSt4cout(%rip), %rax
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	-24(%rax), %rcx
	addq	%rbx, %rcx
	orl	$1, 24(%rcx)
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movdqa	.LC10(%rip), %xmm0
	movq	.LC12(%rip), %rax
	movq	%rbx, %rdi
	leaq	.LC13(%rip), %rsi
	movaps	%xmm0, 96(%rsp)
	movdqa	.LC11(%rip), %xmm0
	movq	%rax, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%r15), %esi
	movq	%rbx, %rdi
	addq	$4, %r15
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpq	%r15, %rbp
	jne	.L7
	leaq	.LC9(%rip), %rsi
	movq	%rbx, %rdi
	leaq	32(%rsp), %r14
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC15(%rip), %rsi
	movq	%rbx, %rdi
	leaq	.LC17(%rip), %r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	leaq	64(%rsp), %rbp
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$25, %edx
	leaq	.LC16(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$5, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$20, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$20, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$28, %edx
	leaq	.LC20(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbx, %rdi
	movabsq	$-1861954595854612865, %rsi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC21(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$27, %edx
	leaq	.LC22(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$8080, %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$28, %edx
	leaq	.LC23(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC24(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$10, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	.LC26(%rip), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$6, %edx
	leaq	.LC28(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	.LC29(%rip), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$10, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	.LC29(%rip), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$7, %edx
	leaq	.LC33(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	.LC34(%rip), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC36(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movdqa	.LC37(%rip), %xmm0
	leaq	.LC41(%rip), %rsi
	movq	%rbx, %rdi
	movaps	%xmm0, 32(%rsp)
	movdqa	.LC38(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC39(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	movdqa	.LC40(%rip), %xmm0
	movaps	%xmm0, 80(%rsp)
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r14), %esi
	movq	%rbx, %rdi
	addq	$4, %r14
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpq	%r14, %rbp
	jne	.L8
	leaq	.LC42(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.p2align 4,,10
	.p2align 3
.L9:
	movl	0(%rbp), %esi
	movq	%rbx, %rdi
	addq	$4, %rbp
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpq	%rbp, %r13
	jne	.L9
	leaq	.LC9(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC43(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$19, %edx
	leaq	.LC44(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC45(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$21, %edx
	leaq	.LC46(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$5, %edx
	leaq	.LC47(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$22, %edx
	leaq	.LC48(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$6, %edx
	leaq	.LC49(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC50(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$21, %edx
	leaq	.LC51(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$23, %edx
	leaq	.LC52(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$24, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC0(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC54(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC55(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$0, 28(%rsp)
	movl	$1000000, %edx
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L10:
	movl	28(%rsp), %eax
	addl	$3628800, %eax
	movl	%eax, 28(%rsp)
	subl	$1, %edx
	jne	.L10
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$28, %edx
	movq	%rbx, %rdi
	pxor	%xmm0, %xmm0
	subq	%rbp, %rax
	leaq	.LC57(%rip), %rsi
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC56(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	8(%rsp), %xmm0
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC58(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC59(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC60(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC61(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC62(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC63(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC64(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC65(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC0(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC66(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC67(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC68(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC69(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC70(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC71(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC72(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC73(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC74(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC75(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC76(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC77(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC78(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC0(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC79(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC80(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC81(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC82(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC83(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC84(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC85(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC86(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC87(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC88(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L17:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3440:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB4245:
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
.LFE4245:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC10:
	.long	2
	.long	3
	.long	5
	.long	7
	.align 16
.LC11:
	.long	11
	.long	13
	.long	17
	.long	19
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
	.long	23
	.long	29
	.align 8
.LC26:
	.long	0
	.long	1079574528
	.align 8
.LC29:
	.long	0
	.long	1076101120
	.align 8
.LC34:
	.long	0
	.long	1075052544
	.section	.rodata.cst16
	.align 16
.LC37:
	.long	64
	.long	34
	.long	25
	.long	12
	.align 16
.LC38:
	.long	22
	.long	11
	.long	90
	.long	88
	.align 16
.LC39:
	.long	11
	.long	12
	.long	22
	.long	25
	.align 16
.LC40:
	.long	34
	.long	64
	.long	88
	.long	90
	.section	.rodata.cst8
	.align 8
.LC56:
	.long	0
	.long	1093567616
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
