ARG PYTHON_VERSION_ARG

FROM python:${PYTHON_VERSION_ARG}-slim

RUN apt-get update \
    && apt-get install --no-install-recommends -y python${PYTHON_VERSION_ARG}-dev libpq-dev libffi-dev \
    && rm -rf /var/lib/apt/lists/*
