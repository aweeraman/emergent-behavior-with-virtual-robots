# Project: Emergent Behavior with Virtual Robots

# Installation on Arch Linux

1. Install ROS from AUR (which didn't exactly work)
```
$ sudo pacman -S base-devel
$ sudo pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg sphinx
$ yay -S ros-melodic-desktop-full
```

## Issues and workarounds

Ran into a few challenges that I had to work around by skipping checksums and downgrading cmake to
an older version. You may not need to do this by the time you read this:

```
$ yay -S -f --mflags "--skipchecksums" ros-melodic-desktop-full
$ pacman -U https://archive.archlinux.org/packages/c/cmake/cmake-3.12.3-1-x86_64.pkg.tar.xz
```

Decided to scrap it and install from source instead.

Delete all Arch packages:

```
$ for i in `pacman -Q | grep ros- | cut -d" " -f 1`; do echo $i; sudo pacman -Rns $i; done
```

# Install ROS from Source on Arch Linux

1. Install dependencies

```
$ sudo pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg sphinx
```

2. Initialize rosdep

```
$ sudo rosdep init
$ rosdep update
```

3. Create the catkin workspace

```
$ mkdir ~/ros_catkin_ws
$ cd ~/ros_catkin_ws
$ rosinstall_generator desktop_full --rosdistro melodic --deps --tar > melodic-desktop-full.rosinstall

```


1. Install Gazebo
```
$ curl -ssL http://get.gazebosim.org | sh
$ gazebo
```

2. Install the Anaconda distribution (https://www.anaconda.com/distribution/)

3. Create a python2.x conda environment
```
$ conda create -n gazebo python=2
$ source activate gazebo
```

4. Install ROS
```
$ pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg sphinx
$ sudo rosdep init
$ rosdep update
```

5. Clone and run gym-gazebo environment
```
$ git clone git@github.com:erlerobot/gym-gazebo.git
$ cd gym-gazebo
$ pip install -e .
$ bash gym_gazebo/envs/installation/turtlebot_setup.bash
$ cd ../../../examples/turtlebot
$ python circuit2_turtlebot_lidar_qlearn.py
```

# References
* https://github.com/erlerobot/gym-gazebo
