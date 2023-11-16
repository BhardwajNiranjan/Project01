#!/bin/bash

# Define the desired version of Node.js
NODE_VERSION="5.12.0"
read -p " Enter Node Version " NODE_VERSION
INSTALL_DIR="/opt/node-v$NODE_VERSION"
DOWNLOAD_URL="https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz"
curl -LO $DOWNLOAD_URL
tar -xzf node-v$NODE_VERSION-linux-x64.tar.gz
sudo mv node-v$NODE_VERSION-linux-x64 $INSTALL_DIR
rm node-v$NODE_VERSION-linux-x64.tar.gz
