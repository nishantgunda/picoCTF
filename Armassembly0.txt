I went to a youtube tutorial to learn how it executes the code 
I came to know that the execution starts from the line where it adds 8 to x0 so basically it starts pointing to the arguments we passed to it
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
I went to func1
  sub	sp, sp, #16     ;for reference w0=266134863 w1=1592237099 
	str	w0, [sp, 12]    ;sp+12=266134863
	str	w1, [sp, 8]     ;sp+8=1592237099
	ldr	w1, [sp, 12]    ;w1=266134863
	ldr	w0, [sp, 8]     ;w0=1592237099
	cmp	w1, w0          ;w1<w0
	bls	.L2             ;go to L2 since ls(less than w2)
now in L2
  ldr	w0, [sp, 8]      ;w0=1592237099
Then it returns to main where
  mov	w1, w0        ;w1=1592237099
  adrp	x0, .LC0    ;send x0 to .LC0
Where it printed it so i converted 1592237099 into hex and checked the answer and it worked
