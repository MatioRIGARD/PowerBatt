                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l052_GPIO
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _STM8L052_GPIO_SetupPin
                                     12 	.globl _STM8L052_GPIO_High
                                     13 	.globl _STM8L052_GPIO_Low
                                     14 	.globl _STM8L052_GPIO_Toggle
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 
                                     28 ; default segment ordering for linker
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area CONST
                                     33 	.area INITIALIZER
                                     34 	.area CODE
                                     35 
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	lib/src/stm8l052_GPIO.c: 3: void STM8L052_GPIO_SetupPin(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin, STM8L052_GPIO_PINMODE pinMode) {
                                     53 ;	-----------------------------------------
                                     54 ;	 function STM8L052_GPIO_SetupPin
                                     55 ;	-----------------------------------------
      008038                         56 _STM8L052_GPIO_SetupPin:
      008038 52 06            [ 2]   57 	sub	sp, #6
                                     58 ;	lib/src/stm8l052_GPIO.c: 4: port->DDR = (port->DDR&(1<<pin))|((pinMode&0x1)<<pin);
      00803A 16 09            [ 2]   59 	ldw	y, (0x09, sp)
      00803C 17 02            [ 2]   60 	ldw	(0x02, sp), y
      00803E 72 A9 00 02      [ 2]   61 	addw	y, #0x0002
      008042 90 F6            [ 1]   62 	ld	a, (y)
      008044 95               [ 1]   63 	ld	xh, a
      008045 7B 0B            [ 1]   64 	ld	a, (0x0b, sp)
      008047 97               [ 1]   65 	ld	xl, a
      008048 A6 01            [ 1]   66 	ld	a, #0x01
      00804A 6B 05            [ 1]   67 	ld	(0x05, sp), a
      00804C 9F               [ 1]   68 	ld	a, xl
      00804D 4D               [ 1]   69 	tnz	a
      00804E 27 05            [ 1]   70 	jreq	00104$
      008050                         71 00103$:
      008050 08 05            [ 1]   72 	sll	(0x05, sp)
      008052 4A               [ 1]   73 	dec	a
      008053 26 FB            [ 1]   74 	jrne	00103$
      008055                         75 00104$:
      008055 9E               [ 1]   76 	ld	a, xh
      008056 14 05            [ 1]   77 	and	a, (0x05, sp)
      008058 6B 01            [ 1]   78 	ld	(0x01, sp), a
      00805A 7B 0C            [ 1]   79 	ld	a, (0x0c, sp)
      00805C A4 01            [ 1]   80 	and	a, #0x01
      00805E 88               [ 1]   81 	push	a
      00805F 9F               [ 1]   82 	ld	a, xl
      008060 4D               [ 1]   83 	tnz	a
      008061 27 05            [ 1]   84 	jreq	00106$
      008063                         85 00105$:
      008063 08 01            [ 1]   86 	sll	(1, sp)
      008065 4A               [ 1]   87 	dec	a
      008066 26 FB            [ 1]   88 	jrne	00105$
      008068                         89 00106$:
      008068 84               [ 1]   90 	pop	a
      008069 1A 01            [ 1]   91 	or	a, (0x01, sp)
      00806B 90 F7            [ 1]   92 	ld	(y), a
                                     93 ;	lib/src/stm8l052_GPIO.c: 5: port->CR1 = (port->DDR&(1<<pin))|((pinMode&0x2>>1)<<pin);
      00806D 1E 02            [ 2]   94 	ldw	x, (0x02, sp)
      00806F 1C 00 03         [ 2]   95 	addw	x, #0x0003
      008072 90 F6            [ 1]   96 	ld	a, (y)
      008074 14 05            [ 1]   97 	and	a, (0x05, sp)
      008076 6B 04            [ 1]   98 	ld	(0x04, sp), a
      008078 7B 0C            [ 1]   99 	ld	a, (0x0c, sp)
      00807A A4 01            [ 1]  100 	and	a, #0x01
      00807C 88               [ 1]  101 	push	a
      00807D 7B 0C            [ 1]  102 	ld	a, (0x0c, sp)
      00807F 27 05            [ 1]  103 	jreq	00108$
      008081                        104 00107$:
      008081 08 01            [ 1]  105 	sll	(1, sp)
      008083 4A               [ 1]  106 	dec	a
      008084 26 FB            [ 1]  107 	jrne	00107$
      008086                        108 00108$:
      008086 84               [ 1]  109 	pop	a
      008087 6B 06            [ 1]  110 	ld	(0x06, sp), a
      008089 7B 04            [ 1]  111 	ld	a, (0x04, sp)
      00808B 1A 06            [ 1]  112 	or	a, (0x06, sp)
      00808D F7               [ 1]  113 	ld	(x), a
                                    114 ;	lib/src/stm8l052_GPIO.c: 6: port->CR2 = (port->DDR&(1<<pin))|((pinMode&0x4>>2)<<pin);
      00808E 1E 02            [ 2]  115 	ldw	x, (0x02, sp)
      008090 1C 00 04         [ 2]  116 	addw	x, #0x0004
      008093 90 F6            [ 1]  117 	ld	a, (y)
      008095 14 05            [ 1]  118 	and	a, (0x05, sp)
      008097 1A 06            [ 1]  119 	or	a, (0x06, sp)
      008099 F7               [ 1]  120 	ld	(x), a
                                    121 ;	lib/src/stm8l052_GPIO.c: 7: }
      00809A 5B 06            [ 2]  122 	addw	sp, #6
      00809C 81               [ 4]  123 	ret
                                    124 ;	lib/src/stm8l052_GPIO.c: 9: void STM8L052_GPIO_High(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
                                    125 ;	-----------------------------------------
                                    126 ;	 function STM8L052_GPIO_High
                                    127 ;	-----------------------------------------
      00809D                        128 _STM8L052_GPIO_High:
      00809D 88               [ 1]  129 	push	a
                                    130 ;	lib/src/stm8l052_GPIO.c: 10: port->IDR |= 1<<pin;
      00809E 1E 04            [ 2]  131 	ldw	x, (0x04, sp)
      0080A0 5C               [ 1]  132 	incw	x
      0080A1 F6               [ 1]  133 	ld	a, (x)
      0080A2 90 97            [ 1]  134 	ld	yl, a
      0080A4 7B 06            [ 1]  135 	ld	a, (0x06, sp)
      0080A6 88               [ 1]  136 	push	a
      0080A7 A6 01            [ 1]  137 	ld	a, #0x01
      0080A9 6B 02            [ 1]  138 	ld	(0x02, sp), a
      0080AB 84               [ 1]  139 	pop	a
      0080AC 4D               [ 1]  140 	tnz	a
      0080AD 27 05            [ 1]  141 	jreq	00104$
      0080AF                        142 00103$:
      0080AF 08 01            [ 1]  143 	sll	(0x01, sp)
      0080B1 4A               [ 1]  144 	dec	a
      0080B2 26 FB            [ 1]  145 	jrne	00103$
      0080B4                        146 00104$:
      0080B4 90 9F            [ 1]  147 	ld	a, yl
      0080B6 1A 01            [ 1]  148 	or	a, (0x01, sp)
      0080B8 F7               [ 1]  149 	ld	(x), a
                                    150 ;	lib/src/stm8l052_GPIO.c: 11: }
      0080B9 84               [ 1]  151 	pop	a
      0080BA 81               [ 4]  152 	ret
                                    153 ;	lib/src/stm8l052_GPIO.c: 13: void STM8L052_GPIO_Low(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
                                    154 ;	-----------------------------------------
                                    155 ;	 function STM8L052_GPIO_Low
                                    156 ;	-----------------------------------------
      0080BB                        157 _STM8L052_GPIO_Low:
      0080BB 88               [ 1]  158 	push	a
                                    159 ;	lib/src/stm8l052_GPIO.c: 14: port->ODR &= !(1<<pin);
      0080BC 16 04            [ 2]  160 	ldw	y, (0x04, sp)
      0080BE 90 F6            [ 1]  161 	ld	a, (y)
      0080C0 6B 01            [ 1]  162 	ld	(0x01, sp), a
      0080C2 7B 06            [ 1]  163 	ld	a, (0x06, sp)
      0080C4 5F               [ 1]  164 	clrw	x
      0080C5 5C               [ 1]  165 	incw	x
      0080C6 4D               [ 1]  166 	tnz	a
      0080C7 27 04            [ 1]  167 	jreq	00104$
      0080C9                        168 00103$:
      0080C9 58               [ 2]  169 	sllw	x
      0080CA 4A               [ 1]  170 	dec	a
      0080CB 26 FC            [ 1]  171 	jrne	00103$
      0080CD                        172 00104$:
      0080CD 1D 00 01         [ 2]  173 	subw	x, #1
      0080D0 4F               [ 1]  174 	clr	a
      0080D1 49               [ 1]  175 	rlc	a
      0080D2 97               [ 1]  176 	ld	xl, a
      0080D3 7B 01            [ 1]  177 	ld	a, (0x01, sp)
      0080D5 89               [ 2]  178 	pushw	x
      0080D6 14 02            [ 1]  179 	and	a, (2, sp)
      0080D8 85               [ 2]  180 	popw	x
      0080D9 90 F7            [ 1]  181 	ld	(y), a
                                    182 ;	lib/src/stm8l052_GPIO.c: 15: }
      0080DB 84               [ 1]  183 	pop	a
      0080DC 81               [ 4]  184 	ret
                                    185 ;	lib/src/stm8l052_GPIO.c: 17: void STM8L052_GPIO_Toggle(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
                                    186 ;	-----------------------------------------
                                    187 ;	 function STM8L052_GPIO_Toggle
                                    188 ;	-----------------------------------------
      0080DD                        189 _STM8L052_GPIO_Toggle:
      0080DD 88               [ 1]  190 	push	a
                                    191 ;	lib/src/stm8l052_GPIO.c: 18: port->ODR ^= 1<<pin;
      0080DE 1E 04            [ 2]  192 	ldw	x, (0x04, sp)
      0080E0 F6               [ 1]  193 	ld	a, (x)
      0080E1 90 97            [ 1]  194 	ld	yl, a
      0080E3 7B 06            [ 1]  195 	ld	a, (0x06, sp)
      0080E5 88               [ 1]  196 	push	a
      0080E6 A6 01            [ 1]  197 	ld	a, #0x01
      0080E8 6B 02            [ 1]  198 	ld	(0x02, sp), a
      0080EA 84               [ 1]  199 	pop	a
      0080EB 4D               [ 1]  200 	tnz	a
      0080EC 27 05            [ 1]  201 	jreq	00104$
      0080EE                        202 00103$:
      0080EE 08 01            [ 1]  203 	sll	(0x01, sp)
      0080F0 4A               [ 1]  204 	dec	a
      0080F1 26 FB            [ 1]  205 	jrne	00103$
      0080F3                        206 00104$:
      0080F3 90 9F            [ 1]  207 	ld	a, yl
      0080F5 18 01            [ 1]  208 	xor	a, (0x01, sp)
      0080F7 F7               [ 1]  209 	ld	(x), a
                                    210 ;	lib/src/stm8l052_GPIO.c: 19: }
      0080F8 84               [ 1]  211 	pop	a
      0080F9 81               [ 4]  212 	ret
                                    213 	.area CODE
                                    214 	.area CONST
                                    215 	.area INITIALIZER
                                    216 	.area CABS (ABS)
