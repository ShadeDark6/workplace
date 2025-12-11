#!/bin/bash

# Ensure the script is run from the directory containing the scripts
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Step 1: Run setup_tools.sh
echo "Running setup_tools.sh..."
bash "$SCRIPT_DIR/setup_tools.sh"
if [ $? -ne 0 ]; then
    echo "Error occurred while running setup_tools.sh. Exiting."
    exit 1
fi

# Step 2: Run download_firmware.sh
echo "Running download_firmware.sh..."
bash "$SCRIPT_DIR/download_firmware.sh"
if [ $? -ne 0 ]; then
    echo "Error occurred while running download_firmware.sh. Exiting."
    exit 1
fi

# Step 3: Run extract_blobs.sh
echo "Running extract_blobs.sh..."
bash "$SCRIPT_DIR/extract_blobs.sh"
if [ $? -ne 0 ]; then
    echo "Error occurred while running extract_blobs.sh. Exiting."
    exit 1
fi

echo "All scripts executed successfully!"

