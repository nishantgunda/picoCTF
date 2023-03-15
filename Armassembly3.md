	add	x0, x0, 8           ;x0 points to 1048110976
	ldr	x0, [x0]            ;x0="1048110976"
	bl	atoi                ;x0=1048110976
	bl	func1               ;go to func
In func1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0           ;x29=sp
	str	w0, [x29, 28]        ;sp+28=1048110976
	str	wzr, [x29, 44]       ;sp+44=0
	b	.L2                  ;go to L2
In L2:
	ldr	w0, [x29, 28]       ;w0=1048110976
	cmp	w0, 0                
	bne	.L4                 ;keep going to L4 until w0=0
In L4:
  ldr	w0, [x29, 28]        ;w0=1048110976
	and	w0, w0, 1            ;bitwise and so outputs 1 if odd and 0 if even
	cmp	w0, 0                ;check if sp+28 is even
	beq	.L3                  ; if its even L3 where its left shifted by 2
	ldr	w0, [x29, 44]        ;w0=0
	bl	func2                ;go to func2
in func2:
  sub	sp, sp, #16
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	add	w0, w0, 3          ;adds 3 to w0 so 
	add	sp, sp, 16
	ret                    ;return to L4
Back in L4:
  str	w0, [x29, 44]      ;puts w0 back into sp+44
Therfore we can see that the loop puts 3 in the sp+44 for every 1 in the binary form of the argument
Argument 1048110976 in binary is 111110011110001110011110000000 which has 16 ones so sp+44 will have 48 as its values
Back in L2:
	ldr	w0, [x29, 44]          ;sp+44=48
	ldp	x29, x30, [sp], 48
	ret                        ;return to main
In main:
adrp	x0, .LC0   ;sends x0 to .LC0 which prints it therefore output is 48
