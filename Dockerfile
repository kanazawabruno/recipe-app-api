FROM python:3.7-alpine
MAINTAINER Bruno Kanazawa

ENV PYTHONUNBUFFERED 1

RUN /sbin/apk add --no-cache --virtual .deps gcc musl-dev

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user



