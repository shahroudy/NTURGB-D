# NTU RGBD 120 database skeleton data parser in python



This repository is to parse the skeleton data in NTU RGB+D 120 database[1]. Although the database already contains the skeleton data parser, It's written in MATLAB which is dependent on the large, commercial platform MATLAB. Also, the script in MATLAB is quite slow and hard to be parallel, making the process of extract the valid data in txt files tedious and time-consuming.  To address those problems and make it easy to embed in the whole python project, I write the skeleton data parser in python.

# Files in Project

The structure of the project looks like:

```shell
read_ntu_rgbd/
├── ntu_rgb120_missings.txt # The missing files list, each item in this list needs to be ignored
├── raw_txt/                # the folder contains the original .txt skeleton data
├── raw_npy/                # the folder contains the parsed numpy arrays
├── readme.md               # it's me :)
└── txt2npy.py              # the main script to parse the data 
```

You need to move your original txt data in the `raw_txt/` folder first.



# Run the script

Before running the script, there are some configs you may need to modify to fit your system. Edit the `txt2npy.py`

You need to specify the `save_npy_path`, `load_txt_path` to load and save the data. 

After the prepare, just run:

```shell
python txt2npy.py
```

and wait for the ending.



# the data structure in array

In the data parsing process, I mainly concern some  but not all items, there are what I most concern:

1. skeleton X, Y, Z coordinate
2. the skeleton coordinate projection on RGBs, it's a 2D coordinate X,Y
3. the skeleton coordinate projection on Depth, it's a 2D coordinate X,Y

There are still other items left, like the ` handRightConfidence `, ` handLeftState `, ` trackingState `, ` handLeftConfidence ` etc. But I just ignore them in this parser, if you need them you need to modify the code. Don't worry, it's rather easy.

Each sample is saved as the array in numpy with name like `SxxxCxxxPxxxRxxxAxxx.skeleton.npy` . You can read the data by:

```python
data = np.load('./SxxxCxxxPxxxRxxxAxxx.skeleton.npy',allow_pickle=True).item()
```

Inside the array, it's actually a dictionary with some keys and each keys is a certain item you need. I list the item as following:

- `file_name`: file's name
- `nbodys`: it's a list with same length of the sequence. it represents the number of the actors in each frame.
- `njoints`: the number of the joint node in the skeleton, it's a constant here
- `skel_bodyx`: the skeleton coordinate with the shape of `(nframe, njoint, 3)`, the x denotes the id of the acting person in each frame.
- `rgb_bodyx`: the projection of the skeleton coordinate in RGBs.
- `depth_bodyx`: the projection of the skeleton coordinate in Depths



# Reference

[1].  https://github.com/shahroudy/NTURGB-D 