# Discrete Cosine Transform (DCT) Project Designs

This directory contains hardware design projects for the 1D (One-Dimensional) and 2D (Two-Dimensional) Discrete Cosine Transform (DCT).

---

## Project Overview

### 1. [1D DCT Design](./1D_DCT_Design)

- **Purpose**: Processes a one-dimensional signal sequence, transforming it from the time or spatial domain into the frequency domain
- **Applications**: Primarily used for audio compression and speech processing
- **Core Operation**: Performs transformation on a sequence of N points in a single direction (e.g., a single row or column)

### 2. [2D DCT Design](./2D_DCT_Design)

- **Purpose**: Processes two-dimensional signal data blocks, such as image pixel matrices, which is essential for image compression (e.g., JPEG standard)
- **Applications**: Image and video compression
- **Core Operation**: Performs transformation on an N×N data block

---

## Operational Differences (1D vs. 2D DCT)

The primary difference lies in the input data structure and the computational process:

### 1D DCT
- **Input**: Operates on a single vector of N data points
- **Process**: The transformation is completed in one step
- **Complexity**: O(N log N) or O(N²) depending on implementation

### 2D DCT
- **Input**: Operates on an N×N data matrix
- **Process**: Typically implemented using the **Row-Column Decomposition** method:
  1. Perform 1D DCT on every **row** of the input matrix
  2. Perform 1D DCT on every **column** of the resulting matrix from step 1
- **Complexity**: Requires two sequential sets of 1D DCT operations, making the computational complexity significantly higher than a single 1D DCT
