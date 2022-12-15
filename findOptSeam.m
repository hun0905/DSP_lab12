function [optSeamIndexArray, seamEnergy] = findOptSeam(energy, seamDirection)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Following paper by Avidan and Shamir `07
% Finds optimal seam by the given energy of an image
% Returns mask with 0 mean a pixel is in the seam
% You only need to implement vertical seam. For
% horizontal case, just using the same function by 
% giving energy for the transpose image I'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% seam_direction 0 => vertical
% seam_direction 1 => horzontal

if seamDirection == 0  % Find vertical seam
    % Find M for vertical seams
    
    M = energy; % Initialize M as energy

    % Add one column of padding in vertical dimension 
    % to avoid handling border elements
    M = padarray(M, [0 1], realmax('double'));

    % For all rows starting from second row, fill in the minimum 
    % energy for all possible seam for each (i,j) in M, which
    % M[i, j] = e[i, j] + min(M[i-1, j-1], M[i-1, j], M[i-1, j+1]).

    % Note that we initialize M as e, so it can be written as
    % M[i, j] = M[i, j] + min(M[i-1, j-1], M[i-1, j], M[i-1, j+1])

    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    for i=2:size(M,1)
        for j=2:size(M,2)-1
            M(i, j) = M(i, j) + min([M(i-1, j-1), M(i-1, j), M(i-1, j+1)]);
        end
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%

    [h, w] = size(M);

    % Find the minimum element in the last row of M
    [val, idx] = min(M(h, :));
    seamEnergy = val;

    % Initial for optimal seam mask
    optSeamIndexArray = zeros(h, 1, 'uint32');

    % Traverse back the path of seam with minimum energy
    % and update optimal seam index array
    optSeamIndexArray(end) = idx; % Initialize
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    for i=h-1:-1:1
        [~,j]=min([M(i,idx-1),M(i,idx),M(i,idx+1)]);
        idx=idx+j-2;
        optSeamIndexArray(i) = idx;
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
    % Minus 1 because we pad M previously
    
    optSeamIndexArray = optSeamIndexArray - 1;

    
else  % Find horizontal seam
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    M = energy;
    M = padarray(M, [1 0], realmax('double'));
    for j=2:size(M,2)
        for i=2:size(M,1)-1
            M(i, j) = M(i, j) + min([M(i-1, j-1), M(i, j-1), M(i+1, j-1)]);
        end
    end
    [h, w] = size(M);
    [val, idx] = min(M(:, w));
    seamEnergy = val;
    optSeamIndexArray = zeros(w, 1, 'uint32');
    optSeamIndexArray(end) = idx;
    for j=w-1:-1:1
        [~,i]=min([M(idx-1,j),M(idx,j),M(idx+1,j)]);
        idx=idx+i-2;
        optSeamIndexArray(j) = idx;
    end
    optSeamIndexArray = optSeamIndexArray - 1;
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
end
