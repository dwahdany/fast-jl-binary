#!/bin/bash

mkdir output
uv run python -m pip wheel traker[fast] --no-build-isolation -w output
mkdir tmp
cp -r output/fast_jl* tmp/
uv run wheel unpack tmp/* -d tmp
rm tmp/*.whl
find tmp -name METADATA -exec sed -i   -e 's/^Author:.*/Author: Dariush Wahdany/'   -e 's/^Author-email:.*/Author-email: dariushwahdany@gmail.com/'   -e 's/^Name: fast_jl/Name: fast_jl_binary/'   {} \;
mkdir dist
uv run wheel pack tmp/* -d dist
