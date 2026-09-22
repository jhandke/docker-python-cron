# docker-python-cron
Template to run a python script periodically inside a Docker container.

## Usage
Create or edit `main.py` script and add your dependencies to `requirements.txt`. Adjust the default `*/10 * * * *` inside the `cronjob` file. Run `docker build -t <some-tag-here> .`. Run the script using `docker run <some-tag-here>` or Docker Compose.