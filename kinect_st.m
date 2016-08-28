% Track a skeleton and overlay results on a video
imaqreset;
imaqreset;
imaqreset;
clc;
close all;
clear all;

colorVid=videoinput('kinect',1); %get the color video from kinect
depthVid=videoinput('kinect',2); %get the depth video from kinect

triggerconfig(colorVid,'manual');
colorVid.FramesPerTrigger=1;
colorVid.TriggerRepeat=inf;
triggerconfig(depthVid,'manual');
depthVid.FramesPerTrigger=1;
depthVid.TriggerRepeat=inf;
set(getselectedsource(depthVid), 'TrackingMode','Skeleton');

start(depthVid);
start(colorVid);
himg=figure;
while ishandle(himg)
    trigger(colorVid);
    trigger(depthVid);
    image=getdata(colorVid);
    [depthMap,~,depthMetaData]=getdata(depthVid);
    
    if sum(depthMetaData.IsSkeletonTracked)>0
        skeletonJoints=depthMetaData.JointImageIndices(:,:,depthMetaData.IsSkeletonTracked);
        skeletonViewer(skeletonJoints,image,1);
    else
        imshow(image);
    end
end

start(colorVid);
start(depthVid);
figure;
for i=1:100
    trigger(depthVid);
    [depthMap,~,depthMetaData]=getdata(depthVid);
    imshow(depthMap,[0 4096]);
    
     hip_center =[depthMetaData.JointWorldCoordinates(1,1,1)
             depthMetaData.JointWorldCoordinates(1,2,1)
             depthMetaData.JointWorldCoordinates(1,3,1)];
spine      =[depthMetaData.JointWorldCoordinates(2,1,1)
             depthMetaData.JointWorldCoordinates(2,2,1)
             depthMetaData.JointWorldCoordinates(2,3,1)];
neck       =[depthMetaData.JointWorldCoordinates(3,1,1)
             depthMetaData.JointWorldCoordinates(3,2,1)
             depthMetaData.JointWorldCoordinates(3,3,1)];
head       =[depthMetaData.JointWorldCoordinates(4,1,1)
             depthMetaData.JointWorldCoordinates(4,2,1)
             depthMetaData.JointWorldCoordinates(4,3,1)];
l_shoulder =[depthMetaData.JointWorldCoordinates(5,1,1)
             depthMetaData.JointWorldCoordinates(5,2,1)
             depthMetaData.JointWorldCoordinates(5,3,1)];
l_elbow    =[depthMetaData.JointWorldCoordinates(6,1,1)
             depthMetaData.JointWorldCoordinates(6,2,1)
             depthMetaData.JointWorldCoordinates(6,3,1)];
l_wrist    =[depthMetaData.JointWorldCoordinates(7,1,1)
             depthMetaData.JointWorldCoordinates(7,2,1)
             depthMetaData.JointWorldCoordinates(7,3,1)];
l_hand     =[depthMetaData.JointWorldCoordinates(8,1,1)
             depthMetaData.JointWorldCoordinates(8,2,1)
             depthMetaData.JointWorldCoordinates(8,3,1)];
r_shoulder =[depthMetaData.JointWorldCoordinates(9,1,1)
             depthMetaData.JointWorldCoordinates(9,2,1)
             depthMetaData.JointWorldCoordinates(9,3,1)];
r_elbow    =[depthMetaData.JointWorldCoordinates(10,1,1)
             depthMetaData.JointWorldCoordinates(10,2,1)
             depthMetaData.JointWorldCoordinates(10,3,1)];
r_wrist    =[depthMetaData.JointWorldCoordinates(11,1,1)
             depthMetaData.JointWorldCoordinates(11,2,1)
             depthMetaData.JointWorldCoordinates(11,3,1)];
r_hand     =[depthMetaData.JointWorldCoordinates(12,1,1)
             depthMetaData.JointWorldCoordinates(12,2,1)
             depthMetaData.JointWorldCoordinates(12,3,1)];
l_hip      =[depthMetaData.JointWorldCoordinates(13,1,1)
             depthMetaData.JointWorldCoordinates(13,2,1)
             depthMetaData.JointWorldCoordinates(13,3,1)];
l_knee     =[depthMetaData.JointWorldCoordinates(14,1,1)
             depthMetaData.JointWorldCoordinates(14,2,1)
             depthMetaData.JointWorldCoordinates(14,3,1)];
l_ankle    =[depthMetaData.JointWorldCoordinates(15,1,1)
             depthMetaData.JointWorldCoordinates(15,2,1)
             depthMetaData.JointWorldCoordinates(15,3,1)];
l_foot     =[depthMetaData.JointWorldCoordinates(16,1,1)
             depthMetaData.JointWorldCoordinates(16,2,1)
             depthMetaData.JointWorldCoordinates(16,3,1)];
r_hip      =[depthMetaData.JointWorldCoordinates(17,1,1)
             depthMetaData.JointWorldCoordinates(17,2,1)
             depthMetaData.JointWorldCoordinates(17,3,1)];
r_knee     =[depthMetaData.JointWorldCoordinates(18,1,1)
             depthMetaData.JointWorldCoordinates(18,2,1)
             depthMetaData.JointWorldCoordinates(18,3,1)];
