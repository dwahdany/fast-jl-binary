#!/usr/bin/env python

from os import environ

# environ['TORCH_CUDA_ARCH_LIST']="7.0 7.2 7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.1 10.3 12.0 12.1+PTX"
environ['TORCH_CUDA_ARCH_LIST']="7.0 7.2 7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.1 12.0 12.1+PTX"

from setuptools import setup
from torch.utils.cpp_extension import BuildExtension, CUDAExtension

long_description = open('README.rst').read()

setup(
    name='fast_jl_binary',
    version="0.1.3.3",
    description="Fast JL: Compute JL projection fast on a GPU (Binary Distribution)",
    author="Dariush Wahdany",
    author_email='dariushwahdany@gmail.com',
    install_requires=["torch>=2.0.0"],
    long_description=long_description,
    ext_modules=[
        CUDAExtension('fast_jl_binary', [
            'fast_jl.cu',
        ]),
    ],
    cmdclass={
        'build_ext': BuildExtension
    },
    setup_requires=["torch>=2.0.0"]) 
