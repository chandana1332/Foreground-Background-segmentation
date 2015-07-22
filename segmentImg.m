function idx = segmentImg(I, k)
% function idx = segmentImage(img)
% Returns the logical image containing the segment ids obtained from 
%   segmenting the input image
%
% INPUTS
% I - The input image contining textured foreground objects to be segmented
%     out.
% k - The number of segments to compute (also the k-means parameter).
%
% OUTPUTS
% idx - The logical image (same dimensions as the input image) contining 
%       the segment ids after segmentation. The maximum value of idx is k.
%          

    % 1. Create your bank of filters using the given alogrithm; 
    % 2. Compute the filter responses by convolving your input image with  
    %     each of the num_filters in the bank of filters F.
    %     responses(:,:,i)=conv2(I,F(:,:,i),'same')
    %     NOTE: we suggest to use 'same' instead of 'full' or 'valid'.
    % 3. Remember to take the absolute value of the filter responses (no
    %     negative values should be used).
    % 4. Construct a matrix X of the points to be clustered, where 
    %     the rows of X = the total number of pixels in I (rows*cols); and
    %     the columns of X = num_filters;
    %     i.e. each pixel is transformed into a num_filters-dimensional
    %     vector.
    % 5. Run kmeans to cluster the pixel features into k clusters,
    %     returning a vector IDX of labels.
    % 6. Reshape IDX into an image with same dimensionality as I and return
    %     the reshaped index image.
    %
       % I = imread('images\cheetah.jpg');
    I = double(rgb2gray(I));
    I=I(:,:,1);
    F=makeLMfilters;
    [~,~,num_filters] = size(F);
    for i=1:num_filters
   responses(:,:,i)=conv2(I,F(:,:,i),'same');
    end
    responses=abs(responses);
    
    [a,b]=size(I);
    X=zeros((a*b),num_filters);
    X=reshape(responses,size(X));

    idx = kmeans(X, k); 
    idx=reshape(idx,size(I));
    
   
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                                                                     %
        %                            YOUR CODE HERE                           %
        %                                                                     %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                                                                     %
        %                            END YOUR CODE                            %
        %                                                                     %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
