#!/bin/bash

# vm_health_check.sh - Health check for Ubuntu VMs

THRESHOLD=60
EXPLAIN_MODE=false

# Check if "--explain" was passed
if [[ "$1" == "--explain" ]]; then
  EXPLAIN_MODE=true
fi

# Function to get CPU usage (user + system)
get_cpu_usage() {
  top -bn1 | grep "%Cpu(s)" | awk '{print 100 - $8}' | cut -d'.' -f1
}

# Function to get memory usage
get_memory_usage() {
  free | awk '/Mem:/ { printf("%.0f", $3/$2 * 100) }'
}

# Function to get disk usage (root partition only)
get_disk_usage() {
  df / | awk 'NR==2 { gsub("%", "", $5); print $5 }'
}

cpu_usage=$(get_cpu_usage)
mem_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

HEALTHY=true
REASONS=()

if (( cpu_usage > THRESHOLD )); then
  HEALTHY=false
  REASONS+=("High CPU usage: ${cpu_usage}%")
fi

if (( mem_usage > THRESHOLD )); then
  HEALTHY=false
  REASONS+=("High Memory usage: ${mem_usage}%")
fi

if (( disk_usage > THRESHOLD )); then
  HEALTHY=false
  REASONS+=("High Disk usage: ${disk_usage}%")
fi

# Print Health Status
if $HEALTHY; then
  echo "VM Health Status: Healthy"
else
  echo "VM Health Status: Not Healthy"
fi

# If in explain mode, show reasons or just usage
if $EXPLAIN_MODE; then
  echo -e "\n--- Explanation ---"
  echo "CPU Usage: ${cpu_usage}%"
  echo "Memory Usage: ${mem_usage}%"
  echo "Disk Usage: ${disk_usage}%"

  if ! $HEALTHY; then
    echo -e "\nIssues Detected:"
    for reason in "${REASONS[@]}"; do
      echo "- $reason"
    done
  fi
fi
