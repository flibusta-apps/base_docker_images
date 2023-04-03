ARG PYTHON_VERSION_ARG

FROM python:${PYTHON_VERSION_ARG}-slim

RUN apt-get update \
    && apt-get install --no-install-recommends -y git gcc build-essential python${PYTHON_VERSION_ARG}-dev libpq-dev libffi-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip install poetry wheel --no-cache-dir

ENV VENV_PATH=/opt/venv

RUN python -m venv $VENV_PATH \
    && . /opt/venv/bin/activate \
    && pip install asyncpg --no-cache-dir
