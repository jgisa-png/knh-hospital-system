#!/bin/bash

# rotate_logs.sh
# Moves current logs from active_logs to archived_logs with a timestamp,
# then recreates empty logs so the Python engine can keep recording.

ACTIVE_DIR="active_logs"
ARCHIVE_DIR="archived_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M")

mkdir -p "$ARCHIVE_DIR"

for logfile in "$ACTIVE_DIR"/*.log; do
    [ -e "$logfile" ] || continue

    filename=$(basename "$logfile")
    base="${filename%.log}"

    mv "$logfile" "$ARCHIVE_DIR/${base}_${TIMESTAMP}.log"
    touch "$logfile"
done

echo "Log rotation complete: $(date)"
