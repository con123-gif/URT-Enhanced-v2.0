from setuptools import setup, find_packages

setup(
    name="urt",
    version="2.0.0",
    author="Cornelius Lytollis",
    description="Universal Recursive Tuning — chaos-physics framework built on δ★",
    packages=find_packages(),
    python_requires=">=3.8",
    install_requires=[
        "numpy>=1.21",
        "scipy>=1.7",
    ],
    extras_require={
        "torch": ["torch>=1.10"],
        "viz":   ["matplotlib>=3.4"],
    },
)
