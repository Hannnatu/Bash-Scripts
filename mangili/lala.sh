#!/bin/bash

PORT=22
if netstat -tuln | grep ":$PORT" > /dev/null; then 
       echo "Port $PORT is open."
else
       echo "Port $PORT is closed."
fi
