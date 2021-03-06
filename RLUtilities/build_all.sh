#!/bin/bash
git submodule init
git submodule update --remote

pypath=C:/Users/sam/AppData/Local/Programs/Python

cd cpp

mkdir build_py36
cd build_py36
cmake -DPYTHON_EXECUTABLE="$pypath/python36/python.exe" .. -G"Visual Studio 15 2017 Win64"
cmake --build . --config Release

cd ../
mkdir build_x86_py36
cd build_x86_py36
cmake -DPYTHON_EXECUTABLE="$pypath/python36-32/python.exe" .. -G"Visual Studio 15 2017"
cmake --build . --config Release

cd ../
mkdir build_py37
cd build_py37
cmake -DPYTHON_EXECUTABLE="$pypath/python37/python.exe" .. -G"Visual Studio 15 2017 Win64"
cmake --build . --config Release

cd ../
mkdir build_x86_py37
cd build_x86_py37
cmake -DPYTHON_EXECUTABLE="$pypath/python37-32/python.exe" .. -G"Visual Studio 15 2017"
cmake --build . --config Release
cd ../

cp $(find . -name "*.pyd") ..
