#!/bin/bash

# ==========================================
# Member 1 (The Architect)
# Function: initialize_system()
# ==========================================
initialize_system() {
    echo "--- Initialisation KNH Infrastructure ---"

    directories=("active_logs" "archived_logs" "reports")

    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            echo "Creating $dir directory..."
            mkdir -p "$dir"
        else
            echo "Directory $dir already exists."
        fi
    done
}

# Member 2 - Security Lead
secure_data() {
    if [ ! -d active_logs ]; then
        echo "active_logs directory not found. Run initialize_system first."
        return 1
    fi
    echo "Securing the active_logs directory..."
    chmod 700 active_logs
    chmod 600 active_logs/*.log 2>/dev/null
    echo "Directory permissions:"
    ls -ld active_logs
    echo "File permissions:"
    ls -l active_logs
    echo "active_logs is now owner-only."
    chmod 600 active_logs/*.log 2>/dev/null
}

