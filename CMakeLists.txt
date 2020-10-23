
file(GLOB SRC_LIST *.c)

source_group_by_dir(${CMAKE_CURRENT_SOURCE_DIR} SRC_LIST)

add_library(yaml SHARED ${CHESTNUT_H} ${SRC_LIST})
#set_target_properties(chestnut PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_DEBUG ../../xluatest)
#set_target_properties(chestnut PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG ../../xluatest)
target_include_directories(yaml PRIVATE ../lua/src)
target_include_directories(yaml PRIVATE .)
if (MSVC)
target_compile_definitions(yaml PRIVATE LUA_BUILD_AS_DLL)
target_compile_definitions(yaml PRIVATE YAML_DECLARE_STATIC)
endif()
target_link_libraries(yaml ../../liblua)
