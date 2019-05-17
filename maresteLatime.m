function imgM = maresteLatime(img,numarPixeliLatime)

imgCopie=img;
imgM=img;
Drumuri=zeros(size(img, 1), 2, numarPixeliLatime);
%retinem primele numarPixeliLatime drumuri de cost minim
for i=1:numarPixeliLatime
    E = calculeazaEnergie(imgCopie);
    drum=selecteazaDrumVertical(E, "programareDinamica");
    imgCopie=eliminaDrumVertical(imgCopie, drum);
    Drumuri(:, :, i)=drum;
end

for i=1:numarPixeliLatime
    drum=Drumuri(:, :,i);
    imgM=adaugaDrumVertical(imgM, drum);
    %mutam toate drumurile din dreapta drumului adaugat
    for j=1:numarPixeliLatime
        for k=1:size(Drumuri,1)
         if Drumuri(k,2,i)<Drumuri(k, 2,j)
            Drumuri(k,2,j)=Drumuri(k, 2, j)+1;
         end
        end
    end

end
end  