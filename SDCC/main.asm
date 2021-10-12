;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _STM8L052_CLK_Setup
	.globl _STM8L052_GPIO_Toggle
	.globl _STM8L052_GPIO_SetupPin
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 7: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 9: STM8L052_CLK_Setup();
	call	_STM8L052_CLK_Setup
;	main.c: 12: STM8L052_GPIO_SetupPin(GPIOA, PIN_7, STM8L052_GPIO_OUTPUT|STM8L052_GPIO_OUTPUT_PP|STM8L052_GPIO_OUTPUT_SPD_10M);
	push	#0x07
	push	#0x07
	push	#0x00
	push	#0x50
	call	_STM8L052_GPIO_SetupPin
	addw	sp, #4
;	main.c: 15: while(1) {
00102$:
;	main.c: 16: STM8L052_GPIO_Toggle(GPIOA, PIN_7);
	push	#0x07
	push	#0x00
	push	#0x50
	call	_STM8L052_GPIO_Toggle
	addw	sp, #3
	jra	00102$
;	main.c: 18: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
