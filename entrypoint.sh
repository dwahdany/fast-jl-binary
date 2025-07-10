#!/bin/bash

mkdir output
uv pip install torch
uv run python -m pip wheel traker[fast] --no-build-isolation -w output
mkdir tmp
cp -r output/fast_jl* tmp/
uv run wheel unpack tmp/* -d tmp
rm tmp/*.whl
find tmp -name METADATA -exec sed -i   -e 's/^Author:.*/Author: Dariush Wahdany/'   -e 's/^Author-email:.*/Author-email: dariushwahdany@gmail.com/'   -e 's/^Name: fast_jl/Name: fast_jl_binary/'   {} \;
mkdir dist
uv run wheel pack tmp/* -d dist
uv run wheel tags --platform-tag manylinux_2_36_x86_64 dist/*.whl --remove
for oldpath in dist/fast_jl-*.whl; do
    newpath="dist/fast_jl_binary-${oldpath#dist/fast_jl-}"
    mv "$oldpath" "$newpath"
done
