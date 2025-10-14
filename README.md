[![arXiv](https://img.shields.io/badge/arXiv-2412.13043-b31b1b.svg?style=for-the-badge)](https://arxiv.org/abs/2503.05580)

# TensorBases

TensorBases is a Mathematica package which provides common interaction bases used in functional computations, with a specific focus on QCD-related interactions.

## Usage

To see how to use the package, you can open the showcase notebook [`examples/Showcase.nb`](https://github.com/satfra/TensorBases/raw/refs/heads/main/examples/Showcase.nb) included in the package.

To donwload the file, right-click on the link and choose "Save Link As". The showcase notebook includes the installation process for the package and is thus fully self-contained.

For more details and backgrounds, see also the corresponding [publication](https://arxiv.org/abs/2503.05580).

## Installation

To install the TensorBases package in Mathematica, simply open a new notebook or kernel and download the installation file:

```Mathematica
Import["https://raw.githubusercontent.com/satfra/TensorBases/main/TensorBasesInstaller.m"]
```

The installer will automatically download the package and all basis definition files and their pre-built cache.

## Future updates

- [x] Basis transformation matrices
- [ ] Automatic derivation of (over-) complete sets of tensors for basis construction convenience.
- [ ] Automatic construction of bases from field-dependent effective potentials/Lagrangians.

If there are features you would like to see in `TensorBases`, you can make a suggestion by opening an [Issue](https://github.com/satfra/TensorBases/issues) or even implement it yourself and submit a [Pull Request](https://github.com/satfra/TensorBases/pulls).

## Citing

If you use the package for your research, please cite the corresponding publication:

```
@article{Braun:2025gvq,
    author = "Braun, Jens and Gei\ss{}el, Andreas and Pawlowski, Jan M. and Sattler, Franz R. and Wink, Nicolas",
    title = "{Juggling with Tensor Bases in Functional Approaches}",
    eprint = "2503.05580",
    archivePrefix = "arXiv",
    primaryClass = "hep-th",
    month = "3",
    year = "2025"
}
```

