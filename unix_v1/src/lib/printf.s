.globl	_printn
.data; _printn:1f
.text; 1:mov r5,-(sp); mov sp,r5
tst	-(sp)
mov	4(r5),(r4)
mov	6(r5),div
mov	(r4),r0
mov	r0,-2(r5)
bne	l2
jmp	l1
l2:mov	6(r5),-(sp)
mov	-2(r5),-(sp)
jsr	pc,*_printn
cmp	(sp)+,(sp)+
l1:mov	4(r5),(r4)
mov	6(r5),div
mov	ac,r0
mov	r0,-(sp)
add	$60,(sp)
jsr	pc,*_putchar
tst	(sp)+
jmp	retrn
.globl	_printf
.data; _printf:1f
.text; 1:mov r5,-(sp); mov sp,r5
add	$-10,sp
mov	r5,r0
add	$6,r0
mov	r0,-4(r5)
.data; l3: 1f; .text; 1:
l4:mov	4(r5),r0
inc	4(r5)
movb	(r0),r0
mov	r0,-10(r5)
cmp	r0,$45
bne	l6
jmp	l5
l6:tst	-10(r5)
beq	l8
jmp	l7
l8:jmp	retrn
l7:mov	-10(r5),-(sp)
jsr	pc,*_putchar
tst	(sp)+
jmp	l4
l5:mov	-4(r5),r0
add	$2,-4(r5)
mov	(r0),-6(r5)
mov	4(r5),r0
inc	4(r5)
movb	(r0),r0
mov	r0,-10(r5)
jsr	pc,bswitch; l9
l10:l11:tst	-6(r5)
blt	l13
jmp	l12
l13:mov	-6(r5),r0
neg	r0
mov	r0,-6(r5)
tst	-6(r5)
blt	l15
jmp	l14
l15:cmp	-10(r5),$157
beq	l17
jmp	l16
l17:.data; l18:
.byte 61,60,60,60,60,60,0
.even;.text
mov	$l18,-(sp)
jsr	pc,*_printf
tst	(sp)+
jmp	l19
l16:.data; l20:
.byte 55,63,62,67,66,70,0
.even;.text
mov	$l20,-(sp)
jsr	pc,*_printf
tst	(sp)+
l19:jmp	*l3
l14:mov	$55,-(sp)
jsr	pc,*_putchar
tst	(sp)+
l12:cmp	-10(r5),$157
bne	l21
mov	$10,-(sp)
br	l22
l21:mov	$12,-(sp)
l22:mov	-6(r5),-(sp)
jsr	pc,*_printn
cmp	(sp)+,(sp)+
jmp	*l3
l23:mov	-6(r5),-(sp)
jsr	pc,*_putchar
tst	(sp)+
jmp	*l3
l24:mov	-6(r5),-2(r5)
l25:mov	-2(r5),r0
inc	-2(r5)
movb	(r0),r0
mov	r0,-10(r5)
bne	l27
jmp	l26
l27:mov	-10(r5),-(sp)
jsr	pc,*_putchar
tst	(sp)+
jmp	l25
l26:jmp	*l3
l28:.data
l9:163; l24
143; l23
157; l11
144; l10
l28; 0
.text
mov	$45,-(sp)
jsr	pc,*_putchar
tst	(sp)+
dec	4(r5)
mov	-4(r5),r0
sub	$2,-4(r5)
jmp	*l3
jmp	retrn
