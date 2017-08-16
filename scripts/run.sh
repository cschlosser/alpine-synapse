#!/bin/sh

# Start the turn server in background mode
/usr/local/bin/turnserver -o

# Start Synapse
source /synapse/bin/activate
synctl start /config/homeserver.yaml
# Create a hanging process to prevent the container from exiting
tail -f $(grep "log_file" /config/homeserver.yaml | awk '{print $2}' | sed -e 's/^"//' -e 's/"$//')
