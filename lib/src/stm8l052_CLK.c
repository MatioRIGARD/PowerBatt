#include "../inc/stm8l052_CLK.h"

void STM8L052_CLK_Setup() {
    //Enable clock
    CLK->SWCR |= 1<<1;
    // HSI (high speed internal clock) selection
    CLK->SWR |= 1;
    // Divider by 1
    CLK->CKDIVR |= 0x0;
    // Enable SPI
    CLK->PCKENR1 |= 1<<4;
}