#!/bin/bash
# Check both card0 and card1 for the AMD gpu_busy_percent file
if [ -f /sys/class/drm/card0/device/gpu_busy_percent ]; then
    cat /sys/class/drm/card0/device/gpu_busy_percent
elif [ -f /sys/class/drm/card1/device/gpu_busy_percent ]; then
    cat /sys/class/drm/card1/device/gpu_busy_percent
else
    echo "0"
fi
