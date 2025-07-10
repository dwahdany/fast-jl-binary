#!/bin/bash
python_version="${1:-3.11}"

mkdir wheels
uv init -p "$python_version"
uv python pin "$python_version"
uv add torch pip wheel
uv run python -m pip wheel traker[fast] --no-build-isolation -w wheels
mkdir tmp
cp -r wheels/fast_jl* tmp/
uv run wheel unpack tmp/* -d tmp
rm tmp/*.whl
find tmp -name METADATA -exec sed -i   -e 's/^Author:.*/Author: Dariush Wahdany/'   -e 's/^Author-email:.*/Author-email: dariushwahdany@gmail.com/'   -e 's/^Name: fast_jl/Name: fast_jl_binary/'   {} \;
cd tmp
for dir in fast_jl-*/; do
  if [ -d "$dir" ]; then
    newdir="$(echo "$dir" | sed 's/^fast_jl-/fast_jl_binary-/')"
    mv "$dir" "$newdir"
  fi
done
cd *
for file in fast_jl.cpython-*.so; do
  if [ -f "$file" ]; then
    newfile="$(echo "$file" | sed 's/^fast_jl/fast_jl_binary/')"
    mv "$file" "$newfile"
  fi
done
for folder in fast_jl-*.dist-info; do
  if [ -d "$folder" ]; then
    newfolder="$(echo "$folder" | sed 's/^fast_jl-/fast_jl_binary-/')"
    mv "$folder" "$newfolder"
  fi
done
cd *.dist-info
echo "fast_jl_binary" > top_level.txt
cd /build
uv run wheel pack tmp/* -d dist
uv run wheel tags --platform-tag manylinux1_x86_64 dist/*.whl --remove
