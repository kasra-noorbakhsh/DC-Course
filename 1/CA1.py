import numpy as np
import matplotlib.pyplot as plt

# threshold determines the convergence condition: the loop continues to update the representatives until
# the maximum change between the current and previous representatives is less than threshold.

def lloyds_algorithm(sigma, b, num_samples=100000, threshold=1e-6):
    samples = np.random.normal(0, sigma, num_samples)
    samples.sort()

    num_regions = 2 ** b
    boundaries = np.linspace(min(samples), max(samples), num_regions + 1)

    representatives = np.zeros(num_regions)
    prev_representatives = np.ones(num_regions) * np.inf

    while np.max(np.abs(representatives - prev_representatives)) > threshold:
        prev_representatives = representatives.copy()

        for i in range(num_regions):
            region_samples = samples[(samples >= boundaries[i]) & (samples < boundaries[i + 1])]
            if len(region_samples) > 0:
                representatives[i] = np.mean(region_samples)
            else:
                representatives[i] = (boundaries[i] + boundaries[i + 1]) / 2

        for i in range(1, num_regions):
            boundaries[i] = (representatives[i - 1] + representatives[i]) / 2

    return samples, representatives, boundaries

def plot_quantization(samples, representatives, boundaries):
    plt.figure(figsize=(12, 6))
    plt.hist(samples, bins=100, density=True, alpha=0.6, color='lightgray', label='Sample Distribution')
    
    for i, rep in enumerate(representatives):
        plt.axvline(rep, color='red', linestyle='--', label='Representative' if i == 0 else "")

    for i, boundary in enumerate(boundaries[1:-1]):
        plt.axvline(boundary, color='blue', linestyle=':', label='Boundary' if i == 0 else "")

    plt.title('Quantization Visualization')
    plt.xlabel('x')
    plt.ylabel('Density')
    plt.legend()
    plt.show()

sigma = 1  # Standard deviation
b = 2      # Number of bits
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 1 - Optimal Representatives (sigma=1, b=2):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 0.5
b = 3
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 2 - Optimal Representatives (sigma=0.5, b=3):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 2
b = 2
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 3 - Optimal Representatives (sigma=2, b=2):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 1
b = 4
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 4 - Optimal Representatives (sigma=1, b=4):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 3
b = 3
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 5 - Optimal Representatives (sigma=3, b=3):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 0.57  
b = 1
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 6 - Optimal Representatives (sigma=0.57, b=1):", representatives)
plot_quantization(samples, representatives, boundaries)

sigma = 0.57
b = 2 
samples, representatives, boundaries = lloyds_algorithm(sigma, b)
print("Test 7 - Optimal Representatives (sigma=0.57, b=2):", representatives)
plot_quantization(samples, representatives, boundaries)
