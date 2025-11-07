#!/bin/bash

LOG_FILE="validate.log"
touch $LOG_FILE

if test -d "src/"; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - src/ directory exists" >> $LOG_FILE
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: src/ directory is missing" >> $LOG_FILE
    exit 1
fi

if jq . config.json >/dev/null 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - config.json is valid" >> $LOG_FILE
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: config.json is invalid" >> $LOG_FILE
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Validation successful" >> $LOG_FILE
exit 0
