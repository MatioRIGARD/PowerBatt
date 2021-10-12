;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8l052_CLK
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _STM8L052_CLK_Setup
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
;	lib/src/stm8l052_CLK.c: 3: void STM8L052_CLK_Setup() {
;	-----------------------------------------
;	 function STM8L052_CLK_Setup
;	-----------------------------------------
_STM8L052_CLK_Setup:
;	lib/src/stm8l052_CLK.c: 5: CLK->SWCR |= 1<<1;
	bset	20681, #1
;	lib/src/stm8l052_CLK.c: 7: CLK->SWR |= 1;
	bset	20680, #0
;	lib/src/stm8l052_CLK.c: 9: CLK->CKDIVR |= 0x0;
	ld	a, 0x50c0
	ld	0x50c0, a
;	lib/src/stm8l052_CLK.c: 11: CLK->PCKENR1 |= 1<<4;
	bset	20675, #4
;	lib/src/stm8l052_CLK.c: 12: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
