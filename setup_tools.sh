#!/bin/bash

# Check if the lineage directory exists; create it if it doesn't
if [ ! -d "lineage" ]; then
    mkdir -p lineage
fi

# Step 1: Setup Tools

echo "Checking and cloning or updating LineageOS extract-tools..."
if [ -d "lineage/prebuilts/extract-tools" ]; then
    echo "extract-tools already exists, updating..."
    cd lineage/prebuilts/extract-tools
    git pull
else
    git clone https://github.com/LineageOS/android_prebuilts_extract-tools.git -b lineage-23.0 lineage/prebuilts/extract-tools
    cd lineage/prebuilts/extract-tools
fi
cd ../../..

echo "Checking and cloning or updating LineageOS extract-utils..."
if [ -d "lineage/tools/extract-utils" ]; then
    echo "extract-utils already exists, updating..."
    cd lineage/tools/extract-utils
    git pull
else
    git clone https://github.com/LineageOS/android_tools_extract-utils.git -b lineage-23.0 lineage/tools/extract-utils
    cd lineage/tools/extract-utils
fi
cd ../../..

# Step 2: Clone JDK
echo "Cloning JDK 21..."
if [ -d "lineage/prebuilts/jdk/jdk21" ]; then
    echo "JDK 21 already exists, skipping clone..."
else
    mkdir -p lineage/prebuilts/jdk  # Create the lineage/prebuilts/jdk directory if it doesn't exist
    git clone --depth 1 --branch android-14.0.0_r67 https://android.googlesource.com/platform/prebuilts/jdk/jdk21 lineage/prebuilts/jdk/jdk21
fi

echo "Setup tools completed successfully!"
