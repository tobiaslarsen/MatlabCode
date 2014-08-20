function means = meanNii(folder, subjNo)
cw=pwd;
cd(folder)

s=dir('fod*');
for i=1:length(s)
    ss(i,:)=s(i).name;
end
hd=spm_vol(ss);
im = spm_read_vols(hd);
means=zeros(length(im),1);
for j=1:length(im)
    means(j)=mean(mean(mean(im(:,:,:,j))));
end
if nargin == 2
    figure(subjNo);
else
    figure;
end
    plot(means)
cd(cw);