	.arch armv8-a
	.file	"symtablehash.c"
	.text
	.global	SIZES
	.section	.rodata
	.align	3
	.type	SIZES, %object
	.size	SIZES, 64
SIZES:
	.xword	509
	.xword	1021
	.xword	2039
	.xword	4093
	.xword	8191
	.xword	16381
	.xword	32749
	.xword	65521
	.align	3
.LC0:
	.string	"symtablehash.c"
	.align	3
.LC1:
	.string	"pcKey != NULL"
	.text
	.align	2
	.type	SymTable_hash, %function
SymTable_hash:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	mov	x0, 63
	movk	x0, 0x1, lsl 16
	str	x0, [sp, 40]
	str	xzr, [sp, 48]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L2
	adrp	x0, __PRETTY_FUNCTION__.5
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.5
	mov	w2, 33
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L2:
	str	xzr, [sp, 56]
	b	.L3
.L4:
	ldr	x1, [sp, 48]
	ldr	x0, [sp, 40]
	mul	x1, x1, x0
	ldr	x2, [sp, 24]
	ldr	x0, [sp, 56]
	add	x0, x2, x0
	ldrb	w0, [x0]
	and	x0, x0, 255
	add	x0, x1, x0
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	str	x0, [sp, 56]
.L3:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 56]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L4
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 16]
	udiv	x2, x0, x1
	ldr	x1, [sp, 16]
	mul	x1, x2, x1
	sub	x0, x0, x1
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	SymTable_hash, .-SymTable_hash
	.align	2
	.global	SymTable_new
	.type	SymTable_new, %function
SymTable_new:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	x1, 24
	mov	x0, 1
	bl	calloc
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L7
	mov	x0, 0
	b	.L8
.L7:
	mov	x0, 509
	mov	x1, 8
	bl	calloc
	mov	x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	cmp	x0, 0
	bne	.L9
	ldr	x0, [sp, 24]
	bl	free
	mov	x0, 0
	b	.L8
.L9:
	ldr	x0, [sp, 24]
	str	xzr, [x0, 16]
	ldr	x0, [sp, 24]
	str	wzr, [x0, 8]
	ldr	x0, [sp, 24]
.L8:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	SymTable_new, .-SymTable_new
	.section	.rodata
	.align	3
.LC2:
	.string	"key != NULL"
	.text
	.align	2
	.global	Node_new
	.type	Node_new, %function
Node_new:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	mov	x1, 24
	mov	x0, 1
	bl	calloc
	str	x0, [sp, 40]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L11
	adrp	x0, __PRETTY_FUNCTION__.4
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.4
	mov	w2, 61
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	__assert_fail
.L11:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L12
	mov	x0, 0
	b	.L13
.L12:
	ldr	x0, [sp, 24]
	bl	strlen
	add	x0, x0, 1
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 40]
	str	x1, [x0]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	cmp	x0, 0
	bne	.L14
	ldr	x0, [sp, 40]
	bl	free
	mov	x0, 0
	b	.L13
.L14:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	ldr	x1, [sp, 24]
	bl	strcpy
	ldr	x0, [sp, 40]
	ldr	x1, [sp, 16]
	str	x1, [x0, 8]
	ldr	x0, [sp, 40]
.L13:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	Node_new, .-Node_new
	.align	2
	.global	free_LL
	.type	free_LL, %function
free_LL:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	beq	.L19
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	beq	.L18
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	bl	free_LL
.L18:
	ldr	x0, [sp, 24]
	bl	free
	b	.L15
.L19:
	nop
.L15:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	free_LL, .-free_LL
	.section	.rodata
	.align	3
.LC3:
	.string	"oSymTable != NULL"
	.text
	.align	2
	.global	SymTable_free
	.type	SymTable_free, %function
SymTable_free:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	xzr, [sp, 40]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	str	x0, [sp, 32]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L21
	adrp	x0, __PRETTY_FUNCTION__.3
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.3
	mov	w2, 87
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L21:
	str	xzr, [sp, 40]
	b	.L22
.L23:
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 40]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	bl	free_LL
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
.L22:
	ldr	x1, [sp, 40]
	ldr	x0, [sp, 32]
	cmp	x1, x0
	bcc	.L23
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 24]
	bl	free
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	SymTable_free, .-SymTable_free
	.align	2
	.global	SymTable_getLength
	.type	SymTable_getLength, %function
SymTable_getLength:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L25
	adrp	x0, __PRETTY_FUNCTION__.2
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.2
	mov	w2, 98
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L25:
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	SymTable_getLength, .-SymTable_getLength
	.align	2
	.global	putElement
	.type	putElement, %function
putElement:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	str	x3, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 32]
	bl	SymTable_hash
	str	x0, [sp, 64]
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 32]
	bl	Node_new
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L28
	mov	w0, 0
	b	.L29
