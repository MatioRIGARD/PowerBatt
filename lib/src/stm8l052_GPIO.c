#include "../inc/stm8l052_GPIO.h"

void STM8L052_GPIO_SetupPin(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin, STM8L052_GPIO_PINMODE pinMode) {
    port->DDR = (port->DDR&(1<<pin))|((pinMode&0x1)<<pin);
    port->CR1 = (port->DDR&(1<<pin))|((pinMode&0x2>>1)<<pin);
    port->CR2 = (port->DDR&(1<<pin))|((pinMode&0x4>>2)<<pin);
}

void STM8L052_GPIO_High(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
    port->IDR |= 1<<pin;
}

void STM8L052_GPIO_Low(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
    port->ODR &= !(1<<pin);
}

void STM8L052_GPIO_Toggle(GPIO_TypeDef* port, STM8L052_GPIO_PINNUM pin) {
    port->ODR ^= 1<<pin;
}