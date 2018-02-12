define reload
    monitor reset halt
    file cmake-build-debug/adc_test.elf
    load
    tb main
    c
end

define restart
    monitor reset halt
    tb main
    c
end

set pagination off
target remote localhost:3333
tui enable
source ../utils/gdb_svd.py
svd_load STM32F103xx.svd
reload
set pagination on
