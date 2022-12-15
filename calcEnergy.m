function energy = calcEnergy(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sum up the energy for each channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx = [-1 0 1; -1 0 1; -1 0 1]; % horizontal gradient filter
dy = dx'; % vertical gradient filter

%[h,w,ch] = size(I, 3);
[h,w,ch] = size(I);
%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
%%%%%%%%%%%%%%%%%%
energy = zeros(h,w);
for i=1:ch
    energy(:,:)=energy(:,:)+abs(imfilter(I(:,:,i),dx))+abs(imfilter(I(:,:,i),dy));
end
%%%%%%%%%%%%%%%%%%
% END OF YOUR CODE
%%%%%%%%%%%%%%%%%%
end

