function output=adaugaDrumVertical(img, drum)
%matricea rezultat
output=zeros(size(img,1), size(img, 2)+1, size(img,3), 'uint8');

 for i=1:size(output,1)
       coloana = drum(i,2);
       %daca coloana este 1 pixelul adaugat in plus va avea valoarea
       %(img(i, coloana, :)+img(i, coloana+1))/2
       if coloana==1
             output(i, 1, :)=img(i, 1, :);
             output(i,coloana+1, :)=mean(img(i, coloana:coloana+1,:));
             output(i, (coloana+2):size(img,2)+1, :)=img(i, (coloana+1):size(img,2),:);
       %daca este ultima coloana, valoarea va fi (img(i, coloana, :)+img(i, coloana-1))/2
       else if coloana==size(img,2)
                output(i,1:coloana-1,:) = img(i,1:coloana-1,:);
                output(i, coloana, :)=mean(img(i, coloana-1:coloana,:));
                output(i, coloana+1, :)=img(i, coloana, :);
          
           else
         %copiem valorile din primele c-1 coloane de pe linia i
        output(i,1:coloana-1,:) = img(i,1:coloana-1,:);
        %adaugam coloanele pentru marirea in latime
        output(i, coloana,:)=mean(img(i, coloana-1:coloana,:));
        output(i, coloana+1,:)=mean(img(i, coloana:coloana+1,:));
        %copiem restul coloanelor
        output(i, (coloana+2):size(img,2)+1, :)=img(i, (coloana+1):size(img,2),:);
        end
       end
 end
 
end