
#!/bin/bash

# Author: Piyush Sharma
# Purpose: Create compressed backups of directories

# Check whether an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

# Check whether the folder exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist: $SOURCE"
    exit 1
fi

# Create backup directory
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"

mkdir -p "$BACKUP_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup filename
BACKUP_FILE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

# Create compressed archive
if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then

    SIZE=$(du -h "$BACKUP_FILE" | awk '{print $1}')

    echo "Backup created successfully!"
    echo "Backup filename: $(basename "$BACKUP_FILE")"
    echo "Backup size: $SIZE"

    echo "$TIMESTAMP - SUCCESS - $(basename "$BACKUP_FILE") - Size: $SIZE" >> "$BACKUP_DIR/backup.log"

else

    echo "Error: Backup creation failed."

    echo "$TIMESTAMP - FAILED - $SOURCE" >> "$BACKUP_DIR/backup.log"

    exit 1
fi
