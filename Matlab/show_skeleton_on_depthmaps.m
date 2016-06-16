function []=show_skeleton_on_depthmaps(...
    skeletonfilename,depthmapsfolder,outputvideofilename)
% Draws the skeleton data on depthmaps.
%
% Argrument:
%   skeletonfilename: full adress and filename of the .skeleton file.
%   depthmapsfolder: corresponding depthmaps folder (full or masked)
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
        imdepth = imread(fullfile(depthmapsfolder,sprintf('Depth-%08d.png',f)));
        % depth maps are in millimeters we need to scale them to [0,255]
        % for visualization:
        imdepth = double(imdepth)/5000;
        imdepth(imdepth>1)=1;
        imdepth = uint8(255*imdepth);
        
        % make it a 3-channel color image...
        depthframe = repmat(imdepth,1,1,3);
        
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
                    dx = joint.depthX;
                    dy = joint.depthY;
                    joint2 = bodyinfo(f).bodies(b).joints(k);
                    dx2 = joint2.depthX;
                    dy2 = joint2.depthY;
                    
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
                        depthframe(dy-1:dy+1,dx-1:dx+1,1)=rv;
                        depthframe(dy-1:dy+1,dx-1:dx+1,2)=gv;
                        depthframe(dy-1:dy+1,dx-1:dx+1,3)=bv;
                    end
                    
                    joint = bodyinfo(f).bodies(b).joints(j);
                    dx = int32(round(joint.depthX));
                    dy = int32(round(joint.depthY));
                    
                    % use green color to draw joints
                    rv=0;
                    gv=255;
                    bv=0;
                    depthframe(dy-3:dy+3,dx-3:dx+3,1)=rv;
                    depthframe(dy-3:dy+3,dx-3:dx+3,2)=gv;
                    depthframe(dy-3:dy+3,dx-3:dx+3,3)=bv;
                catch err1
                    disp(err1);
                end
            end
        end
        
        % cut the extra boundaries if any!
        depthframe = depthframe(1:424,1:512,:);
        
        imshow(depthframe);
        if nargin>2
            writeVideo(writerObj,depthframe);
        end
        pause(0.01);
    catch err2
        disp(err2);
    end
end

if nargin>2
    close(writerObj);
end
end
