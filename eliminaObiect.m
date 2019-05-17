function mg=eliminaObiect(mg)
imshow(mg);
rect=getrect;
xmin=rect(1)
ymin=rect(2)
w=rect(3)
h=rect(4)
xmax=xmin+rect(3);
ymax=ymin+rect(4);

    for i=1:w
        E=calculeazaEnergie(mg);
        Einf=zeros(size(E));
        %vom avea valori foarte mici in interiorul dreptunghiului astfel
        %incat drumurile care sunt in dreptunghi sa fie selectate si
        %eliminate
        Einf(uint8(ymin):uint8(ymax),uint8(xmin):uint8(xmax),:)=-1000;
        E=E+Einf;
        for k=uint8(ymin):uint8(ymax)
            for j=uint8(xmin):uint8(xmax)
                fprintf("%d ", E(k,j));
                
            end
            fprintf("\n");
        end
        drum=selecteazaDrumVertical(E, "programareDinamica");
        mg=eliminaDrumVertical(mg, drum);
        xmax=xmax-1;

    end
    imshow(mg);