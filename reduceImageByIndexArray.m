function imageReduced = reduceImageByIndexArray(image, seamIndexArray, seamDirection)

if seamDirection == 0
    [h,w,ch] = size(image);
    imageReduced = zeros(h, w-1, ch);
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    for i=1:h
        imageReduced(i,:,:) = cat(2,image(i,1:seamIndexArray(i)-1,:),image(i,seamIndexArray(i)+1:end,:));
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
else
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    [h,w,ch] = size(image);
    imageReduced = zeros(h-1, w, ch);
    for j=1:w
        imageReduced(:,j,:) = cat(1,image(1:seamIndexArray(j)-1,j,:),image(seamIndexArray(j)+1:end,j,:));
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end

end

