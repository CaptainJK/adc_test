# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# compile ASM with //bin/arm-none-eabi-gcc
# compile C with //bin/arm-none-eabi-gcc
ASM_FLAGS = -mthumb -mcpu=cortex-m3 -x assembler-with-cpp -g  

ASM_DEFINES = -DCORTEX_USE_FPU=FALSE -DSTM32F1 -DSTM32F103xB

ASM_INCLUDES = -I/home/captain/McuWorkspace/adc_test -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/rt/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ports/ARMCMx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/license -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ports/ARMCMx/compilers/GCC -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/startup/ARMCMx/devices/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/oslib/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ext/CMSIS/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ext/CMSIS/ST/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/osal/rt -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/common/ARMCMx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/DMAv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/GPIOv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/TIMv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/USARTv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/USBv1 -I/home/captain/McuWorkspace/adc_test/config -I/home/captain/McuWorkspace/adc_test/board 

C_FLAGS = -mthumb -fno-builtin -mcpu=cortex-m3 -Wall -std=gnu99 -ffunction-sections -fdata-sections -fomit-frame-pointer -mabi=aapcs -fno-unroll-loops -ffast-math -ftree-vectorize -Og -g -O0  

C_DEFINES = -DCORTEX_USE_FPU=FALSE -DSTM32F1 -DSTM32F103xB

C_INCLUDES = -I/home/captain/McuWorkspace/adc_test -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/rt/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ports/ARMCMx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/license -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ports/ARMCMx/compilers/GCC -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/startup/ARMCMx/devices/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/oslib/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ext/CMSIS/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/common/ext/CMSIS/ST/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/include -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/osal/rt -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/STM32F1xx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/common/ARMCMx -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/DMAv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/GPIOv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/TIMv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/USARTv1 -I/home/captain/McuWorkspace/ChibiOS_17.6.3/os/hal/ports/STM32/LLD/USBv1 -I/home/captain/McuWorkspace/adc_test/config -I/home/captain/McuWorkspace/adc_test/board 

