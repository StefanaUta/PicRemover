function img1 = eliminaDrumOrizontal(img,drum)
%elimina drumul orizontal din imagine
%input: img - imaginea initiala
%       drum - drumul orizontal
%output img1 - imaginea initiala din care s-a eliminat drumul orizontal
img1 = zeros(size(img,1),size(img,2)-1,size(img,3),'uint8');

for i=1:size(img1,2)
        linia = drum(i,1);
        fprintf("%d ", linia);
        %copiem partea de sus
        img1(1:linia-1,i,:) = img(1:linia-1,i,:);
        %copiem partea de jos
        img1(linia:size(img,1)-1, i , :)=img(linia+1:size(img,1), i, :); 
end