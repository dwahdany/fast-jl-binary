#!/bin/bash
docker run -v $(pwd)/dist:/build/dist --rm ghcr.io/dwahdany/fast-jl-binary:latest
