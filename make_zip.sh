#!/bin/bash

mkdir -p TensorBases

cp TensorBases.m TensorBases
cp PacletInfo.m TensorBases
cp LICENSE TensorBases
cp README.md TensorBases
cp -r cache TensorBases
cp -r bases TensorBases

if [[ -e ./TensorBases.zip ]]; then
  rm ./TensorBases.zip
fi
zip -r TensorBases.zip TensorBases

rm -rf ./TensorBases/
