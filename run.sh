#!/bin/bash
python_version="${1:-3.11}"
docker run -v $(pwd)/dist:/build/dist -v $(pwd)/fast_jl-0.1.3:/build/fast_jl-0.1.3 -e PYTHON_VERSION="${python_version}" --rm ghcr.io/dwahdany/fast-jl-binary:latest
