#!/bin/bash
python_version="${PYTHON_VERSION:-${1:-3.11}}"

mkdir wheels
uv init -p "$python_version"
uv python pin "$python_version"
uv add torch pip wheel setuptools

# Copy the source code to build directory
cp -r /src/fast_jl-0.1.3 ./
cd fast_jl-0.1.3

# Rename setup_binary.py to setup.py for pip wheel to find it
mv setup_binary.py setup.py

# Use pip directly to build the wheel with explicit environment
uv run pip wheel . --wheel-dir ../dist --no-build-isolation

# Apply manylinux tags
cd ..
uv run wheel tags --platform-tag manylinux1_x86_64 dist/*.whl --remove