.L28:
	ldr	x0, [sp, 64]
	lsl	x0, x0, 3
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L31
	ldr	x0, [sp, 64]
	lsl	x0, x0, 3
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldr	x1, [sp, 56]
	str	x1, [x0]
	mov	w0, 1
	b	.L29
.L32:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L31:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L32
	ldr	x0, [sp, 72]
	ldr	x1, [sp, 56]
	str	x1, [x0, 16]
	mov	w0, 1
.L29:
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	putElement, .-putElement
	.align	2
	.global	expandTable
	.type	expandTable, %function
expandTable:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L34
	adrp	x0, __PRETTY_FUNCTION__.1
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.1
	mov	w2, 126
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L34:
	ldr	x0, [sp, 24]
	ldr	x1, [x0, 16]
	mov	x0, 32749
	cmp	x1, x0
	bcc	.L35
	mov	w0, 1
	b	.L36
.L35:
	ldr	x0, [sp, 24]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 24]
	ldr	w2, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x2, w2
	ldr	x0, [x0, x2, lsl 3]
	cmp	x1, x0
	bcc	.L37
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	str	x0, [sp, 72]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 8]
	add	w1, w0, 1
	ldr	x0, [sp, 24]
	str	w1, [x0, 8]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	str	x0, [sp, 64]
	str	xzr, [sp, 88]
	mov	x1, 8
	ldr	x0, [sp, 64]
	bl	calloc
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L38
	mov	w0, 0
	b	.L36
.L38:
	str	xzr, [sp, 88]
	b	.L39
.L42:
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 88]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 80]
	b	.L40
.L41:
	ldr	x0, [sp, 80]
	ldr	x0, [x0]
	ldr	x1, [sp, 64]
	bl	SymTable_hash
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	lsl	x0, x0, 3
	ldr	x1, [sp, 56]
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 40]
	ldr	x0, [sp, 80]
	ldr	x2, [x0]
	ldr	x0, [sp, 80]
	ldr	x0, [x0, 8]
	mov	x1, x0
	mov	x0, x2
	bl	Node_new
	str	x0, [sp, 32]
	ldr	x0, [sp, 48]
	lsl	x0, x0, 3
	ldr	x1, [sp, 56]
	add	x0, x1, x0
	ldr	x1, [sp, 32]
	str	x1, [x0]
	ldr	x0, [sp, 32]
	ldr	x1, [sp, 40]
	str	x1, [x0, 16]
	ldr	x0, [sp, 80]
	ldr	x0, [x0, 16]
	str	x0, [sp, 32]
	ldr	x0, [sp, 80]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 80]
	bl	free
	ldr	x0, [sp, 32]
	str	x0, [sp, 80]
.L40:
	ldr	x0, [sp, 80]
	cmp	x0, 0
	bne	.L41
	ldr	x0, [sp, 88]
	add	x0, x0, 1
	str	x0, [sp, 88]
.L39:
	ldr	x1, [sp, 88]
	ldr	x0, [sp, 72]
	cmp	x1, x0
	bcc	.L42
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 24]
	ldr	x1, [sp, 56]
	str	x1, [x0]
	mov	w0, 1
	b	.L36
.L37:
	mov	w0, 1
.L36:
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	expandTable, .-expandTable
	.align	2
	.global	SymTable_put
	.type	SymTable_put, %function
SymTable_put:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	str	xzr, [sp, 64]
	str	xzr, [sp, 56]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L44
	adrp	x0, __PRETTY_FUNCTION__.0
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.0
	mov	w2, 178
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L44:
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L45
	adrp	x0, __PRETTY_FUNCTION__.0
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.0
	mov	w2, 179
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L45:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 32]
	bl	Node_new
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	cmp	x0, 0
	bne	.L46
	mov	w0, 0
	b	.L47
.L46:
	ldr	x0, [sp, 40]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	SymTable_hash
	str	x0, [sp, 48]
	ldr	x0, [sp, 40]
	ldr	x1, [x0]
	ldr	x0, [sp, 48]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L48
	ldr	x0, [sp, 40]
	ldr	x1, [x0]
	ldr	x0, [sp, 48]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x1, [sp, 64]
	str	x1, [x0]
	b	.L49
.L48:
	ldr	x0, [sp, 72]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	strcmp
	cmp	w0, 0
	bne	.L50
	ldr	x0, [sp, 64]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 64]
	bl	free
	mov	w0, 0
	b	.L47
.L50:
	ldr	x0, [sp, 72]
	str	x0, [sp, 56]
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L48
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 64]
	str	x1, [x0, 16]
.L49:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	add	x1, x0, 1
	ldr	x0, [sp, 40]
	str	x1, [x0, 16]
	ldr	x0, [sp, 40]
	bl	expandTable
.L47:
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	SymTable_put, .-SymTable_put
	.align	2
	.global	getNodeFromKey
	.type	getNodeFromKey, %function
getNodeFromKey:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	SymTable_hash
	str	x0, [sp, 32]
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 32]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L54
	mov	x0, 0
	b	.L53
