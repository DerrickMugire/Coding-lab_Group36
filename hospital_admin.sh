#!/bin/bash

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
# Protect active logs so only the owner can read and write.

secure_data() {

    echo "Securing active_logs..."

    chmod 600 active_logs

    echo "Updated permissions:"
    ls -ld active_logs
}

initialize_system
secure_data

echo ""
echo "System Environment Secured"
date
