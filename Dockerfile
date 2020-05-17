# base image
FROM python:3.8.1-alpine

# set working directory
WORKDIR /code

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

# copy requirements file
COPY requirements.txt requirements.txt

# install dependencies
RUN apk add --no-cache gcc musl-dev linux-headers \
      && pip install --upgrade pip setuptools wheel \
      && pip install -r requirements.txt \
      && rm -rf /root/.cache/pip

# copy project
COPY . .
