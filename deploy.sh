#!/bin/bash

cd /home/ec2-user/attendance_tracker || exit 1

# Stop any running app
echo "Stopping existing Flask app if running..."
pkill -f app.py || true

# Setup virtual environment
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

source venv/bin/activate

# Install/update dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Restart the app
echo "Starting Flask app..."
nohup python3 app.py > app.log 2>&1 &
