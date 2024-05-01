cmake_minimum_required(VERSION 3.10)
project(MusicSearch)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(include)
include_directories(lib)


# Add executable target
add_executable(music_search main.cpp src/MusicDatabase.cpp src/APIServer.cpp)

# Link against OpenSSL library
find_package(OpenSSL REQUIRED)
target_link_libraries(music_search OpenSSL::SSL OpenSSL::Crypto)


# Specify the path to MySQL Connector/C library folder
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib)

# Link MySQL connector library
# Specify the path to MySQL Connector/C++ library include folder
include_directories(/usr/local/mysql-connector-c++-8.4.0/include/jdbc)

# Specify the path to MySQL Connector/C++ library folder
link_directories(/usr/local/mysql-connector-c++-8.4.0/include/jdbc)

# Find cpprestsdk
find_package(cpprestsdk REQUIRED)

# Link cpprestsdk library
target_link_libraries(music_search cpprestsdk::cpprest)
