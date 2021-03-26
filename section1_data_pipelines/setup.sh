#!/bin/bash

# Change working directory
cd ${PWD}

# Create directories if not exists and set permissions
mkdir processed
chmod 770 processed

chmod 750 run.sh
chmod 750 process.py

echo 'Setup completed.'
