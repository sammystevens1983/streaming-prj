#!/bin/bash

# echo that the script is running
echo "Running post-create.sh"

sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential ca-certificates
# wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
# sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
# echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
# echo "export GOPATH=\$HOME/go" >> ~/.bashrc
# echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc


# Add the deadsnakes PPA to get Python 3.8
sudo add-apt-repository -y ppa:deadsnakes/ppa

# Update the package list
sudo apt-get update

# Install Python 3.8
sudo apt-get install -y python3.8 python3-pip python3.8-venv

# Update alternatives to set Python 3.8 as the default
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo ln -s /usr/bin/python3.8 /usr/bin/python


# Update OS packages 
sudo apt-get update -y

# Install OS headers 
sudo apt-get install linux-headers-$(uname -r) -y

# Install git 
sudo apt-get install git -y

# Install Python venv 
sudo apt-get install -y python3.8-venv g++ 

# Create Python venv
# python3.8 -m venv .aws_neuron_venv_pytorch 

# Activate Python venv 
# source .aws_neuron_venv_pytorch/bin/activate 
python -m pip install -U pip 

# export PATH=$HOME/.local/bin:$PATH

# Export paths to bashrc so they persist across shell sessions
# echo 'export PATH=/opt/aws/neuron/bin:$PATH' >> ~/.bashrc
# echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc

echo "<<<<<< Basic python packages >>>>>>"
pip install --upgrade pip setuptools wheel
echo 'export PATH="$HOME/.local/bin:$PATH"'


# manual install
echo "<<<<<<<<< Installing Python packages >>>>>>>>>"
pip install python-dotenv pip-tools ipykernel jupyter notebook environment_kernels

echo "<<<<<<<<<<< Installing sound dependencies >>>>>>>>>>"
# sudo apt-get install portaudio19-dev
sudo apt-get -y install ffmpeg

echo "<<<<<<<<<<<<< Reseting bashrc >>>>>>>>>>>"
source ~/.bashrc
