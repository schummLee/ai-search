cmake_minimum_required(VERSION 3.10)
project(MusicSearch)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(include)

# Add executable target
add_executable(music_search main.cpp src/MusicDatabase.cpp src/APIServer.cpp src/JsonFileGenerator.cpp)

# Link against OpenSSL library
find_package(OpenSSL REQUIRED)
target_link_libraries(music_search OpenSSL::SSL OpenSSL::Crypto)

# Find cpprestsdk
find_package(cpprestsdk REQUIRED)

# Link cpprestsdk library
target_link_libraries(music_search cpprestsdk::cpprest)

# Find MySQL Connector/C++ library
find_library(MYSQL_CPP_CONN_LIB mysqlcppconn PATHS /usr/lib/x86_64-linux-gnu)

if(NOT MYSQL_CPP_CONN_LIB)
    message(FATAL_ERROR "MySQL Connector/C++ library not found.")
endif()

# Link MySQL Connector/C++ library
target_link_libraries(music_search ${MYSQL_CPP_CONN_LIB})
