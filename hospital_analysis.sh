#!/bin/bash
# Member 5 (Clinical Analyst)
process_vitals() {
    echo "Scanning heart rate and temperature logs for CRITICAL readings..."

    if [ ! -d "reports" ]; then
        echo "reports directory not found, creating it..."
        mkdir reports
    fi

    > reports/critical_alerts.txt

    for log in active_logs/heart_rate_log.log active_logs/temperature_log.log; do
        if [ -f "$log" ]; then
            grep "CRITICAL" "$log" | awk -F ' \\| ' '{print $1 " | " $2 " | " $3}' >> reports/critical_alerts.txt
        else
            echo "Warning: $log not found, skipping."
        fi
    done

    alert_count=$(wc -l < reports/critical_alerts.txt)
    echo "Found ${alert_count} CRITICAL alert(s). Saved to reports/critical_alerts.txt"
}

# Member 6 (Facility Auditor)
water_audit() {
    echo "Running facility water audit..."

    local log="active_logs/water_usage_log.log"

    if [ ! -f "$log" ]; then
        echo "Water usage log not found."
        return 1
    fi

    avg=$(grep "ICU_WATER_RESERVE" "$log" | awk -F ' \\| ' '
        { sum += $3; count++ }
        END {
            if (count > 0) printf "%.2f", sum / count
            else print "0.00"
        }')

    printf "\n===== ICU Water Reserve Audit =====\n"
    printf "Average Usage : %s Liters/min\n" "$avg"
    printf "====================================\n"
}

process_vitals
water_audit
