


I = imread('image.jpg');
grayimage=rgb2gray(I);
%ad=imadjust(grayimage,[0.1,0.9],[0.0,1.0]);
ad=imadjust(grayimage);
%filtered2=fspecial('average',[3 3]);
%filtered=imfilter(grayimage,filtered2);
filtered=imnoise(ad,'salt & pepper',0);
%sharpen= imsharpen(I);
%contrast=imcontrast(filtered);

%pixel_avg=mean(filtered(:));
%perprocessed=pixel_avg-grayimage;

SE=strel('disk',3);
%filtered=imopen(grayimage,SE);

erosion=imerode(filtered,SE);
dilation=imdilate(filtered,SE);
diff=dilation-erosion;
%image_dilate_diff=dilation-grayimage;
%image_erode_diff=erosion-grayimage;
gradient_image=filtered-diff;
SE2=strel('diamond',3);
new_dilation=imdilate(gradient_image,SE2);

c=edge(new_dilation,'sobel');
figure(1);
imshow(c);

c2=edge(new_dilation,'prewitt');
figure(2);
imshow(c2);


c3=edge(new_dilation,'canny',0.2);
figure(3);
imshow(c3);




