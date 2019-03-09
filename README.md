# Project: Emergent Behavior with Virtual Robots

# Steps to Install and Run

## Install Docker
```
$ sudo pacman -S docker
$ sudo usermod -aG docker $(whoami)
$ sudo systemctl enable docker
$ sudo systemctl start docker
$ docker run hello-world
```

## Build Docker image and start the container
```
$ docker build -t ros .
$ scripts/start-ros.sh
```

# References
* https://github.com/erlerobot/gym-gazebo
