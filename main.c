#include "lib/inc/stm8l15x.h"
#include "lib/inc/stm8l052_GPIO.h"
#include "lib/inc/stm8l052_CLK.h"
#include "lib/inc/stm8l052_SPI.h"


void main(void) {
    // horloge
    STM8L052_CLK_Setup();
    SPI_Init();

    // setup gpio
    STM8L052_GPIO_SetupPin(GPIOA, PIN_7, STM8L052_GPIO_OUTPUT|STM8L052_GPIO_OUTPUT_PP|STM8L052_GPIO_OUTPUT_SPD_10M);


    while(1) {
        STM8L052_GPIO_Toggle(GPIOA, PIN_7);
    }
}

