# ##############################################################################
# CMakeLists.txt for the TensorBases Mathematica package
#
#   cmake -B build .
#   make -C build install    # copy the package into the Wolfram Applications dir
#   make -C build test       # run tests/Test.m
#   make -C build test-single FILE=Basics/SmokeTests.m
# ##############################################################################

cmake_minimum_required(VERSION 3.20)

project(TensorBases LANGUAGES NONE)

set(CMAKE_INSTALL_MESSAGE LAZY)

include(${CMAKE_CURRENT_SOURCE_DIR}/utils/common.cmake)

if(CMAKE_VERSION VERSION_GREATER_EQUAL "3.31.0")
  cmake_policy(SET CMP0177 NEW)
endif()

# ##############################################################################
# Locate a Wolfram kernel
# ##############################################################################

find_program(WolframLanguage_wolframscript_EXE NAMES wolframscript wolfram math)

if(DEFINED ENV{WOLFRAM_SCRIPT})
  set(WolframLanguage_wolframscript_EXE $ENV{WOLFRAM_SCRIPT})
elseif(NOT (WolframLanguage_wolframscript_EXE STREQUAL ""))
  # nothing to do, we found it with find_program
else()
  set(WolframLanguage_wolframscript_EXE "")
endif()

if(NOT DEFINED WolframLanguage_wolframscript_EXE
   OR WolframLanguage_wolframscript_EXE STREQUAL "")
  message(
    FATAL_ERROR
      "No Wolfram kernel found. Install one, or point WOLFRAM_SCRIPT at it.")
endif()

# strip newlines from the executable path. Happens sometimes, breaks everything
string(REPLACE "\n" "" WolframLanguage_wolframscript_EXE
               "${WolframLanguage_wolframscript_EXE}")
message(
  STATUS
    "Found a matching wolfram executable at: ${WolframLanguage_wolframscript_EXE}"
)

# get the application directory
execute_process(
  COMMAND ${WolframLanguage_wolframscript_EXE} -script
          ${CMAKE_CURRENT_SOURCE_DIR}/utils/get_wolfram_app_dir.m
  OUTPUT_VARIABLE WOLFRAM_APP_DIR
  OUTPUT_STRIP_TRAILING_WHITESPACE)
message(STATUS "Wolfram Language application directory: ${WOLFRAM_APP_DIR}")

# ##############################################################################
# Install the Mathematica package
# ##############################################################################

install(
  FILES ${CMAKE_CURRENT_SOURCE_DIR}/TensorBases.m
        ${CMAKE_CURRENT_SOURCE_DIR}/TensorBasesInstaller.m
        ${CMAKE_CURRENT_SOURCE_DIR}/PacletInfo.m
  DESTINATION ${WOLFRAM_APP_DIR}/TensorBases)

# modules/ is the package source; bases/ and cache/ are the shipped tensor data
# (loading without cache/ can take many minutes, so it must be installed).
install(
  DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/modules
            ${CMAKE_CURRENT_SOURCE_DIR}/bases
            ${CMAKE_CURRENT_SOURCE_DIR}/cache
            ${CMAKE_CURRENT_SOURCE_DIR}/examples
            ${CMAKE_CURRENT_SOURCE_DIR}/tests
            ${CMAKE_CURRENT_SOURCE_DIR}/utils
  MESSAGE_NEVER
  DESTINATION ${WOLFRAM_APP_DIR}/TensorBases
  FILES_MATCHING
  PATTERN "*.m"
  PATTERN "*.wl"
  PATTERN "*.mx"
  PATTERN "*.nb")

# ##############################################################################
# Testing
# ##############################################################################

if(WIN32)
  add_custom_target(
    test
    COMMAND ${WolframLanguage_wolframscript_EXE} -script
            ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m
    COMMENT "Running tests"
    VERBATIM)

  add_custom_target(
    test-single
    COMMAND ${WolframLanguage_wolframscript_EXE} -script
            ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m $(FILE)
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m
    COMMENT "Running tests")
else()
  add_custom_target(
    test
    COMMAND ${WolframLanguage_wolframscript_EXE} -script
            ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m | tee
            ${CMAKE_CURRENT_BINARY_DIR}/test.log
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m
    COMMENT "Running tests"
    VERBATIM)

  # Run a single test file or directory:
  #   make test-single FILE=Basics/SmokeTests.m
  #   make test-single FILE=Basics
  # Note: $(FILE) is expanded by Make at build time, not by CMake at configure
  # time. VERBATIM is intentionally omitted so that Make resolves the variable.
  add_custom_target(
    test-single
    COMMAND ${WolframLanguage_wolframscript_EXE} -script
            ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m $(FILE) | tee
            ${CMAKE_CURRENT_BINARY_DIR}/test.log
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tests/Test.m
    COMMENT "Running tests")
endif()
