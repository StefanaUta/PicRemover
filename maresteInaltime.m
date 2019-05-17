function imgM = maresteInaltime(img,numarPixeliLatime)
%rotim imaginea pentru a aplica acelasi algoritm ca la maresteLatime
img=imrotate(img, -90);
imgCopie=img;
%imgM=zeros(size(img, 1), size(img,2)+numarPixeliLatime, size(img,3));
imgM=img;
Drumuri=zeros(size(img, 1), 2, numarPixeliLatime);
for i=1:numarPixeliLatime
    E = calculeazaEnergie(imgCopie);
    drum=selecteazaDrumVertical(E, "programareDinamica");
    imgCopie=eliminaDrumVertical(imgCopie, drum);
    Drumuri(:, :, i)=drum;
    
end

for i=1:numarPixeliLatime
    drum=Drumuri(:, :,i);
    disp(['adaug drumul ' num2str(i) ' ']);
     for j=1:numarPixeliLatime
        for k=1:size(Drumuri,1)
         if Drumuri(k,2,i)<Drumuri(k, 2,j)
            Drumuri(k,2,j)=Drumuri(k, 2, j)+1;
         end
        end
    end
    imgM=adaugaDrumVertical(imgM, drum);
    
    fprintf("%d %d\n", size(imgM,2), size(img,2));
end
figure
imshow(imgM)
    hold on
    figure(2)
    imshow(img)
    %rotim imaginea la loc
imgM=imrotate(imgM, 90);
end
    