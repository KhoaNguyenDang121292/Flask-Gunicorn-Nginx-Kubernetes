#!/usr/bin/env bash
gunicorn --workers=2 --threads=2 --bind 0.0.0.0:8000 app