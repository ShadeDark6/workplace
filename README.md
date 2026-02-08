# Workplace

## Overview

The `workplace` repository contains a set of scripts for setting up tools, downloading MIUI firmware, and extracting blobs for Android development. This repository is structured to streamline the process of preparing and managing Android device trees and firmware.

## Directory Structure

- `setup_tools.sh`: Sets up the necessary tools for extracting Android blobs.
- `download_firmware.sh`: Downloads the MIUI firmware and sets up the DumprX environment.
- `extract_blobs.sh`: To update the device trees and create vendor tree using dt proprietary-files.txt.
- `run_all_scripts.sh`: Runs all the above scripts in sequence.

## Prerequisites

- Ensure you have Git and Bash installed on your system.
- Ensure you have sufficient disk space for downloading firmware and extracting blobs.

## Cloning the Repository

To clone the `workplace` repository, use the following command:

```bash
git clone https://github.com/ShadeDark6/workplace.git -b marble workplace

```

## Usage

Navigate to the Repository Directory:

```bash
cd workplace
```

Make Scripts Executable:

```bash
chmod +x setup_tools.sh download_firmware.sh extract_blobs.sh run_all_scripts.sh
```

Run the Scripts:


To set up tools, run:

```bash
./setup_tools.sh
```

To download the MIUI firmware and set up the DumprX environment, run:

```bash
./download_firmware.sh
```

To update the device trees and create vendor tree using dt proprietary-files.txt, run:

```bash
./extract_blobs.sh
```

## To run all scripts in order :

```bash
./run_all_scripts.sh
```

## Notes

Ensure that you have internet access while running these scripts, as they will need to download firmware and update repositories.

The run_all_scripts.sh script will execute each script in sequence and halt if any script encounters an error.

You may need to adjust paths or URLs in the scripts according to your specific setup or requirements.
