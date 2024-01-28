#!/bin/sh
source home/app/venv/bin/activate
gunicorn -b 0.0.0.0:5000 app:app