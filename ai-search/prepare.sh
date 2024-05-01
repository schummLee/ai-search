#!/bin/bash

# Update apt package index
sudo apt update

# Install MySQL Server
sudo apt install mysql-server

# Install MySQL Connector/C++
sudo apt install libmysqlcppconn-dev

# Install OpenSSL
sudo apt install openssl

# Install additional OpenSSL development libraries
sudo apt install libssl-dev

# Install build-essential (includes essential packages like gcc, g++, make, etc.)
sudo apt install build-essential

echo "Installation complete."
