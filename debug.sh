#!/bin/bash
docker run --rm -it  --entrypoint bash -v $(pwd)/dist:/build/dist fast-jl-builder
# docker run -v $(pwd)/dist:/build/dist --rm -it --entrypoint bash ghcr.io/dwahdany/fast-jl-binary:latest
