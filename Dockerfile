from ros:kinetic-ros-core

# Add source code.
COPY ros/eaglemk4 /catkin_ws/src/eaglemk4
COPY ros/eaglemk4.rosinstall /catkin_ws/.rosinstall

# ROS workspace and dependencies.
RUN . /opt/ros/kinetic/setup.sh && \
    cd /catkin_ws && \
    wstool update && \
    apt-get update && \
    rosdep install --from-paths src --ignore-src -y && \
    rm -rf /var/lib/apt/lists/* && \
    catkin_make

COPY ./ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
