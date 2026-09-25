# Coding-lab_Group36

## Kenyatta National Hospital Digital Infrastructure

### Members Covered

- **Member 1:** `initialize_system()`Member 1: initialize_system() — checks whether the required hospital directories exist and creates active_logs/, archived_logs/, and reports/ if they are missing.
- **Member 2:** `secure_data()`- secures the sensitive active_logs/ directory by restricting access to the owner and displays the directory permissions using ls -ld.
- **Member 3:** Execution logic - automatically runs the system initialization and security functions in the correct order, then displays a confirmation message and the current date.
- **Member 4:** `archive_logs()` — rotates active logs into `archived_logs/` with a timestamp and recreates fresh log files for continuity
- **Member 5:** `process_vitals()` — extracts every CRITICAL heart rate/temperature reading into `reports/critical_alerts.txt`
- **Member 6:** `water_audit()` — calculates and prints the average usage for `ICU_WATER_RESERVE`

### Files

- `hospital_system.py` – Data simulator
- `hospital_admin.sh` – Setup and security
- `hospital_archive.sh` – Archive script
- `hospital_analysis.sh` – Analysis script

### Run

```bash
chmod +x hospital_admin.sh hospital_analysis.sh hospital_archive.sh

# 1. Set up directories and permissions
./hospital_admin.sh

# 2. Start the simulator to generate live data
python3 hospital_system.py start

# 3. Run analysis on live data (before archiving)
./hospital_analysis.sh

# 4. Stop the simulator, then archive the logs
python3 hospital_system.py stop
./hospital_archive.sh
```