r_ankle    =[depthMetaData.JointWorldCoordinates(19,1,1)
             depthMetaData.JointWorldCoordinates(19,2,1)
             depthMetaData.JointWorldCoordinates(19,3,1)];
r_foot     =[depthMetaData.JointWorldCoordinates(20,1,1)
             depthMetaData.JointWorldCoordinates(20,2,1)
             depthMetaData.JointWorldCoordinates(20,3,1)];
         
%  Calculate angle
ra1 = anglebwlines_2D(neck(1:2),r_shoulder(1:2),r_shoulder(1:2),r_elbow(1:2));
disp(ra1);
end;

% hold the co-ordinates of each joint 

% hip_center =[depthMetaData.JointWorldCoordinates(1,1,1)
%              depthMetaData.JointWorldCoordinates(1,2,1)
%              depthMetaData.JointWorldCoordinates(1,3,1)];
% spine      =[depthMetaData.JointWorldCoordinates(2,1,1)
%              depthMetaData.JointWorldCoordinates(2,2,1)
%              depthMetaData.JointWorldCoordinates(2,3,1)];
% neck       =[depthMetaData.JointWorldCoordinates(3,1,1)
%              depthMetaData.JointWorldCoordinates(3,2,1)
%              depthMetaData.JointWorldCoordinates(3,3,1)];
% head       =[depthMetaData.JointWorldCoordinates(4,1,1)
%              depthMetaData.JointWorldCoordinates(4,2,1)
%              depthMetaData.JointWorldCoordinates(4,3,1)];
% l_shoulder =[depthMetaData.JointWorldCoordinates(5,1,1)
%              depthMetaData.JointWorldCoordinates(5,2,1)
%              depthMetaData.JointWorldCoordinates(5,3,1)];
% l_elbow    =[depthMetaData.JointWorldCoordinates(6,1,1)
%              depthMetaData.JointWorldCoordinates(6,2,1)
%              depthMetaData.JointWorldCoordinates(6,3,1)];
% l_wrist    =[depthMetaData.JointWorldCoordinates(7,1,1)
%              depthMetaData.JointWorldCoordinates(7,2,1)
%              depthMetaData.JointWorldCoordinates(7,3,1)];
% l_hand     =[depthMetaData.JointWorldCoordinates(8,1,1)
%              depthMetaData.JointWorldCoordinates(8,2,1)
%              depthMetaData.JointWorldCoordinates(8,3,1)];
% r_shoulder =[depthMetaData.JointWorldCoordinates(9,1,1)
%              depthMetaData.JointWorldCoordinates(9,2,1)
%              depthMetaData.JointWorldCoordinates(9,3,1)];
% r_elbow    =[depthMetaData.JointWorldCoordinates(10,1,1)
%              depthMetaData.JointWorldCoordinates(10,2,1)
%              depthMetaData.JointWorldCoordinates(10,3,1)];
% r_wrist    =[depthMetaData.JointWorldCoordinates(11,1,1)
%              depthMetaData.JointWorldCoordinates(11,2,1)
%              depthMetaData.JointWorldCoordinates(11,3,1)];
% r_hand     =[depthMetaData.JointWorldCoordinates(12,1,1)
%              depthMetaData.JointWorldCoordinates(12,2,1)
%              depthMetaData.JointWorldCoordinates(12,3,1)];
% l_hip      =[depthMetaData.JointWorldCoordinates(13,1,1)
%              depthMetaData.JointWorldCoordinates(13,2,1)
%              depthMetaData.JointWorldCoordinates(13,3,1)];
% l_knee     =[depthMetaData.JointWorldCoordinates(14,1,1)
%              depthMetaData.JointWorldCoordinates(14,2,1)
%              depthMetaData.JointWorldCoordinates(14,3,1)];
% l_ankle    =[depthMetaData.JointWorldCoordinates(15,1,1)
%              depthMetaData.JointWorldCoordinates(15,2,1)
%              depthMetaData.JointWorldCoordinates(15,3,1)];
% l_foot     =[depthMetaData.JointWorldCoordinates(16,1,1)
%              depthMetaData.JointWorldCoordinates(16,2,1)
%              depthMetaData.JointWorldCoordinates(16,3,1)];
% r_hip      =[depthMetaData.JointWorldCoordinates(17,1,1)
%              depthMetaData.JointWorldCoordinates(17,2,1)
%              depthMetaData.JointWorldCoordinates(17,3,1)];
% r_knee     =[depthMetaData.JointWorldCoordinates(18,1,1)
%              depthMetaData.JointWorldCoordinates(18,2,1)
%              depthMetaData.JointWorldCoordinates(18,3,1)];
% r_ankle    =[depthMetaData.JointWorldCoordinates(19,1,1)
%              depthMetaData.JointWorldCoordinates(19,2,1)
%              depthMetaData.JointWorldCoordinates(19,3,1)];
% r_foot     =[depthMetaData.JointWorldCoordinates(20,1,1)
%              depthMetaData.JointWorldCoordinates(20,2,1)
%              depthMetaData.JointWorldCoordinates(20,3,1)];
%          
% %  Calculate angle
% ra1 = anglebwlines_2D(neck(1:2),r_shoulder(1:2),r_shoulder(1:2),r_elbow(1:2));
% disp(ra1);

stop(depthVid);
stop(colorVid);