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

### Action Classes

The title of the 60 action classes are:

1. drink water
2. eat meal/snack
3. brushing teeth
4. brushing hair
5. drop
6. pickup
7. throw
8. sitting down
9. standing up (from sitting position)
10. clapping
11. reading
12. writing
13. tear up paper
14. wear jacket
15. take off jacket
16. wear a shoe
17. take off a shoe
18. wear on glasses
19. take off glasses
20. put on a hat/cap
21. take off a hat/cap
22. cheer up
23. hand waving
24. kicking something
25. put something inside pocket / take out something from pocket
26. hopping (one foot jumping)
27. jump up
28. make a phone call/answer phone
29. playing with phone/tablet
30. typing on a keyboard
31. pointing to something with finger
32. taking a selfie
33. check time (from watch)
34. rub two hands together
35. nod head/bow
36. shake head
37. wipe face
38. salute
39. put the palms together
40. cross hands in front (say stop)
41. sneeze/cough
42. staggering
43. falling
44. touch head (headache)
45. touch chest (stomachache/heart pain)
46. touch back (backache)
47. touch neck (neckache)
48. nausea or vomiting condition
49. use a fan (with hand or paper)/feeling warm
50. punching/slapping other person
51. kicking other person
52. pushing other person
53. pat on back of other person
54. point finger at the other person
55. hugging other person
56. giving something to other person
57. touch other person's pocket
58. handshaking
59. walking towards each other
60. walking apart from each other

### Sample codes

I have provided some MATLAB codes [here](https://github.com/shahroudy/NTURGB-D/tree/master/Matlab) to demonstrate how to read skeleton files and map them to other modalities (RGB, depth, and IR frames).

### Mailing List

If you are interested to recieve news, updates, and future events about this dataset please subscribe in the Google group of the dataset at: https://groups.google.com/d/forum/ntu-rgbd.
If you cannot access the group's page, please email me, I will add your email to the list. 
You can find my email in the [paper](http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Shahroudy_NTU_RGBD_A_CVPR_2016_paper.pdf), I'm the first author :)

### 3D Human Activity Analysis Challenge

We have organized the action recognition challenge based on our dataset soon.
The top performing groups have been invited to ACCV 2016 Workshop "Large Scale 3D Human Activity Analysis Challenge in Depth Videos" to present their works.

The updates about the future events will be posted to the mailing list and [here](http://rose1.ntu.edu.sg/ActionRecognitionChallenge).
Please subscribe to the mailing list if you are interested.

### Citation

To cite NTU RGB+D dataset, please use this bibtex record:

```
@InProceedings{Shahroudy_2016_CVPR,
author = {Shahroudy, Amir and Liu, Jun and Ng, Tian-Tsong and Wang, Gang},
title = {NTU RGB+D: A Large Scale Dataset for 3D Human Activity Analysis},
booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
month = {June},
year = {2016}
}
```

### Reported results on NTU RGB+D benchmark

Coming soon :)

### FAQ

**What is the frame rate of the provided videos and depth maps in your dataset?**<br>
*We have used the default 30 fps setting of Kinect V2 to capture all the modalities.*

**Why the individual and mutual actions are considered together? Isn't it better to separate them in our evaluations?**<br>
*Having these classes of human actions together is a part of our dataset design to cope with more realistic scenarios of human action analysis. Therefore, the ideal evalution should not provide any prior info about the type of the action.*

**How did you handle the variable subject numbers (one or two) in the input of the network?**<br>
*Our inputs initially includes two sets of joints (for two skeletons).
When we observed just one, the second set was filled with zeros.
When we observed two or more, we decided about which one to be the main subject and which one to be the second one, by measuring the amount of motion of their joints.
Also, some of the detected skeletons are noise, like tables and seats!!!
You can eliminate them by filtering out the skeletons which does not have reasonable Y spread over X spread values over all of their joints.*

**How did you choose the main actor in the preprocessing step?**<br>
*We used a heuristic. It's very simple (but not necessarily correct for all the samples).
Consider the variance of the X, Y, and Z values of all the joints and add them up.
We took the body with the higher value as the main subject.*

**How important is the skeleton normalization step, described in experimantal setup section?**<br>
*In the extension of our experiments, we found out the normalization is not vital.
You can skip the normalization step and it should work fine.
Actually the network is supposed to learn how to normalize the data by itself.*

**Are you going to release the Part-aware LSTM source code?**<br>
*I like to do so, but it needs some cleaning up and documentation.
I have utilized Andrej Karpathy's [char-rnn](https://github.com/karpathy/char-rnn) code to implement Part-aware LSTM.
Please take a look at it till then.*

**The provided MATLAB code cannot read avi files on my Linux machine.**<br>
*Most probably it's a missing codec problem.
I used [this solution](http://askubuntu.com/questions/575869/how-do-i-install-gstreamer0-10-ffmpeg-on-ubuntu-14-10/707612#707612) and it worked on my own machine, hope it would help you also.*
