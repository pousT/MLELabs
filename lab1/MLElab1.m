
%Get images names
imagefiles_q = dir('*.png');
%Number of files found
nfiles_q = length(imagefiles_q);
%Read in images
for ii=1:nfiles_q
   %Get current image's name
   currentfilename = imagefiles_q(ii).name;
   %Read in current image
   currentimage = imread(currentfilename);
   %Save current image in images_q
   images_q{ii} = currentimage;
end
