#!/usr/bin/env python3

import rospy
import cv2
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import mediapipe as mp
import matplotlib.pyplot as plt
import PIL
import urllib

bridge = CvBridge()

def url_to_array(url):
    req = urllib.request.urlopen(url)
    arr = np.array(bytearray(req.read()), dtype=np.int8)
    arr = cv2.imdecode(arr, -1)
    arr = cv2.cvtColor(arr, cv2.COLOR_BGR2RGB)
    return arr

mug = 'https://goodstock.photos/wp-content/uploads/2018/01/Laptop-Coffee-Mug-on-Table.jpg'
mug = url_to_array(mug)

mp_objectron = mp.solutions.objectron
mp_drawing = mp.solutions.drawing_utils

objectron = mp_objectron.Objectron(static_image_mode=False,
                            max_num_objects=5,
                            min_detection_confidence=0.4,
                            min_tracking_confidence=0.70,
                            model_name='Cup')


class cup_detection_pub:

  def __init__(self):
    self.image_pub = rospy.Publisher("/detected_cup",Image, queue_size=1)
    self.id_pub = rospy.Publisher("/cuplocation", Float32MultiArray, queue_size=1)
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/usb_cam/image_raw/", Image, self.callback)

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    markers_img=self.detect_cup(cv_image)

    try:
      self.image_pub.publish(self.bridge.cv2_to_imgmsg(markers_img, "bgr8"))
    except CvBridgeError as e:
      print(e)

  def detect_cup(self,img):
    location=(0,0)
    flag=0  
    img.flags.writeable = False
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    results = objectron.process(img)

    img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
    if results.detected_objects:
        for detected_object in results.detected_objects:
            #print(detected_object.landmarks_2d)
            flag=1
            mp_drawing.draw_landmarks(img, 
                                      detected_object.landmarks_2d, 
                                      mp_objectron.BOX_CONNECTIONS)
            
            mp_drawing.draw_axis(img, 
                                 detected_object.rotation,
                                 detected_object.translation)
            
            xx=detected_object.landmarks_2d.landmark[0].x
            yy=detected_object.landmarks_2d.landmark[0].y
            location=Float32MultiArray()
            location.data=[xx,yy]
            self.id_pub.publish(location)
            img = cv2.circle(img, (int(xx*640),int(yy*480)), radius=10, color=(0, 0, 255), thickness=-1)
    
    cv2.imshow('Cup detection results', cv2.flip(img, 1))
    cv2.waitKey(3)
    return img
    

def main():
  print("Initializing ROS node")
  rospy.init_node('cup detector', anonymous=True)
  print("Cup detection code is initiated.")
  ic = cup_detection_pub()
  rospy.spin()

if __name__ == '__main__':
    main()
