	.arch armv8-a
	.file	"symtablelist.c"
	.text
	.align	2
	.global	SymTable_new
	.type	SymTable_new, %function
SymTable_new:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	x1, 16
	mov	x0, 1
	bl	calloc
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L2
	mov	x0, 0
	b	.L3
.L2:
	ldr	x0, [sp, 24]
	str	xzr, [x0]
	ldr	x0, [sp, 24]
.L3:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	SymTable_new, .-SymTable_new
	.align	2
	.global	free_LL
	.type	free_LL, %function
free_LL:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	beq	.L5
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	bl	free_LL
.L5:
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 24]
	bl	free
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	free_LL, .-free_LL
	.section	.rodata
	.align	3
.LC0:
	.string	"symtablelist.c"
	.align	3
.LC1:
	.string	"oSymTable != NULL"
	.text
	.align	2
	.global	SymTable_free
	.type	SymTable_free, %function
SymTable_free:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L7
	adrp	x0, __PRETTY_FUNCTION__.8
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.8
	mov	w2, 36
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L7:
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 8]
	cmp	x0, 0
	bne	.L8
	ldr	x0, [sp, 24]
	bl	free
	b	.L6
.L8:
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 8]
	bl	free_LL
	ldr	x0, [sp, 24]
	bl	free
.L6:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	SymTable_free, .-SymTable_free
	.align	2
	.global	SymTable_getLength
	.type	SymTable_getLength, %function
SymTable_getLength:
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
	bne	.L11
	adrp	x0, __PRETTY_FUNCTION__.7
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.7
	mov	w2, 46
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L11:
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	SymTable_getLength, .-SymTable_getLength
	.section	.rodata
	.align	3
.LC2:
	.string	"key != NULL"
	.text
	.align	2
	.global	Node_new
	.type	Node_new, %function
Node_new:
.LFB4:
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
	bne	.L14
	adrp	x0, __PRETTY_FUNCTION__.6
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.6
	mov	w2, 53
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	__assert_fail
.L14:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L15
	mov	x0, 0
	b	.L16
.L15:
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
	bne	.L17
	ldr	x0, [sp, 40]
	bl	free
	mov	x0, 0
	b	.L16
.L17:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	ldr	x1, [sp, 24]
	bl	strcpy
	ldr	x0, [sp, 40]
	ldr	x1, [sp, 16]
	str	x1, [x0, 8]
	ldr	x0, [sp, 40]
.L16:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	Node_new, .-Node_new
	.section	.rodata
	.align	3
.LC3:
	.string	"pcKey != NULL"
	.text
	.align	2
	.global	SymTable_put
	.type	SymTable_put, %function
SymTable_put:
.LFB5:
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
	ldr	x0, [x0, 8]
	str	x0, [sp, 72]
	str	xzr, [sp, 64]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L19
	adrp	x0, __PRETTY_FUNCTION__.5
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.5
	mov	w2, 77
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L19:
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L20
	adrp	x0, __PRETTY_FUNCTION__.5
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.5
	mov	w2, 78
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L20:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L24
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 32]
	bl	Node_new
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L22
	mov	w0, 0
	b	.L23
.L22:
	ldr	x0, [sp, 40]
	ldr	x1, [sp, 56]
	str	x1, [x0, 8]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	add	x1, x0, 1
	ldr	x0, [sp, 40]
	str	x1, [x0]
	mov	w0, 1
	b	.L23
.L26:
	ldr	x0, [sp, 72]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	strcmp
	cmp	w0, 0
	bne	.L25
	mov	w0, 0
	b	.L23
.L25:
	ldr	x0, [sp, 72]
	str	x0, [sp, 64]
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L24:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L26
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 32]
	bl	Node_new
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L27
	mov	w0, 0
	b	.L23
.L27:
	ldr	x0, [sp, 64]
	ldr	x1, [sp, 56]
	str	x1, [x0, 16]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	add	x1, x0, 1
	ldr	x0, [sp, 40]
	str	x1, [x0]
	mov	w0, 1
.L23:
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	SymTable_put, .-SymTable_put
	.align	2
	.global	SymTable_replace
	.type	SymTable_replace, %function
SymTable_replace:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
	str	x0, [sp, 56]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L29
	adrp	x0, __PRETTY_FUNCTION__.4
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.4
	mov	w2, 106
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L29:
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L31
	adrp	x0, __PRETTY_FUNCTION__.4
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.4
	mov	w2, 107
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L34:
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	strcmp
	cmp	w0, 0
	bne	.L32
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 24]
	str	x1, [x0, 8]
	ldr	x0, [sp, 48]
	b	.L33
.L32:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L31:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L34
	mov	x0, 0
.L33:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	SymTable_replace, .-SymTable_replace
	.align	2
	.global	SymTable_contains
	.type	SymTable_contains, %function
