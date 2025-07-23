#!/bin/bash
python_version="${PYTHON_VERSION:-${1:-3.11}}"

mkdir wheels
uv init -p "$python_version"
uv python pin "$python_version"
uv add torch "pip<25.3" wheel setuptools

# Copy the source code to build directory
cp -r /src/fast_jl-0.1.3 ./
cd fast_jl-0.1.3

# Rename setup_binary.py to setup.py for pip wheel to find it
mv setup_binary.py setup.py

mkdir -p /tmp/build
uv run pip wheel . --wheel-dir /tmp/build --no-build-isolation
mv /tmp/build/fast_jl_binary*.whl /build/dist/
uv run wheel tags --platform-tag manylinux1_x86_64 /build/dist/*.whl --remove
