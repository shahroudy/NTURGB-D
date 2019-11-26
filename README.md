# "NTU RGB+D" Action Recognition Dataset
# "NTU RGB+D 120" Action Recognition Dataset

"NTU RGB+D" is a large-scale dataset for human action recognition.
It is introduced in our CVPR 2016 paper [[PDF]](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf). 

"NTU RGB+D 120" is the extended version of the "NTU RGB+D" dataset.
It is introduced in our TPAMI 2019 paper [[PDF]](https://arxiv.org/pdf/1905.04757.pdf).

For any possible query regarding the datasets, please contact the first author of the paper. 

### How to download the datasets

Please click [here](http://rose1.ntu.edu.sg/Datasets/actionRecognition.asp) for more information about accessing the "NTU RGB+D" and "NTU RGB+D 120" datasets. 

If you need the skeleton data only, you could also obtain it via:

https://drive.google.com/open?id=1CUZnBtYwifVXS21yVg62T-vrPVayso5H

https://drive.google.com/open?id=1tEbuaEqMxAV7dNc4fqu1O4M7mC6CJ50w

### Structures of the datasets

"NTU RGB+D" and NTU RGB+D 120" datasets contain 56,880 and 114,480 action samples, repsectively. Both datasets include 4 different modalities of data for each sample:
* RGB videos
* depth map sequences
* 3D skeletal data
* infrared (IR) videos

Video samples have been captured by three Microsoft Kinect V2 cameras concurrently. 
The resolutions of RGB videos are 1920×1080, depth maps and IR videos are all in 512×424, and 3D skeletal data contains the 3D locations of 25 major body joints at each frame.

**Each file/folder name in both datasets is in the format of SsssCcccPpppRrrrAaaa (e.g., S001C002P003R002A013), in which sss is the setup number, ccc is the camera ID, ppp is the performer (subject) ID, rrr is the replication number (1 or 2), and aaa is the action class label.**

The "NTU RGB+D" dataset includes the files/folders with setup numbers between S001 and S017, while the "NTU RGB+D 120" dataset includes the files/folders with setup numbers between S001 and S032. 

For more details about the setups, camera IDs, ..., please refer to the ["NTU RGB+D" dataset paper](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf) and the ["NTU RGB+D 120" dataset paper](https://arxiv.org/pdf/1905.04757.pdf). 

### Samples with missing skeletons

302 samples in "NTU RGB+D" dataset and 535 samples in "NTU RGB+D 120" dataset have missing or incomplete skeleton data.
If you are working on skeleton-based analysis, please ignore these files in your training and testing procedures.  
The list of these samples in "NTU RGB+D" dataset are provided [here](https://github.com/shahroudy/NTURGB-D/blob/master/Matlab/NTU_RGBD_samples_with_missing_skeletons.txt).  
The list of these samples in "NTU RGB+D 120" dataset are provided [here](https://github.com/shahroudy/NTURGB-D/blob/master/Matlab/NTU_RGBD120_samples_with_missing_skeletons.txt).

### Sample codes

We have provided some MATLAB codes [here](https://github.com/shahroudy/NTURGB-D/tree/master/Matlab) to demonstrate how to read the skeleton files, map them to other modalities (RGB, depth, and IR frames), and visualize the skeleton data. The [codes](https://github.com/shahroudy/NTURGB-D/tree/master/Matlab) are suitable for both "NTU RGB+D" and "NTU RGB+D 120".

### Action Classes

"NTU RGB+D" dataset contains 60 action classes, and "NTU RGB+D 120" dataset contains 120 action classes. The actions in these two datasets are listed below. Note that actions labelled from A1 to A60 are in "NTU RGB+D", while actions labelled from A1 to A120 are in "NTU RGB+D 120".

* A1. drink water. 
* A2. eat meal/snack. 
* A3. brushing teeth. 
* A4. brushing hair. 
* A5. drop. 
* A6. pickup. 
* A7. throw. 
* A8. sitting down. 
* A9. standing up (from sitting position). 
* A10. clapping. 
* A11. reading. 
* A12. writing. 
* A13. tear up paper. 
* A14. wear jacket. 
* A15. take off jacket. 
* A16. wear a shoe. 
* A17. take off a shoe. 
* A18. wear on glasses. 
* A19. take off glasses. 
* A20. put on a hat/cap. 
* A21. take off a hat/cap. 
* A22. cheer up. 
* A23. hand waving. 
* A24. kicking something. 
* A25. reach into pocket. 
* A26. hopping (one foot jumping). 
* A27. jump up. 
* A28. make a phone call/answer phone. 
* A29. playing with phone/tablet. 
* A30. typing on a keyboard. 
* A31. pointing to something with finger. 
* A32. taking a selfie. 
* A33. check time (from watch). 
* A34. rub two hands together. 
* A35. nod head/bow. 
* A36. shake head. 
* A37. wipe face. 
* A38. salute. 
* A39. put the palms together. 
* A40. cross hands in front (say stop). 
* A41. sneeze/cough. 
* A42. staggering. 
* A43. falling. 
* A44. touch head (headache). 
* A45. touch chest (stomachache/heart pain). 
* A46. touch back (backache). 
* A47. touch neck (neckache). 
* A48. nausea or vomiting condition. 
* A49. use a fan (with hand or paper)/feeling warm.
* A50. punching/slapping other person. 
* A51. kicking other person. 
* A52. pushing other person. 
* A53. pat on back of other person. 
* A54. point finger at the other person. 
* A55. hugging other person. 
* A56. giving something to other person. 
* A57. touch other person's pocket. 
* A58. handshaking. 
* A59. walking towards each other. 
* A60. walking apart from each other. 
* A61. put on headphone. 
* A62. take off headphone. 
* A63. shoot at the basket. 
* A64. bounce ball. 
* A65. tennis bat swing. 
* A66. juggling table tennis balls. 
* A67. hush (quite). 
* A68. flick hair. 
* A69. thumb up. 
* A70. thumb down. 
* A71. make ok sign. 
* A72. make victory sign. 
* A73. staple book. 
* A74. counting money. 
* A75. cutting nails. 
* A76. cutting paper (using scissors). 
* A77. snapping fingers. 
* A78. open bottle. 
* A79. sniff (smell). 
* A80. squat down. 
* A81. toss a coin. 
* A82. fold paper. 
* A83. ball up paper.
* A84. play magic cube. 
* A85. apply cream on face. 
* A86. apply cream on hand back. 
* A87. put on bag. 
* A88. take off bag. 
* A89. put something into a bag. 
* A90. take something out of a bag. 
* A91. open a box. 
* A92. move heavy objects. 
* A93. shake fist. 
* A94. throw up cap/hat. 
* A95. hands up (both hands). 
* A96. cross arms. 
* A97. arm circles. 
* A98. arm swings. 
* A99. running on the spot. 
* A100.	butt kicks (kick backward). 
* A101.	cross toe touch. 
* A102.	side kick. 
* A103.	yawn. 
* A104.	stretch oneself. 
* A105.	blow nose. 
* A106.	hit other person with something. 
* A107.	wield knife towards other person. 
* A108.	knock over other person (hit with body). 
* A109.	grab other person’s stuff. 
* A110.	shoot at other person with a gun. 
* A111.	step on foot. 
* A112.	high-five. 
* A113.	cheers and drink. 
* A114.	carry something with other person. 
* A115.	take a photo of other person. 
* A116.	follow other person. 
* A117.	whisper in other person’s ear. 
* A118.	exchange things with other person. 
* A119.	support somebody with hand. 
* A120. finger-guessing game (playing rock-paper-scissors). 

### Evaluation Protocol of One-Shot Action Recognition on "NTU RGB+D 120"

In ["NTU RGB+D 120" dataset paper](https://arxiv.org/pdf/1905.04757.pdf), we introduced the one-shot recognition setting, in which "NTU RGB+D 120" dataset is split to two parts: auxiliary set and one-shot evaluation set. 
**Auxiliary set** contains 100 classes, and all samples of these classes can be used for learning.
**Evaluation set** consists of 20 novel classes, and one sample from each novel class is picked as the exemplar, while all the remaining samples of these classes are used to test the recognition performance. 

**Evaluation set.** 20 novel classes, namely, A1, A7, A13, A19, A25, A31, A37, A43, A49, A55, A61, A67, A73, A79, A85, A91, A97, A103, A109, A115. The following 20 samples are the exemplars:  
(01)**S001**C003P008R001**A001**, (02)**S001**C003P008R001**A007**, (03)**S001**C003P008R001**A013**, (04)**S001**C003P008R001**A019**, (05)**S001**C003P008R001**A025**, (06)**S001**C003P008R001**A031**, (07)**S001**C003P008R001**A037**, (08)**S001**C003P008R001**A043**, (09)**S001**C003P008R001**A049**, (10)**S001**C003P008R001**A055**, 
(11)**S018**C003P008R001**A061**, (12)**S018**C003P008R001**A067**, (13)**S018**C003P008R001**A073**, (14)**S018**C003P008R001**A079**, (15)**S018**C003P008R001**A085**, (16)**S018**C003P008R001**A091**, (17)**S018**C003P008R001**A097**, (18)**S018**C003P008R001**A103**, (19)**S018**C003P008R001**A109**, (20)**S018**C003P008R001**A115**.

**Auxiliary set.** 100 classes (the remaining 100 classes of "NTU RGB+D 120" excluding the 20 classes in evaluation set).

### Citation

To cite our datasets, please use the following bibtex records:

```
@inproceedings{Shahroudy_2016_NTURGBD,
  author = {Shahroudy, Amir and Liu, Jun and Ng, Tian-Tsong and Wang, Gang},
  title = {NTU RGB+D: A Large Scale Dataset for 3D Human Activity Analysis},
  booktitle = {IEEE Conference on Computer Vision and Pattern Recognition},
  month = {June},
  year = {2016}
}

@article{Liu_2019_NTURGBD120,
  title={NTU RGB+D 120: A Large-Scale Benchmark for 3D Human Activity Understanding},
  author={Liu, Jun and Shahroudy, Amir and Perez, Mauricio and Wang, Gang and Duan, Ling-Yu and Kot, Alex C.},
  journal={IEEE Transactions on Pattern Analysis and Machine Intelligence},
  year={2019},
  doi={10.1109/TPAMI.2019.2916873}
}
```

### Mailing List

If you are interested to recieve news, updates, and future events about this dataset, please subscribe in the Google group of the dataset at: https://groups.google.com/d/forum/ntu-rgbd.
If you cannot access the group's page, please email me, I will add your email to the list. 
You can find my email in the [paper](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf), and I'm the first author :)

### 3D Human Activity Analysis Challenge

We organized the action recognition challenge "Large Scale 3D Human Activity Analysis Challenge in Depth Videos" based on the "NTU RGB+D" dataset in ACCV 2016. 
Details about this challenge can be found [here](http://rose1.ntu.edu.sg/ActionRecognitionChallenge).

### Reported results on "NTU RGB+D" benchmark and "NTU RGB+D 120" benchmark

Coming soon :)

### FAQs
**(1) When I've sent the request for the dataset, I recieved '500 - Internal server error'.**<br>
*This error happens some of the time and is a technical problem in the hosting server.
Please contact us via email, so that we can follow this up.
The best person to email is the technician of our lab: Chai Ooy Mei (EOMChai@ntu.edu.sg).
Please CC us (amir3@ntu.edu.sg, jliu029@ntu.edu.sg) in your email so that we can follow it up and ensure you will get access as soon as possible.*

**(2) I want to align RGB and depth frames. Are there any camera calibration data recorded?**<br>
Unfortunately no camera calibration info is recorded.
However, one applicable solution for this is to use the skeletal data.
For each video sample, the skeletal data includes a big number of body joints and their precise locations in both RGB and depth frames.
So for each sample you have a big number of mappings.
Keep in mind that the cameras were fixed during each setup (Sxxx in the file names mean this sample is from setup xxx).
So for each camera at each setup you have a huge number of mappings between RGB and depth cameras (and also between the three sensors!).
Finding a transformation between the cameras will be as easy as solving a linear system with a lot of known points!

**(3) There are some extra values recorded for each skeletal joint like orientation, lean, etc. What do they mean?**<br>
In almost all of the applications, the 3D locations of the joints are enough...
We tried to keep everything generated by the SDK, so we recorded all.
For more info about the meaning of those extra values, you can read this:
https://medium.com/@lisajamhoury/understanding-kinect-v2-joints-and-coordinate-system-4f4b90b9df16

**(4) What are masked depthmap in the download page?**<br>
The main purpose of providing masked depthmaps were to have a smaller sized version of the original depth maps.
We used the position of the body skeletons to find regions of interest in depthmaps.
We copied the depth values for the regions of interest (from the original depthmaps) and set the other regions' depth to zero.
This helped to achieve a much more efficient frame-wise compression ratios.

**(5) Why the individual and mutual actions are considered together? Isn't it better to separate them in our evaluations?**<br>
*Having these classes of human actions together is a part of our dataset design to cope with more realistic scenarios of human action analysis. Therefore, the ideal evalution should not provide any prior info about the type of the action.*

**(6) How did you handle the variable subject numbers (one or two) in the input of the network?**<br>
*Our inputs initially includes two sets of joints (for two skeletons).
When we observed just one, the second set was filled with zeros.
When we observed two or more, we decided about which one to be the main subject and which one to be the second one, by measuring the amount of motion of their joints.
Also, some of the detected skeletons are noise, like tables and seats.
You can eliminate them by filtering out the skeletons that do not have reasonable Y spread over X spread values over all of their joints.*

**(7) How did you choose the main actor in the preprocessing step?**<br>
*We used a heuristic method. It's very simple (but not necessarily correct for all the samples).
We consider the variance of the X, Y, and Z values of all the joints and add them up.
We took the body with the higher value as the main subject.*

**(8) How important is the skeleton normalization step, described in experimantal setup section?**<br>
*In the extension of our experiments, we found out the normalization is not vital.
You can skip the normalization step and it should work fine.
Actually the network is supposed to learn how to normalize the data by itself.*

**(9) The provided MATLAB code cannot read .avi files on my Linux machine.**<br>
*Most probably it's a missing codec problem.
I used [this solution](http://askubuntu.com/questions/575869/how-do-i-install-gstreamer0-10-ffmpeg-on-ubuntu-14-10/707612#707612), and it worked on my own machine. Hope it would help you also.*
