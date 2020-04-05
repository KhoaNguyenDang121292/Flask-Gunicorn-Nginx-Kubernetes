FROM ubuntu:latest
LABEL maintainer="Khoa Nguyen Dang"

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential vim

COPY . /app
WORKDIR /app

EXPOSE 80

ENV PYTHONPATH=/app
ENV FLASK_APP=app.py
ENV SECRET=b'\xdd\xa2\xb3\xcf0\x86m\x93\x9e\xee\xfe\x168\xb3\xb2:\xf5\xdf\xa3\x1b:\xad\xe1\r'
ENV APP_SETTINGS=development
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN pip install -r requirements.txt
RUN chmod 777 gunicorn_starter.sh
ENTRYPOINT ["./gunicorn_starter.sh"]
