#!/bin/bash

# Check if the lineage directory exists; create it if it doesn't
if [ ! -d "lineage" ]; then
    mkdir -p lineage
fi

# Path to your dumped firmware (DumprX output)
DUMP_PATH="../../../../DumprX/out"

# ---------------------------------------------------------
# 1. Clone/Update Xiaomi SM8450-common
# ---------------------------------------------------------
echo "Checking and cloning or updating Xiaomi SM8450-common..."
COMMON_PATH="lineage/device/xiaomi/sm8450-common"

if [ -d "$COMMON_PATH" ]; then
    echo "Xiaomi SM8450-common already exists, updating..."
    cd "$COMMON_PATH"
    git pull
    cd ../../../..
else
    # Cloning pa-gr / vauxite
    git clone https://github.com/pa-gr/android_device_xiaomi_sm8450-common.git -b vauxite "$COMMON_PATH"
fi

# ---------------------------------------------------------
# 2. Clone/Update Xiaomi Marble
# ---------------------------------------------------------
echo "Checking and cloning or updating Xiaomi Marble..."
MARBLE_PATH="lineage/device/xiaomi/marble"

if [ -d "$MARBLE_PATH" ]; then
    echo "Xiaomi Marble already exists, updating..."
    cd "$MARBLE_PATH"
    git pull
    cd ../../../..
else
    # Cloning pa-gr / vauxite
    git clone https://github.com/pa-gr/android_device_xiaomi_marble.git -b vauxite "$MARBLE_PATH"
fi

# ---------------------------------------------------------
# 3. Extraction (Triggers Common + Device)
# ---------------------------------------------------------
echo "Starting extraction process from Marble..."
cd "$MARBLE_PATH"

echo "Running setup-makefiles.sh..."
bash setup-makefiles.sh

echo "Running extract-files.sh..."
# This will extract Marble blobs AND automatically trigger sm8450-common blobs
bash extract-files.sh "$DUMP_PATH"

echo "Blobs extracted successfully!"