FROM python:3.6
MAINTAINER Khoa Nguyen Dang

# Application setup
ADD . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000