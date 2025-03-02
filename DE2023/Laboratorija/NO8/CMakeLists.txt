
cmake_minimum_required(VERSION 3.12)


project(lab08)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/ram.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/tb_ram.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e tb_ram
)

add_test(
    NAME ram_test_anja_djakovic
    COMMAND ./tb_ram
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
