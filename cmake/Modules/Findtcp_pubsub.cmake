find_path(tcp_pubsub_INCLUDE_DIR
  NAMES tcp_pubsub.hpp
  HINTS
    "${CONAN_TCP_PUBSUB_INCLUDE_DIR_ROOT}/include"
    "${ECAL_PROJECT_ROOT}/thirdparty/tcp_pubsub/tcp_pubsub/include"
  NO_DEFAULT_PATH
  NO_CMAKE_FIND_ROOT_PATH
)

if(tcp_pubsub_INCLUDE_DIR-NOTFOUND)
  message(FATAL_ERROR "Could not find tcp_pubsub library")
  set(tcp_pubsub_FOUND FALSE)
else()
  set(tcp_pubsub_FOUND TRUE)
  set(TCP_PUBSUB_INCLUDE_DIR_INCLUDE_DIR ${tcp_pubsub_INCLUDE_DIR})
endif()

if(tcp_pubsub_FOUND)
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(tcp_pubsub
    REQUIRED_VARS tcp_pubsub_INCLUDE_DIR)

  if(NOT TARGET tcp_pubsub::tcp_pubsub)
    set(tcp_pubsub_INCLUDE_DIRS ${tcp_pubsub_INCLUDE_DIR})
    add_library(tcp_pubsub::tcp_pubsub INTERFACE IMPORTED)
    set_target_properties(tcp_pubsub::tcp_pubsub PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES ${tcp_pubsub_INCLUDE_DIR}
      INTERFACE_COMPILE_DEFINITIONS TCP_PUBSUB_INCLUDE_DIR_STANDALONE)
    mark_as_advanced(tcp_pubsub_INCLUDE_DIR)
  endif()
endif()
