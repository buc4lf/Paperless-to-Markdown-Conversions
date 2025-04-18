#!/bin/bash

# Define directories and log file
DIRECTORY="/home/"  # Input directory containing the document scans.
OUTPUT_DIRECTORY="/home/"  # Directory to store the converted Markdown files.
LOGFILE="/home/"  # File to record the script's activity and any errors.
PROCESSED_LIST="/home/"  # File to keep track of files that have already been converted.

# Ensure processed files list exists
touch "$PROCESSED_LIST"

# Log start of operation
echo "["$(date +"%Y-%m-%d %H:%M:%S")"] Starting marker process." >> "$LOGFILE"

# Iterate over files in the directory
for FILE in "$DIRECTORY"/*; do
  [ -e "$FILE" ] || continue  # Skip if no files

  FILENAME=$(basename "$FILE")

  # Check if the file has already been processed
  if grep -Fxq "$FILENAME" "$PROCESSED_LIST"; then
    echo "["$(date +"%Y-%m-%d %H:%M:%S")"] Skipping already processed file: $FILENAME" >> "$LOGFILE"
    continue
  fi

  # Run marker_single for the file
  OUTPUT_FILE="$OUTPUT_DIRECTORY/$FILENAME"
  marker_single "$FILE" --output_dir "$OUTPUT_FILE" 2>&1 | tee -a "$LOGFILE"

  # Mark file as processed
  echo "$FILENAME" >> "$PROCESSED_LIST"

  # Log completion of file processing
  echo "["$(date +"%Y-%m-%d %H:%M:%S")"] Processed file: $FILENAME" >> "$LOGFILE"
done

# Log completion of operation
echo "["$(date +"%Y-%m-%d %H:%M:%S")"] Marker process completed." >> "$LOGFILE"