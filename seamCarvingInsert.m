function output = seamCarvingInsert(image, insertsize)

%% Perform seam carving and record indexes
% Duplicate image 
image_duplicate = image;
[h,w,ch] = size(image);


% Create a container to record the seam index
seamIndex = zeros(h, insertsize, 'uint32');

%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
%%%%%%%%%%%%%%%%%%
% Use a for loop to delete each seam
% with your "calcEnergy", "findOptSeam", "reduceImageByIndexArray"
seamDirection = 0;
for i=1:insertsize
    % Perform seam carving
    % ...
    energy = calcEnergy(image_duplicate);
    % Record the seam index
    % ...
    seamIndex(:,i) = findOptSeam(energy, seamDirection);
    image_duplicate = reduceImageByIndexArray(image_duplicate, seamIndex(:,i), seamDirection);
end
%%%%%%%%%%%%%%%%%%
% END OF YOUR CODE
%%%%%%%%%%%%%%%%%%

%% Update seamIndex

%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
%%%%%%%%%%%%%%%%%%

% Update seamIndex to original image
% ...

for column_ref = insertsize-1:-1:1
    for column = column_ref+1:insertsize
         seamIndex(:,column)=seamIndex(:,column)+uint32(seamIndex(:,column) > seamIndex(:,column_ref));
    end
end
% Update seamIndex to enlarged image
% ...
for column_ref = 1:insertsize-1
    for column = column_ref+1:insertsize 
        seamIndex(:,column)=seamIndex(:,column)+uint32(seamIndex(:,column) > seamIndex(:,column_ref));
    end
end
%%%%%%%%%%%%%%%%%%
% END OF YOUR CODE
%%%%%%%%%%%%%%%%%%

%% Insert seams
output = image;
% Use a for loop to add each seam
% with your "enlargeImageByIndexArray"

%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
%%%%%%%%%%%%%%%%%%
output = image;
for i=1:insertsize
    % Get s_i from record
    s_i = seamIndex(:, i);
    % Enlarge image with enlargeImageByIndexArray
    output = enlargeImageByIndexArray(output, s_i);
    %%% ...
end
%%%%%%%%%%%%%%%%%%
% END OF YOUR CODE
%%%%%%%%%%%%%%%%%%
end
