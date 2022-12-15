function maskReduced = reduceMaskByIndexArray(mask, seamIndexArray, seamDirection)

if seamDirection == 0
    [h,w] = size(mask);
    maskReduced = zeros(h, w-1, 'logical');
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    for i=1:h
        maskReduced(i,:,:) = cat(2,mask(i,1:seamIndexArray(i)-1,:),mask(i,seamIndexArray(i)+1:end,:));
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
else
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    [h,w,ch] = size(mask);
    maskReduced = zeros(h-1, w, ch);
    for j=1:w
        maskReduced(:,j,:) = cat(1,mask(1:seamIndexArray(j)-1,j,:),mask(seamIndexArray(j)+1:end,j,:));
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
end
