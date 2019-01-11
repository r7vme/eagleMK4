# (DRAFT) Installing Eagle MK4 on NVIDIA Jetson TX1

# Install JetPack

Download [latest JetPack for TX1](https://developer.nvidia.com/embedded/jetpack).

Follow official quick start guide (e.g. [for L4t 28.1](http://developer2.download.nvidia.com/embedded/L4T/r28_Release_v2.0/BSP/l4t_quick_start_guide.txt)).

To install on external SSD consult [this blog post](http://polarnick.com/blogs/other/gpu/embedded/nvidia/cuda/2017/05/24/Jetson-tx2-OS-on-ssd.html).

Packages to be included into install:
- CUDA
- TensorRT

# Install drivers

Install cp210x driver (YDLIDAR X4). Easiest way to get precompiled version for `4.4.38-tegra` from JetsonHacks.
```
git clone https://github.com/jetsonhacks/installACMModule
cd installACMModule
./installCP210x.sh
```

# Install ROS

Make sure you've enabled "universe" Ubuntu repositories in `/etc/apt/sources.list`.

Follow [official installation guide for Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu).

Finally relogin and check that ros is available in your shell:
```
rosversion -d
```

# Configure ROS workspace

```
mkdir -p ~/eagle_ws/src
cd eagle_ws
catkin_make
```

Download code
```
wget <rosinstall file>
wstool update
```

Install dependencies
```
source devel/setup.bash
rosdep -y install --from-paths src --ignore-src
```

Build
```
catkin_make
```
