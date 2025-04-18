#!/bin/bash

## When Maker converts pdfs into markdown format it breaks the pdf up and creates a bunch of
## image files and extra folders.  This script cleans all that up by deleting
## the images, which Onyx can't use, and moving all files up to one central folder
## so Onyx does not have to look through a complex folder tree for the files.

TARGET_DIR="/home" #Should match the OUTPUT_DIRECTORY in paperless-markdown-conversion.sh

# Step 1: Remove all image files in TARGET_DIR and subdirectories
find "$TARGET_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.svg" \) -exec rm -v {} \;

# Step 2: Move all remaining files to TARGET_DIR
find "$TARGET_DIR" -type f -exec mv -v {} "$TARGET_DIR" \;

# Step 3: Delete empty directories
find "$TARGET_DIR" -type d -empty -delete

echo "Cleanup complete."