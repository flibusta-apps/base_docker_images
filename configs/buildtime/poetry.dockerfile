ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}-slim

RUN apt-get update \
    && apt-get install --no-install-recommends -y gcc build-essential python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install wheel poetry --no-cache-dir