.L56:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	strcmp
	cmp	w0, 0
	bne	.L55
	ldr	x0, [sp, 40]
	b	.L53
.L55:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L54:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L56
	mov	x0, 0
.L53:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	getNodeFromKey, .-getNodeFromKey
	.align	2
	.global	SymTable_replace
	.type	SymTable_replace, %function
SymTable_replace:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	getNodeFromKey
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L58
	mov	x0, 0
	b	.L59
.L58:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 24]
	str	x1, [x0, 8]
	ldr	x0, [sp, 48]
.L59:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	SymTable_replace, .-SymTable_replace
	.align	2
	.global	SymTable_contains
	.type	SymTable_contains, %function
SymTable_contains:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	getNodeFromKey
	cmp	x0, 0
	cset	w0, ne
	and	w0, w0, 255
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	SymTable_contains, .-SymTable_contains
	.align	2
	.global	SymTable_get
	.type	SymTable_get, %function
SymTable_get:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	getNodeFromKey
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L63
	mov	x0, 0
	b	.L64
.L63:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
.L64:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	SymTable_get, .-SymTable_get
	.align	2
	.global	SymTable_remove
	.type	SymTable_remove, %function
SymTable_remove:
.LFB13:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	SymTable_hash
	str	x0, [sp, 40]
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 40]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 56]
	str	xzr, [sp, 48]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L68
	mov	x0, 0
	b	.L67
.L72:
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	strcmp
	cmp	w0, 0
	bne	.L69
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	str	x0, [sp, 32]
	ldr	x0, [sp, 48]
	cmp	x0, 0
	bne	.L70
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 40]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x1, [sp, 56]
	ldr	x1, [x1, 16]
	str	x1, [x0]
	b	.L71
.L70:
	ldr	x0, [sp, 56]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 48]
	str	x1, [x0, 16]
.L71:
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 56]
	bl	free
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	sub	x1, x0, #1
	ldr	x0, [sp, 24]
	str	x1, [x0, 16]
	ldr	x0, [sp, 32]
	b	.L67
.L69:
	ldr	x0, [sp, 56]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L68:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L72
	mov	x0, 0
.L67:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE13:
	.size	SymTable_remove, .-SymTable_remove
	.align	2
	.global	SymTable_map
	.type	SymTable_map, %function
SymTable_map:
.LFB14:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 40]
	ldr	w1, [x0, 8]
	adrp	x0, SIZES
	add	x0, x0, :lo12:SIZES
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	str	x0, [sp, 56]
	str	xzr, [sp, 72]
	str	xzr, [sp, 72]
	b	.L74
.L77:
	ldr	x0, [sp, 40]
	ldr	x1, [x0]
	ldr	x0, [sp, 72]
	lsl	x0, x0, 3
	add	x0, x1, x0
	ldr	x0, [x0]
	str	x0, [sp, 64]
	b	.L75
.L76:
	ldr	x0, [sp, 64]
	ldr	x4, [x0]
	ldr	x0, [sp, 64]
	ldr	x0, [x0, 8]
	ldr	x3, [sp, 32]
	ldr	x2, [sp, 24]
	mov	x1, x0
	mov	x0, x4
	blr	x3
	ldr	x0, [sp, 64]
	ldr	x0, [x0, 16]
	str	x0, [sp, 64]
.L75:
	ldr	x0, [sp, 64]
	cmp	x0, 0
	bne	.L76
	ldr	x0, [sp, 72]
	add	x0, x0, 1
	str	x0, [sp, 72]
.L74:
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 56]
	cmp	x1, x0
	bcc	.L77
	nop
	nop
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE14:
	.size	SymTable_map, .-SymTable_map
	.section	.rodata
	.align	3
	.type	__PRETTY_FUNCTION__.5, %object
	.size	__PRETTY_FUNCTION__.5, 14
__PRETTY_FUNCTION__.5:
	.string	"SymTable_hash"
	.align	3
	.type	__PRETTY_FUNCTION__.4, %object
	.size	__PRETTY_FUNCTION__.4, 9
__PRETTY_FUNCTION__.4:
	.string	"Node_new"
	.align	3
	.type	__PRETTY_FUNCTION__.3, %object
	.size	__PRETTY_FUNCTION__.3, 14
__PRETTY_FUNCTION__.3:
	.string	"SymTable_free"
	.align	3
	.type	__PRETTY_FUNCTION__.2, %object
	.size	__PRETTY_FUNCTION__.2, 19
__PRETTY_FUNCTION__.2:
	.string	"SymTable_getLength"
	.align	3
	.type	__PRETTY_FUNCTION__.1, %object
	.size	__PRETTY_FUNCTION__.1, 12
__PRETTY_FUNCTION__.1:
	.string	"expandTable"
	.align	3
	.type	__PRETTY_FUNCTION__.0, %object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"SymTable_put"
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits
