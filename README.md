# NTU RGB+D Action Recognition Dataset
#####Info and sample codes for "NTU RGB+D Action Recognition Dataset"

NTU RGB+D is a large scale dataset for human action recognition.
It has been introduced in our CVPR 2016 paper [[PDF]](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf). 

### How to access the dataset

Please click [here](http://rose1.ntu.edu.sg/Datasets/actionRecognition.asp) for more info about obtaining the dataset.

### Structure of the dataset

This dataset consists of 56,880 action samples containing 4 different modalities of data for each sample:
* RGB videos
* depth map sequences
* 3D skeletal data
* infrared videos

Video samples have been captured by 3 Microsoft Kinect v.2 cameras concurrently. 
The resolution of RGB videos are 1920×1080, depth maps and IR videos are all in 512×424, and 3D skeletal data contains the three dimensional locations of 25 major body joints, at each frame.

Each file/folder name in the dataset is in the format of SsssCcccPpppRrrrAaaa (e.g. S001C002P003R002A013), for which sss is the setup number, ccc is the camera ID, ppp is the performer ID, rrr is the replication number (1 or 2), and aaa is the action class label.
For more details about setups, camera IDs, ... please refer to the [paper](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf). 

### Samples with missing skeletons

302 of the captured samples have missing or incomplete skeleton data.
If you are working on skeleton-based analysis, please ignore these files in your training and testing procedures.
The list of these samples are provided [here](https://github.com/shahroudy/NTURGB-D/blob/master/Matlab/samples_with_missing_skeletons.txt).

### Sample codes

I have provided some MATLAB codes [here](https://github.com/shahroudy/NTURGB-D/tree/master/Matlab) to demonstrate how to read skeleton files and map them to other modalities (RGB, depth, and IR frames).

### Mailing List

If you are interested to recieve news, updates, and future events about this dataset please subscribe in the Google group of the dataset at: https://groups.google.com/d/forum/ntu-rgbd.
If you cannot access the group's page, please email me, I will add your email to the list. 
My Gmail is the same as my GitHub account, which is my familyname :)

### Challenge

We are going to organize an action recognition challenge based on our dataset soon.
The top performing groups will be invited to a workshop at ACCV 2016 to present their work.

The updates about this challege will be posted to the mailing list and [here](http://rose1.ntu.edu.sg/ActionRecognitionChallenge).
Please subscribe to the mailing list if you are interested.

### Citation

To cite NTU RGB+D dataset, please use this bibtex record:

@InProceedings{Shahroudy_2016_CVPR,
author = {Shahroudy, Amir and Liu, Jun and Ng, Tian-Tsong and Wang, Gang},
title = {NTU RGB+D: A Large Scale Dataset for 3D Human Activity Analysis},
booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
month = {June},
year = {2016}
}
