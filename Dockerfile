FROM python:3.14-slim

RUN apt-get update && apt-get install -y cron dumb-init

COPY requirements.txt /app/requirements.txt
COPY main.py /app/main.py
COPY cronjob /etc/cron.d/cronjob
COPY entrypoint.sh /entrypoint.sh

RUN crontab /etc/cron.d/cronjob
RUN touch /var/log/cron.log
RUN chmod 0644 /etc/cron.d/cronjob

WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/entrypoint.sh"]
