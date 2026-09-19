#!/bin/bash

# ==========================================
# Member 1 (The Architect)
# Function: initialize_system()
# ==========================================
initialize_system() {
    echo "--- Initialisation de l'infrastructure KNH ---"

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
