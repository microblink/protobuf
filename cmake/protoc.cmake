set(protoc_files
  ${protobuf_SOURCE_DIR}/src/google/protobuf/compiler/main.cc
)

add_executable(protoc ${protoc_files} ${protobuf_version_rc_file})
target_link_libraries(protoc
  libprotoc
  libprotobuf
  ${protobuf_ABSL_USED_TARGETS}
)
add_executable(protobuf::protoc ALIAS protoc)

set_target_properties(protoc PROPERTIES
    VERSION ${protobuf_VERSION})

# MB patch begin

if ( COMMAND mb_statically_link_cpp )
    mb_statically_link_cpp( protoc )
endif()

# MB patch end
