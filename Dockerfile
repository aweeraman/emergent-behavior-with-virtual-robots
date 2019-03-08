FROM ubuntu

RUN	apt-get update && apt-get upgrade -y && apt-get install -y lsb-release gnupg2
RUN	sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN 	mkdir ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf
RUN	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN	apt-get update
RUN	DEBIAN_FRONTEND=noninteractive apt install -y ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool build-essential
RUN	rosdep init && rosdep update
RUN	export uid=1000 gid=1000
RUN	mkdir -p /home/ros
RUN	echo "ros:x:${uid}:${gid}:ROS,,,:/home/ros:/bin/bash" >> /etc/passwd
RUN	echo "ros:x:${uid}:" >> /etc/group
RUN	echo "ros ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ros
RUN	echo "source /opt/ros/melodic/setup.bash" >> /home/ros/.bashrc
RUN	chmod 0440 /etc/sudoers.d/ros
RUN	chown ${uid}:${gid} -R /home/ros

USER ros
ENV HOME /home/ros
CMD /bin/bash
