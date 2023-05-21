make -j4
arm-none-eabi-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature ..\armgcc\flexspi_nor_release\igpio_led_output.elf ..\armgcc\flexspi_nor_release\gpio_test.hex