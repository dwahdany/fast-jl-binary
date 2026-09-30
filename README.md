> [!WARNING]
> **Deprecated — this repo is archived and will not ship new wheels.**
> You no longer need it: `uv` can build the upstream `fast-jl` sdist directly. See [Workaround](#workaround-install-upstream-fast-jl-with-uv) below.

## Workaround: install upstream `fast-jl` with uv

`fast-jl`'s `setup.py` imports `torch` but declares no build dependencies, so isolated builds fail with `No module named 'torch'`.
Tell uv to inject your project's own `torch` into the build environment (requires uv >= 0.8.4):

```toml
[project]
dependencies = ["torch>=2.0.0", "fast-jl"]

[tool.uv.extra-build-dependencies]
fast-jl = [{ requirement = "torch", match-runtime = true }]

# fast-jl has no static metadata; match-runtime needs it
[[tool.uv.dependency-metadata]]
name = "fast-jl"
version = "0.1.3"
requires-dist = ["torch>=2.0.0"]
```

Then `uv sync`. The build machine needs the CUDA toolkit (`nvcc`, `CUDA_HOME` set).

Without uv's project config (pip / `uv pip`), install torch first and disable build isolation:

```bash
pip install torch
pip install fast-jl --no-build-isolation
```

---

*Original README follows.*

Have you tried installing `fast-jl` but failed?  
No more! This repo ships binary wheels for your efficient progress.
## What is this
`fast-jl-binary` literally only provides binary wheels for the `fast-jl` package (https://github.com/MadryLab/trak/tree/main/fast_jl), compiled in a CUDA docker container. It should be slightly faster on modern GPUs, as it compiles the CUDA kernels not only for `7.0+PTX` but natively for `7.0 7.2 7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.1 12.0+PTX`
## Usage
Install with
```
pip install fast-jl-binary
```
or add to your requirements
```
uv add fast-jl-binary
```
