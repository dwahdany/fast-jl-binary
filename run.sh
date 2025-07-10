#!/bin/bash
docker run -v $(pwd)/output:/build/output --rm -it fast-jl-builder uv run python -m pip wheel traker[fast] --no-build-isolation -w output
