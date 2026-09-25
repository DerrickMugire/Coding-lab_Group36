#!/bin/bash
# Member 4 (The Archivist)

archive_logs() {
    echo "Starting log rotation..."

    if [ ! -d "archived_logs" ]; then
        echo "archived_logs not found, creating it..."
        mkdir archived_logs
    fi

    if [ ! -d "active_logs" ]; then
        echo "active_logs directory not found. Nothing to archive."
        return 1
    fi

    timestamp=$(date +%Y%m%d_%H%M)

    declare -A logs=(
        ["heart_rate_log.log"]="heart_rate"
        ["temperature_log.log"]="temperature"
        ["water_usage_log.log"]="water_usage"
    )

    for filename in "${!logs[@]}"; do
        src="active_logs/${filename}"
        prefix="${logs[$filename]}"
        dest="archived_logs/${prefix}_${timestamp}.log"

        if [ -f "$src" ]; then
            mv "$src" "$dest"
            echo "Archived: $src -> $dest"
        else
            echo "Skipped: $src not found."
        fi
    done

    echo "Recreating empty log files in active_logs for continuity..."
    touch active_logs/heart_rate_log.log
    touch active_logs/temperature_log.log
    touch active_logs/water_usage_log.log

    echo "Log rotation complete."
}

archive_logs
