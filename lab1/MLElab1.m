
% Open file with permession Read
% Return an id of the file
fid = fopen('train-images-idx3-ubyte','r');
% Read file

% The first 32 bits(4 bytes) of MNIST is a magic number
% If not 2051, then there is sth wrong when reading file
magicNumber = fread(fid, 1, 'uint32');
% Should be 2051
if swapbytes(uint32(magicNumber)) ~= 2051
     error('Invalid image file header');
end

% The next 4 bytes is num of images in total
total = fread(fid, 1, 'uint32');
total = swapbytes(uint32(total));
% The next 4 bytes is num of rows
% 28 in this case
numRows = fread(fid, 1, 'uint32');
numRows = swapbytes(uint32(numRows));
% The next 4 bytes is num of columns
% 28 in this case
numCols = fread(fid, 1, 'uint32');
numCols = swapbytes(uint32(numCols));
% Store image into an individual slice
% Each image is 28 * 28 * 8bits(1byte)
images = zeros(numRows, numCols, total, 'uint8');
for k = 1 : total
    % Read in numRows*numCols pixels at a time
    A = fread(fid, numRows*numCols, 'uint8');
    % Reshape so that it becomes a matrix
    images(:,:,k) = reshape(uint8(A), numCols, numRows).';
end
% Close the file
fclose(fid);
% Display first digit
figure;
imshow(images(:,:,1),[0 255]);
