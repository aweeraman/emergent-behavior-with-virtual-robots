FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y lsb-release gnupg2
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update && apt install -y ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool build-essential sudo
RUN rosdep init
RUN useradd -d /home/ros -m ros -p ros && echo "source /opt/ros/melodic/setup.bash" >> /home/ros/.bashrc

USER ros

RUN rosdep update

ENV HOME /home/ros

CMD /bin/bash
