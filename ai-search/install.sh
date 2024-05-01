#!/bin/bash

# Create build directory
mkdir -p build
cd build || exit

# Run CMake to generate Makefiles
cmake ..

# Build the project using Make
make

# Check if compilation was successful
if [ $? -eq 0 ]; then
    # Run the executable
    ./music_search
else
    echo "Build failed. Exiting."
    exit 1
fi
