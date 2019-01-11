#!/bin/bash

# Usage: ./run-in-docker.sh

ROSLAUNCH="roslaunch eaglemk4 car.launch"

docker run --rm -ti \
    -v $(pwd)/ros/eaglemk4:/catkin_ws/src/eaglemk4 \
        eaglemk4 $ROSLAUNCH
