#!/bin/bash

# This script is the equivalent of the Dockerfile for installing
# ROS 1 (melodic) and ROS 2 (eloquent), as well as cloning into the 
# ros1_bridge repo on GitHub.

sudo	
apt update && \
apt upgrade -y && \
apt install -y locales libpython3-dev vim nano && \
locale-gen en_US en_US.UTF-8 && \
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
apt install -y curl gnupg2 lsb-release && \
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
apt update && \
apt install -y \
build-essential \
cmake \
git \
python3-colcon-common-extensions \
python3-pip \
python-rosdep \
python3-vcstool \
wget && \
python3 -m pip install -U \
argcomplete \
flake8 \
flake8-blind-except \
flake8-builtins \
flake8-class-newline \
flake8-comprehensions \
flake8-deprecated \
flake8-docstrings \
flake8-import-order \
flake8-quotes \
pytest-repeat \
pytest-rerunfailures \
pytest \
pytest-cov \
pytest-runner \
setuptools && \
apt install --no-install-recommends -y \
libasio-dev \
libtinyxml2-dev \
libcunit1-dev && \
apt install -y ros-eloquent-desktop \
ros-eloquent-launch* && \
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
apt update && \
apt install -y ros-melodic-desktop && \
cd ~ && \
mkdir -p bridge_ws/src && \
cd bridge_ws/src && \
git clone https://github.com/ros2/ros1_bridge.git
