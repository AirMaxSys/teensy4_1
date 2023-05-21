make -j4
arm-none-eabi-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature ..\armgcc\flexspi_nor_release\flexspi_nor_polling_transfer.elf ..\armgcc\flexspi_nor_release\flexspi.hex