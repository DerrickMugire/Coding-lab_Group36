#!/bin/bash

# ==========================================================
# Member 1 - System Architect
# Creates required hospital directories
# ==========================================================

initialize_system() {

    echo "Checking system directories..."

    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    else
        echo "active_logs already exists."
    fi

    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    else
        echo "archived_logs already exists."
    fi

    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    else
        echo "reports already exists."
    fi
}


# ==========================================================
# Member 2 - Security Lead
# Protects sensitive medical logs
# ==========================================================

secure_data() {

    echo "Securing active_logs directory..."

    # Owner has read, write and execute permission.
    # Group and others have no access.
    chmod 700 active_logs

    echo "Updated active_logs permissions:"
    ls -ld active_logs
}


# ==========================================================
# Member 3 - Orchestrator
# Executes the functions in the correct order
# ==========================================================

initialize_system

secure_data

echo ""
echo "System Environment Secured"
echo "Date: $(date)"
