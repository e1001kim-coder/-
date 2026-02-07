#!/bin/bash

# Script to install OpenCLAW on Linux/macOS systems

# Update package lists
sudo apt update

# Install required dependencies
sudo apt install -y build-essential cmake git

# Clone OpenCLAW repository
git clone https://github.com/OpenCLAW/OpenCLAW.git

# Change to the OpenCLAW directory
cd OpenCLAW

# Create a build directory
mkdir build
cd build

# Run CMake
cmake ..

# Compile the code
make

# Install OpenCLAW
sudo make install

# Print completion message
echo "OpenCLAW installation completed!"