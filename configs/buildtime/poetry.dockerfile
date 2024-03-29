ARG PYTHON_VERSION_ARG

FROM python:${PYTHON_VERSION_ARG}-slim

ARG PYTHON_VERSION_ARG
ENV PYTHON_VERSION_ARG=$PYTHON_VERSION_ARG

RUN apt-get update \
    && apt-get install --no-install-recommends -y gcc build-essential python3-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip install wheel poetry --no-cache-dir

ENV VENV_PATH=/opt/venv

RUN python -m venv $VENV_PATH
