#!/bin/bash

# setup
python3.11 -m venv --upgrade-deps venv
source ./venv/bin/activate
pip install --upgrade pip

# clean
pip uninstall llama-cpp-python -y
pip cache remove llama_cpp_python

# install
pip install instructlab
deactivate
