%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script tests your implementation of seamCarving function, and you can 
% also use it for resizing your own images.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear all
clear; close all; clc;

%% Load data
image = imread('../data/sea.jpg');
image = im2double(image);
sz = size(image);
% resize image to one-third size to reduce execution time
image = imresize(image, [floor(sz(1)/3), floor(sz(2)/3)]);
sz = size(image);
figure
imshow(image)

%% Image resizing by scaling
image_scaling_width = imresize(image, [sz(1), floor(sz(2)/2)]);
figure
imshow(image_scaling_width);

%% Image resizing by cropping 
image_crop_width = imcrop(image, [1, 1, floor(sz(2)/2), sz(1)]);  %[xmin ymin width height]
figure
imshow(image_crop_width);

%% Image resizing by seam carving
seamDirection = 0; % 0->vertical seam, 1->horizontal seam
image_seamCarving_reduce = seamCarvingReduce(image, floor(sz(2)/2), seamDirection);
figure
imshow(image_seamCarving_reduce);
imwrite(image_seamCarving_reduce, '../results/seamCarving_reduce.jpg');


%% Image resizing by seam insertion
image_seamCarving_insert = seamCarvingInsert(image, floor(sz(2)/4));
figure
imshow(image_seamCarving_insert);
imwrite(image_seamCarving_insert, '../results/seamCarving_insert.jpg');

%% apply seam carving for object removmal
figure
imshow(image)
% A figure will pop up when drawfreehand() is called
% Use your mouse to circle the region you want to remove
roi = drawfreehand();
% Create a mask based on the circled region
% Width and height of the mask are the same as those of the image,
% and the circled region is set to 1 (true)
mask = createMask(roi);

seamDirection = 0;
image_seamCarving_object_remove = seamCarvingObjectRemove(image, mask, seamDirection);
figure
imshow(image_seamCarving_object_remove);
imwrite(image_seamCarving_object_remove, '../results/seamCarving_object_remove.jpg');

%% apply seam carving for content amplification
image_seamCarving_content_amplification = seamCarvingContentAmplification(image);

figure
imshow(image_seamCarving_content_amplification);
imwrite(image_seamCarving_content_amplification, '../results/seamCarving_content_amplification.jpg');

