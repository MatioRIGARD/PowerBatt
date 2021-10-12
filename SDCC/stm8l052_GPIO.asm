;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8l052_GPIO
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _STM8L052_GPIO_SetupPin
	.globl _STM8L052_GPIO_High
	.globl _STM8L052_GPIO_Low
	.globl _STM8L052_GPIO_Toggle
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/src/stm8l052_GPIO.c: 3: void STM8L052_GPIO_SetupPin(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin, STM8L052_GPIO_PINMODE pinMode) {
;	-----------------------------------------
;	 function STM8L052_GPIO_SetupPin
;	-----------------------------------------
_STM8L052_GPIO_SetupPin:
	sub	sp, #6
;	lib/src/stm8l052_GPIO.c: 4: port->DDR = (port->DDR&(1<<pin))|((pinMode&0x1)<<pin);
	ldw	y, (0x09, sp)
	ldw	(0x02, sp), y
	addw	y, #0x0002
	ld	a, (y)
	ld	xh, a
	ld	a, (0x0b, sp)
	ld	xl, a
	ld	a, #0x01
	ld	(0x05, sp), a
	ld	a, xl
	tnz	a
	jreq	00104$
00103$:
	sll	(0x05, sp)
	dec	a
	jrne	00103$
00104$:
	ld	a, xh
	and	a, (0x05, sp)
	ld	(0x01, sp), a
	ld	a, (0x0c, sp)
	and	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00106$
00105$:
	sll	(1, sp)
	dec	a
	jrne	00105$
00106$:
	pop	a
	or	a, (0x01, sp)
	ld	(y), a
;	lib/src/stm8l052_GPIO.c: 5: port->CR1 = (port->DDR&(1<<pin))|((pinMode&0x2>>1)<<pin);
	ldw	x, (0x02, sp)
	addw	x, #0x0003
	ld	a, (y)
	and	a, (0x05, sp)
	ld	(0x04, sp), a
	ld	a, (0x0c, sp)
	and	a, #0x01
	push	a
	ld	a, (0x0c, sp)
	jreq	00108$
00107$:
	sll	(1, sp)
	dec	a
	jrne	00107$
00108$:
	pop	a
	ld	(0x06, sp), a
	ld	a, (0x04, sp)
	or	a, (0x06, sp)
	ld	(x), a
;	lib/src/stm8l052_GPIO.c: 6: port->CR2 = (port->DDR&(1<<pin))|((pinMode&0x4>>2)<<pin);
	ldw	x, (0x02, sp)
	addw	x, #0x0004
	ld	a, (y)
	and	a, (0x05, sp)
	or	a, (0x06, sp)
	ld	(x), a
;	lib/src/stm8l052_GPIO.c: 7: }
	addw	sp, #6
	ret
;	lib/src/stm8l052_GPIO.c: 9: void STM8L052_GPIO_High(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
;	-----------------------------------------
;	 function STM8L052_GPIO_High
;	-----------------------------------------
_STM8L052_GPIO_High:
	push	a
;	lib/src/stm8l052_GPIO.c: 10: port->IDR |= 1<<pin;
	ldw	x, (0x04, sp)
	incw	x
	ld	a, (x)
	ld	yl, a
	ld	a, (0x06, sp)
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00104$
00103$:
	sll	(0x01, sp)
	dec	a
	jrne	00103$
00104$:
	ld	a, yl
	or	a, (0x01, sp)
	ld	(x), a
;	lib/src/stm8l052_GPIO.c: 11: }
	pop	a
	ret
;	lib/src/stm8l052_GPIO.c: 13: void STM8L052_GPIO_Low(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
;	-----------------------------------------
;	 function STM8L052_GPIO_Low
;	-----------------------------------------
_STM8L052_GPIO_Low:
	push	a
;	lib/src/stm8l052_GPIO.c: 14: port->ODR &= !(1<<pin);
	ldw	y, (0x04, sp)
	ld	a, (y)
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	clrw	x
	incw	x
	tnz	a
	jreq	00104$
00103$:
	sllw	x
	dec	a
	jrne	00103$
00104$:
	subw	x, #1
	clr	a
	rlc	a
	ld	xl, a
	ld	a, (0x01, sp)
	pushw	x
	and	a, (2, sp)
	popw	x
	ld	(y), a
;	lib/src/stm8l052_GPIO.c: 15: }
	pop	a
	ret
;	lib/src/stm8l052_GPIO.c: 17: void STM8L052_GPIO_Toggle(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
;	-----------------------------------------
;	 function STM8L052_GPIO_Toggle
;	-----------------------------------------
_STM8L052_GPIO_Toggle:
	push	a
;	lib/src/stm8l052_GPIO.c: 18: port->ODR ^= 1<<pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	ld	yl, a
	ld	a, (0x06, sp)
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00104$
00103$:
	sll	(0x01, sp)
	dec	a
	jrne	00103$
00104$:
	ld	a, yl
	xor	a, (0x01, sp)
	ld	(x), a
;	lib/src/stm8l052_GPIO.c: 19: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
