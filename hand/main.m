close ; close all; 

n = 400;                           %20*20 pixel
mun_labels = 10;                   %10 labels ,from 0 to 9  

load('ex3data1.mat');              %X(5000,200)
m = size(X,1);                     %m=5000

random_image = randperm(m);
example = X(random_image(1),:);    %draw a number at random
example_temp = zeros(20);
for i=1:20
	example_temp(:,i) = example((20*i-19):(20*i));
end
imshow(example_temp);