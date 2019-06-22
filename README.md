# Project: Emergent Behavior with Virtual Robots

# Installing ROS2

[Setup instructions for Mac](https://index.ros.org/doc/ros2/Installation/Crystal/OSX-Install-Binary/)

Additionly, the following had to be run in order to get the installation working:

```
$ brew install tinyxml2@6.2.0
```

Disable anaconda if installed and use the system installed distribution of Python3.

Specify the following in ~/.bashrc or ~/.bash_profile:

```
export ROS_HOME=/Users/anuradha/ros/ros2-osx
export ROS_WS=/Users/anuradha/ros/ros2_ws
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
. ${ROS_HOME}/setup.bash
. ${ROS_WS}/install/setup.bash

```

If using OpenSplice DDS:

```
export OSPL_HOME=/Users/anuradha/ros/HDE/x86_64.darwin10_clang
. ${OSPL_HOME}/release.com
```

# References
* https://github.com/erlerobot/gym-gazebo
