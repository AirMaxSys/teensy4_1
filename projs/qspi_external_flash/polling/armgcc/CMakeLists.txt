# CROSS COMPILER SETTING
SET(CMAKE_SYSTEM_NAME Generic)
CMAKE_MINIMUM_REQUIRED (VERSION 3.10.0)

# THE VERSION NUMBER
SET (Tutorial_VERSION_MAJOR 1)
SET (Tutorial_VERSION_MINOR 0)

# Add by AirMax
SET (ENV{ARMGCC_DIR} "D:/software/gnu_arm_compiler/9 2019-q4-major")
SET (ENV{SdkRootDirPath} "D:/gitRepo/mcuxsdk")

# ENABLE ASM
ENABLE_LANGUAGE(ASM)

SET(CMAKE_STATIC_LIBRARY_PREFIX)
SET(CMAKE_STATIC_LIBRARY_SUFFIX)

SET(CMAKE_EXECUTABLE_LIBRARY_PREFIX)
SET(CMAKE_EXECUTABLE_LIBRARY_SUFFIX)

# CURRENT DIRECTORY
SET(ProjDirPath ${CMAKE_CURRENT_SOURCE_DIR})

if (DEFINED ENV{SdkRootDirPath})
    SET(SdkRootDirPath "$ENV{SdkRootDirPath}")
else()
    SET(SdkRootDirPath "${ProjDirPath}/../../../../../../..")
endif()

SET(EXECUTABLE_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})
SET(LIBRARY_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})


project(flexspi_nor_polling_transfer)

set(MCUX_BUILD_TYPES flexspi_nor_debug flexspi_nor_release debug release sdram_debug sdram_release)

set(MCUX_SDK_PROJECT_NAME flexspi_nor_polling_transfer.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${SdkRootDirPath})
endif()

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_executable(${MCUX_SDK_PROJECT_NAME} 
"${ProjDirPath}/../flexspi_nor_polling_transfer.c"
"${ProjDirPath}/../flexspi_nor_flash_ops.c"
"${ProjDirPath}/../app.h"
"${ProjDirPath}/../pin_mux.c"
"${ProjDirPath}/../pin_mux.h"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/board.c"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/board.h"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/clock_config.c"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/clock_config.h"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/dcd.c"
"${SdkRootDirPath}/core/boards/evkmimxrt1060/dcd.h"
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${ProjDirPath}/..
    ${SdkRootDirPath}/core/boards/evkmimxrt1060
)

set(CMAKE_MODULE_PATH
    ${SdkRootDirPath}/core/utilities
    ${SdkRootDirPath}/core/utilities/assert
    ${SdkRootDirPath}/core/drivers/flexspi
    ${SdkRootDirPath}/core/drivers/cache/armv7-m7
    ${SdkRootDirPath}/core/devices/MIMXRT1062/drivers
    ${SdkRootDirPath}/core/drivers/common
    ${SdkRootDirPath}/core/devices/MIMXRT1062
    ${SdkRootDirPath}/core/components/uart
    ${SdkRootDirPath}/core/components/lists
    ${SdkRootDirPath}/core/drivers/lpuart
    ${SdkRootDirPath}/core/drivers/igpio
    ${SdkRootDirPath}/core/devices/MIMXRT1062/xip
    ${SdkRootDirPath}/core/boards/evkmimxrt1060/xip
    ${SdkRootDirPath}/core/CMSIS/Core/Include
    ${SdkRootDirPath}/core/utilities/misc_utilities
)

# include modules
include(utility_debug_console_lite)

include(utility_assert_lite)

include(driver_flexspi)

include(driver_cache_armv7_m7)

include(driver_clock)

include(driver_common)

include(device_CMSIS)

include(component_lpuart_adapter)

include(component_lists)

include(driver_lpuart)

include(device_startup)

include(driver_iomuxc)

include(driver_igpio)

include(driver_xip_device)

include(driver_xip_board_evkmimxrt1060)

include(CMSIS_Include_core_cm)

include(utilities_misc_utilities_MIMXRT1062)

include(device_system)


IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)  
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")  
ENDIF()  

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)


