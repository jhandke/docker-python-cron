#!/bin/sh

/usr/local/bin/python /app/main.py 2>&1
cron && tail -f /var/log/cron.log
