function output = seamCarvingObjectRemove(image, mask, seamDirection)
    % Use a for loop to delete each seam
    % with your "calcEnergy", "findOptSeam", "reduceImageByIndexArray, 
    % and reducedMaskByIndexArray"

    % Hint: 
    % Before "findOptSeam", modify the output of "calcEnergy" according
    % to the mask so that "findOptSeam" always selects a seam passing
    % through the circled region

    output = image;
    while any(mask == true, "all")
        %%%%%%%%%%%%%%%%%%
        % YOUR CODE HERE:
        %%%%%%%%%%%%%%%%%%
        % calculate energy
        % ...
        energy = calcEnergy(output);
        % modify the output of energy according the mask
        % so that "findOptSeam" always selects a seam passing
        % through the circled region
        % ...
        energy = energy-mask*realmax('double');
        % findOptSeam
        % ...
        seamDirection = 0;
        optSeamIndexArray = findOptSeam(energy, seamDirection);
        % reduceImage and reduceMask
        % ...
        output = reduceImageByIndexArray(output, optSeamIndexArray, seamDirection);
        mask = reduceMaskByIndexArray(mask, optSeamIndexArray, seamDirection);
        %%%%%%%%%%%%%%%%%%
        % END OF YOUR CODE
        %%%%%%%%%%%%%%%%%%
    end
end
