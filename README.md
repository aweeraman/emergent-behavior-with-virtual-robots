# Project: Emergent Behavior with Virtual Robots

# Installation

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

4. Clone and run gym-gazebo environment
```
$ git clone git@github.com:erlerobot/gym-gazebo.git
$ cd gym-gazebo
$ pip install -e .
$ pip install matplotlib
$ pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg sphinx
$ sudo rosdep init
$ rosdep update
$ bash gym_gazebo/envs/installation/turtlebot_setup.bash
$ cd ../../../examples/turtlebot
$ python circuit2_turtlebot_lidar_qlearn.py
```

# References
* https://github.com/erlerobot/gym-gazebo
