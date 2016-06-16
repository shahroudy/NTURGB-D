function []=show_skeleton_on_RGB_frames(...
    skeletonfilename,rgbfilename,outputvideofilename)
% Draws the skeleton data on RGB frames.
%
% Argrument:
%   skeletonfilename: full adress and filename of the .skeleton file.
%   rgbfilename: corresponding RGB video file
%   outputvideofilename (optional): the filename for output video file.
%
% For further information please refer to:
%   NTU RGB+D dataset's webpage:
%       http://rose1.ntu.edu.sg/Datasets/actionRecognition.asp
%   NTU RGB+D dataset's github page:
%        https://github.com/shahroudy/NTURGB-D
%   CVPR 2016 paper:
%       Amir Shahroudy, Jun Liu, Tian-Tsong Ng, and Gang Wang,
%       "NTU RGB+D: A Large Scale Dataset for 3D Human Activity Analysis",
%       in IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2016

bodyinfo = read_skeleton_file(skeletonfilename);

videofile = VideoReader(rgbfilename);
rgbvid = read(videofile);

if nargin>2 % if the output video file is given
    writerObj = VideoWriter(outputvideofilename);
    open(writerObj);
end

% in the skeleton structure, each joint is connected to some other joint:
connecting_joint = ...
    [2 1 21 3 21 5 6 7 21 9 10 11 1 13 14 15 1 17 18 19 2 8 8 12 12];

% reapeat this for every frame
for f=1:numel(bodyinfo)
    try
        imrgb = rgbvid(:,:,:,f);
        
        % for all the detected skeletons in the current frame:
        for b=1:numel(bodyinfo(f).bodies)
            % for all the 25 joints within each skeleton:
            for j=1:25
                try
                    % use red color for drawing joint connections
                    rv=255;
                    gv=0;
                    bv=0;
                    
                    k = connecting_joint(j);
                    
                    joint = bodyinfo(f).bodies(b).joints(j);
                    dx = joint.colorX;
                    dy = joint.colorY;
                    joint2 = bodyinfo(f).bodies(b).joints(k);
                    dx2 = joint2.colorX;
                    dy2 = joint2.colorY;
                    
                    xdist=abs(dx-dx2);
                    ydist=abs(dy-dy2);
                    
                    % locate the pixels of the connecting line between the
                    % two joints
                    if xdist>ydist
                        xrange = [dx:sign(dx2-dx):dx2];
                        yrange = [dy:sign(dy2-dy)*abs((dy2-dy)/(dx2-dx)):dy2];
                    else
                        yrange = [dy:sign(dy2-dy):dy2];
                        xrange = [dx:sign(dx2-dx)*abs((dx2-dx)/(dy2-dy)):dx2];
                    end
                    % draw the line!
                    for i=1:numel(xrange)
                        dx = int32(round(xrange(i)));
                        dy = int32(round(yrange(i)));
                        imrgb(dy-3:dy+3,dx-3:dx+3,1)=rv;
                        imrgb(dy-3:dy+3,dx-3:dx+3,2)=gv;
                        imrgb(dy-3:dy+3,dx-3:dx+3,3)=bv;
                    end
                    
                    joint = bodyinfo(f).bodies(b).joints(j);
                    dx = int32(round(joint.colorX));
                    dy = int32(round(joint.colorY));
                    
                    % use green color to draw joints
                    rv=0;
                    gv=255;
                    bv=0;
                    imrgb(dy-7:dy+7,dx-7:dx+7,1)=rv;
                    imrgb(dy-7:dy+7,dx-7:dx+7,2)=gv;
                    imrgb(dy-7:dy+7,dx-7:dx+7,3)=bv;
                catch err1
                    disp(err1);
                end
            end
        end
        imrgb = imrgb(1:1080,1:1920,:);
        imshow(imrgb);
        writeVideo(writerObj,imrgb);
        pause(0.001);
    catch err2
        disp(err2);
    end
end
close(writerObj);
end
