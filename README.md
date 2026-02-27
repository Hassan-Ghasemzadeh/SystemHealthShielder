🛡️ System Health Shielder
A Modular, Professional Bash-Based System Monitoring Tool.

System Health Shielder is a lightweight, robust monitoring solution designed to track system resources (CPU and RAM) while adhering to professional DevOps standards. It features a modular architecture that separates logic, configuration, and execution.

✨ Key Features
Modular Architecture: Clean separation of concerns between core logic, utility functions, and user configuration.

Enterprise Standards: Implements set -euo pipefail for maximum script reliability and error handling.

Self-Healing Logic: Designed to detect critical thresholds and log warnings before system failure.

Automated Deployment: Includes an intelligent install.sh that sets up the directory structure and a system-wide Cronjob.

Professional Logging: Centralized logging system with categorized levels (INFO, WARN, ERROR).

📂 Project Structure
Plaintext
health_shielder/
├── main.sh            # Entry point and orchestrator
├── config/
│   └── app.conf       # Environment variables and thresholds
├── lib/
│   └── utils.sh       # Shared utility functions (Logging, Root checks)
└── logs/
    └── health.log     # Persistent system logs
🚀 Getting Started
1. Prerequisites
Ensure your Linux system has the following utilities installed:

bash (v4.0 or higher)

awk, grep, top

2. Automatic Installation
Run the installer to automatically generate the project structure and schedule the monitor:

Bash
chmod +x install.sh
./install.sh
3. Manual Execution
If you wish to run the monitor manually for an immediate check:

Bash
cd ~/health_shielder
./main.sh
⚙️ Configuration
You can customize the monitoring behavior by editing config/app.conf:

CPU_THRESHOLD: Maximum allowed CPU usage percentage (Default: 80).

MEM_THRESHOLD: Maximum allowed RAM usage percentage (Default: 85).

LOG_FILE: Path to the output log file.

🛠️ Monitoring & Troubleshooting
To watch the health logs in real-time as the automated script runs:

Bash
tail -f ~/health_shielder/logs/health.log
🗑️ Uninstallation
To completely remove the project and clean up system Cronjobs:

Bash
chmod +x uninstall.sh
./uninstall.sh
📜 License
This project is licensed under the MIT License. Feel free to modify and distribute.
