                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l052_CLK
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _STM8L052_CLK_Setup
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; absolute external ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DABS (ABS)
                                     24 
                                     25 ; default segment ordering for linker
                                     26 	.area HOME
                                     27 	.area GSINIT
                                     28 	.area GSFINAL
                                     29 	.area CONST
                                     30 	.area INITIALIZER
                                     31 	.area CODE
                                     32 
                                     33 ;--------------------------------------------------------
                                     34 ; global & static initialisations
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area GSINIT
                                     40 ;--------------------------------------------------------
                                     41 ; Home
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area HOME
                                     45 ;--------------------------------------------------------
                                     46 ; code
                                     47 ;--------------------------------------------------------
                                     48 	.area CODE
                                     49 ;	lib/src/stm8l052_CLK.c: 3: void STM8L052_CLK_Setup() {
                                     50 ;	-----------------------------------------
                                     51 ;	 function STM8L052_CLK_Setup
                                     52 ;	-----------------------------------------
      008024                         53 _STM8L052_CLK_Setup:
                                     54 ;	lib/src/stm8l052_CLK.c: 5: CLK->SWCR |= 1<<1;
      008024 72 12 50 C9      [ 1]   55 	bset	20681, #1
                                     56 ;	lib/src/stm8l052_CLK.c: 7: CLK->SWR |= 1;
      008028 72 10 50 C8      [ 1]   57 	bset	20680, #0
                                     58 ;	lib/src/stm8l052_CLK.c: 9: CLK->CKDIVR |= 0x0;
      00802C C6 50 C0         [ 1]   59 	ld	a, 0x50c0
      00802F C7 50 C0         [ 1]   60 	ld	0x50c0, a
                                     61 ;	lib/src/stm8l052_CLK.c: 11: CLK->PCKENR1 |= 1<<4;
      008032 72 18 50 C3      [ 1]   62 	bset	20675, #4
                                     63 ;	lib/src/stm8l052_CLK.c: 12: }
      008036 81               [ 4]   64 	ret
                                     65 	.area CODE
                                     66 	.area CONST
                                     67 	.area INITIALIZER
                                     68 	.area CABS (ABS)
