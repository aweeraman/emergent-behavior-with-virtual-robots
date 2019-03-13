FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y lsb-release gnupg2
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update && apt install -y ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool python-pip build-essential sudo python-skimage
RUN rosdep init
RUN useradd -d /home/ros -m ros -p ros -G sudo && echo "source /opt/ros/melodic/setup.bash" >> /home/ros/.bashrc && \
    echo "ros:ros" | chpasswd
RUN cd /home/ros && \
    git clone https://github.com/erlerobot/gym-gazebo.git && \
    cd gym-gazebo && \
    pip install -e . && \
    chown -R ros:ros /home/ros/

USER ros

RUN rosdep update

ENV HOME /home/ros

CMD /bin/bash
