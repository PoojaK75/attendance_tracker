#!/bin/bash
echo "Cleaning up old deployment..."
if [ -d "/home/ec2-user/attendance_tracker" ]; then
    rm -rf /home/ec2-user/attendance_tracker/*
    echo "Cleaned up."
else
    echo "Directory not found. Skipping cleanup."
fi

exit 0