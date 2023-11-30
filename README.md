# MediaPipe for 3D cup location detection

This is a code for locating the 3D position of a cup.

To use this file first you need to download and create the repository to get USB camera data through ROS. The following repository contains the directory to do so. 

https://github.com/ros-drivers/usb_cam

More information about this repository can be found at:

https://wiki.ros.org/usb_cam

The following steps are required:
mkdir catkinws

cd catkinws

mkdir src

cd src

git clone https://github.com/ros-drivers/usb_cam

cd ..

catkin_make

cd src

mkdir scripts

git clone https://github.com/Moji82/3D-cup-detection/

chmod +x *.py

cd ..

cd ..

roslaunch usb_cam usb_cam.launch

rosrun usb_cam cup_detection_ros.py

The USB camera you have attached to your PC should be able to detect your cup :)



