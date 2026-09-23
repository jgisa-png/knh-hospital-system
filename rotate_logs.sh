#!/bin/bash
# Member 4 - Log Rotation and Archiving
archive_logs() {
    echo "--- Archiving KNH Logs ---"
    timestamp=$(date +"%Y%m%d_%H%M%S")
    mkdir -p archived_logs reports
    for log_file in active_logs/*.log; do
        if [ -f "$log_file" ]; then
            filename=$(basename "$log_file" .log)
            archive_name="archived_logs/${filename}_${timestamp}.log"
            cp "$log_file" "$archive_name"
            > "$log_file"
        fi
    done
    echo "Archiving Complete"
}
archive_logs