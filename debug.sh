#!/bin/bash
docker run -v $(pwd)/dist:/build/dist --rm -it --entrypoint bash ghcr.io/dwahdany/fast-jl-binary:latest
