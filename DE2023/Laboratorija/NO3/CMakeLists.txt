
cmake_minimum_required(VERSION 3.12)


project(lab03)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/D_FF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/T_FF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/RS_FF_TB.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FF.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/JK_FF_TB.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e D_FF_TB
    COMMAND ghdl-gcc -e JK_FF_TB
    COMMAND ghdl-gcc -e RS_FF_TB
    COMMAND ghdl-gcc -e T_FF_TB
)

add_test(
    NAME D_FF_TB_test
    COMMAND ./d_ff_tb
)
add_test(
    NAME T_FF_TB_test
    COMMAND ./t_ff_tb
)
add_test(
    NAME RS_FF_TB_test
    COMMAND ./rs_ff_tb
)
add_test(
    NAME JK_FF_TB_test
    COMMAND ./jk_ff_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
