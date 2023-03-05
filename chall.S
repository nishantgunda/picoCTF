	.arch armv8-a
	.file	"chall.c"
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	sub	sp, sp, #16     ;w0=266134863 w1=1592237099 
	str	w0, [sp, 12]    ;sp+12=266134863
	str	w1, [sp, 8]     ;sp+8=1592237099
	ldr	w1, [sp, 12]    ;w1=266134863
	ldr	w0, [sp, 8]     ;w0=1592237099
	cmp	w1, w0          ;w1<w0
	bls	.L2             ;since ls(less than w2)
	ldr	w0, [sp, 12]
	b	.L3
.L2:
	ldr	w0, [sp, 8]      ;w0=1592237099
.L3:
	add	sp, sp, 16
	ret
	.size	func1, .-func1
	.section	.rodata
	.align	3
.LC0:
	.string	"Result: %ld\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0    ;x29=sp
	str	x19, [sp, 16] ;sp+16=x19
	str	w0, [x29, 44] ;sp+44=266134863
	str	x1, [x29, 32] ;sp+32=1592237099
	ldr	x0, [x29, 32] ;x0=1592237099
	add	x0, x0, 8     ;x0 points to 1 next element in stack therefore x0 points 266134863
	ldr	x0, [x0]      ;x0="266134863"
	bl	atoi          ;convert x0 to int 
	mov	w19, w0       ;w19=266134863
	ldr	x0, [x29, 32] ;x0=1592237099
	add	x0, x0, 16    ;now x0 points 2nd argument
	ldr	x0, [x0]      ;x0=1592237099
	bl	atoi          ;conv x0 to int
	mov	w1, w0        ;w1=1592237099
	mov	w0, w19       ;w0=266134863
	bl	func1         ;go to func1
	mov	w1, w0        ;w1=1592237099
	adrp	x0, .LC0  
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