SymTable_contains:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 8]
	str	x0, [sp, 40]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L36
	adrp	x0, __PRETTY_FUNCTION__.3
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.3
	mov	w2, 125
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L36:
	ldr	x0, [sp, 16]
	cmp	x0, 0
	bne	.L38
	adrp	x0, __PRETTY_FUNCTION__.3
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.3
	mov	w2, 126
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L41:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	strcmp
	cmp	w0, 0
	bne	.L39
	mov	w0, 1
	b	.L40
.L39:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L38:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L41
	mov	w0, 0
.L40:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	SymTable_contains, .-SymTable_contains
	.align	2
	.global	SymTable_get
	.type	SymTable_get, %function
SymTable_get:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 8]
	str	x0, [sp, 40]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L43
	adrp	x0, __PRETTY_FUNCTION__.2
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.2
	mov	w2, 138
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L43:
	ldr	x0, [sp, 16]
	cmp	x0, 0
	bne	.L45
	adrp	x0, __PRETTY_FUNCTION__.2
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.2
	mov	w2, 139
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L48:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	strcmp
	cmp	w0, 0
	bne	.L46
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
	b	.L47
.L46:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L45:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L48
	mov	x0, 0
.L47:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	SymTable_get, .-SymTable_get
	.align	2
	.global	SymTable_remove
	.type	SymTable_remove, %function
SymTable_remove:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 8]
	str	x0, [sp, 56]
	str	xzr, [sp, 48]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L50
	adrp	x0, __PRETTY_FUNCTION__.1
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.1
	mov	w2, 154
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L50:
	ldr	x0, [sp, 16]
	cmp	x0, 0
	bne	.L52
	adrp	x0, __PRETTY_FUNCTION__.1
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.1
	mov	w2, 155
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	__assert_fail
.L57:
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	bl	strcmp
	cmp	w0, 0
	bne	.L53
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	str	x0, [sp, 40]
	ldr	x0, [sp, 48]
	cmp	x0, 0
	bne	.L54
	ldr	x0, [sp, 56]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 24]
	str	x1, [x0, 8]
	b	.L55
.L54:
	ldr	x0, [sp, 56]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 48]
	str	x1, [x0, 16]
.L55:
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 56]
	bl	free
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	sub	x1, x0, #1
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 40]
	b	.L56
.L53:
	ldr	x0, [sp, 56]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L52:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L57
	mov	x0, 0
.L56:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	SymTable_remove, .-SymTable_remove
	.section	.rodata
	.align	3
.LC4:
	.string	"pfApply != NULL"
	.text
	.align	2
	.global	SymTable_map
	.type	SymTable_map, %function
SymTable_map:
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
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
	str	x0, [sp, 56]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L59
	adrp	x0, __PRETTY_FUNCTION__.0
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.0
	mov	w2, 182
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__assert_fail
.L59:
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L61
	adrp	x0, __PRETTY_FUNCTION__.0
	add	x3, x0, :lo12:__PRETTY_FUNCTION__.0
	mov	w2, 183
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	__assert_fail
.L62:
	ldr	x0, [sp, 56]
	ldr	x4, [x0]
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	ldr	x3, [sp, 32]
	ldr	x2, [sp, 24]
	mov	x1, x0
	mov	x0, x4
	blr	x3
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L61:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L62
	nop
	nop
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	SymTable_map, .-SymTable_map
	.section	.rodata
	.align	3
	.type	__PRETTY_FUNCTION__.8, %object
	.size	__PRETTY_FUNCTION__.8, 14
__PRETTY_FUNCTION__.8:
	.string	"SymTable_free"
	.align	3
	.type	__PRETTY_FUNCTION__.7, %object
	.size	__PRETTY_FUNCTION__.7, 19
__PRETTY_FUNCTION__.7:
	.string	"SymTable_getLength"
	.align	3
	.type	__PRETTY_FUNCTION__.6, %object
	.size	__PRETTY_FUNCTION__.6, 9
__PRETTY_FUNCTION__.6:
	.string	"Node_new"
	.align	3
	.type	__PRETTY_FUNCTION__.5, %object
	.size	__PRETTY_FUNCTION__.5, 13
__PRETTY_FUNCTION__.5:
	.string	"SymTable_put"
	.align	3
	.type	__PRETTY_FUNCTION__.4, %object
	.size	__PRETTY_FUNCTION__.4, 17
__PRETTY_FUNCTION__.4:
	.string	"SymTable_replace"
	.align	3
	.type	__PRETTY_FUNCTION__.3, %object
	.size	__PRETTY_FUNCTION__.3, 18
__PRETTY_FUNCTION__.3:
	.string	"SymTable_contains"
	.align	3
	.type	__PRETTY_FUNCTION__.2, %object
	.size	__PRETTY_FUNCTION__.2, 13
__PRETTY_FUNCTION__.2:
	.string	"SymTable_get"
	.align	3
	.type	__PRETTY_FUNCTION__.1, %object
	.size	__PRETTY_FUNCTION__.1, 16
__PRETTY_FUNCTION__.1:
	.string	"SymTable_remove"
	.align	3
	.type	__PRETTY_FUNCTION__.0, %object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"SymTable_map"
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits
