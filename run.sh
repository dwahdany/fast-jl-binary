#!/bin/bash
docker run -v $(pwd)/output:/build/output --rm ghcr.io/dwahdany/fast-jl-binary:latest uv run python -m pip wheel traker[fast] --no-build-isolation -w output
