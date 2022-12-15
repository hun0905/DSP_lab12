function imageEnlarged = enlargeImageByIndexArray(image, seamIndexArray)
    [h,w,ch] = size(image);
    imageEnlarged = zeros(h, w+1, ch);
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    for i=1:h
        insert = mean([image(i,seamIndexArray(i),:) image(i,seamIndexArray(i)+1,:)]);
        imageEnlarged(i,:,:) = [image(i,1:seamIndexArray(i),:) insert image(i,seamIndexArray(i)+1:end,:)];
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
