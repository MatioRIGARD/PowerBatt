                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _STM8L052_CLK_Setup
                                     13 	.globl _STM8L052_GPIO_Toggle
                                     14 	.globl _STM8L052_GPIO_SetupPin
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; Stack segment in internal ram 
                                     25 ;--------------------------------------------------------
                                     26 	.area	SSEG
      FFFFFF                         27 __start__stack:
      FFFFFF                         28 	.ds	1
                                     29 
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; interrupt vector 
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
      008000                         47 __interrupt_vect:
      008000 82 00 80 07             48 	int s_GSINIT ; reset
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
      008007                         56 __sdcc_gs_init_startup:
      008007                         57 __sdcc_init_data:
                                     58 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   59 	ldw x, #l_DATA
      00800A 27 07            [ 1]   60 	jreq	00002$
      00800C                         61 00001$:
      00800C 72 4F 00 00      [ 1]   62 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   63 	decw x
      008011 26 F9            [ 1]   64 	jrne	00001$
      008013                         65 00002$:
      008013 AE 00 00         [ 2]   66 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   67 	jreq	00004$
      008018                         68 00003$:
      008018 D6 80 23         [ 1]   69 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   70 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   71 	decw	x
      00801F 26 F7            [ 1]   72 	jrne	00003$
      008021                         73 00004$:
                                     74 ; stm8_genXINIT() end
                                     75 	.area GSFINAL
      008021 CC 80 04         [ 2]   76 	jp	__sdcc_program_startup
                                     77 ;--------------------------------------------------------
                                     78 ; Home
                                     79 ;--------------------------------------------------------
                                     80 	.area HOME
                                     81 	.area HOME
      008004                         82 __sdcc_program_startup:
      008004 CC 80 FA         [ 2]   83 	jp	_main
                                     84 ;	return from main will return to caller
                                     85 ;--------------------------------------------------------
                                     86 ; code
                                     87 ;--------------------------------------------------------
                                     88 	.area CODE
                                     89 ;	main.c: 7: void main(void) {
                                     90 ;	-----------------------------------------
                                     91 ;	 function main
                                     92 ;	-----------------------------------------
      0080FA                         93 _main:
                                     94 ;	main.c: 9: STM8L052_CLK_Setup();
      0080FA CD 80 24         [ 4]   95 	call	_STM8L052_CLK_Setup
                                     96 ;	main.c: 12: STM8L052_GPIO_SetupPin(GPIOA, PIN_7, STM8L052_GPIO_OUTPUT|STM8L052_GPIO_OUTPUT_PP|STM8L052_GPIO_OUTPUT_SPD_10M);
      0080FD 4B 07            [ 1]   97 	push	#0x07
      0080FF 4B 07            [ 1]   98 	push	#0x07
      008101 4B 00            [ 1]   99 	push	#0x00
      008103 4B 50            [ 1]  100 	push	#0x50
      008105 CD 80 38         [ 4]  101 	call	_STM8L052_GPIO_SetupPin
      008108 5B 04            [ 2]  102 	addw	sp, #4
                                    103 ;	main.c: 15: while(1) {
      00810A                        104 00102$:
                                    105 ;	main.c: 16: STM8L052_GPIO_Toggle(GPIOA, PIN_7);
      00810A 4B 07            [ 1]  106 	push	#0x07
      00810C 4B 00            [ 1]  107 	push	#0x00
      00810E 4B 50            [ 1]  108 	push	#0x50
      008110 CD 80 DD         [ 4]  109 	call	_STM8L052_GPIO_Toggle
      008113 5B 03            [ 2]  110 	addw	sp, #3
      008115 20 F3            [ 2]  111 	jra	00102$
                                    112 ;	main.c: 18: }
      008117 81               [ 4]  113 	ret
                                    114 	.area CODE
                                    115 	.area CONST
                                    116 	.area INITIALIZER
                                    117 	.area CABS (ABS)
