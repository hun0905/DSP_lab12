function output = seamCarvingContentAmplification(image)
    % Hint
    % To perform content amplification,
    % enlarge the image with standard scaling
    % Then, use seamCarvingReduce() with vertical and horizontal
    % seams to reduce the image back to original size

    % Record input size
    [h_input, w_input, ch] = size(image);
    
    % Enlarge image with standard scaling
    enlarged_image = imresize(image, 1.4);
    [h_enlarge, w_enlarge, ch] = size(enlarged_image);

    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    output = seamCarvingReduce(enlarged_image,w_enlarge-w_input, 0);
    output = seamCarvingReduce(output,h_enlarge-h_input, 1);
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
