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
