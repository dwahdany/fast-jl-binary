#!/bin/bash
docker build -t fast-jl-builder .
docker run --rm -v $(pwd)/dist:/build/dist fast-jl-builder
