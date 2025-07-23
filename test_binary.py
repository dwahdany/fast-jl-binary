#!/usr/bin/env python3
"""
Simple test script to verify fast_jl_binary module works correctly
"""
import torch
import fast_jl_binary

def test_basic_functionality():
    print("Testing fast_jl_binary import...")
    
    # Check if CUDA is available
    if not torch.cuda.is_available():
        print("CUDA not available, skipping CUDA tests")
        return
    
    print("CUDA is available, testing functionality...")
    
    # Create test input
    batch_size = 32
    features = 128
    projection_dim = 64
    
    # Test with float32
    input_tensor = torch.randn(batch_size, features, device='cuda', dtype=torch.float32)
    
    try:
        # Test Rademacher projection
        result = fast_jl_binary.project_rademacher_8(input_tensor, projection_dim, seed=42, num_feature_tiles=features)
        print(f"Rademacher projection successful! Output shape: {result.shape}")
        
        # Test Normal projection  
        result = fast_jl_binary.project_normal_8(input_tensor, projection_dim, seed=42, num_feature_tiles=features)
        print(f"Normal projection successful! Output shape: {result.shape}")
        
        print("All tests passed!")
        
    except Exception as e:
        print(f"Test failed with error: {e}")
        raise

if __name__ == "__main__":
    test_basic_functionality() 