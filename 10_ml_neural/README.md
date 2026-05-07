# 10 — ML / Neural Networks

## Purpose

Explore how δ★ and the URT framework interact with machine learning systems.

## Grokking experiments

The most interesting ML work here is the **grokking** experiments (Untitled36–38, 50, 56).

Grokking is the phenomenon where neural networks suddenly "understand" a task
after a long period of memorisation — a phase transition in learning dynamics.

The hypothesis: **the grokking transition happens when the network's δ passes through δ★**.

Experiments test:
- Modular addition/multiplication (classic grokking task)
- Lytollis Law as a curriculum or regulariser (`learning_rate_scale` ~ δ★)
- Small transformers trained until late generalisation

If δ★ governs grokking, it would mean the same universal constant controls:
- Physical critical transitions (plasma, EEG)
- Mathematical learning transitions (neural networks)

## Lyapunov-verified neural networks

Notebooks 7–9 implement URT controllers as verified neural network layers (PyTorch):
- Lyapunov stability certificate computed analytically
- Controller contraction rate κ < 1 guaranteed at every forward pass
- Applicable to robotics, autonomous control, safe RL

## Notebooks

| File | Content |
|------|---------|
| `urt_lyapunov_torch_v1/v2/v3.ipynb` | Lyapunov-verified URT in PyTorch |
| `mnist_cnn_tensorflow.ipynb` | MNIST baseline (98%+ accuracy) |
| `mnist_plasma_colormap.ipynb` | MNIST with plasma-style visualisation |
| `lytollis_grokking_experiment.ipynb` | Grokking experiment v1 |
| `lytollis_grokking_v3.ipynb` | Grokking v3 |
| `lytollis_grokking_v3_fixed.ipynb` | Grokking v3.2 — stable passing version |
| `modulo_net_lytollis_grokking.ipynb` | ModuloNet: dedicated grokking architecture |
| `grokking_delta_law_transformer.ipynb` | Transformer on modular arithmetic with δ-law curriculum |
