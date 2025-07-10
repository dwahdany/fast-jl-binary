FROM nvidia/cuda:12.9.1-devel-ubuntu22.04 AS build
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN mkdir /build
WORKDIR /build
RUN uv venv
RUN uv pip install torch pip wheel
